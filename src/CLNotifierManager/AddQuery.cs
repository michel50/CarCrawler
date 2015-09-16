using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;
using CLNotifierManager.Models;
using Dapper;



namespace CLNotifierManager
{
    public partial class AddQuery : Form
    {
        public int editType { get; set; }
        public int listId { get; set; }
        private readonly SqlConnection conn;
        public Query query { get; set; }

        public AddQuery()
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CarCrawler"].ConnectionString);
            InitializeComponent();
            txtSubject.Select();
        }

        private void AddQueryLoad(object sender, EventArgs e)
        {
            FillPredicates();
            GetAllMakes();
            this.cbMake.SelectedIndexChanged += new System.EventHandler(this.cbMake_SelectedIndexChanged);

            FillYears(cbStartYear, 0);
            FillYears(cbEndYear, 0);
            FillPrice(cbStartPrice, 0);
            FillPrice(cbEndPrice, 0);
            FillMiles(cbStartMiles, 0);
            FillMiles(cbEndMiles, 0);
            if (editType == 2)
            {
                txtSubject.Text = query.Subject;
                txtKeywords.Text = query.TitleAndDescripton;
                txtExceptions.Text = query.Ignore;
                if (query.AndOr == 1)
                {
                    radioButton1.Checked = true;
                }
                else
                {
                    radioButton2.Checked = true;
                }
                cbMakePredicate.SelectedIndex = (int)query.MakePredicate.Value;
                cbMake.SelectedText = query.MakeValue.EmptyIfNull();
                ckMakeAllowNulls.Checked = (bool) query.MakeAllowNull;
                cbModelPredicate.SelectedIndex = (int)query.ModelPredicate;
                cbModel.SelectedText = query.ModelValue.EmptyIfNull();
                cbYearPredicate.SelectedIndex = (int)query.YearPredicate;
                cbMilesPredicate.SelectedIndex = (int)query.MilesPredicate;
                cbPricePredicate.SelectedIndex = (int)query.PricePredicate;
                var tempstring = query.YearValue.EmptyIfNull();
                SetCombos(tempstring, cbStartYear, cbEndYear);
                tempstring = query.MilesValue.EmptyIfNull();

                SetCombosFormatNumber(tempstring, cbStartMiles, cbEndMiles);
                tempstring = query.PriceValue.EmptyIfNull();
                SetCombosFormatMoney(tempstring, cbStartPrice, cbEndPrice);

                ckEmail.Checked = query.Email.Value;
                ckMakeAllowNulls.Checked = (bool) query.MakeAllowNull;
                ckModelAllowNulls.Checked = (bool) query.ModelAllowNull;
                ckPriceAllowNulls.Checked = (bool) query.PriceAllowNull;
                ckYearsAllowNulls.Checked = (bool) query.YearAllowNull;
                ckMilesAllowNulls.Checked = (bool) query.MilesAllowNull;

            }
        }

        private void FillPredicates()
        {
            var tempList = conn.Query<Predicate>("select * from Predicate").ToList();
            var MakeList = tempList.Where(x => x.PredicateForAll == false).ToList();
            var ModelList = tempList.Where(x => x.PredicateForAll == false).ToList();
            var YearList = tempList;
            var PriceList = tempList;
            var MilesList = tempList;
            BindPredicates(cbMakePredicate, MakeList);
            BindPredicates(cbModelPredicate, ModelList);
            BindPredicates(cbYearPredicate, YearList);
            BindPredicates(cbPricePredicate, PriceList);
            BindPredicates(cbMilesPredicate, MilesList);



        }

        private void BindPredicates(ComboBox comboBox, List<Predicate> list)
        {
            comboBox.BindingContext = new BindingContext();
            comboBox.DataSource = list;
            comboBox.DisplayMember = "PredicateSymbol";
            comboBox.ValueMember = "Id";

        }

        private void GetAllMakes()
        {
            try
            {
                var list =
                    conn.Query<DataAccess.Entities.MakeModel>("Select distinct make from makemodel order by make")
                        .ToList();
                list.Insert(0, new DataAccess.Entities.MakeModel { Id = 0, Make = "All", Model = "All", Year = 0 });
                cbMake.BindingContext = new BindingContext();
                cbMake.DataSource = list;
                cbMake.DisplayMember = "Make";
                cbMake.ValueMember = "Make";

            }
            catch (Exception)
            {
            }
        }

        private void GetYears(string make, string model)
        {
            try
            {
                List<MakeModel> templist = new List<MakeModel>();
                if (cbModel.SelectedValue != null && (string)cbModel.SelectedValue != "All")
                    templist =
                        conn.Query<MakeModel>(
                            "Select distinct year from makemodel where make = @make and model = @model order by year",
                            new { make = make, model = model }).ToList();
                else
                {
                    var s = (DataAccess.Entities.MakeModel)cbMake.SelectedItem;
                    if (cbMake.SelectedValue != null && s.Make != "All")
                        templist =
                              conn.Query<MakeModel>(
                        "Select distinct year from makemodel where make = @make  order by year",
                        new { make = make }).ToList();

                    else
                    {
                        cbStartYear.DataBindings.Clear();
                        cbEndYear.DataBindings.Clear();
                        FillYears(cbStartYear, 0);
                        FillYears(cbEndYear, 0);
                        return;
                    }

                }

                var list = templist.Select(y => new Year { year = y.Year, display = y.Year.ToString() }).ToList();
                list.Insert(0, new Year { year = 0, display = "All" });
                cbStartYear.BindingContext = new BindingContext();
                cbStartYear.DataSource = list;
                cbStartYear.DisplayMember = "display";
                cbStartYear.ValueMember = "year";
                cbEndYear.BindingContext = new BindingContext();
                cbEndYear.DataSource = list;
                cbEndYear.DisplayMember = "display";
                cbEndYear.ValueMember = "model";
            }
            catch (Exception)
            {
            }

        }

        private void GetSpecificModels(string make)
        {
            try
            {
                //using (var db = new DbManager())
                //{
                var list =
                    conn.Query<MakeModel>(
                        "Select distinct model from makemodel where make = @make order by model", new { make = make })
                        .ToList();
                // var list = db.SetCommand(, db.Parameter("@make", make)).ExecuteList<makesmodels>();
                list.Insert(0, new MakeModel { Id = 0, Make = "All", Model = "All", Year = 0 });
                cbModel.BindingContext = new BindingContext();
                cbModel.DataSource = list;
                cbModel.DisplayMember = "Model";
                cbModel.ValueMember = "Model";

                //}
            }
            catch (Exception)
            {

            }

        }
        private void FillYears(System.Windows.Forms.ComboBox cb, int start)
        {
            var year = start;
            if (start == 0)
                year = new DateTime(1930, 1, 1).Year;
            var list = new List<Year>();
            while (year < DateTime.Now.AddYears(1).Year)
            {
                list.Add(new Year()
                {
                    year = year,
                    display = year.ToString()
                });
                year += Properties.Settings.Default.yearinc;
            }

            if (start == 0)
                list.Insert(0, new Year { year = 0, display = "All" });

            cb.BindingContext = new BindingContext();
            cb.DataSource = list;
            cb.DisplayMember = "display";
            cb.ValueMember = "year";
        }

        private void FillPrice(System.Windows.Forms.ComboBox cb, decimal start)
        {
            decimal price = start;
            if (start == 0)
                price = 500m;
            var list = new List<Price>();
            while (price < 150000)
            {

                list.Add(new Price
                                        {
                                            price = price,
                                            display = price.ToString("C")
                                        });
                price += Properties.Settings.Default.priceinc;
            }

            if (start == 0)
                list.Insert(0, new Price { price = 0, display = "All" });


            cb.BindingContext = new BindingContext();
            cb.DataSource = list;
            cb.DisplayMember = "display";
            cb.ValueMember = "price";

        }
        private void FillMiles(System.Windows.Forms.ComboBox cb, int start)
        {
            var list = new List<Miles>();
            var miles = start;
            while (miles <= 250000)
            {
                list.Add(new Miles
                {
                    miles = miles,
                    display = miles.ToString("#,##0")
                });
                miles += Properties.Settings.Default.milesinc;
            }

            if (start == 0)
                list.Insert(0, new Miles { miles = 0, display = "All" });
            cb.BindingContext = new BindingContext();
            cb.DataSource = list;
            cb.DisplayMember = "display";
            cb.ValueMember = "miles";
        }

        private void cbMake_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetSpecificModels(cbMake.SelectedValue.ToString());
            GetYears(cbMake.SelectedValue.ToString(), cbModel.SelectedValue.ToString());
        }

        private void cbModel_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetYears(cbMake.SelectedValue.ToString(), cbModel.SelectedValue.ToString());
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var startYear = (Year)cbStartYear.SelectedItem;
            var endYear = (Year)cbEndYear.SelectedItem;
            var startMiles = (Miles)cbStartMiles.SelectedItem;
            var endMiles = (Miles)cbEndMiles.SelectedItem;
            var startPrice = (Price)cbStartPrice.SelectedItem;
            var endPrice = (Price)cbEndPrice.SelectedItem;
            if (editType == 1)
            {
                query = new Query();
            }

            query.Subject = txtSubject.Text;
            query.TitleAndDescripton = string.IsNullOrEmpty(txtKeywords.Text.Trim()) ? "" : txtKeywords.Text;
            query.Ignore = string.IsNullOrEmpty(txtExceptions.Text.Trim()) ? "" : txtExceptions.Text;

            query.AndOr = radioButton1.Checked ? (byte)1 : (byte)2;
            query.MakePredicate = (byte)cbMakePredicate.SelectedIndex;
            query.MakeValue = cbMakePredicate.SelectedIndex == 0 ? null : cbMake.SelectedValue.ToString();
            query.MakeAllowNull = ckMakeAllowNulls.Checked;
            query.ModelPredicate = (byte)cbModelPredicate.SelectedIndex;
            query.ModelValue = cbModelPredicate.SelectedIndex == 0 ? null : cbModel.SelectedIndex.ToString();
            query.ModelAllowNull = ckModelAllowNulls.Checked;
            query.MilesPredicate = (byte)cbMilesPredicate.SelectedIndex;
            query.MilesValue =
                cbMilesPredicate.SelectedIndex == 0
                    ? null
                    : cbMilesPredicate.SelectedIndex == 1
                          ? startMiles.miles.ToString() + "," + endMiles.miles.ToString()
                          : startMiles.miles.ToString();
            query.MilesAllowNull = ckMilesAllowNulls.Checked;
            query.YearPredicate = (byte)cbYearPredicate.SelectedIndex;
            query.YearValue =
                cbYearPredicate.SelectedIndex == 0
                    ? null
                    : cbYearPredicate.SelectedIndex == 1
                          ? startYear.year.ToString() + "," + endYear.year.ToString()
                          : startYear.year.ToString();
            query.YearAllowNull = ckYearsAllowNulls.Checked;
            query.PricePredicate = (byte)cbPricePredicate.SelectedIndex;
            query.PriceValue =
                cbPricePredicate.SelectedIndex == 0
                    ? null
                    : cbPricePredicate.SelectedIndex == 1
                          ? startPrice.price.ToString() + "," + endPrice.price.ToString()
                          : startPrice.price.ToString();
            query.Email = ckEmail.Checked;

            var dynParam = new DynamicParameters(new
            {
                Subject = query.Subject,
                TitleAndDescripton = query.TitleAndDescripton,
                AndOr = query.AndOr,
                Ignore = query.Ignore,
                MakePredicate = query.MakePredicate,
                MakeValue = query.MakeValue,
                MakeAllowNull = query.MakeAllowNull,
                ModelPredicate = query.ModelPredicate,
                ModelValue = query.ModelValue,
                ModelAllowNull = query.ModelAllowNull,
                MilesPredicate = query.MilesPredicate,
                MilesValue = query.MilesValue,
                MilesAllowNull = query.MilesAllowNull,
                YearPredicate = query.YearPredicate,
                YearValue = query.YearValue,
                YearAllowNull = query.YearAllowNull,
                PricePredicate = query.PricePredicate,
                PriceValue = query.PriceValue,
                PriceAllowNull = query.PriceAllowNull,
                Email = query.Email

            });

            if (editType == 1)
            {
                dynParam.Add("@InsertedId", dbType: DbType.Int32,
                             direction: ParameterDirection.Output);
                conn.Execute("usp_Query_Create", dynParam, commandType: CommandType.StoredProcedure);
            }
            else
            {
                dynParam.Add("@Id", dbType: DbType.Int16,
             value: query.Id);
                conn.Execute("usp_Query_Update", dynParam, commandType: CommandType.StoredProcedure);
            }
        }

        public void SetCombos(string value, System.Windows.Forms.ComboBox combo1,
                                System.Windows.Forms.ComboBox combo2)
        {
            if (value.Length > 0)
            {
                if (value.Split(',').Length == 2)
                {
                    combo1.SelectedIndex = combo1.FindString(value.Split(',')[0]);
                    combo2.SelectedIndex = combo2.FindString(value.Split(',')[1]);
                }
                else
                {
                    combo1.SelectedIndex = combo1.FindString(value);
                }
            }

        }

        public void SetCombosFormatNumber(string value, System.Windows.Forms.ComboBox combo1,
                         System.Windows.Forms.ComboBox combo2)
        {
            if (value.Length > 0)
            {
                if (value.Split(',').Length == 2)
                {
                    var t1 = Convert.ToInt32(value.Split(',')[0]).ToString("#,##0");
                    var t2 = Convert.ToInt32(value.Split(',')[1]).ToString("#,##0");
                    combo1.SelectedIndex = combo1.FindString(t1);
                    combo2.SelectedIndex = combo2.FindString(t2);
                }
                else
                {
                    var t1 = Convert.ToInt32(value).ToString("#,##0");
                    combo1.SelectedIndex = combo1.FindString(t1);
                }
            }

        }

        public void SetCombosFormatMoney(string value, System.Windows.Forms.ComboBox combo1,
                 System.Windows.Forms.ComboBox combo2)
        {
            if (value.Length > 0)
            {
                if (value.Split(',').Length == 2)
                {
                    var t1 = Convert.ToDecimal(value.Split(',')[0]).ToString("C");
                    var t2 = Convert.ToDecimal(value.Split(',')[1]).ToString("C");
                    combo1.SelectedIndex = combo1.FindString(t1);
                    combo2.SelectedIndex = combo2.FindString(t2);
                }
                else
                {
                    var t1 = Convert.ToDecimal(value).ToString("C");
                    combo1.SelectedIndex = combo1.FindString(t1);
                }
            }

        }



        private void txtSubject_Validating(object sender, CancelEventArgs e)
        {
            if (txtSubject.Text.Length > 0)
            {
                btnSave.DialogResult = DialogResult.OK;
                errorProvider1.SetError(txtSubject, "");
            }
            else
            {
                btnSave.DialogResult = DialogResult.None;
                errorProvider1.SetError(txtSubject, "Must have a title.");
            }
        }

        private void cbStartYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            var item = (Year)cbStartYear.SelectedItem;
            var year = item.year;
            FillYears(cbEndYear, year);
        }

        private void cbStartPrice_SelectedIndexChanged(object sender, EventArgs e)
        {
            var item = (Price)cbStartPrice.SelectedItem;
            var price = item.price;
            FillPrice(cbEndPrice, price);
        }

        private void cbStartMiles_SelectedIndexChanged(object sender, EventArgs e)
        {
            var item = (Miles)cbStartMiles.SelectedItem;
            var miles = item.miles;
            FillMiles(cbEndMiles, miles);
        }

        private void cbYearPredicate_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbStartYear.Visible = cbYearPredicate.SelectedIndex != 0;
            cbEndYear.Visible = cbYearPredicate.SelectedIndex == 1;
        }

        private void cbPricePredicate_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbStartPrice.Visible = cbPricePredicate.SelectedIndex != 0;
            cbEndPrice.Visible = cbPricePredicate.SelectedIndex == 1;
        }

        private void cbMilesPredicate_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbStartMiles.Visible = cbMilesPredicate.SelectedIndex != 0;

            cbEndMiles.Visible = cbMilesPredicate.SelectedIndex == 1;
        }

        private void cbMakePredicate_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbMake.Visible = cbMakePredicate.SelectedIndex != 0;

        }

        private void cbModelPredicate_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbModel.Visible = cbModelPredicate.SelectedIndex != 0;
        }

        private void AddQuery_FormClosing(object sender, FormClosingEventArgs e)
        {
            conn.Dispose();
        }


    }




    public class Price
    {
        public decimal price { get; set; }
        public string display { get; set; }
    }
    public class Year
    {
        public int year { get; set; }
        public string display { get; set; }
    }
    public class Miles
    {
        public int miles { get; set; }
        public string display { get; set; }
    }


}
