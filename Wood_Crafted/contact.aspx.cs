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
    public partial class WebForm7 : System.Web.UI.Page
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
            txtFName.Text = "";
            txtLName.Text = "";
            txtEmail.Text = "";
            txtMessage.Text = "";

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (btnSend.Text == "Send Message")
            {
                getcon();



                cmd = new SqlCommand("insert into ContactMessages (FirstName,LastName,Email,Message) values('" + txtFName.Text + "','" + txtLName.Text + "','" + txtEmail.Text + "' ,'" + txtMessage.Text + "') ", con);
                cmd.ExecuteNonQuery();
                clear();
            }
        }
    }
}