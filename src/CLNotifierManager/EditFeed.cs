using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Windows.Forms;
using CLNotifierManager.Models;
using Dapper;


namespace CLNotifierManager
{
    public partial class EditFeed : Form
    {
        public int EditType { get; set; }
        public short FeedId { get; set; }
        private readonly SqlConnection conn;
        public EditFeed()
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CarCrawler"].ConnectionString);

            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(textBox1.Text) && !string.IsNullOrEmpty(textBox2.Text) && !string.IsNullOrEmpty(textBox3.Text))
            {
                var f = new Feed
                    {
                        FeedCity = textBox1.Text,
                        FeedState = textBox2.Text.Substring(0, 2),
                        FeedRssLink = textBox3.Text,
                        FeedActive = checkBox1.Checked
                    };
                if (EditType == 2)
                {
                    f.Id = FeedId;
                    var p = new DynamicParameters(new { FeedCity = f.FeedCity, FeedState = f.FeedState, FeedRssLink = f.FeedRssLink, FeedActive = f.FeedActive, Id = FeedId });
                    conn.Execute(
                        "update feed set FeedCity = @FeedCity, FeedState = @FeedState, FeedRssLink = @FeedRssLink, FeedActive = @FeedActive where Id = @Id", p);

                }
                else
                {
                       var p = new DynamicParameters(new { FeedCity = f.FeedCity, FeedState = f.FeedState, FeedRssLink = f.FeedRssLink, FeedActive = f.FeedActive });
                        conn.Execute("insert into feed( FeedCity, FeedState, FeedRssLink, FeedActive) values(@FeedCity, @FeedState, @FeedRssLink, @FeedActive)", p);
                }
                conn.Dispose();
                this.DialogResult = System.Windows.Forms.DialogResult.OK;
            }
            else
            {
                MessageBox.Show("All fields must be filled");
                this.DialogResult = System.Windows.Forms.DialogResult.None;
            }
        }

        private void EditFeed_FormClosed(object sender, FormClosedEventArgs e)
        {
            conn.Dispose();
        }
    }
}
