namespace MessageHubWithServiceBroker
{
    partial class fTopics
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
            this.lbAllTopics = new System.Windows.Forms.ListBox();
            this.SuspendLayout();
            // 
            // lbAllTopics
            // 
            this.lbAllTopics.FormattingEnabled = true;
            this.lbAllTopics.ItemHeight = 16;
            this.lbAllTopics.Location = new System.Drawing.Point(27, 28);
            this.lbAllTopics.Name = "lbAllTopics";
            this.lbAllTopics.ScrollAlwaysVisible = true;
            this.lbAllTopics.Size = new System.Drawing.Size(763, 324);
            this.lbAllTopics.TabIndex = 0;
            // 
            // fTopics
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(802, 374);
            this.Controls.Add(this.lbAllTopics);
            this.Name = "fTopics";
            this.Text = "All Topics";
            this.Load += new System.EventHandler(this.fTopics_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ListBox lbAllTopics;
    }
}