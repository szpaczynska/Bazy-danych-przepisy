using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Przepisy_Projekt
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBox1.Visible = true;
            TextBox2.Visible = true;
            TextBox3.Visible = true;
            Label1.Visible = true;
            Label2.Visible = true;
            Label3.Visible = true;
            Button2.Visible = true;
            Label9.Visible = true;

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Przepisy_Baza;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand sqlCommand = new SqlCommand("INSERT INTO Potrawy (nazwaPotrawy, typPotrawy, sPrzygototwania) values (@param, @parame, @parametr)");
            sqlCommand.Parameters.AddWithValue("@param",TextBox1.Text);
            sqlCommand.Parameters.AddWithValue("@parame", TextBox2.Text);
            sqlCommand.Parameters.AddWithValue("@parametr", TextBox3.Text);
            sqlCommand.Connection = connection;
            connection.Open();
            sqlCommand.ExecuteNonQuery();
            connection.Close();
            GridView1.DataBind();
            DropDownList1.Visible = true;
            Button3.Visible = true;
            Label10.Visible = true;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Label4.Visible = true;
            Label5.Visible = true;
            TextBox4.Visible = true;
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Przepisy_Baza;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand sqlCommand = new SqlCommand("select jednostkaMiary from Skladniki where idSkladnika like @param");
            sqlCommand.Parameters.AddWithValue("@param", DropDownList1.SelectedValue); 
            sqlCommand.Connection = connection;
            connection.Open();
            sqlCommand.ExecuteNonQuery();
            var kcal = sqlCommand.ExecuteScalar();
            Label4.Text = kcal.ToString();
            connection.Close();

            string connectionString2 = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Przepisy_Baza;Integrated Security=True";
            SqlConnection connection2 = new SqlConnection(connectionString2);
            SqlCommand sqlCommand2 = new SqlCommand("select idPotrawy from Potrawy where nazwaPotrawy like @parame");
            sqlCommand2.Parameters.AddWithValue("@parame", TextBox1.Text);
            sqlCommand2.Connection = connection2;
            connection2.Open();
            sqlCommand2.ExecuteNonQuery();
            var idP = sqlCommand2.ExecuteScalar();
            Label6.Text = idP.ToString();
            connection.Close();

            Button4.Visible = true;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Przepisy_Baza;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand sqlCommand = new SqlCommand("INSERT INTO Przepisy (idPotrawy, idSkladnika, ilosc, jednostkaMiary) values (@param, @parame, @parametr,@p)");
            sqlCommand.Parameters.AddWithValue("@param", Label6.Text);
            sqlCommand.Parameters.AddWithValue("@parame", DropDownList1.SelectedValue);
            sqlCommand.Parameters.AddWithValue("@parametr",TextBox4.Text);
            sqlCommand.Parameters.AddWithValue("@p", Label4.Text);
            sqlCommand.Connection = connection;
            connection.Open();
            sqlCommand.ExecuteNonQuery();
            connection.Close();
            GridView2.DataBind();
            Label7.Visible = true;
            GridView2.Visible = true;
        }
    }
}