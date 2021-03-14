namespace MessageHubWithServiceBroker
{
    partial class fDashboard
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
            this.cbConsumers = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.tbConsumerDescription = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.tbWorker = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.lbConsumerLog = new System.Windows.Forms.ListBox();
            this.label4 = new System.Windows.Forms.Label();
            this.lbTopics = new System.Windows.Forms.ListBox();
            this.label3 = new System.Windows.Forms.Label();
            this.tbConsumerName = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.bnReset = new System.Windows.Forms.Button();
            this.bnPublish = new System.Windows.Forms.Button();
            this.bnSubscribeConsumer = new System.Windows.Forms.Button();
            this.bnRefresh = new System.Windows.Forms.Button();
            this.bnTopics = new System.Windows.Forms.Button();
            this.bnConsume = new System.Windows.Forms.Button();
            this.tbError = new System.Windows.Forms.TextBox();
            this.bnCreateSubscription = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // cbConsumers
            // 
            this.cbConsumers.FormattingEnabled = true;
            this.cbConsumers.Location = new System.Drawing.Point(134, 32);
            this.cbConsumers.Name = "cbConsumers";
            this.cbConsumers.Size = new System.Drawing.Size(359, 24);
            this.cbConsumers.TabIndex = 0;
            this.cbConsumers.SelectedIndexChanged += new System.EventHandler(this.cbConsumers_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(32, 35);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(72, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "Consumer";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.tbConsumerDescription);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.tbWorker);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.lbConsumerLog);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.lbTopics);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.tbConsumerName);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Location = new System.Drawing.Point(35, 77);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(842, 439);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Consumer Info";
            // 
            // tbConsumerDescription
            // 
            this.tbConsumerDescription.BackColor = System.Drawing.SystemColors.Window;
            this.tbConsumerDescription.Location = new System.Drawing.Point(99, 56);
            this.tbConsumerDescription.Multiline = true;
            this.tbConsumerDescription.Name = "tbConsumerDescription";
            this.tbConsumerDescription.ReadOnly = true;
            this.tbConsumerDescription.Size = new System.Drawing.Size(722, 47);
            this.tbConsumerDescription.TabIndex = 9;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(10, 29);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(49, 17);
            this.label6.TabIndex = 8;
            this.label6.Text = "Name:";
            // 
            // tbWorker
            // 
            this.tbWorker.BackColor = System.Drawing.SystemColors.Window;
            this.tbWorker.Location = new System.Drawing.Point(99, 109);
            this.tbWorker.Name = "tbWorker";
            this.tbWorker.ReadOnly = true;
            this.tbWorker.Size = new System.Drawing.Size(722, 22);
            this.tbWorker.TabIndex = 7;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(10, 109);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(58, 17);
            this.label5.TabIndex = 6;
            this.label5.Text = "Worker:";
            // 
            // lbConsumerLog
            // 
            this.lbConsumerLog.FormattingEnabled = true;
            this.lbConsumerLog.HorizontalScrollbar = true;
            this.lbConsumerLog.ItemHeight = 16;
            this.lbConsumerLog.Location = new System.Drawing.Point(99, 243);
            this.lbConsumerLog.Name = "lbConsumerLog";
            this.lbConsumerLog.ScrollAlwaysVisible = true;
            this.lbConsumerLog.Size = new System.Drawing.Size(722, 180);
            this.lbConsumerLog.TabIndex = 5;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(10, 243);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(36, 17);
            this.label4.TabIndex = 4;
            this.label4.Text = "Log:";
            // 
            // lbTopics
            // 
            this.lbTopics.FormattingEnabled = true;
            this.lbTopics.ItemHeight = 16;
            this.lbTopics.Location = new System.Drawing.Point(99, 142);
            this.lbTopics.Name = "lbTopics";
            this.lbTopics.ScrollAlwaysVisible = true;
            this.lbTopics.Size = new System.Drawing.Size(722, 84);
            this.lbTopics.TabIndex = 3;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(10, 142);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(50, 17);
            this.label3.TabIndex = 2;
            this.label3.Text = "Topics";
            // 
            // tbConsumerName
            // 
            this.tbConsumerName.BackColor = System.Drawing.SystemColors.Window;
            this.tbConsumerName.Location = new System.Drawing.Point(99, 28);
            this.tbConsumerName.Multiline = true;
            this.tbConsumerName.Name = "tbConsumerName";
            this.tbConsumerName.ReadOnly = true;
            this.tbConsumerName.Size = new System.Drawing.Size(722, 22);
            this.tbConsumerName.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(10, 54);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(83, 17);
            this.label2.TabIndex = 0;
            this.label2.Text = "Description:";
            // 
            // bnReset
            // 
            this.bnReset.Location = new System.Drawing.Point(34, 522);
            this.bnReset.Name = "bnReset";
            this.bnReset.Size = new System.Drawing.Size(181, 32);
            this.bnReset.TabIndex = 3;
            this.bnReset.Text = "Clear All Queues";
            this.bnReset.UseVisualStyleBackColor = true;
            this.bnReset.Click += new System.EventHandler(this.bnReset_Click);
            // 
            // bnPublish
            // 
            this.bnPublish.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.bnPublish.Location = new System.Drawing.Point(221, 522);
            this.bnPublish.Name = "bnPublish";
            this.bnPublish.Size = new System.Drawing.Size(222, 32);
            this.bnPublish.TabIndex = 4;
            this.bnPublish.Text = "#1 Post Publisher Message";
            this.bnPublish.UseVisualStyleBackColor = false;
            this.bnPublish.Click += new System.EventHandler(this.bnPublish_Click);
            // 
            // bnSubscribeConsumer
            // 
            this.bnSubscribeConsumer.Location = new System.Drawing.Point(675, 560);
            this.bnSubscribeConsumer.Name = "bnSubscribeConsumer";
            this.bnSubscribeConsumer.Size = new System.Drawing.Size(181, 32);
            this.bnSubscribeConsumer.TabIndex = 5;
            this.bnSubscribeConsumer.Text = "Manage Consumer";
            this.bnSubscribeConsumer.UseVisualStyleBackColor = true;
            this.bnSubscribeConsumer.Click += new System.EventHandler(this.bnSubscribeConsumer_Click);
            // 
            // bnRefresh
            // 
            this.bnRefresh.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.bnRefresh.Location = new System.Drawing.Point(686, 27);
            this.bnRefresh.Name = "bnRefresh";
            this.bnRefresh.Size = new System.Drawing.Size(191, 32);
            this.bnRefresh.TabIndex = 6;
            this.bnRefresh.Text = "#3 Consumer Reply";
            this.bnRefresh.UseVisualStyleBackColor = false;
            this.bnRefresh.Click += new System.EventHandler(this.bnRefresh_Click);
            // 
            // bnTopics
            // 
            this.bnTopics.Location = new System.Drawing.Point(35, 560);
            this.bnTopics.Name = "bnTopics";
            this.bnTopics.Size = new System.Drawing.Size(180, 32);
            this.bnTopics.TabIndex = 7;
            this.bnTopics.Text = "All Topics";
            this.bnTopics.UseVisualStyleBackColor = true;
            this.bnTopics.Click += new System.EventHandler(this.bnTopics_Click);
            // 
            // bnConsume
            // 
            this.bnConsume.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.bnConsume.Location = new System.Drawing.Point(499, 27);
            this.bnConsume.Name = "bnConsume";
            this.bnConsume.Size = new System.Drawing.Size(172, 32);
            this.bnConsume.TabIndex = 8;
            this.bnConsume.Text = "#2 Process Messages";
            this.bnConsume.UseVisualStyleBackColor = false;
            this.bnConsume.Click += new System.EventHandler(this.bnConsume_Click);
            // 
            // tbError
            // 
            this.tbError.Location = new System.Drawing.Point(35, 602);
            this.tbError.Multiline = true;
            this.tbError.Name = "tbError";
            this.tbError.ReadOnly = true;
            this.tbError.Size = new System.Drawing.Size(821, 48);
            this.tbError.TabIndex = 9;
            // 
            // bnCreateSubscription
            // 
            this.bnCreateSubscription.Location = new System.Drawing.Point(675, 522);
            this.bnCreateSubscription.Name = "bnCreateSubscription";
            this.bnCreateSubscription.Size = new System.Drawing.Size(181, 32);
            this.bnCreateSubscription.TabIndex = 10;
            this.bnCreateSubscription.Text = "Create Consumer";
            this.bnCreateSubscription.UseVisualStyleBackColor = true;
            this.bnCreateSubscription.Click += new System.EventHandler(this.bnCreateSubscription_Click);
            // 
            // fDashboard
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(893, 668);
            this.Controls.Add(this.bnCreateSubscription);
            this.Controls.Add(this.tbError);
            this.Controls.Add(this.bnConsume);
            this.Controls.Add(this.bnTopics);
            this.Controls.Add(this.bnRefresh);
            this.Controls.Add(this.bnSubscribeConsumer);
            this.Controls.Add(this.bnPublish);
            this.Controls.Add(this.bnReset);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cbConsumers);
            this.Name = "fDashboard";
            this.Text = "Message Hub Dashboard";
            this.Load += new System.EventHandler(this.fDashboard_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cbConsumers;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox tbConsumerName;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ListBox lbConsumerLog;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ListBox lbTopics;
        private System.Windows.Forms.TextBox tbWorker;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button bnReset;
        private System.Windows.Forms.Button bnPublish;
        private System.Windows.Forms.Button bnSubscribeConsumer;
        private System.Windows.Forms.Button bnRefresh;
        private System.Windows.Forms.Button bnTopics;
        private System.Windows.Forms.Button bnConsume;
        private System.Windows.Forms.TextBox tbError;
        private System.Windows.Forms.Button bnCreateSubscription;
        private System.Windows.Forms.TextBox tbConsumerDescription;
        private System.Windows.Forms.Label label6;
    }
}
