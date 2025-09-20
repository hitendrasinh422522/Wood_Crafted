<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="checkout.aspx.cs" Inherits="Wood_Crafted.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .checkout-box { 
            padding:20px; 
            background:#fff; 
            border-radius:10px; 
            box-shadow:0 3px 15px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .btn-checkout { 
            background:#28a745; 
            color:#fff; 
            padding:10px 20px; 
            border:none; 
            border-radius:5px; 
            width: 100%;
        }
        .btn-checkout:hover { 
            background:#218838; 
        }
        .btn-checkout:disabled {
            background: #6c757d;
            cursor: not-allowed;
        }
        .error-message {
            color: #dc3545;
            font-size: 14px;
            margin-top: 5px;
        }
        .success-message {
            color: #28a745;
            font-size: 14px;
            margin-top: 5px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .empty-cart {
            text-align: center;
            padding: 20px;
            color: #6c757d;
        }
        .validation-summary {
            color: #dc3545;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
            background-color: #f8d7da;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <h2 class="my-4">Checkout</h2>
        
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validation-summary" DisplayMode="BulletList" />
        
        <asp:Panel ID="pnlCheckoutForm" runat="server">
            <div class="row">
                <!-- Billing Details -->
                <div class="col-md-6">
                    <div class="checkout-box">
                        <h4>Billing Details</h4>
                        
                        <div class="form-group">
                            <asp:Label AssociatedControlID="txtName" Text="Full Name *" runat="server" />
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" 
                                ErrorMessage="Name is required" CssClass="error-message" Display="Dynamic" />
                        </div>
                        
                        <div class="form-group">
                            <asp:Label AssociatedControlID="txtEmail" Text="Email *" runat="server" />
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                                ErrorMessage="Email is required" CssClass="error-message" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
                                ErrorMessage="Invalid email format" CssClass="error-message" Display="Dynamic" />
                        </div>
                        
                        <div class="form-group">
                            <asp:Label AssociatedControlID="txtPhone" Text="Phone *" runat="server" />
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Phone"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" 
                                ErrorMessage="Phone is required" CssClass="error-message" Display="Dynamic" />
                        </div>
                        
                        <div class="form-group">
                            <asp:Label AssociatedControlID="txtAddress" Text="Address *" runat="server" />
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Address"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" 
                                ErrorMessage="Address is required" CssClass="error-message" Display="Dynamic" />
                        </div>
                    </div>
                </div>

                <!-- Order Summary -->
                <div class="col-md-6">
                    <div class="checkout-box">
                        <h4>Order Summary</h4>
                        
                        <asp:Panel ID="pnlOrderSummary" runat="server">
                            <asp:GridView ID="gvOrderSummary" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                                <Columns>
                                    <asp:BoundField DataField="ProductName" HeaderText="Product" />
                                    <asp:BoundField DataField="Quantity" HeaderText="Qty" />
                                    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="₹{0:N2}" />
                                    <asp:BoundField DataField="TotalPrice" HeaderText="Total" DataFormatString="₹{0:N2}" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <div class="empty-cart">
                                        Your cart is empty
                                    </div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:Label ID="lblTotal" runat="server" Font-Bold="true" CssClass="d-block mb-3"></asp:Label>
                        </asp:Panel>
                        
                        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" CssClass="btn-checkout" OnClick="btnPlaceOrder_Click" />
                    </div>
                </div>
            </div>
        </asp:Panel>
        
        <asp:Panel ID="pnlSuccess" runat="server" Visible="false">
            <div class="alert alert-success text-center">
                <h4>Order Placed Successfully!</h4>
                <p>Your order has been processed. You will receive a confirmation email shortly.</p>
                <asp:HyperLink ID="hlContinue" runat="server" Text="Continue Shopping" NavigateUrl="~/Default.aspx" CssClass="btn btn-primary" />
            </div>
        </asp:Panel>
        
        <asp:Panel ID="pnlError" runat="server" Visible="false">
            <div class="alert alert-danger text-center">
                <h4>Error Processing Order</h4>
                <asp:Label ID="lblError" runat="server" />
                <br />
                <asp:Button ID="btnTryAgain" runat="server" Text="Try Again" CssClass="btn btn-secondary mt-2" OnClick="btnTryAgain_Click" />
            </div>
        </asp:Panel>
    </div>
</asp:Content>