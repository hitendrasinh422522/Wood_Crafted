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
    public partial class Users_Admin : System.Web.UI.Page
    {
        String s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        String fnm;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            fillgrid();
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();

        }
        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from user_tbl ", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        void select()
        {
            getcon();
            da = new SqlDataAdapter("select * from user_tbl where Id = '" + ViewState["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            txtName.Text = ds.Tables[0].Rows[0][1].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0][3].ToString();
            txtRole.Text = ds.Tables[0].Rows[0][7].ToString();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;
                btnUpdate.Text = "Update";
                EditPanel.Visible = true;
                select();
            }
            else
            {
                getcon();
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;
                cmd = new SqlCommand("delete from user_tbl where Id = '" + ViewState["id"] + "'", con);
                cmd.ExecuteNonQuery();
                fillgrid();

            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("Update user_tbl set Name='" + txtName.Text + "',Email='"+txtEmail.Text+"',Role='"+txtRole.Text+"' where Id = '" + ViewState["id"] + "'", con);
            cmd.ExecuteNonQuery();
            fillgrid();
        }
    }
}