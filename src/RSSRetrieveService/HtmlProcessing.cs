using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using AngleSharp.Parser.Html;
using DataAccess;
using DataAccess.Entities;
using RSSRetrieveService.DTos;

namespace RSSRetrieveService
{
    class HtmlProcessing
    {
        private List<Makes> makes;
        private bool _disposed;
        ~HtmlProcessing()
        {
            // Do not re-create Dispose clean-up code here. 
            // Calling Dispose(false) is optimal in terms of 
            // readability and maintainability.
            Dispose(false);
        }

        public void Dispose()
        {
            Dispose(true);
            // This object will be cleaned up by the Dispose method. 
            // Therefore, you should call GC.SupressFinalize to 
            // take this object off the finalization queue  
            // and prevent finalization code for this object 
            // from executing a second time.
            GC.SuppressFinalize(this);
        }

        private void Dispose(bool disposing)
        {
            // Check to see if Dispose has already been called. 
            if (!_disposed)
            {
                // If disposing equals true, dispose all managed  
                // and unmanaged resources. 
                if (disposing)
                {


                }

                // Call the appropriate methods to clean up  
                // unmanaged resources here. 
                // If disposing is false,  
                // only the following code is executed.
            }
            _disposed = true;
        }

        public void ProcessHtml()
        {
            var data = new Data();
            makes = data.GetMakes();

            var htmlList = data.GetAllHtmUnprocessed();

            htmlList.Clear();
            htmlList = data.GetAllHtmUnprocessed();
            var myList = new List<string>();
            foreach (var doc in htmlList)
            {
                var carId = doc.CarId;
                var propValue = new List<PropValue>();
                var parser = new HtmlParser();
                //Just get the DOM representation
                var document = parser.Parse(doc.html);
                var postdate = document.All.Where(m => m.LocalName == "time");
                if (postdate.Count() > 0)
                {
                    var date = ((AngleSharp.Dom.Html.IHtmlTimeElement)postdate.First()).DateTime;
                    propValue.Add(new PropValue
                    {
                        Prop = "PostDate",
                        Value = date
                    });
                }
                var attrgroup = document.All.Where(m => m.LocalName == "p" && m.ClassList.Contains("attrgroup"));
                foreach (var att in attrgroup)
                {
                    var c = att.GetDeepControlsByType<AngleSharp.Dom.IElement>();
                    foreach (var elem in c)
                    {
                        if (!string.IsNullOrEmpty(elem.InnerHtml.Trim()) && elem.InnerHtml.Contains("<b>"))
                        {
                            myList.Add(elem.InnerHtml);
                            var ymm = MatchYearMakeModel(elem.InnerHtml);
                            if (ymm != null)
                            {
                                if (!string.IsNullOrEmpty(ymm.Year))
                                {
                                    propValue.Add(item:
                                        new PropValue { CarId = carId, Prop = "year", Value = ymm.Year });
                                }
                                if (!string.IsNullOrEmpty(ymm.Make))
                                {
                                    propValue.Add(item:
                                        new PropValue { CarId = carId, Prop = "make", Value = ymm.Make });
                                }
                                if (!string.IsNullOrEmpty(ymm.Model))
                                {
                                    propValue.Add(item:
                                        new PropValue { CarId = carId, Prop = "model", Value = ymm.Model });
                                }

                            }
                            var propval = MatchPropValue(elem.InnerHtml);
                            propValue.Add(item:
                                new PropValue { CarId = carId, Prop = propval.Prop, Value = propval.Value });

                        }

                    }
                }

                if (propValue.Count > 0)
                {
                    var car = data.GetCar(doc.CarId);
                    if (car == null) continue;
                    foreach (var pv in propValue)
                    {
                        switch (pv.Prop)
                        {
                            case "PostDate":
                                car.PostDate = DateTimeOffset.Parse(pv.Value).UtcDateTime;
                                break;
                            case "year":
                                car.Year = !string.IsNullOrEmpty(pv.Value.NullIfEmpty())
                                    ? Convert.ToInt16(pv.Value.NullIfEmpty())
                                    : car.Year;
                                break;
                            case "make":
                                car.Make = pv.Value.NullIfEmpty();
                                break;
                            case "model":
                                car.Model = pv.Value.NullIfEmpty();
                                break;
                            case "condition":
                                car.Condition = pv.Value.NullIfEmpty();
                                break;
                            case "drive":
                                car.Drive = pv.Value.NullIfEmpty();
                                break;
                            case "fuel":
                                car.Fuel = pv.Value.NullIfEmpty();
                                break;
                            case "paint color":
                                car.Color = pv.Value.NullIfEmpty();
                                break;
                            case "size":
                                car.Size = pv.Value.NullIfEmpty();
                                break;
                            case "title status":
                                car.TitleStatus = pv.Value.NullIfEmpty();
                                break;
                            case "transmission":
                                car.Transmission = pv.Value.NullIfEmpty();
                                break;
                            case "type":
                                car.Type = pv.Value.NullIfEmpty();
                                break;
                            case "VID":
                                car.VIN = pv.Value.NullIfEmpty();
                                break;
                            case "odometer":
                                var miles = !string.IsNullOrEmpty(pv.Value.NullIfEmpty())
                                    ? Convert.ToInt32(pv.Value.NullIfEmpty())
                                    : car.Miles;
                                if (miles != null)
                                    if (!car.Miles.ToString().StartsWith(miles.ToString().Trim()))
                                    {
                                        car.Miles = miles != 0 ? miles : null;
                                    }
                                break;
                        }
                    }
                    data.UpdateCars(car);
                }

                data.UpdateHtmlSent(doc.CarId);


            }
            data.Dispose();
        }

        private YearMakeModel MatchYearMakeModel(string InputText)
        {
            var regex = new Regex("(?:<b>)(?<year>\\d{4})(?<makemodel>\\s[0-9A-Za-z ]+)(?:</b>)",
            RegexOptions.Multiline
            | RegexOptions.CultureInvariant
            | RegexOptions.Compiled);
            var m = regex.Match(InputText);
            YearMakeModel returnVal = null;
            if (m.Success)
            {
                returnVal = new YearMakeModel();
                //yearMakeModel.Add(m.Groups["title"].Value);
                returnVal.Year = m.Groups["year"].Value.Trim();
                var makeModel = m.Groups["makemodel"].Value.Trim();
                foreach (var cm in makes)
                {
                    if (makeModel.ToUpper().Contains(cm.Make.ToUpper()))
                    {
                        returnVal.Make = cm.Make;
                        break;
                    }
                }
                foreach (var cm in makes)
                {
                    if (makeModel.ToUpper().Contains(cm.Model.ToUpper()) && makeModel.ToUpper().Contains(cm.Make.ToUpper()))
                    {
                        returnVal.Model = cm.Model;
                        break;
                    }
                }

            }
            return returnVal;
        }
        private PropValue MatchPropValue(string InputText)
        {

            var MyRegex = new Regex("(?<prop>^[A-Za-z ]+):\\s<b>(?<value>\\w+)</b>",
                RegexOptions.Multiline
                | RegexOptions.CultureInvariant
                | RegexOptions.Compiled);



            //// Capture the first Match, if any, in the InputText
            Match m = MyRegex.Match(InputText);
            var match = new PropValue();
            if (m.Success)
            {
                match.Prop = m.Groups["prop"].Value;
                match.Value = m.Groups["value"].Value;

            }
            return match;
        }


    }
}
