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
    public partial class ViewDetail : System.Web.UI.Page
    {
        String s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        String fnm;
        PagedDataSource pg;
        int row = 3, p;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            fill();
            filllist();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();

        }

        void filllist()
        {
            getcon();
            da = new SqlDataAdapter("select * from add_prod", con);
            ds = new DataSet();
            da.Fill(ds);


            row = ds.Tables[0].Rows.Count;
            pg = new PagedDataSource();
        }

        void fill()
        {
            da = new SqlDataAdapter("select * from add_prod where Id = '" + Request.QueryString["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
          
        }



        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }
    }
}