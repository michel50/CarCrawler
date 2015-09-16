namespace CLNotifierManager
{
    partial class AddQuery
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.cbMake = new System.Windows.Forms.ComboBox();
            this.cbModel = new System.Windows.Forms.ComboBox();
            this.cbStartYear = new System.Windows.Forms.ComboBox();
            this.cbEndYear = new System.Windows.Forms.ComboBox();
            this.cbStartPrice = new System.Windows.Forms.ComboBox();
            this.cbEndPrice = new System.Windows.Forms.ComboBox();
            this.cbStartMiles = new System.Windows.Forms.ComboBox();
            this.cbEndMiles = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.btnSave = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.ckEmail = new System.Windows.Forms.CheckBox();
            this.txtKeywords = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.radioButton2 = new System.Windows.Forms.RadioButton();
            this.radioButton1 = new System.Windows.Forms.RadioButton();
            this.lblSubject = new System.Windows.Forms.Label();
            this.txtSubject = new System.Windows.Forms.TextBox();
            this.cbMakePredicate = new System.Windows.Forms.ComboBox();
            this.cbModelPredicate = new System.Windows.Forms.ComboBox();
            this.cbYearPredicate = new System.Windows.Forms.ComboBox();
            this.cbPricePredicate = new System.Windows.Forms.ComboBox();
            this.cbMilesPredicate = new System.Windows.Forms.ComboBox();
            this.ckMakeAllowNulls = new System.Windows.Forms.CheckBox();
            this.ckModelAllowNulls = new System.Windows.Forms.CheckBox();
            this.ckYearsAllowNulls = new System.Windows.Forms.CheckBox();
            this.ckPriceAllowNulls = new System.Windows.Forms.CheckBox();
            this.ckMilesAllowNulls = new System.Windows.Forms.CheckBox();
            this.txtExceptions = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // cbMake
            // 
            this.cbMake.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbMake.FormattingEnabled = true;
            this.cbMake.Location = new System.Drawing.Point(253, 254);
            this.cbMake.Name = "cbMake";
            this.cbMake.Size = new System.Drawing.Size(273, 21);
            this.cbMake.TabIndex = 4;
            // 
            // cbModel
            // 
            this.cbModel.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbModel.FormattingEnabled = true;
            this.cbModel.Location = new System.Drawing.Point(253, 288);
            this.cbModel.Name = "cbModel";
            this.cbModel.Size = new System.Drawing.Size(273, 21);
            this.cbModel.TabIndex = 7;
            this.cbModel.SelectedIndexChanged += new System.EventHandler(this.cbModel_SelectedIndexChanged);
            // 
            // cbStartYear
            // 
            this.cbStartYear.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbStartYear.FormattingEnabled = true;
            this.cbStartYear.Location = new System.Drawing.Point(253, 321);
            this.cbStartYear.Name = "cbStartYear";
            this.cbStartYear.Size = new System.Drawing.Size(121, 21);
            this.cbStartYear.TabIndex = 10;
            this.cbStartYear.SelectedIndexChanged += new System.EventHandler(this.cbStartYear_SelectedIndexChanged);
            // 
            // cbEndYear
            // 
            this.cbEndYear.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbEndYear.FormattingEnabled = true;
            this.cbEndYear.Location = new System.Drawing.Point(405, 321);
            this.cbEndYear.Name = "cbEndYear";
            this.cbEndYear.Size = new System.Drawing.Size(121, 21);
            this.cbEndYear.TabIndex = 11;
            // 
            // cbStartPrice
            // 
            this.cbStartPrice.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbStartPrice.FormattingEnabled = true;
            this.cbStartPrice.Location = new System.Drawing.Point(253, 355);
            this.cbStartPrice.Name = "cbStartPrice";
            this.cbStartPrice.Size = new System.Drawing.Size(121, 21);
            this.cbStartPrice.TabIndex = 14;
            this.cbStartPrice.SelectedIndexChanged += new System.EventHandler(this.cbStartPrice_SelectedIndexChanged);
            // 
            // cbEndPrice
            // 
            this.cbEndPrice.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbEndPrice.FormattingEnabled = true;
            this.cbEndPrice.Location = new System.Drawing.Point(405, 355);
            this.cbEndPrice.Name = "cbEndPrice";
            this.cbEndPrice.Size = new System.Drawing.Size(121, 21);
            this.cbEndPrice.TabIndex = 15;
            // 
            // cbStartMiles
            // 
            this.cbStartMiles.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbStartMiles.FormattingEnabled = true;
            this.cbStartMiles.Location = new System.Drawing.Point(253, 391);
            this.cbStartMiles.Name = "cbStartMiles";
            this.cbStartMiles.Size = new System.Drawing.Size(121, 21);
            this.cbStartMiles.TabIndex = 18;
            this.cbStartMiles.SelectedIndexChanged += new System.EventHandler(this.cbStartMiles_SelectedIndexChanged);
            // 
            // cbEndMiles
            // 
            this.cbEndMiles.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbEndMiles.FormattingEnabled = true;
            this.cbEndMiles.Location = new System.Drawing.Point(405, 391);
            this.cbEndMiles.Name = "cbEndMiles";
            this.cbEndMiles.Size = new System.Drawing.Size(121, 21);
            this.cbEndMiles.TabIndex = 19;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(24, 73);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 13);
            this.label1.TabIndex = 25;
            this.label1.Text = "Keywords";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(24, 258);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(34, 13);
            this.label2.TabIndex = 26;
            this.label2.Text = "Make";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(24, 292);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(36, 13);
            this.label3.TabIndex = 27;
            this.label3.Text = "Model";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(24, 325);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(34, 13);
            this.label4.TabIndex = 28;
            this.label4.Text = "Years";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(24, 359);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(31, 13);
            this.label5.TabIndex = 29;
            this.label5.Text = "Price";
            // 
            // btnSave
            // 
            this.btnSave.Location = new System.Drawing.Point(643, 435);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(75, 23);
            this.btnSave.TabIndex = 22;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.CausesValidation = false;
            this.btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnCancel.Location = new System.Drawing.Point(788, 435);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 23;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            // 
            // ckEmail
            // 
            this.ckEmail.AutoSize = true;
            this.ckEmail.Location = new System.Drawing.Point(85, 435);
            this.ckEmail.Name = "ckEmail";
            this.ckEmail.Size = new System.Drawing.Size(51, 17);
            this.ckEmail.TabIndex = 21;
            this.ckEmail.Text = "Email";
            this.ckEmail.UseVisualStyleBackColor = true;
            // 
            // txtKeywords
            // 
            this.txtKeywords.Location = new System.Drawing.Point(83, 73);
            this.txtKeywords.Multiline = true;
            this.txtKeywords.Name = "txtKeywords";
            this.txtKeywords.Size = new System.Drawing.Size(696, 77);
            this.txtKeywords.TabIndex = 1;
            this.toolTip1.SetToolTip(this.txtKeywords, "Seperate values with a comma.");
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(24, 395);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(31, 13);
            this.label6.TabIndex = 30;
            this.label6.Text = "Miles";
            // 
            // errorProvider1
            // 
            this.errorProvider1.ContainerControl = this;
            // 
            // toolTip1
            // 
            this.toolTip1.IsBalloon = true;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.radioButton2);
            this.groupBox1.Controls.Add(this.radioButton1);
            this.groupBox1.Location = new System.Drawing.Point(799, 73);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(73, 77);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            // 
            // radioButton2
            // 
            this.radioButton2.AutoSize = true;
            this.radioButton2.Location = new System.Drawing.Point(7, 42);
            this.radioButton2.Name = "radioButton2";
            this.radioButton2.Size = new System.Drawing.Size(36, 17);
            this.radioButton2.TabIndex = 1;
            this.radioButton2.Text = "Or";
            this.radioButton2.UseVisualStyleBackColor = true;
            // 
            // radioButton1
            // 
            this.radioButton1.AutoSize = true;
            this.radioButton1.Checked = true;
            this.radioButton1.Location = new System.Drawing.Point(7, 11);
            this.radioButton1.Name = "radioButton1";
            this.radioButton1.Size = new System.Drawing.Size(44, 17);
            this.radioButton1.TabIndex = 0;
            this.radioButton1.TabStop = true;
            this.radioButton1.Text = "And";
            this.radioButton1.UseVisualStyleBackColor = true;
            // 
            // lblSubject
            // 
            this.lblSubject.AutoSize = true;
            this.lblSubject.Location = new System.Drawing.Point(24, 23);
            this.lblSubject.Name = "lblSubject";
            this.lblSubject.Size = new System.Drawing.Size(43, 13);
            this.lblSubject.TabIndex = 24;
            this.lblSubject.Text = "Subject";
            // 
            // txtSubject
            // 
            this.txtSubject.Location = new System.Drawing.Point(83, 23);
            this.txtSubject.Name = "txtSubject";
            this.txtSubject.Size = new System.Drawing.Size(696, 20);
            this.txtSubject.TabIndex = 0;
            this.txtSubject.Validating += new System.ComponentModel.CancelEventHandler(this.txtSubject_Validating);
            // 
            // cbMakePredicate
            // 
            this.cbMakePredicate.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbMakePredicate.FormattingEnabled = true;
            this.cbMakePredicate.Location = new System.Drawing.Point(85, 254);
            this.cbMakePredicate.Name = "cbMakePredicate";
            this.cbMakePredicate.Size = new System.Drawing.Size(140, 21);
            this.cbMakePredicate.TabIndex = 3;
            this.cbMakePredicate.SelectedIndexChanged += new System.EventHandler(this.cbMakePredicate_SelectedIndexChanged);
            // 
            // cbModelPredicate
            // 
            this.cbModelPredicate.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbModelPredicate.FormattingEnabled = true;
            this.cbModelPredicate.Location = new System.Drawing.Point(85, 288);
            this.cbModelPredicate.Name = "cbModelPredicate";
            this.cbModelPredicate.Size = new System.Drawing.Size(140, 21);
            this.cbModelPredicate.TabIndex = 6;
            this.cbModelPredicate.SelectedIndexChanged += new System.EventHandler(this.cbModelPredicate_SelectedIndexChanged);
            // 
            // cbYearPredicate
            // 
            this.cbYearPredicate.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbYearPredicate.FormattingEnabled = true;
            this.cbYearPredicate.Location = new System.Drawing.Point(85, 321);
            this.cbYearPredicate.Name = "cbYearPredicate";
            this.cbYearPredicate.Size = new System.Drawing.Size(140, 21);
            this.cbYearPredicate.TabIndex = 9;
            this.cbYearPredicate.SelectedIndexChanged += new System.EventHandler(this.cbYearPredicate_SelectedIndexChanged);
            // 
            // cbPricePredicate
            // 
            this.cbPricePredicate.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbPricePredicate.FormattingEnabled = true;
            this.cbPricePredicate.Location = new System.Drawing.Point(85, 355);
            this.cbPricePredicate.Name = "cbPricePredicate";
            this.cbPricePredicate.Size = new System.Drawing.Size(140, 21);
            this.cbPricePredicate.TabIndex = 13;
            this.cbPricePredicate.SelectedIndexChanged += new System.EventHandler(this.cbPricePredicate_SelectedIndexChanged);
            // 
            // cbMilesPredicate
            // 
            this.cbMilesPredicate.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbMilesPredicate.FormattingEnabled = true;
            this.cbMilesPredicate.Location = new System.Drawing.Point(85, 391);
            this.cbMilesPredicate.Name = "cbMilesPredicate";
            this.cbMilesPredicate.Size = new System.Drawing.Size(140, 21);
            this.cbMilesPredicate.TabIndex = 17;
            this.cbMilesPredicate.SelectedIndexChanged += new System.EventHandler(this.cbMilesPredicate_SelectedIndexChanged);
            // 
            // ckMakeAllowNulls
            // 
            this.ckMakeAllowNulls.AutoSize = true;
            this.ckMakeAllowNulls.Location = new System.Drawing.Point(572, 256);
            this.ckMakeAllowNulls.Name = "ckMakeAllowNulls";
            this.ckMakeAllowNulls.Size = new System.Drawing.Size(77, 17);
            this.ckMakeAllowNulls.TabIndex = 5;
            this.ckMakeAllowNulls.Text = "Allow Nulls";
            this.ckMakeAllowNulls.UseVisualStyleBackColor = true;
            // 
            // ckModelAllowNulls
            // 
            this.ckModelAllowNulls.AutoSize = true;
            this.ckModelAllowNulls.Location = new System.Drawing.Point(572, 290);
            this.ckModelAllowNulls.Name = "ckModelAllowNulls";
            this.ckModelAllowNulls.Size = new System.Drawing.Size(77, 17);
            this.ckModelAllowNulls.TabIndex = 8;
            this.ckModelAllowNulls.Text = "Allow Nulls";
            this.ckModelAllowNulls.UseVisualStyleBackColor = true;
            // 
            // ckYearsAllowNulls
            // 
            this.ckYearsAllowNulls.AutoSize = true;
            this.ckYearsAllowNulls.Location = new System.Drawing.Point(572, 323);
            this.ckYearsAllowNulls.Name = "ckYearsAllowNulls";
            this.ckYearsAllowNulls.Size = new System.Drawing.Size(77, 17);
            this.ckYearsAllowNulls.TabIndex = 12;
            this.ckYearsAllowNulls.Text = "Allow Nulls";
            this.ckYearsAllowNulls.UseVisualStyleBackColor = true;
            // 
            // ckPriceAllowNulls
            // 
            this.ckPriceAllowNulls.AutoSize = true;
            this.ckPriceAllowNulls.Location = new System.Drawing.Point(572, 357);
            this.ckPriceAllowNulls.Name = "ckPriceAllowNulls";
            this.ckPriceAllowNulls.Size = new System.Drawing.Size(77, 17);
            this.ckPriceAllowNulls.TabIndex = 16;
            this.ckPriceAllowNulls.Text = "Allow Nulls";
            this.ckPriceAllowNulls.UseVisualStyleBackColor = true;
            // 
            // ckMilesAllowNulls
            // 
            this.ckMilesAllowNulls.AutoSize = true;
            this.ckMilesAllowNulls.Location = new System.Drawing.Point(572, 393);
            this.ckMilesAllowNulls.Name = "ckMilesAllowNulls";
            this.ckMilesAllowNulls.Size = new System.Drawing.Size(77, 17);
            this.ckMilesAllowNulls.TabIndex = 20;
            this.ckMilesAllowNulls.Text = "Allow Nulls";
            this.ckMilesAllowNulls.UseVisualStyleBackColor = true;
            // 
            // txtExceptions
            // 
            this.txtExceptions.Location = new System.Drawing.Point(83, 156);
            this.txtExceptions.Multiline = true;
            this.txtExceptions.Name = "txtExceptions";
            this.txtExceptions.Size = new System.Drawing.Size(696, 77);
            this.txtExceptions.TabIndex = 31;
            this.toolTip1.SetToolTip(this.txtExceptions, "Seperate values with a comma.");
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(24, 156);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(59, 13);
            this.label7.TabIndex = 32;
            this.label7.Text = "Exceptions";
            // 
            // AddQuery
            // 
            this.AcceptButton = this.btnSave;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.btnCancel;
            this.ClientSize = new System.Drawing.Size(902, 466);
            this.Controls.Add(this.txtExceptions);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.ckMilesAllowNulls);
            this.Controls.Add(this.ckPriceAllowNulls);
            this.Controls.Add(this.ckYearsAllowNulls);
            this.Controls.Add(this.ckModelAllowNulls);
            this.Controls.Add(this.ckMakeAllowNulls);
            this.Controls.Add(this.cbMilesPredicate);
            this.Controls.Add(this.cbPricePredicate);
            this.Controls.Add(this.cbYearPredicate);
            this.Controls.Add(this.cbModelPredicate);
            this.Controls.Add(this.cbMakePredicate);
            this.Controls.Add(this.txtSubject);
            this.Controls.Add(this.lblSubject);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txtKeywords);
            this.Controls.Add(this.ckEmail);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnSave);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cbStartMiles);
            this.Controls.Add(this.cbEndMiles);
            this.Controls.Add(this.cbStartPrice);
            this.Controls.Add(this.cbEndPrice);
            this.Controls.Add(this.cbEndYear);
            this.Controls.Add(this.cbStartYear);
            this.Controls.Add(this.cbModel);
            this.Controls.Add(this.cbMake);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "AddQuery";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Add Query";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.AddQuery_FormClosing);
            this.Load += new System.EventHandler(this.AddQueryLoad);
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cbMake;
        private System.Windows.Forms.ComboBox cbModel;
        private System.Windows.Forms.ComboBox cbStartYear;
        private System.Windows.Forms.ComboBox cbEndYear;
        private System.Windows.Forms.ComboBox cbStartPrice;
        private System.Windows.Forms.ComboBox cbEndPrice;
        private System.Windows.Forms.ComboBox cbStartMiles;
        private System.Windows.Forms.ComboBox cbEndMiles;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.CheckBox ckEmail;
        private System.Windows.Forms.TextBox txtKeywords;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.ErrorProvider errorProvider1;
        private System.Windows.Forms.ToolTip toolTip1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton radioButton2;
        private System.Windows.Forms.RadioButton radioButton1;
        private System.Windows.Forms.ComboBox cbMilesPredicate;
        private System.Windows.Forms.ComboBox cbPricePredicate;
        private System.Windows.Forms.ComboBox cbYearPredicate;
        private System.Windows.Forms.ComboBox cbModelPredicate;
        private System.Windows.Forms.ComboBox cbMakePredicate;
        private System.Windows.Forms.TextBox txtSubject;
        private System.Windows.Forms.Label lblSubject;
        private System.Windows.Forms.CheckBox ckYearsAllowNulls;
        private System.Windows.Forms.CheckBox ckModelAllowNulls;
        private System.Windows.Forms.CheckBox ckMakeAllowNulls;
        private System.Windows.Forms.CheckBox ckMilesAllowNulls;
        private System.Windows.Forms.CheckBox ckPriceAllowNulls;
        private System.Windows.Forms.TextBox txtExceptions;
        private System.Windows.Forms.Label label7;
    }
}