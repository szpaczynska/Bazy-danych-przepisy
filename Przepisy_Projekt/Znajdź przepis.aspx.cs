using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Przepisy_Projekt
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
            
        protected void ButtonKalorie_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Przepisy_Baza;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand sqlCommand = new SqlCommand("SELECT ROUND(SUM(Przepisy.ilosc * Skladniki.kalorycznosc / Skladniki.iloscPodstawowa),1) FROM Potrawy INNER JOIN Przepisy ON Potrawy.idPotrawy = Przepisy.idPotrawy INNER JOIN Skladniki ON Przepisy.idSkladnika = Skladniki.idSkladnika WHERE (Przepisy.idPotrawy = @param)");
            sqlCommand.Parameters.AddWithValue("@param", DropDownList1.SelectedValue);
            sqlCommand.Connection = connection;
            connection.Open();
            sqlCommand.ExecuteNonQuery();
            var kalorie = sqlCommand.ExecuteScalar();
            LabelKalorie.Text = "Kaloryczność tej potrawy to: " + kalorie.ToString() + " kcal";
            connection.Close();
        }

        protected void ButtonCena_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Przepisy_Baza;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand sqlCommand = new SqlCommand("SELECT ROUND(SUM(Przepisy.ilosc * Skladniki.cena / Skladniki.iloscPodstawowa),2) FROM Potrawy INNER JOIN Przepisy ON Potrawy.idPotrawy = Przepisy.idPotrawy INNER JOIN Skladniki ON Przepisy.idSkladnika = Skladniki.idSkladnika WHERE (Przepisy.idPotrawy = @param)");
            sqlCommand.Parameters.AddWithValue("@param", DropDownList1.SelectedValue);
            sqlCommand.Connection = connection;
            connection.Open();
            sqlCommand.ExecuteNonQuery();
            var cena = sqlCommand.ExecuteScalar();
            LabelCena.Text = "Cena tej potrawy to: " + cena.ToString() + " zł";
            connection.Close();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}