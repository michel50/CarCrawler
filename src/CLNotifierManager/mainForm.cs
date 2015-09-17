using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Windows.Forms;
using DataAccess.Entities;
using DataAccess;
using Dapper;
using NLog;

namespace CLNotifierManager
{
    public partial class MainForm : Form
    {
        private static Logger logger = LogManager.GetCurrentClassLogger();
        public SqlConnection conn { get; set; }
        public Data dataLayer { get; set; }
        public List<Predicate> predicates { get; set; }

        public MainForm()
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CarCrawler"].ConnectionString);
            dataLayer = new Data();
            predicates = dataLayer.GetPredicates();
            InitializeComponent();
            dataGridView1.Columns["Price"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            dataGridView1.Columns["Miles"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
        }

        private void mainForm_Load(object sender, EventArgs e)
        {
            try
            {
                FillQueryCombo();
                this.cbQuery.SelectedIndexChanged += new System.EventHandler(this.cbQuery_SelectedIndexChanged);
                RefreshData();
            }
            catch (Exception ex)
            {
                logger.Error(ex.ToString);
            }
        }

        private void FillQueryCombo()
        {
            cbQuery.DataBindings.Clear();
            bindingSource1.DataSource = FillQueryList();
            cbQuery.DataSource = bindingSource1.DataSource;
            cbQuery.DisplayMember = "Subject";
            cbQuery.ValueMember = "Id";
        }

        private void BindData(IList<Car> vcars)
        {

            this.label2.Text = string.Format("{0} Automobiles", vcars.Count);
            DataTable dt = vcars.ToDataTable();
            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.DataSource = dt;
            this.devAgeTextBox1.DataBindings.Clear();
            this.devAgeTextBox1.DataBindings.Add("Text", dataGridView1.DataSource, "Description");
            this.linkLabel1.DataBindings.Clear();
            this.linkLabel1.DataBindings.Add("Text", dataGridView1.DataSource, "Link");
            if (vcars.Count <= 0) return;
            dataGridView1.Focus();
            dataGridView1.CurrentCell = dataGridView1.Rows[0].Cells[2];
        }

        private List<Query> FillQueryList()
        {
            return
              conn.Query<Query>("Select * from query order by id", commandType: CommandType.Text).ToList();
        }

        private
            IList<Car> GetVcars(string sql)
        {
            var list = new List<Car>();
            if (sql != null && sql.Length > 0)
                list = conn.Query<Car>(sql).ToList();
            return list;
        }

        private
            IList<Car> NonNullCars
            ()
        {
            return conn.Query<Car>
               (
                    "Select * from Car where miles is not null and make is not null and model is not null and year is not null and price is not null order by datein desc")
                  .ToList();
        }

        private
            void linkLabel1_Click
            (object sender, EventArgs e)
        {

            Process.Start(linkLabel1.Text as string);
        }

        private
            void linkLabel1_MouseClick
            (object sender, MouseEventArgs e)
        {

        }

        private
            void button3_Click
            (object sender, EventArgs e)
        {

            using (var dialog = new AddQuery())
            {
                dialog.editType = 1;
                if (dialog.ShowDialog() == DialogResult.OK)
                {
                    FillQueryCombo();
                    cbQuery.SelectedIndex = cbQuery.FindString(dialog.query.Subject);
                }
            }
        }

        private void cbQuery_SelectedIndexChanged(object sender, EventArgs e)
        {
            devAgeTextBox1.Clear();
            TimerReset();
            RefreshData();
        }
        private void TimerReset()
        {
            timer1.Stop();
            timer1.Start();
        }
        private void RefreshData()
        {
            var cursor = Cursor;
            try
            {
                Cursor = Cursors.WaitCursor;
                var query = (Query)cbQuery.SelectedItem;
                BindData(GetVcars(GenSqlStatementForEmails(query.Id)));
            }
            finally
            {
                Cursor = cursor;
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
            TimerReset();
            if (cbQuery.Items.Count == 1)
            {
                MessageBox.Show(this, "Must have at least one query!", "Error Deleting Query", MessageBoxButtons.OK,
                                MessageBoxIcon.Error);
                return;
            }
            var query = (Query)cbQuery.SelectedItem;
            conn.Execute("delete from query where id = @queryid", new { queryid = query.Id });
            FillQueryCombo();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            TimerReset();
            using (var dialog = new AddQuery())
            {
                dialog.editType = 2;
                Models.Query selectedquery = (Models.Query) cbQuery.SelectedItem;
                dialog.query = selectedquery;
                if (dialog.ShowDialog() != DialogResult.OK) return;
                FillQueryCombo();
                cbQuery.SelectedIndex = cbQuery.FindString(selectedquery.Subject);
            }
        }

        private void btnFeeds_Click(object sender, EventArgs e)
        {
            TimerReset();
            using (var dialog = new Feeds())
            {
                if (dialog.ShowDialog() == DialogResult.OK)
                {
                }
            }
        }

        private void mainForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            conn.Dispose();
            dataLayer.Dispose();
            timer1.Dispose();
        }

        private string GenSqlStatementForEmails(Int16 id)
        {
            var query = dataLayer.GetQueryById(id);

            var keywords = query.TitleAndDescripton.Split(',');
            for (int i = 0; i < keywords.Length; i++)
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
            if (string.IsNullOrEmpty(query.Ignore))
                query.Ignore = string.Empty;
            else
            {
                query.Ignore = query.Ignore.Trim();
            }
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
            var sqlStr = "select * from car where " + contains + " and " +
                            string.Format("(datediff(day,datein,getdate()) < {0})",

                            Properties.Settings.Default.limitdaysto) + " order by DateIn desc";
            return sqlStr;
        }

        private string BuildStringPredicate(string contains, byte predicate, string value, string name, bool allowNulls)
        {
            var tmpPredicate = predicates.FirstOrDefault(e => e.Id == predicate);
            var tempvalue = value.Split(',');
            var tempcontains = "(";
            if (string.IsNullOrEmpty(value))
            {
                if (tempvalue.Length == 2)
                {
                    if (tmpPredicate != null)
                        tempcontains +=
                            string.Format(tmpPredicate.PredicateFormat, name + "'", tempvalue[0].Trim(),
                                "'" + tempvalue[1].Trim()) +
                            (allowNulls
                                ? "' or " + name + " is null"
                                : "'") + ")";
                }
                else
                {
                    if (tmpPredicate != null)
                        tempcontains += string.Format(tmpPredicate.PredicateFormat, name, "'" + tempvalue[0] + "'") +
                                        (allowNulls
                                            ? " or " + name + " is null"
                                            : "") + ")";
                }
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
            var tmpPredicate = predicates.FirstOrDefault(e => e.Id == predicate);
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

        private void timer1_Tick(object sender, EventArgs e)
        {
            RefreshData();
        }

        private void dataGridView1_Scroll(object sender, ScrollEventArgs e)
        {
            TimerReset();

        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            TimerReset();
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            timer1.Enabled = checkBox1.Checked;
        }
    }
}
