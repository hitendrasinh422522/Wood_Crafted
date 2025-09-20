using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System;
using System.Data.SqlClient;
using System.Configuration;
namespace Wood_Crafted
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        String s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            getcon();

            // Fetch Role also
            string query = "SELECT Role FROM user_tbl WHERE Email='" + txtEmail.Text + "' AND Password='" + txtPassword.Text + "'";
            cmd = new SqlCommand(query, con);

            object roleObj = cmd.ExecuteScalar();

            if (roleObj != null)  // valid login
            {
                string role = roleObj.ToString();

                if (role == "Admin")
                {
                    Session["admin_email"] = txtEmail.Text;
                    Response.Redirect("Admin_Dashboard.aspx");
                }
                else if (role == "User")
                {
                    Session["user_email"] = txtEmail.Text;
                    Response.Redirect("index.aspx");
                }
                else
                {
                    lblMsg.Text = "Unknown role in database!";
                }
            }
            else
            {
                lblMsg.Text = "Invalid Email or Password!";
            }

            con.Close();
        }
    }
}