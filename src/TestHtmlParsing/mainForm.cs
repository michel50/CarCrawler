using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using AngleSharp;
using AngleSharp.Parser.Html;

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
            LoadAsync("www.codeproject.com", CancellationToken.None);
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
            cancel.ThrowIfCancellationRequested();

            //Get the response stream
            var response = await request.Content.ReadAsStreamAsync();
            cancel.ThrowIfCancellationRequested();

            // Create a new parser front - end(can be re - used)
            var parser = new HtmlParser();
            //Just get the DOM representation
            var document = parser.Parse(response);
           
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
    }

    internal class async
    {
    }
}
