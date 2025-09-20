using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data.SqlClient;
using System.Data;
using System.Configuration;



namespace Wood_Crafted
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        String s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();

        }

        void clear()
        {
            TextBox2.Text = "";
            TextBox1.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Button1.Text == "Signup")
            {
                getcon();
         


                cmd = new SqlCommand("insert into user_tbl (Name,Gender,Email,Password,ConformPassword,City) values('" + TextBox1.Text + "','" + RadioButtonList1.Text + "','" + TextBox2.Text + "' ,'" + TextBox3.Text + "','" + TextBox4.Text + "','" + DropDownList1.SelectedValue + "') ", con);
                cmd.ExecuteNonQuery();
                clear();
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            
                
            

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}