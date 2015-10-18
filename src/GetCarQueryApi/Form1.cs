using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using DansCSharpLibrary.IO;
using DansCSharpLibrary.Serialization;
using ServiceStack;

namespace GetCarQueryApi
{
    public partial class Form1 : Form
    {
        static List<Make> _makes;
        static List<Model> _models;
        private static string proxyserver;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnGetYears_Click(object sender, EventArgs e)
        {

        }

        private static async Task GetMakes(string year)
        {
            try
            {
                var httpHandler = new HttpClientHandler
                {
                    //http://proxylist.hidemyass.com/search-1291967#listable
                    Proxy = new WebProxy(proxyserver, false),
                    UseProxy = true

                };

                var client = new HttpClient(httpHandler);
                client.DefaultRequestHeaders.Add("User-Agent",
                                 "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; WOW64; Trident / 6.0)");
                {

                    var task = client.GetAsync("http://www.carqueryapi.com/api/0.3/?callback=?&cmd=getMakes&year=" + year)
                        .ContinueWith((taskwithresponse) =>
                        {
                            var response = taskwithresponse.Result;
                            var jsonString = response.Content.ReadAsStringAsync();

                            jsonString.Wait();
                            Debug.Write(jsonString.Result);
                            var googleSearch = JObject.Parse(jsonString.Result.Replace("?(", "").Replace(");", ""));
                            var results = googleSearch["Makes"].Children().ToList();


                            _makes = new List<Make>();

                            foreach (JToken result in results)
                            {
                                var searchResult =
                                    JsonConvert.DeserializeObject<Make>(result.ToString());
                                _makes.Add(searchResult);
                            }


                        });
                    task.Wait();

                }
            }
            catch (Exception ex)
            {
                Debug.Write(ex.ToString());
            }
        }

        private static async Task GetModels(string make, string year, string make_display)
        {
            try
            {
                if (File.Exists(string.Concat(make_display, year, ".xml")))
                    return;
                else
                {
                    Debug.WriteLine(string.Concat(make_display, year, ".xml"));
                }
                Thread.Sleep(1500);
                var httpHandler = new HttpClientHandler
                {
                    //http://proxylist.hidemyass.com/search-1291967#listable
                    Proxy = new WebProxy(proxyserver, false),
                    UseProxy = true

                };

                var client = new HttpClient(httpHandler);
                client.DefaultRequestHeaders.Add("User-Agent",
                                 "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; WOW64; Trident / 6.0)");
                {

                    var task = client.GetAsync(string.Format("http://www.carqueryapi.com/api/0.3/?callback=?&cmd=getModels&make={0}&year={1}", make, year))
                        .ContinueWith((taskwithresponse) =>
                        {
                            var response = taskwithresponse.Result;
                            var jsonString = response.Content.ReadAsStringAsync();

                            jsonString.Wait();

                            var googleSearch = JObject.Parse(jsonString.Result.Replace("?(", "").Replace(");", ""));
                            var results = googleSearch["Models"].Children().ToList();


                            _models = new List<Model>();


                            foreach (JToken result in results)
                            {
                                var searchResult =
                                    JsonConvert.DeserializeObject<Model>(result.ToString());
                                _models.Add(searchResult);
                            }
                            if (_models.Count > 0)
                            {

                                var ymm = new List<YearMakeModel>();
                                foreach (var mod in _models)
                                {
                                    ymm.Add(new YearMakeModel { make_display = make_display, year = Convert.ToInt16(year), model_name = mod.model_name });
                                }
                                if (ymm.Count > 0)
                                {

                                    XmlSerialization.WriteToXmlFile<List<YearMakeModel>>(string.Concat(make_display, year, ".xml"), ymm);
                                }
                            }

                        });
                    task.Wait();

                }
            }
            catch (Exception ex)
            {
                Debug.Write(ex.ToString());
            }
        }


        private void btnGetMakes_Click(object sender, EventArgs e)
        {

            var task = GetMakes(textBox1.Text);

        }

        private void btnGetTrim_Click(object sender, EventArgs e)
        {
            //http://www.carqueryapi.com/api/0.3/?callback=?&cmd=getTrims&make=bentley&year=2013
        }

        private void btnGetModels_Click(object sender, EventArgs e)
        {
            // http://www.carqueryapi.com/api/0.3/?callback=?&cmd=getModels&make=ford&year=2013
            foreach (var make in _makes)
            {
                var task = GetModels(make.make_id, textBox1.Text, make.make_display);
            }
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            proxyserver = textBox2.Text;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var googleSearch = JObject.Parse(richTextBox1.Text.Replace("?(", "").Replace(");", ""));
            var results = googleSearch["Makes"].Children().ToList();


            _makes = new List<Make>();

            foreach (JToken result in results)
            {
                var searchResult =
                    JsonConvert.DeserializeObject<Make>(result.ToString());
                _makes.Add(searchResult);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var files = Directory.GetFiles(@"D:\dev\CarCrawler\src\GetCarQueryApi\cars\");
            var list = new List<YearMakeModel>();
            var data = new DataAccess.Data();
            foreach (var f in files)
            {
               var yym = DansCSharpLibrary.Serialization.XmlSerialization.ReadFromXmlFile<List<YearMakeModel>>(f);
                //list.AddRange(yym);
                foreach (var car in yym)
                {
                    data.InsertYearMakeModel(car.year, car.make_display, car.model_name);
                }
            
            }
        }
    }
}