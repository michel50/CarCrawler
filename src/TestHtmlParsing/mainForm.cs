using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using AngleSharp.Dom.Html;
using DataAccess.Entities;
using AngleSharp.Parser.Html;
using DataAccess;
using MongoDB.Driver.Linq;
using TestHtmlParsing.DTos;


namespace TestHtmlParsing
{
    public partial class mainForm : Form
    {
        private List<Html> htmlList = new List<Html>();
 
        private List<string> yearMakeModel = new List<string>(); 
        private DataAccess.Data data = new Data();
        public mainForm()
        {
            InitializeComponent();
        }


        private void button1_Click(object sender, EventArgs e)
        {
            LoadAsync(this.textBox2.Text, CancellationToken.None);
        }

        async Task LoadAsync(String url, CancellationToken cancel)
        {
            var handler = new HttpClientHandler { AllowAutoRedirect = false };
            var http = new HttpClient(handler);
            http.DefaultRequestHeaders.Add("User-Agent",
                                             "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; WOW64; Trident / 6.0)");



            //Get a correct URL from the given one (e.g. transform codeproject.com to http://codeproject.com)
            var uri = Sanitize(url);

            //Make the request
            var request = await http.GetAsync(uri);
            //var request = await http.GetStringAsync(uri);
            cancel.ThrowIfCancellationRequested();

            //Get the response stream
            var response = await request.Content.ReadAsStringAsync();
            cancel.ThrowIfCancellationRequested();
            var html = new Html();
            txtHtml.Text = response;
            html.CarId = Convert.ToInt32(textBox1.Text);
            html.html = response;
            html.Processed = false;
            var data = new Data();
            data.InsertHtmlData(html);
            cancel.ThrowIfCancellationRequested();

            /* Use the document */
        }
        protected Uri Sanitize(String url)
        {
            Uri uri;

            if (File.Exists(url))
                url = "file://localhost/" + url.Replace('\\', '/');

            var lurl = url.ToLower();

            if (!lurl.StartsWith("file://") && !lurl.StartsWith("http://") && !lurl.StartsWith("https://"))
                url = "http://" + url;

            if (Uri.TryCreate(url, UriKind.Absolute, out uri))
                return uri;

            return new Uri("http://www.google.com/search?q=" + url);
        }


        private void SleepRandom()
        {
            // Quartz .net  [DisallowConcurrentExecution]    http://www.quartz-scheduler.net/documentation/faq.html
            // more https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=quartz+net++%5BDisallowConcurrentExecution%5D
            Random random = new Random();
            var mseconds = random.Next(75, 100) * 1000;
            Thread.Sleep(mseconds);
            Debug.Write("sleped from " + (mseconds / 1000) );
        }

        public static int GetRandom(RNGCryptoServiceProvider rngProvider, int min, int max)
        {
            byte[] b = new byte[sizeof(UInt32)];
            rngProvider.GetBytes(b);
            double d = BitConverter.ToUInt32(b, 0) / (double)UInt32.MaxValue;
            return min + (int)((max - min) * d);
        }
        private void btnParse_Click(object sender, EventArgs e)
        {
            txtParse.Text = string.Empty;
            // Create a new parser front - end(can be re - used)
            var parser = new HtmlParser();
            //Just get the DOM representation
            var document = parser.Parse(txtHtml.Text);

            var attrgroup = document.All.Where(m => m.LocalName == "p" && m.ClassList.Contains("attrgroup"));
            foreach (var att in attrgroup)
            {
                var c = att.GetDeepControlsByType<AngleSharp.Dom.IElement>();
                foreach (var elem in c)
                {
                    txtParse.AppendText(elem.InnerHtml.AppendLine());
                }
            }
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            SleepRandom();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            FillHtmlList();
        }

        private void FillHtmlList()
        {
            htmlList.Clear();
            htmlList = data.GetAllHtmUnprocessed();
            foreach (var id in htmlList)
            {
                comboBox1.Items.Add(id.CarId);
            }
        }


        private string MatchYearMakeModel(string InputText)
        {
           var regex = new Regex("(?:<b>)(?<year>\\d{4})(?<makemode>\\s[0-9A-Za-z ]+)(?:</b>)",
           RegexOptions.Multiline
           | RegexOptions.CultureInvariant
           | RegexOptions.Compiled);
            Match m = regex.Match(InputText);
            string year = null;
            if (m.Success)
            { 
                yearMakeModel.Add(m.Groups["title"].Value);
                year = m.Groups["year"].Value.Trim();
            }
            return year;
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

    private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtHtml.Text = htmlList.Where(x => x.CarId == Convert.ToInt32(comboBox1.SelectedItem)).First().html;
            // txtHtml.Text = e.In(htmlList)
        }

        private void button3_Click(object sender, EventArgs e)
        {
            yearMakeModel.Clear();
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
                            if (!string.IsNullOrEmpty(ymm))
                            {
                                propValue.Add(item:
                                    new PropValue { CarId = carId, Prop = "year", Value = ymm });

                            }
                            var propval = MatchPropValue(elem.InnerHtml);
                            propValue.Add(item:
                                new PropValue {CarId = carId, Prop = propval.Prop, Value = propval.Value});

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
                            case "year":
                                car.Year = !string.IsNullOrEmpty(pv.Value.NullIfEmpty()) ? Convert.ToInt16(pv.Value.NullIfEmpty()) : car.Year;
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
                                car.Miles = !string.IsNullOrEmpty(pv.Value.NullIfEmpty()) ? Convert.ToInt32(pv.Value.NullIfEmpty()) : car.Miles;
                                break;
                        }
                    }
                    data.UpdateCars(car);
                }
            }
            //myList.Sort();
            //foreach (var s in myList)
            //{
            //    txtParse.AppendText(s.AppendLine());
            //}

            //var uniqueProps =
            //    (from dbo in propValue
            //      select dbo.Prop).Distinct().OrderBy(name => name);

            //htmlList.Clear();
   
            //foreach (var upv in uniqueProps)
            //{
            //    txtHtml.AppendText(upv.AppendLine());
            //}
            //yearMakeModel.Sort();
            //foreach (var ymm in yearMakeModel)
            //{
            //    txtHtml.AppendText(ymm.AppendLine());
            //}

        }
    }


    internal class async
    {
    }
}
