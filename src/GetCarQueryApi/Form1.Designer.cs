namespace GetCarQueryApi
{
    partial class Form1
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
            this.btnGetYears = new System.Windows.Forms.Button();
            this.btnGetMakes = new System.Windows.Forms.Button();
            this.btnGetModels = new System.Windows.Forms.Button();
            this.btnGetTrim = new System.Windows.Forms.Button();
            this.btnGetModel = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // btnGetYears
            // 
            this.btnGetYears.Location = new System.Drawing.Point(524, 35);
            this.btnGetYears.Name = "btnGetYears";
            this.btnGetYears.Size = new System.Drawing.Size(75, 23);
            this.btnGetYears.TabIndex = 0;
            this.btnGetYears.Text = "Get Years";
            this.btnGetYears.UseVisualStyleBackColor = true;
            this.btnGetYears.Click += new System.EventHandler(this.btnGetYears_Click);
            // 
            // btnGetMakes
            // 
            this.btnGetMakes.Location = new System.Drawing.Point(605, 35);
            this.btnGetMakes.Name = "btnGetMakes";
            this.btnGetMakes.Size = new System.Drawing.Size(78, 23);
            this.btnGetMakes.TabIndex = 1;
            this.btnGetMakes.Text = "Get Makes";
            this.btnGetMakes.UseVisualStyleBackColor = true;
            this.btnGetMakes.Click += new System.EventHandler(this.btnGetMakes_Click);
            // 
            // btnGetModels
            // 
            this.btnGetModels.Location = new System.Drawing.Point(689, 35);
            this.btnGetModels.Name = "btnGetModels";
            this.btnGetModels.Size = new System.Drawing.Size(75, 23);
            this.btnGetModels.TabIndex = 2;
            this.btnGetModels.Text = "Get Models";
            this.btnGetModels.UseVisualStyleBackColor = true;
            // 
            // btnGetTrim
            // 
            this.btnGetTrim.Location = new System.Drawing.Point(770, 35);
            this.btnGetTrim.Name = "btnGetTrim";
            this.btnGetTrim.Size = new System.Drawing.Size(75, 23);
            this.btnGetTrim.TabIndex = 3;
            this.btnGetTrim.Text = "Get Trim";
            this.btnGetTrim.UseVisualStyleBackColor = true;
            // 
            // btnGetModel
            // 
            this.btnGetModel.Location = new System.Drawing.Point(851, 35);
            this.btnGetModel.Name = "btnGetModel";
            this.btnGetModel.Size = new System.Drawing.Size(75, 23);
            this.btnGetModel.TabIndex = 4;
            this.btnGetModel.Text = "Get Model";
            this.btnGetModel.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(67, 45);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(29, 13);
            this.label1.TabIndex = 5;
            this.label1.Text = "Year";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(102, 42);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(100, 20);
            this.textBox1.TabIndex = 6;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1109, 641);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnGetModel);
            this.Controls.Add(this.btnGetTrim);
            this.Controls.Add(this.btnGetModels);
            this.Controls.Add(this.btnGetMakes);
            this.Controls.Add(this.btnGetYears);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnGetYears;
        private System.Windows.Forms.Button btnGetMakes;
        private System.Windows.Forms.Button btnGetModels;
        private System.Windows.Forms.Button btnGetTrim;
        private System.Windows.Forms.Button btnGetModel;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox1;
    }
}

