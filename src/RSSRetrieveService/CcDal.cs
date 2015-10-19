using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Web.UI;
using DataAccess;
using DataAccess.Entities;
using NLog;
using RSSRetrieveService.Properties;
using AngleSharp.Parser.Html;

namespace RSSRetrieveService
{
    public class CcDal : IDisposable
    {
        private static readonly Logger Logger = LogManager.GetCurrentClassLogger();
        private bool _disposed;
        public readonly Data DataAccess;
        private readonly List<CarDetail> _emptyList;
        private readonly List<Feed> _feeds;
        private readonly List<Predicate> _predicates;
        public CcDal()
        {
            DataAccess = new Data();
            // DataAccess.CleanTables();
            _emptyList = DataAccess.GetEmptyDetail();
            _feeds = DataAccess.GetActiveFeeds();
            _predicates = DataAccess.GetPredicates();
        }
        public void FillCarDetails()
        {
            try
            {
                Console.WriteLine("Starting");
                DataAccess.CleanTables();
                Logger.Debug("Filling Details = {0}", DateTime.Now.ToString("MMM ddd d HH:mm yyyy"));
                FillMillage();
                FillYears();
                FillMake();
                FillModel();
                FillPrice();
                foreach (var car in _emptyList)
                {
                    DataAccess.UpdateCarDetail(car);
                    DataAccess.CheckForDups(car.Id);
                }

                var htmlProcess = new HtmlProcessing();
                htmlProcess.ProcessHtml();
                htmlProcess.Dispose();

                SendOutEmails();
                SendMail();
                Console.WriteLine("Done");

            }
            catch (Exception ex)
            {
                Logger.Error(ex.ToString());
            }
        }

   

        private void FillMillage()
        {

            var regExMiles = DataAccess.GetRegEx("Miles");

            foreach (var regEx in regExMiles)
            {

                var regex = new Regex(
                    regEx.RegExExpression,
                    RegexOptions.IgnoreCase
                    | RegexOptions.Singleline
                    | RegexOptions.CultureInvariant
                    | RegexOptions.Compiled
                    );
                Match m;

                string tempString;
                string intString;
                int miles;
                int tempMiles;
                foreach (var emptyColumn in _emptyList)
                {

                    m = regex.Match(emptyColumn.Title);
                    if (m.Success)
                    {

                        tempString = m.Value;
                        tempString = tempString.ToLower().Replace(".5k", "500");
                        tempString = tempString.ToLower().Replace("k", "000");
                        tempString = tempString.ToLower().Replace("xxx", "000");

                        intString = RemoveNonNumeric(tempString);
                        if (Int32.TryParse(intString, out tempMiles))
                        {

                            if (tempMiles > 3000)
                            {
                                miles = tempMiles;
                                emptyColumn.Miles = miles;
                            }
                        }
                    }

                }


                foreach (var emptyColumn in _emptyList.Where(x => x.Miles == (int?)null))
                {
                    m = regex.Match(emptyColumn.Description);
                    if (m.Success)
                    {
                        tempString = m.Value;
                        tempString = tempString.ToLower().Replace(".5k", "500");
                        tempString = tempString.ToLower().Replace("k", "000");
                        tempString = tempString.ToLower().Replace("xxx", "000");

                        intString = RemoveNonNumeric(tempString);
                        if (int.TryParse(intString, out tempMiles))
                        {

                            if (tempMiles > 3000)
                            {
                                miles = tempMiles;
                                emptyColumn.Miles = miles;
                            }
                        }
                    }
                }
            }
        }



        private void FillMake()
        {
            try
            {

                foreach (var car in _emptyList.Where(x => x.Year != (short?)null))
                {
                    var makes = DataAccess.GetDistinctMakes(car.Year.Value);
                    if (makes.Count > 0)
                    {
                        foreach (var make in makes)
                        {

                            if (car.Title.ToUpper().Contains(make.ToUpper()))
                            {
                                car.Make = make;

                            }
                        }

                    }
                }

                foreach (var car in _emptyList.Where(x => x.Year != (short?)null))
                {
                    var makes = DataAccess.GetDistinctMakes(car.Year.Value);
                    if (makes.Count > 0)
                    {
                        foreach (var make in makes)
                        {

                            if (car.Description.ToUpper().Contains(make.ToUpper()))
                            {
                                car.Make = make;
                            }
                        }

                    }
                }

            }
            catch (Exception ex)
            {
                Logger.Error(ex.ToString());
            }
        }

        private void FillModel()
        {
            try
            {

                foreach (var car in _emptyList.Where(x => x.Year != (short?)null && x.Make != null))
                {
                    var models = DataAccess.GetDistinctModel(car.Year.Value, car.Make);
                    if (models.Count > 0)
                    {

                        foreach (var model in models)
                        {

                            var carmodels = model.Split(' ');
                            var carfound = false;
                            var stringmodel = "";
                            foreach (string t in carmodels.Where(t => car.Title.ToUpper().Contains(t.ToUpper())))
                            {
                                if (carfound)
                                {
                                    stringmodel += " " + t;
                                }
                                else
                                {
                                    stringmodel += carmodels[0];
                                    carfound = true;

                                }
                            }
                            if (carfound)
                            {
                                car.Model = stringmodel;
                                break;
                            }

                        }

                    }
                }

                foreach (var car in _emptyList.Where(x => x.Year != (short?)null && x.Make != null))
                {
                    var models = DataAccess.GetDistinctModel(car.Year.Value, car.Make);
                    if (models.Count > 0)
                    {

                        foreach (var model in models)
                        {

                            var carmodels = model.Split(' ');
                            var carfound = false;
                            var stringmodel = "";
                            foreach (string t in carmodels.Where(t => car.Description.ToUpper().Contains(t.ToUpper())))
                            {
                                if (carfound)
                                {
                                    stringmodel += " " + t;
                                }
                                else
                                {
                                    stringmodel += carmodels[0];
                                    carfound = true;

                                }
                            }
                            if (carfound)
                            {
                                car.Model = stringmodel;
                                break;
                            }

                        }

                    }
                }
            }
            catch (Exception ex)
            {
                Logger.Error(ex.ToString());
            }
        }

        private void FillYears()
        {

            try
            {


                foreach (var emptyColumn in _emptyList)
                {
                    var tempstr = emptyColumn.Title.Substring(0, 4);
                    short tempint;
                    if (Int16.TryParse(tempstr, out tempint))
                    {
                        if (tempint > 1930 && tempint <= DateTime.Now.Year)
                        {
                            emptyColumn.Year = tempint;
                        }

                    }
                }


                foreach (var emptyColumn in _emptyList)
                {
                    var tempstr = emptyColumn.Title.Substring(0, 2);
                    short tempint;
                    if (Int16.TryParse(tempstr, out tempint))
                    {
                        if (tempint > 30)
                            tempint = (short)(tempint + 1900);
                        else
                        {
                            tempint = (short)(tempint + 2000);
                        }
                        if (tempint <= DateTime.Now.Year)
                        {
                            emptyColumn.Year = tempint;
                        }

                    }
                }

                var regExMiles = DataAccess.GetRegEx("Year");

                foreach (var regex in regExMiles.Select(regEx => new Regex(
                    regEx.RegExExpression,
                    RegexOptions.IgnoreCase
                    | RegexOptions.Singleline
                    | RegexOptions.CultureInvariant
                    | RegexOptions.Compiled
                    )))
                {
                    Match m;

                    short tempInt;
                    foreach (var emptyColumn in _emptyList)
                    {


                        m = regex.Match(emptyColumn.Title);
                        if (m.Success)
                        {
                            if (short.TryParse(m.Value, out tempInt))
                            {
                                emptyColumn.Year = tempInt;

                            }
                        }

                    }


                    foreach (var emptyColumn in _emptyList)
                    {

                        m = regex.Match(emptyColumn.Description);
                        if (m.Success)
                        {
                            if (short.TryParse(m.Value, out tempInt))
                            {
                                emptyColumn.Year = tempInt;

                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.Error(ex.ToString());
            }
        }

        private void FillPrice()
        {

            try
            {
                var regExMiles = DataAccess.GetRegEx("Price");

                foreach (var regEx in regExMiles)
                {

                    var regex = new Regex(
                        regEx.RegExExpression,
                        RegexOptions.IgnoreCase
                        | RegexOptions.Singleline
                        | RegexOptions.CultureInvariant
                        | RegexOptions.Compiled
                        );
                    Match m;

                    decimal tempInt;
                    foreach (var emptyColumn in _emptyList)
                    {


                        m = regex.Match(emptyColumn.Title);

                        if (m.Success)
                        {
                            if (decimal.TryParse(m.Value.Replace("$", "").Replace(",", ""), out tempInt))
                            {
                                emptyColumn.Price = tempInt;
                            }
                        }

                    }


                    foreach (var emptyColumn in _emptyList)
                    {

                        m = regex.Match(emptyColumn.Description);
                        if (m.Success)
                        {
                            if (decimal.TryParse(m.Value.Replace("$", "").Replace(",", ""), out tempInt))
                            {
                                emptyColumn.Price = tempInt;
                            }

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.Error(ex.ToString());
            }
        }

        private void WriteHtml(IEnumerable<Car> values, string subject)
        {
            
            var strBldr = new StringBuilder();
            var strWriter = new StringWriter(strBldr);
            var writer = new HtmlTextWriter(strWriter);

            writer.RenderBeginTag(HtmlTextWriterTag.Html);

            // <head>
            writer.RenderBeginTag(HtmlTextWriterTag.Head);

            writer.AddAttribute("type", "text/css");
            writer.RenderBeginTag(HtmlTextWriterTag.Style);
            writer.Write("table { border-collapse: separate; }");
            writer.Write("border-spacing: 0 5px; }");
            writer.RenderEndTag();

            // </head>
            writer.RenderEndTag();

            // <body>



            writer.RenderBeginTag(HtmlTextWriterTag.Body);

            writer.AddStyleAttribute("width", " 100%");

            writer.RenderBeginTag(HtmlTextWriterTag.Table); //Main Table
            writer.RenderBeginTag(HtmlTextWriterTag.Tr);
            writer.RenderBeginTag(HtmlTextWriterTag.Td);

            var counter = 0;
            foreach (var val in values)
            {
                
                if(val.EmailSent)
                    continue;
 
                writer.AddStyleAttribute("width", " 100%");

                writer.AddStyleAttribute("background-color", counter % 2 == 0 ? " #3399FF" : " #999966");

                writer.RenderBeginTag(HtmlTextWriterTag.Table);

                //writer.RenderBeginTag(HtmlTextWriterTag.Tr);
                //writer.RenderBeginTag(HtmlTextWriterTag.Td);
                //writer.Write("&nbsp;");
                //writer.RenderEndTag();
                //writer.RenderEndTag();

                writer.RenderBeginTag(HtmlTextWriterTag.Tr);
                writer.RenderBeginTag(HtmlTextWriterTag.Td);

                writer.AddStyleAttribute("width", " 100%");
                writer.RenderBeginTag(HtmlTextWriterTag.Table);

                writer.RenderBeginTag(HtmlTextWriterTag.Tr);

                writer.RenderBeginTag(HtmlTextWriterTag.Td);
                writer.Write(val.DateIn.ToString("MM/dd/yyyy hh:mm:ss tt", CultureInfo.InvariantCulture));
                writer.RenderEndTag();

                writer.RenderBeginTag(HtmlTextWriterTag.Td);
                // To do
                writer.Write(_feeds.Where(x => x.Id == val.FeedId).FirstOrDefault().FeedCity);

                writer.RenderEndTag();

                writer.RenderBeginTag(HtmlTextWriterTag.Td);
                // To Do
                writer.Write(_feeds.Where(x => x.Id == val.FeedId).FirstOrDefault().FeedState);
                writer.RenderEndTag();

                writer.RenderEndTag();
                writer.RenderEndTag();

                writer.RenderEndTag();
                writer.RenderEndTag();

                writer.RenderBeginTag(HtmlTextWriterTag.Tr);
                writer.RenderBeginTag(HtmlTextWriterTag.Td);
                writer.Write(val.Title);
                writer.RenderEndTag();
                writer.RenderEndTag();



                writer.RenderBeginTag(HtmlTextWriterTag.Tr);
                writer.RenderBeginTag(HtmlTextWriterTag.Td);
                writer.Write(val.Description);
                writer.RenderEndTag();
                writer.RenderEndTag();

                writer.RenderBeginTag(HtmlTextWriterTag.Tr);
                writer.RenderBeginTag(HtmlTextWriterTag.Td);
                writer.AddAttribute(HtmlTextWriterAttribute.Href, val.Link);
                writer.RenderBeginTag(HtmlTextWriterTag.A);
                writer.Write(val.Link);
                writer.RenderEndTag(); //A
                writer.RenderEndTag();
                writer.RenderEndTag();
                writer.RenderEndTag();
                counter++;
            }


            writer.RenderEndTag();
            writer.RenderEndTag();
            writer.RenderEndTag(); //End Main Table



            // </body>
            writer.RenderEndTag();
            // </html>
            writer.RenderEndTag();

            var html = strBldr.ToString();
            var email = new Email
                {
                    EmailGeneratedDate = DateTime.Now,
                    EmailMessage = html,
                    EmailSent = false,
                    EmailSubject = subject
                };
            //  Logger.Debug(html);
            int id = DataAccess.InsertEmail(email);
            foreach (var v in values)
            {
     
                var batch = new EmailBatch { EmailId = id, CarId = v.Id };
                DataAccess.InsertEmailBatch(batch);
                DataAccess.UpdateMailSent(v.Id);
                v.EmailSent = true;
            }


        }

  
        private void SendOutEmails()
        {
            foreach (var q in DataAccess.GetEmailQueries().FindAll(x => x.Email == true))
            {
                
                var emails = DataAccess.GetEmailsToSend(GenSqlStatementForEmails(q.Id));
                Logger.Debug("Total from query {0} = {1}.", q.Subject, emails.Count);
                var emailss = emails.Where(e => e.EmailSent == false);
                Logger.Debug("Total after Lambda  {0} = {1}.", q.Subject, emailss.Count());
                var batches = emailss.Partition(10);
                foreach (var batch in batches)
                {
                    WriteHtml(batch, q.Subject);

                }
            }
        }
        private string GenSqlStatementForHtmlParsing(Int16 id)
        {
            var query = DataAccess.GetQueryById(id);
            var keywords = query.TitleAndDescripton.Split(',');
            for (var i = 0; i < keywords.Length; i++)
            {

                keywords[i] = "\"" + keywords[i].Trim() + "\"";
            }
            var contains = string.Empty;
            if (!string.IsNullOrEmpty(query.TitleAndDescripton.Trim()))
            {
                contains = "(contains([title],'";

                foreach (var word in keywords)
                {
                    if (query.AndOr == 1)
                    {
                        contains += word.Trim() + " And ";
                    }
                    else
                    {
                        contains += word.Trim() + " Or ";
                    }
                }
                if (contains.EndsWith(" And "))
                    contains = contains.Substring(0, contains.Length - 5);
                if (contains.EndsWith(" Or "))
                    contains = contains.Substring(0, contains.Length - 4);

                contains += "')";
                contains += " or contains([description],'";
                foreach (var word in keywords)
                {
                    if (query.AndOr == 1)
                    {
                        contains += word.Trim() + " And ";
                    }
                    else
                    {
                        contains += word.Trim() + " Or ";
                    }
                }
                if (contains.EndsWith(" And "))
                    contains = contains.Substring(0, contains.Length - 5);
                if (contains.EndsWith(" Or "))
                    contains = contains.Substring(0, contains.Length - 4);
                if (keywords.Length > 0)
                {
                    contains += "'))";
                }

            }
            query.Ignore = string.IsNullOrEmpty(query.Ignore) ? string.Empty : query.Ignore.Trim();
            var ignore = query.Ignore.Split(',');
            for (var i = 0; i < ignore.Length; i++)
            {
                ignore[i] = "\"" + ignore[i].Trim() + "\"";

            }





            if (!string.IsNullOrEmpty(query.Ignore))
            {
                if (!string.IsNullOrEmpty(contains))
                {
                    contains += " and (not contains([title],'";
                }
                else
                {
                    contains = "(not contains([title],'";
                }
                contains = ignore.Aggregate(contains, (current, word) => current + (word.Trim() + " And "));
                if (contains.EndsWith(" And "))
                    contains = contains.Substring(0, contains.Length - 5);


                contains += "')";
                contains += " and not contains([description],'";
                contains = ignore.Aggregate(contains, (current, word) => current + (word.Trim() + " And "));
                if (contains.EndsWith(" And "))
                    contains = contains.Substring(0, contains.Length - 5);
                if (contains.EndsWith(" Or "))
                    contains = contains.Substring(0, contains.Length - 4);
                contains += "'))";


            }
            var sqlStr = "select * from car where " + contains + " and (HtmlDownloaded = 0) and (datediff(day, DateIn, getdate()) < " + Settings.Default.maxemaildate + ")"; //(FeedId in (select Id From Feed where FeedActive = 1))
            Logger.Debug(sqlStr);
            return sqlStr;
        }
        private string GenSqlStatementForEmails(Int16 id)
        {
            var query = DataAccess.GetQueryById(id);
            var keywords = query.TitleAndDescripton.Split(',');
            for (var i = 0; i < keywords.Length; i++)
            {
           
                    keywords[i] = "\"" + keywords[i].Trim() + "\"";
            }
            var contains = string.Empty;
            if (!string.IsNullOrEmpty(query.TitleAndDescripton.Trim()))
            {
                contains = "(contains([title],'";

                foreach (var word in keywords)
                {
                    if (query.AndOr == 1)
                    {
                        contains += word.Trim() + " And ";
                    }
                    else
                    {
                        contains += word.Trim() + " Or ";
                    }
                }
                if (contains.EndsWith(" And "))
                    contains = contains.Substring(0, contains.Length - 5);
                if (contains.EndsWith(" Or "))
                    contains = contains.Substring(0, contains.Length - 4);

                contains += "')";
                contains += " or contains([description],'";
                foreach (var word in keywords)
                {
                    if (query.AndOr == 1)
                    {
                        contains += word.Trim() + " And ";
                    }
                    else
                    {
                        contains += word.Trim() + " Or ";
                    }
                }
                if (contains.EndsWith(" And "))
                    contains = contains.Substring(0, contains.Length - 5);
                if (contains.EndsWith(" Or "))
                    contains = contains.Substring(0, contains.Length - 4);
                if (keywords.Length > 0)
                {
                    contains += "'))";
                }

            }
            query.Ignore = string.IsNullOrEmpty(query.Ignore) ? string.Empty : query.Ignore.Trim();
            var ignore = query.Ignore.Split(',');
            for (var i = 0; i < ignore.Length; i++)
            {
                     ignore[i] = "\"" + ignore[i].Trim() + "\"";

            }





            if (!string.IsNullOrEmpty(query.Ignore))
            {
                if (!string.IsNullOrEmpty(contains))
                {
                    contains += " and (not contains([title],'";
                }
                else
                {
                    contains = "(not contains([title],'";
                }
                contains = ignore.Aggregate(contains, (current, word) => current + (word.Trim() + " And "));
                if (contains.EndsWith(" And "))
                    contains = contains.Substring(0, contains.Length - 5);


                contains += "')";
                contains += " and not contains([description],'";
                contains = ignore.Aggregate(contains, (current, word) => current + (word.Trim() + " And "));
                if (contains.EndsWith(" And "))
                    contains = contains.Substring(0, contains.Length - 5);
                if (contains.EndsWith(" Or "))
                    contains = contains.Substring(0, contains.Length - 4);
                contains += "'))";


            }
            if (query.MakePredicate > 0)
            {
                contains = BuildStringPredicate(contains, query.MakePredicate.Value, query.MakeValue, "Make", query.MakeAllowNull);

            }
            if (query.ModelPredicate > 0)
            {
                contains = BuildStringPredicate(contains, query.ModelPredicate.Value, query.ModelValue, "Model", query.ModelAllowNull);

            }
            if (query.MilesPredicate > 0)
            {
                contains = BuildNumberPredicate(contains, query.MilesPredicate.Value, query.MilesValue, "Miles", query.MilesAllowNull);

            }
            if (query.PricePredicate > 0)
            {
                contains = BuildNumberPredicate(contains, query.PricePredicate.Value, query.PriceValue, "Price", query.PriceAllowNull);

            }
            if (query.YearPredicate > 0)
            {
                contains = BuildNumberPredicate(contains, query.YearPredicate.Value, query.YearValue, "[Year]", query.YearAllowNull);

            }

            var sqlStr = "select * from car where " + contains + " and (EmailSent = 0) and (datediff(day, DateIn, getdate()) < " + Settings.Default.maxemaildate + ")"; //(FeedId in (select Id From Feed where FeedActive = 1))
            Logger.Debug(sqlStr);
            return sqlStr;
        }

        private string BuildStringPredicate(string contains, byte predicate, string value, string name, bool allowNulls)
        {

            var tmpPredicate = _predicates.FirstOrDefault(e => e.Id == predicate);
            var tempvalue = value.Split(',');
            var tempcontains = "(";
            if (tempvalue.Length == 2)
            {
                tempcontains += string.Format(tmpPredicate.PredicateFormat, name + "'", tempvalue[0].Trim(), "'" + tempvalue[1].Trim()) +
                                (allowNulls
                                     ? "' or " + name + " is null"
                                     : "'") + ")";
            }
            else
            {
                tempcontains += string.Format(tmpPredicate.PredicateFormat, name, "'" + tempvalue[0] + "'") +
                               (allowNulls
                                    ? " or " + name + " is null"
                                    : "") + ")";
            }

            if (contains.Length > 0)
            {
                contains += "and " + tempcontains;
            }
            else
            {
                contains = tempcontains;
            }
            return contains;
        }
        private string BuildNumberPredicate(string contains, byte predicate, string value, string name, bool allowNulls)
        {

            var tmpPredicate = _predicates.FirstOrDefault(e => e.Id == predicate);
            var tempvalue = value.Split(',');
            var tempcontains = "(";
            if (tempvalue.Length == 2)
            {
                tempcontains += string.Format(tmpPredicate.PredicateFormat, name, tempvalue[0].Trim(), tempvalue[1].Trim()) +
                                (allowNulls
                                     ? " or " + name + " is null"
                                     : "") + ")";
            }
            else
            {
                tempcontains += string.Format(tmpPredicate.PredicateFormat, name, tempvalue[0]) +
                               (allowNulls
                                    ? " or " + name + " is null"
                                    : "") + ")";
            }

            if (contains.Length > 0)
            {
                contains += " and " + tempcontains;
            }
            else
            {
                contains = tempcontains;
            }
            return contains;
        }
        private void SendMail()
        {
            Logger.Info("Sending Email {0}",DateTime.Now);
            var batches = DataAccess.GetBatchemailsToSend();
            foreach (var batch in batches)
            {
                if(batch.EmailSent.Value)
                    continue;
                var message = new MailMessage(Settings.Default.mailfrom, Settings.Default.mailto);
                message.IsBodyHtml = true;
                if (batch.EmailGeneratedDate != null)
                    message.Subject =
                        string.Format(batch.EmailSubject + " " +
                                      batch.EmailGeneratedDate.Value.ToString("MM/dd/yyyy hh:mm:ss tt",
                                                                              CultureInfo.InvariantCulture));
                message.Body = batch.EmailMessage;
                var client = new SmtpClient(Settings.Default.smptserver);
                client.Port = Settings.Default.smtpport;

                client.Credentials = new NetworkCredential(Settings.Default.smtpuser,
                                                           Settings.Default.smptpassword);
                client.EnableSsl = Settings.Default.smtpssl;

                //var client = new SmtpClient("localhost");
                //client.Port = 25;

                // Credentials are necessary if the server requires the client 
                // to authenticate before it will send e-mail on the client's behalf.
                if (!Settings.Default.sendemail)
                {
                    return;
                }
                client.Send(message);
                DataAccess.BatchEmailSent(batch.Id);
                var random = new Random();
                int randomNumber = random.Next(1000, 5000);
                Thread.Sleep(randomNumber);
            }
        }



        /// <summary>
        ///  Using an array and a foreach loop. Fastest in .NET 4.0
        /// </summary>
        /// <param name="word"></param>
        /// <returns></returns>
        private string RemoveNonNumeric(string word)
        {
            int x = 0;
            var chars = new char[word.Length];
            // ReSharper disable RedundantStringToCharArrayCall
            foreach (char c in word.ToCharArray())
            // ReSharper restore RedundantStringToCharArrayCall
            {
                if (Char.IsDigit(c))
                {
                    chars[x] = c;
                    x++;
                }
            }
            return new string(chars, 0, x);
        }


        // Implement IDisposable. http://msdn.microsoft.com/en-us/library/system.gc.suppressfinalize.aspx
        // Do not make this method virtual. 
        // A derived class should not be able to override this method. 
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

        // Dispose(bool disposing) executes in two distinct scenarios. 
        // If disposing equals true, the method has been called directly 
        // or indirectly by a user's code. Managed and unmanaged resources 
        // can be disposed. 
        // If disposing equals false, the method has been called by the  
        // runtime from inside the finalizer and you should not reference  
        // other objects. Only unmanaged resources can be disposed. 
        private void Dispose(bool disposing)
        {
            // Check to see if Dispose has already been called. 
            if (!_disposed)
            {
                // If disposing equals true, dispose all managed  
                // and unmanaged resources. 
                if (disposing)
                {
                    DataAccess.Dispose();
                    _emptyList.Clear();


                }

                // Call the appropriate methods to clean up  
                // unmanaged resources here. 
                // If disposing is false,  
                // only the following code is executed.
            }
            _disposed = true;
        }

        // Use C# destructor syntax for finalization code. 
        // This destructor will run only if the Dispose method  
        // does not get called. 
        // It gives your base class the opportunity to finalize. 
        // Do not provide destructors in types derived from this class.
        ~CcDal()
        {
            // Do not re-create Dispose clean-up code here. 
            // Calling Dispose(false) is optimal in terms of 
            // readability and maintainability.
            Dispose(false);
        }

    }

    static class DataReaderExtensions
    {
        public static string GetStringOrNull(this IDataReader reader, int ordinal)
        {
            return reader.IsDBNull(ordinal) ? null : reader.GetString(ordinal);
        }

        public static string GetStringOrNull(this IDataReader reader, string columnName)
        {
            return reader.IsDBNull(reader.GetOrdinal(columnName)) ? null : reader.GetString(reader.GetOrdinal(columnName));
        }
    }



}
