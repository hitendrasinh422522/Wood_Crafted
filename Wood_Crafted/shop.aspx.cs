using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Wood_Crafted
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        PagedDataSource pg;
        int row = 3, p;
        DataTable productsTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["pid"] = 0;
                getcon();
                filllist();
            }
            else
            {
                // Recreate the PagedDataSource on postback
                getcon();
                filllist();
            }

          
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            int currentpage = Convert.ToInt32(ViewState["pid"]);
            currentpage++;
            ViewState["pid"] = currentpage;
            filllist();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            int currentpage = Convert.ToInt32(ViewState["pid"]);
            currentpage--;
            ViewState["pid"] = currentpage;
            filllist();
        }

        void filllist()
        {
            getcon();
            da = new SqlDataAdapter("select * from add_prod", con);
            ds = new DataSet();
            da.Fill(ds);
            productsTable = ds.Tables[0]; // Store for later use

            row = ds.Tables[0].Rows.Count;
            pg = new PagedDataSource();

            pg.AllowPaging = true;
            pg.PageSize = 3;
            pg.CurrentPageIndex = Convert.ToInt32(ViewState["pid"]);

            pg.DataSource = ds.Tables[0].DefaultView;
            LinkButton1.Enabled = !pg.IsFirstPage;
            LinkButton2.Enabled = !pg.IsLastPage;
            DataList1.DataSource = pg;
            DataList1.DataBind();

         
        }



        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_view")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("ViewDetail.aspx?id=" + id);

            }
        }

        private void AddToCart(string productId, string productName, string productImage, decimal productPrice)
        {

        }

       
    }

}
   