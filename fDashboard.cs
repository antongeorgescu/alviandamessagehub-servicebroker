using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace MessageHubWithServiceBroker
{
    public partial class fDashboard : Form
    {
        public fDashboard()
        {
            InitializeComponent();
        }

        private void fDashboard_Load(object sender, EventArgs e)
        {
            Program.ConnectionString = "Data Source=STDL1ZJM1N2\\MSSQLSERVER2;Initial Catalog=LoanStarMessageBusBroker;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

            PopulateConsumerList();

            var consumerqueue = ((dynamic)cbConsumers.Items[cbConsumers.SelectedIndex]).code;
            PopulateTopicList(consumerqueue);
        }

        private void PopulateTopicList(string consumer)
        {
            string queryString = 
                "SELECT [QueueConsumer],[Name],[WorkerName],[Description] FROM [LoanStarMessageBusBroker].[dbo].[BrokerConsumers] " +
                $"WHERE [QueueConsumer] = '{consumer}'";

            string queryString2 =
                "SELECT sm.[Contract],sm.[QueueConsumer],sm.[ServiceConsumer]," +
                "mt.[InitiatorMessageType],mt.[TargetMessageType],mt.[Topic] " +
                "FROM[LoanStarMessageBusBroker].[dbo].[BrokerServicesMatrix] sm " +
                "INNER JOIN[LoanStarMessageBusBroker].[dbo].[BrokerContractMessageTypes] mt " +
                "ON sm.[Contract] = mt.[Contract] " +
                $"WHERE sm.[QueueConsumer] = '{consumer}'";

            using (SqlConnection connection =
                       new SqlConnection(Program.ConnectionString))
            {
                connection.Open();
                SqlCommand command =
                    new SqlCommand(queryString, connection);
                SqlDataReader reader = command.ExecuteReader();

                reader.Read();
                tbConsumerName.Text = reader[1].ToString();
                tbConsumerDescription.Text = reader[3].ToString();
                tbWorker.Text = reader[2].ToString();
                reader.Close();

                command = new SqlCommand(queryString2, connection);
                reader = command.ExecuteReader();
                // Call Read before accessing data.
                lbTopics.Items.Clear();
                lbTopics.DisplayMember = "name";
                lbTopics.ValueMember = "code";
                while (reader.Read())
                {
                    var entry = new {name= reader[5].ToString(), code= reader[0].ToString() };
                    lbTopics.Items.Add(entry);
                }
                // Call Close when done reading.
                reader.Close();
            }
        }

        private void PopulateConsumerList()
        {
            string queryString =
                "SELECT [QueueConsumer],[Name],[WorkerName] FROM [LoanStarMessageBusBroker].[dbo].[BrokerConsumers]";
            using (SqlConnection connection =
                       new SqlConnection(Program.ConnectionString))
            {
                connection.Open();
                SqlCommand command =
                    new SqlCommand(queryString, connection);
                SqlDataReader reader = command.ExecuteReader();
                
                cbConsumers.DisplayMember = "name";
                cbConsumers.ValueMember = "code";

                // Call Read before accessing data.
                while (reader.Read())
                {
                    cbConsumers.Items.Add(new { code = reader[0].ToString(), name = reader[1].ToString() });
                }

                cbConsumers.SelectedIndex = 0;

                // Call Close when done reading.
                reader.Close();

            }

            
        }

        private void cbConsumers_SelectedIndexChanged(object sender, EventArgs e)
        {

            var consumerqueue = ((dynamic)cbConsumers.SelectedItem).code;
            string queryString =
                "SELECT [QueueConsumer],[Description],[WorkerName] FROM [LoanStarMessageBusBroker].[dbo].[BrokerConsumers] " +
                $"WHERE [QueueConsumer] = '{consumerqueue}'";
            using (SqlConnection connection =
                       new SqlConnection(Program.ConnectionString))
            {
                connection.Open();
                SqlCommand command =
                    new SqlCommand(queryString, connection);
                SqlDataReader reader = command.ExecuteReader();
                reader.Read();
                tbConsumerName.Text = reader[1].ToString();
                tbWorker.Text = reader[2].ToString();

                // Call Close when done reading.
                reader.Close();

                PopulateTopicList(consumerqueue);

                PopulateConsumerLog(consumerqueue);
            }
        }

        private void PopulateConsumerLog(string consumerqueue)
        {
            string queryString = "select message_type_name as \"MessageType\"," +
                                "qp.message_enqueue_time as \"Posted On\"," +
                                "mt.Topic as \"Topic\"," +
                                "CAST(qp.message_body AS XML) AS \"ResponseMessage\" " +
                                "from dbo.QueuePublisher qp " +
                                "inner join dbo.BrokerContractMessageTypes mt on qp.message_type_name = mt.TargetMessageType COLLATE SQL_Latin1_General_CP1_CI_AS " +
                                "where qp.validation = 'X' " +
                                $"and CHARINDEX('{consumerqueue}', CAST(qp.message_body AS nvarchar(500)))> 0";
            using (SqlConnection connection =
                       new SqlConnection(Program.ConnectionString))
            {
                connection.Open();
                SqlCommand command =
                    new SqlCommand(queryString, connection);
                SqlDataReader reader = command.ExecuteReader();

                // Call Read before accessing data.
                lbConsumerLog.Items.Clear();
                while (reader.Read())
                {
                    lbConsumerLog.Items.Add($"Message Type:{reader[0]}");
                    lbConsumerLog.Items.Add($"Posted On:{reader[1]}");
                    lbConsumerLog.Items.Add($"Topic:{reader[2]}");
                    lbConsumerLog.Items.Add($"Consumer Response:{reader[3]}");
                    lbConsumerLog.Items.Add($"{Environment.NewLine}");
                }
                // Call Close when done reading.
                reader.Close();
            }
        }

        private void bnTopics_Click(object sender, EventArgs e)
        {
            var frm = new fTopics();
            frm.Show();
        }

        private void bnReset_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection =
                       new SqlConnection(Program.ConnectionString))
            {
                connection.Open();
                SqlCommand command =
                    new SqlCommand("dbo.ClearServiceBrokerQueries", connection);
                command.CommandType = CommandType.StoredProcedure;
                var res = command.ExecuteNonQuery();
                cbConsumers.SelectedIndex = 0;
            }
            tbError.Text = String.Empty;
            tbError.Text = "All Consumer queues cleared out.";
        }

        private void bnPublish_Click(object sender, EventArgs e)
        {
            var frm = new fPublishMessage();
            frm.Show();
        }

        private void bnConsume_Click(object sender, EventArgs e)
        {
            //PopulateConsumerList();

            //var consumerqueue = ((dynamic)cbConsumers.Items[cbConsumers.SelectedIndex]).code;
            //PopulateTopicList(consumerqueue);

            using (SqlConnection connection =
                      new SqlConnection(Program.ConnectionString))
            {
                connection.Open();
                SqlCommand command =
                    new SqlCommand("dbo.ConsumeMessage", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@QueueConsumer", SqlDbType.NChar, 50, "QueueConsumer"));
                command.Parameters[0].Value = ((dynamic)cbConsumers.Items[cbConsumers.SelectedIndex]).code;
                command.ExecuteNonQuery();
            }
            tbError.Text = String.Empty;
            tbError.Text = $"Consumer {((dynamic)cbConsumers.Items[cbConsumers.SelectedIndex]).code} enqueued messages have been processed.";
        }

        private void bnRefresh_Click(object sender, EventArgs e)
        {
            var consumerqueue = ((dynamic)cbConsumers.SelectedItem).code;
            string queryString =
                "SELECT [QueueConsumer],[Description],[WorkerName] FROM [LoanStarMessageBusBroker].[dbo].[BrokerConsumers] " +
                $"WHERE [QueueConsumer] = '{consumerqueue}'";
            using (SqlConnection connection =
                       new SqlConnection(Program.ConnectionString))
            {
                connection.Open();
                SqlCommand command =
                    new SqlCommand(queryString, connection);
                SqlDataReader reader = command.ExecuteReader();
                reader.Read();
                tbConsumerName.Text = reader[1].ToString();
                tbWorker.Text = reader[2].ToString();

                // Call Close when done reading.
                reader.Close();

                PopulateTopicList(consumerqueue);

                PopulateConsumerLog(consumerqueue);
            }

            //PopulateConsumerList();

            tbError.Text = String.Empty;
            tbError.Text = $"Consumers list has been refreshed.";
        }

        private void bnSubscribeConsumer_Click(object sender, EventArgs e)
        {
            var queueConsumer = ((dynamic)cbConsumers.Items[cbConsumers.SelectedIndex]).code;
            var frm = new fManageSubscription(queueConsumer);
            frm.Show();

            

        }

        private void bnCreateSubscription_Click(object sender, EventArgs e)
        {
            var frm = new fManageSubscription();
            frm.Show();
        }
    }
}
