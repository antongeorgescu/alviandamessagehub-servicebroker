using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MessageHubWithServiceBroker
{
    public partial class fManageSubscription : Form
    {
        //public string QueueConsumer { get; set; }
        public static fDashboard FDashboard;

        public fManageSubscription(string queueConsumer = null)
        {
            InitializeComponent();

            if (!(queueConsumer == null))
                PopulateCurrentConsumer(queueConsumer);
            else
                PopulateTopicsList();
        }

        private void PopulateTopicsList()
        {
            string queryString =
                "SELECT [Contract],[InitiatorMessageType],[TargetMessageType],[Topic] " +
                "FROM[LoanStarMessageBusBroker].[dbo].[BrokerContractMessageTypes]";

            using (SqlConnection connection =
                       new SqlConnection(Program.ConnectionString))
            {
                connection.Open();
                SqlCommand command =
                    new SqlCommand(queryString, connection);
                SqlDataReader reader = command.ExecuteReader();

                // Call Read before accessing data.
                lbAllTopics.Items.Clear();
                lbAllTopics.DisplayMember = "name";
                lbAllTopics.ValueMember = "code";
                while (reader.Read())
                {
                    var selected = string.Empty;
                    var entry = new { name = reader[3].ToString(), code = reader[0].ToString() };

                    lbAllTopics.Items.Add(entry);

                }

                // Call Close when done reading.
                reader.Close();
            }
        }

        private void PopulateCurrentConsumer(string queueConsumer)
        {
            tbConsumerQueue.Text = queueConsumer;

            // read the Consumer data from database
            string queryString =
                "SELECT [QueueConsumer],[Name],[Description],[WorkerName] " +
                "FROM [LoanStarMessageBusBroker].[dbo].[BrokerConsumers] " +
                $"WHERE [QueueConsumer] = '{queueConsumer}'";

            string queryString2 =
                "SELECT[dbo].[BrokerVwAllTopics].[Contract],[dbo].[BrokerVwAllTopics].[Topic]," +
                "CASE WHEN EXISTS(SELECT DISTINCT sm.[Contract] as \"Contract\", mt.[Topic] as \"Topic\" " +
                "FROM[dbo].[BrokerServicesMatrix] sm " +
                "RIGHT OUTER JOIN " +
                "[dbo].[BrokerContractMessageTypes] mt " +
                "ON sm.[Contract] = mt.[Contract] " +
                $"WHERE sm.[QueueConsumer] = '{queueConsumer}' AND sm.[Contract] = [dbo].[BrokerVwAllTopics].[Contract]) THEN 1 " +
                "ELSE 0 END as \"Selected\" " +
                "FROM[dbo].[BrokerVwAllTopics]";

            using (SqlConnection connection =
                       new SqlConnection(Program.ConnectionString))
            {
                connection.Open();
                SqlCommand command =
                    new SqlCommand(queryString, connection);
                SqlDataReader reader = command.ExecuteReader();

                reader.Read();
                tbConsumerName.Text = reader[1].ToString();
                tbConsumerDescription.Text = reader[2].ToString();
                tbWorker.Text = reader[3].ToString();
                reader.Close();

                command = new SqlCommand(queryString2, connection);
                reader = command.ExecuteReader();
                // Call Read before accessing data.
                lbAllTopics.Items.Clear();
                lbAllTopics.DisplayMember = "name";
                lbAllTopics.ValueMember = "code";
                while (reader.Read())
                {
                    var selected = string.Empty;
                    var entry = new { name = reader[1].ToString(), code = reader[0].ToString() };

                    lbAllTopics.Items.Add(entry);
                    if (reader[2].ToString() == "1")
                        lbAllTopics.SetSelected(lbAllTopics.Items.Count - 1, true);
                }
                // Call Close when done reading.
                reader.Close();
            }
        }

        private void fManageSubscription_Load(object sender, EventArgs e)
        {
            
        }

        private void bnUpdate_Click(object sender, EventArgs e)
        {

            //@QueueConsumer NVARCHAR(50), 
	        //@ConsumerName NVARCHAR(50),
	        //@Description NVARCHAR(50),
	        //@WorkerName NVARCHAR(50)
            using (SqlConnection connection =
                      new SqlConnection(Program.ConnectionString))
            {
                connection.Open();
                SqlCommand command =
                    new SqlCommand("dbo.SaveConsumer", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@QueueConsumer", SqlDbType.NChar, 50));
                command.Parameters[0].Value = tbConsumerQueue.Text;
                command.Parameters.Add(new SqlParameter("@ConsumerName", SqlDbType.NChar, 50));
                command.Parameters[1].Value = tbConsumerName.Text;
                command.Parameters.Add(new SqlParameter("@Description", SqlDbType.NChar, 2000));
                command.Parameters[2].Value = tbConsumerDescription.Text;
                command.Parameters.Add(new SqlParameter("@WorkerName", SqlDbType.NChar, 50));
                command.Parameters[3].Value = tbWorker.Text;
                command.ExecuteNonQuery();
            }

            // update subscription to topics list
            var allitems = lbAllTopics.Items;
            using (SqlConnection connection =
                       new SqlConnection(Program.ConnectionString))
            {
                connection.Open();
                foreach (var item in allitems)
                {
                    var contract = ((dynamic)item).code;
                    var consumerqueue = tbConsumerQueue.Text;
                    bool selected = lbAllTopics.GetSelected(allitems.IndexOf(item));
                    
                    SqlCommand command =
                        new SqlCommand("dbo.[UpdateConsumerContracts]", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@QueueConsumer", SqlDbType.NChar, 50));
                    command.Parameters[0].Value = consumerqueue.Trim();
                    command.Parameters.Add(new SqlParameter("@Contract", SqlDbType.NChar, 50));
                    command.Parameters[1].Value = contract;
                    command.Parameters.Add(new SqlParameter("@Action", SqlDbType.NChar, 10));
                    if (selected)
                        command.Parameters[2].Value = "ADD";
                    else
                        command.Parameters[2].Value = "REMOVE";
                    command.ExecuteNonQuery();
                    
                }
            }

            FDashboard.PopulateConsumerList();

            tbError.Clear();
            tbError.AppendText("Execution finished successfully.");
            //tbError.AppendText($"Cannot create Consumer {tbConsumerName.Text} with unique Queue {tbConsumerQueue.Text}.");
            //tbError.AppendText("Check if this consumer queue already exists or choose a different Queue name.");
        }

        private void lbAllTopics_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}
