using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;

namespace Wood_Crafted
{
    public partial class Checkout : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrderSummary();
            }
        }

        private void LoadOrderSummary()
        {
            List<CartItem> cart = Session["Cart"] as List<CartItem>;

            if (cart != null && cart.Count > 0)
            {
                gvOrderSummary.DataSource = cart;
                gvOrderSummary.DataBind();
                lblTotal.Text = "Total: ₹" + cart.Sum(x => x.TotalPrice).ToString("N2");
                pnlOrderSummary.Visible = true;
                btnPlaceOrder.Enabled = true;
            }
            else
            {
                pnlOrderSummary.Visible = false;
                btnPlaceOrder.Enabled = false;
                btnPlaceOrder.Text = "Cart is Empty";
            }
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                List<CartItem> cart = Session["Cart"] as List<CartItem>;
                if (cart == null || cart.Count == 0)
                {
                    ShowError("Your cart is empty. Please add products before checkout.");
                    return;
                }

                try
                {
                    int orderId = InsertOrder();
                    if (orderId > 0)
                    {
                        bool itemsInserted = InsertOrderItems(orderId, cart);
                        if (itemsInserted)
                        {
                            Session["Cart"] = null;
                            ShowSuccess();
                        }
                        else
                        {
                            ShowError("Failed to insert order items. Please try again.");
                        }
                    }
                    else
                    {
                        ShowError("Failed to create order. Please try again.");
                    }
                }
                catch (Exception ex)
                {
                    ShowError("An error occurred while processing your order: " + ex.Message);
                }
            }
        }

        private int InsertOrder()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "INSERT INTO Orders (CustomerName, Email, Phone, Address, OrderDate, TotalAmount) " +
                               "OUTPUT INSERTED.OrderId " +
                               "VALUES (@CustomerName, @Email, @Phone, @Address, @OrderDate, @TotalAmount)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Parameterized query to prevent SQL injection
                    cmd.Parameters.AddWithValue("@CustomerName", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);

                    List<CartItem> cart = Session["Cart"] as List<CartItem>;
                    cmd.Parameters.AddWithValue("@TotalAmount", cart.Sum(x => x.TotalPrice));

                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }

        private bool InsertOrderItems(int orderId, List<CartItem> cartItems)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Use transaction to ensure all items are inserted or none
                using (SqlTransaction transaction = con.BeginTransaction())
                {
                    try
                    {
                        foreach (var item in cartItems)
                        {
                            using (SqlCommand cmd = new SqlCommand("InsertOrderItem", con, transaction))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@OrderId", orderId);
                                cmd.Parameters.AddWithValue("@ProductName", item.ProductName);
                                cmd.Parameters.AddWithValue("@Quantity", item.Quantity);
                                cmd.Parameters.AddWithValue("@Price", item.Price);
                                cmd.Parameters.AddWithValue("@TotalPrice", item.TotalPrice);
                                cmd.ExecuteNonQuery();
                            }
                        }

                        transaction.Commit();
                        return true;
                    }
                    catch
                    {
                        transaction.Rollback();
                        throw;
                    }
                }
            }
        }

        private void ShowSuccess()
        {
            pnlCheckoutForm.Visible = false;
            pnlError.Visible = false;
            pnlSuccess.Visible = true;
        }

        private void ShowError(string errorMessage)
        {
            lblError.Text = errorMessage;
            pnlError.Visible = true;
            pnlSuccess.Visible = false;
            pnlCheckoutForm.Visible = true;
        }

        protected void btnTryAgain_Click(object sender, EventArgs e)
        {
            pnlError.Visible = false;
        }

        [Serializable]
        public class CartItem
        {
            public string ProductName { get; set; }
            public int Quantity { get; set; }
            public decimal Price { get; set; }
            public decimal TotalPrice { get { return Quantity * Price; } }
        }
    }
}