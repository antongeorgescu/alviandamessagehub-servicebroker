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
    public partial class fPublishMessage : Form
    {
        public fPublishMessage()
        {
            InitializeComponent();
        }

        private void fPublishMessage_Load(object sender, EventArgs e)
        {
            string queryString =
                "SELECT [Contract],[InitiatorMessageType],[TargetMessageType],[Topic] " +
                "FROM [AlviandaMessageBroker].[dbo].[BrokerContractMessageTypes]";

            using (SqlConnection connection =
                       new SqlConnection(Program.ConnectionString))
            {
                connection.Open();
                SqlCommand command =
                    new SqlCommand(queryString, connection);
                SqlDataReader reader = command.ExecuteReader();

                // Call Read before accessing data.
                cbTopics.DisplayMember = "name";
                cbTopics.ValueMember = "code";

                // Call Read before accessing data.
                while (reader.Read())
                {
                    cbTopics.Items.Add(new { code = reader[0].ToString(), name = reader[3].ToString() });
                }

                cbTopics.SelectedIndex = 0;

                // Call Close when done reading.
                reader.Close();
            }
        }

        private void bnPublish_Click(object sender, EventArgs e)
        {
            
            using (SqlConnection connection =
                      new SqlConnection(Program.ConnectionString))
            {
                connection.Open();
                SqlCommand command =
                    new SqlCommand("dbo.PublishMessage", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ContractName", SqlDbType.NChar, 50));
                command.Parameters[0].Value = ((dynamic)cbTopics.Items[cbTopics.SelectedIndex]).code;
                var res = command.ExecuteNonQuery();
            }
            
            tbStatus.Text = "Message published! Make new selection and publish.";
        }

        private void OnPublishedMessageChanged(object sender, EventArgs e)
        {
            tbStatus.Text = string.Empty;
        }
    }
}
