using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Xml.Linq;
namespace Wood_Crafted
{
    public partial class WebForm12 : System.Web.UI.Page
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
            fillcombo();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();

        }
        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from add_prod ", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        void select()
        {
            getcon();
            da = new SqlDataAdapter("select * from add_prod where Id = '" + ViewState["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

           
            txtpnm.Text = ds.Tables[0].Rows[0][2].ToString();
            txtpconfig.Text = ds.Tables[0].Rows[0][3].ToString();
            txtprice.Text = ds.Tables[0].Rows[0][4].ToString();
        }

        void fillcombo()
        {
            getcon();
            da = new SqlDataAdapter("select * from add_comp", con);
            ds = new DataSet();
            da.Fill(ds);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                drpdwn.Items.Add(ds.Tables[0].Rows[i][1].ToString());
            }
        }

        void imgupload()
        {
            if (flpimg.HasFile)
            {
                fnm = "Prod_images/" + flpimg.FileName;
                flpimg.SaveAs(Server.MapPath(fnm));
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;
                Button1.Text = "Update";
                Panel1.Visible = true;
                select();
            }
            else
            {
                getcon();
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;
                cmd = new SqlCommand("delete from add_prod where Id = '" + ViewState["id"] + "'", con);
                cmd.ExecuteNonQuery();
                fillgrid();

            }

        }

        protected void drpdwn_SelectedIndexChanged(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select Id from add_comp where Name='" + drpdwn.SelectedItem.Text + "'", con);

            ds = new DataSet();
            da.Fill(ds);
            ViewState["cid"] = ds.Tables[0].Rows[0][0].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            imgupload();
            cmd = new SqlCommand("Update add_prod set Comp_Name='" + drpdwn.SelectedValue + "',Prod_Name='" + txtpnm.Text + "',Prod_Config='" + txtpconfig.Text + "' ,Prod_Price='" + txtprice.Text + "',Prod_Image='" + fnm +"' where Id = '" + ViewState["id"] + "'", con);
            cmd.ExecuteNonQuery();
            fillgrid();
        }
    }
}