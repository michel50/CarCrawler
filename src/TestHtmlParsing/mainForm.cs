using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using DataAccess.Entities;
using AngleSharp.Parser.Html;
using DataAccess;


namespace TestHtmlParsing
{
    public partial class mainForm : Form
    {
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

        private void btnParse_Click(object sender, EventArgs e)
        {
            // Create a new parser front - end(can be re - used)
            var parser = new HtmlParser();
            //Just get the DOM representation
            var document = parser.Parse(txtHtml.Text);

            var attrgroup = document.All.Where(m => m.LocalName == "p" && m.ClassList.Contains("attrgroup"));
            foreach (var att in attrgroup)
            {
                var c = att.GetDeepControlsByType<AngleSharp.Dom.IElement>();
            }
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            SleepRandom();
        }
    }


    internal class async
    {
    }
}
