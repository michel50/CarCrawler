using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Linq.Expressions;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Windows.Forms;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using ServiceStack;
using ServiceStack.Text;

namespace GetCarQueryApi
{
    public partial class Form1 : Form
    {
        static List<Make> makes = new List<Make>();
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

        private static async Task GetMakes()
        {
            try
            {
                var client = new HttpClient();
                {

                    var task = client.GetAsync("http://www.carqueryapi.com/api/0.3/?callback=?&cmd=getMakes&year=2014")
                        .ContinueWith((taskwithresponse) =>
                        {
                            var response = taskwithresponse.Result;
                            var jsonString = response.Content.ReadAsStringAsync();

                            jsonString.Wait();

                            JObject googleSearch = JObject.Parse(jsonString.Result.Replace("?(", "").Replace(");", ""));
                            IList<JToken> results = googleSearch["Makes"].Children().ToList();


                            //List<Make> c = JsonConvert.DeserializeObject<List<Make>>(googleSearch["Makes"].Children());
                            var makes = new List<Make>();
                            
                            foreach (JToken result in results)
                            {
                                var searchResult =
                                    JsonConvert.DeserializeObject<Make>(result.ToString());
                                makes.Add(searchResult);
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
            //HttpWebRequest request = WebRequest.Create("http://www.carqueryapi.com/api/0.3/?callback=?&cmd=getMakes&year=2014") as HttpWebRequest;
            //using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
            //{
            //    if (response.StatusCode != HttpStatusCode.OK)
            //        throw new Exception(String.Format(
            //        "Server error (HTTP {0}: {1}).",
            //        response.StatusCode,
            //        response.StatusDescription));
                
            //    object objResponse = new JsonParser().Parse <Make> (response.GetResponseStream());
            //}

            var task = GetMakes();
            var mcnt = makes.Count;
          
        }

        private void btnGetTrim_Click(object sender, EventArgs e)
        {
            //http://www.carqueryapi.com/api/0.3/?callback=?&cmd=getTrims&make=bentley&year=2013
        }
    }
}