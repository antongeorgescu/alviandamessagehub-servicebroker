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
    public partial class fTopics : Form
    {
        public fTopics()
        {
            InitializeComponent();
        }

        private void fTopics_Load(object sender, EventArgs e)
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
                while (reader.Read())
                {
                    lbAllTopics.Items.Add($"[{reader[2]}] {reader[3]}");
                }

                // Call Close when done reading.
                reader.Close();
             }
        }
    }
}
