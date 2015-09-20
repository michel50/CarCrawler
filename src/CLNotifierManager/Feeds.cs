using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;

using Dapper;
using DataAccess.Entities;


namespace CLNotifierManager
{
    public partial class Feeds : Form
    {
        private readonly SqlConnection conn;
        public Feeds()
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CarCrawler"].ConnectionString);

            InitializeComponent();
        }


        private void BindData(List<Feed> vcars)
        {
          
           DataTable dt = vcars.ToDataTable();
           dataGrid1.AutoGenerateColumns = false;
            dataGrid1.DataSource = dt;
 

  

        }

        public List<Feed> GetFeeds()
        {
            if (checkBox1.Checked)
            {
                return
                    conn.Query<Feed>("select * from feed where FeedActive = @FeedActive order by FeedState, FeedCity",
                                     new {FeedActive = 1}).ToList();
            }
            else
            {
                return
                    conn.Query<Feed>("select * from feed  order by FeedState, FeedCity").ToList();
            }
        }

        //private void Selection_SelectionChanged(object sender, SourceGrid.RangeRegionChangedEventArgs e)
        //{
        //    //vcars p = this.dataGrid1.BindingContext[bindList].Current as vcars;// get the current object
        //    object[] rows = dataGrid1.SelectedDataRows;
        //    if (rows != null && rows.Length > 0)
        //    {

        //        row = (DataRowView)rows[0];

        //    }
        //}

        private void Feeds_Load(object sender, EventArgs e)
        {
            BindData(GetFeeds());
        }

        private void button2_Click(object sender, EventArgs e)
        {
            using (var dialog = new EditFeed())
            {
               
                if (dataGrid1.SelectedRows[0] != null)
                {
                    var editRow = dataGrid1.SelectedRows[0];
                    dialog.EditType = 2;
                    dialog.FeedId = Convert.ToInt16(editRow.Cells["Id"].Value);
                    dialog.textBox1.Text = editRow.Cells["FeedCity"].Value.ToString();
                    dialog.textBox2.Text = editRow.Cells["FeedState"].Value.ToString();
                    dialog.textBox3.Text = editRow.Cells["FeedRssLink"].Value.ToString();
                    dialog.checkBox1.Checked = Convert.ToBoolean(editRow.Cells["FeedActive"].Value);
                    if (dialog.ShowDialog() == DialogResult.OK)
                    {
                        BindData(GetFeeds());
                    }
                }
                else
                    MessageBox.Show("Must select row");
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (var dialog = new EditFeed())
            {
                    dialog.EditType = 1;
                    if (dialog.ShowDialog() == DialogResult.OK)
                    {
                        BindData(GetFeeds());
                    }
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            conn.Dispose();
            this.Close();
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            BindData(GetFeeds());
        }

        private void dataGrid1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void Feeds_FormClosing(object sender, FormClosingEventArgs e)
        {
            conn.Dispose();
        }
    }
}
