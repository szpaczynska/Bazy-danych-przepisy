using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Przepisy_Projekt
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Przepisy_Baza;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand sqlCommand = new SqlCommand("SELECT TOP 1 nazwaPotrawy FROM potrawy where typPotrawy like 'sniadanie'ORDER BY NEWID()");

            string connectionString2 = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Przepisy_Baza;Integrated Security=True";
            SqlConnection connection2 = new SqlConnection(connectionString2);
            SqlCommand sqlCommand2 = new SqlCommand("SELECT TOP 1 nazwaPotrawy FROM potrawy where typPotrawy like 'obiad'ORDER BY NEWID()");

            string connectionString3 = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Przepisy_Baza;Integrated Security=True";
            SqlConnection connection3 = new SqlConnection(connectionString3);
            SqlCommand sqlCommand3 = new SqlCommand("SELECT TOP 1 nazwaPotrawy FROM potrawy where typPotrawy like 'kolacja'ORDER BY NEWID()");

            sqlCommand.Connection = connection;
            sqlCommand2.Connection = connection2;
            sqlCommand3.Connection = connection3;

            connection.Open();
            sqlCommand.ExecuteNonQuery();
          
            var s = sqlCommand.ExecuteScalar();
            Label1.Text = s.ToString();
            connection.Close();

            connection2.Open();
            sqlCommand2.ExecuteNonQuery();
            var o = sqlCommand2.ExecuteScalar();
            Label4.Text = o.ToString();
            connection2.Close();


            connection3.Open();
            sqlCommand3.ExecuteNonQuery();
            var k = sqlCommand3.ExecuteScalar();
            Label6.Text = k.ToString();
            connection3.Close();






        }
    }
}