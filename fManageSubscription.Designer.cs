namespace MessageHubWithServiceBroker
{
    partial class fManageSubscription
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
            this.label1 = new System.Windows.Forms.Label();
            this.tbConsumerName = new System.Windows.Forms.TextBox();
            this.tbConsumerQueue = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.tbConsumerDescription = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.tbWorker = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.lbAllTopics = new System.Windows.Forms.ListBox();
            this.bnUpdate = new System.Windows.Forms.Button();
            this.tbError = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(39, 33);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(117, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "Consumer Name:";
            // 
            // tbConsumerName
            // 
            this.tbConsumerName.Location = new System.Drawing.Point(204, 33);
            this.tbConsumerName.Name = "tbConsumerName";
            this.tbConsumerName.Size = new System.Drawing.Size(356, 22);
            this.tbConsumerName.TabIndex = 1;
            // 
            // tbConsumerQueue
            // 
            this.tbConsumerQueue.Location = new System.Drawing.Point(204, 78);
            this.tbConsumerQueue.Name = "tbConsumerQueue";
            this.tbConsumerQueue.Size = new System.Drawing.Size(356, 22);
            this.tbConsumerQueue.TabIndex = 3;
            this.tbConsumerQueue.Text = "dbo.QueueConsumer[X]";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(39, 78);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(123, 17);
            this.label2.TabIndex = 2;
            this.label2.Text = "Consumer Queue:";
            // 
            // tbConsumerDescription
            // 
            this.tbConsumerDescription.Location = new System.Drawing.Point(204, 120);
            this.tbConsumerDescription.Multiline = true;
            this.tbConsumerDescription.Name = "tbConsumerDescription";
            this.tbConsumerDescription.Size = new System.Drawing.Size(566, 40);
            this.tbConsumerDescription.TabIndex = 5;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(39, 120);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(83, 17);
            this.label3.TabIndex = 4;
            this.label3.Text = "Description:";
            // 
            // tbWorker
            // 
            this.tbWorker.Location = new System.Drawing.Point(204, 166);
            this.tbWorker.Name = "tbWorker";
            this.tbWorker.Size = new System.Drawing.Size(566, 22);
            this.tbWorker.TabIndex = 7;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(39, 166);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(95, 17);
            this.label4.TabIndex = 6;
            this.label4.Text = "WorkerName:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(39, 200);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(129, 17);
            this.label5.TabIndex = 8;
            this.label5.Text = "Subscribed Topics:";
            // 
            // lbAllTopics
            // 
            this.lbAllTopics.FormattingEnabled = true;
            this.lbAllTopics.ItemHeight = 16;
            this.lbAllTopics.Location = new System.Drawing.Point(204, 200);
            this.lbAllTopics.Name = "lbAllTopics";
            this.lbAllTopics.SelectionMode = System.Windows.Forms.SelectionMode.MultiSimple;
            this.lbAllTopics.Size = new System.Drawing.Size(566, 116);
            this.lbAllTopics.TabIndex = 9;
            this.lbAllTopics.SelectedIndexChanged += new System.EventHandler(this.lbAllTopics_SelectedIndexChanged);
            // 
            // bnUpdate
            // 
            this.bnUpdate.Location = new System.Drawing.Point(204, 324);
            this.bnUpdate.Name = "bnUpdate";
            this.bnUpdate.Size = new System.Drawing.Size(221, 40);
            this.bnUpdate.TabIndex = 10;
            this.bnUpdate.Text = "Save Consumer";
            this.bnUpdate.UseVisualStyleBackColor = true;
            this.bnUpdate.Click += new System.EventHandler(this.bnUpdate_Click);
            // 
            // tbError
            // 
            this.tbError.Location = new System.Drawing.Point(34, 375);
            this.tbError.Multiline = true;
            this.tbError.Name = "tbError";
            this.tbError.ReadOnly = true;
            this.tbError.Size = new System.Drawing.Size(736, 48);
            this.tbError.TabIndex = 11;
            // 
            // fManageSubscription
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.tbError);
            this.Controls.Add(this.bnUpdate);
            this.Controls.Add(this.lbAllTopics);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.tbWorker);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.tbConsumerDescription);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.tbConsumerQueue);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.tbConsumerName);
            this.Controls.Add(this.label1);
            this.Name = "fManageSubscription";
            this.Text = "Manage Consumer Subscription";
            this.Load += new System.EventHandler(this.fManageSubscription_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox tbConsumerName;
        private System.Windows.Forms.TextBox tbConsumerQueue;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox tbConsumerDescription;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox tbWorker;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ListBox lbAllTopics;
        private System.Windows.Forms.Button bnUpdate;
        private System.Windows.Forms.TextBox tbError;
    }
}