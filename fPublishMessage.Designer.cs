namespace MessageHubWithServiceBroker
{
    partial class fPublishMessage
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
            this.cbTopics = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.bnPublish = new System.Windows.Forms.Button();
            this.tbStatus = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // cbTopics
            // 
            this.cbTopics.FormattingEnabled = true;
            this.cbTopics.Location = new System.Drawing.Point(173, 30);
            this.cbTopics.Name = "cbTopics";
            this.cbTopics.Size = new System.Drawing.Size(589, 24);
            this.cbTopics.TabIndex = 0;
            this.cbTopics.SelectedValueChanged += new System.EventHandler(this.OnPublishedMessageChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(32, 33);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(112, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = " Message Topic:";
            // 
            // bnPublish
            // 
            this.bnPublish.Location = new System.Drawing.Point(173, 60);
            this.bnPublish.Name = "bnPublish";
            this.bnPublish.Size = new System.Drawing.Size(212, 36);
            this.bnPublish.TabIndex = 2;
            this.bnPublish.Text = "Publish";
            this.bnPublish.UseVisualStyleBackColor = true;
            this.bnPublish.Click += new System.EventHandler(this.bnPublish_Click);
            // 
            // tbStatus
            // 
            this.tbStatus.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.tbStatus.Location = new System.Drawing.Point(391, 67);
            this.tbStatus.Name = "tbStatus";
            this.tbStatus.ReadOnly = true;
            this.tbStatus.Size = new System.Drawing.Size(371, 15);
            this.tbStatus.TabIndex = 3;
            // 
            // fPublishMessage
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(786, 109);
            this.Controls.Add(this.tbStatus);
            this.Controls.Add(this.bnPublish);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cbTopics);
            this.Name = "fPublishMessage";
            this.Text = "Publish Message";
            this.Load += new System.EventHandler(this.fPublishMessage_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cbTopics;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button bnPublish;
        private System.Windows.Forms.TextBox tbStatus;
    }
}
