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

        private List<Makes> makes;

        private DataAccess.Data data = new Data();

        public mainForm()
        {
            InitializeComponent();
            makes = data.GetMakes();


        }


        private void button1_Click(object sender, EventArgs e)
        {
            LoadAsync(this.textBox2.Text, CancellationToken.None);
        }

        private async Task LoadAsync(String url, CancellationToken cancel)
        {
            var handler = new HttpClientHandler {AllowAutoRedirect = false};
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
            var mseconds = random.Next(75, 100)*1000;
            Thread.Sleep(mseconds);
            Debug.Write("sleped from " + (mseconds/1000));
        }

        public static int GetRandom(RNGCryptoServiceProvider rngProvider, int min, int max)
        {
            byte[] b = new byte[sizeof (UInt32)];
            rngProvider.GetBytes(b);
            double d = BitConverter.ToUInt32(b, 0)/(double) UInt32.MaxValue;
            return min + (int) ((max - min)*d);
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


        private YearMakeModel MatchYearMakeModel(string InputText)
        {
            var regex = new Regex("(?:<b>)(?<year>\\d{4})(?<makemodel>\\s[0-9A-Za-z ]+)(?:</b>)",
                RegexOptions.Multiline
                | RegexOptions.CultureInvariant
                | RegexOptions.Compiled);
            Match m = regex.Match(InputText);
            string year = null;
            string makeModel = null;
            string make = null;
            string model = null;
            YearMakeModel returnVal = null;
            if (m.Success)
            {
                returnVal = new YearMakeModel();
                //yearMakeModel.Add(m.Groups["title"].Value);
                returnVal.Year = m.Groups["year"].Value.Trim();
                makeModel = m.Groups["makemodel"].Value.Trim();
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
                    if (makeModel.ToUpper().Contains(cm.Model.ToUpper()) &&
                        makeModel.ToUpper().Contains(cm.Make.ToUpper()))
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

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtHtml.Text = htmlList.Where(x => x.CarId == Convert.ToInt32(comboBox1.SelectedItem)).First().html;
            // txtHtml.Text = e.In(htmlList)
        }

        private void button3_Click(object sender, EventArgs e)
        {
            var htmlProcess = new HtmlProcessing();
            htmlProcess.ProcessHtml();
            htmlProcess.Dispose();
        }
    
}

    

    internal class async
    {
    }
}
