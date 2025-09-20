﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewDetail.aspx.cs" Inherits="Wood_Crafted.ViewDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <center>
        <h1>View Detail</h1>
        <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" Height="149px" ImageUrl='<%# Eval("Prod_Image") %>' Width="153px" />
                <br>
                <b>Product Name:</b>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Prod_Name") %>'></asp:Label>
                <br >
                <b>Product Config:</b>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Prod_Config") %>'></asp:Label>
                <br >
                <b>Product Price:</b>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Prod_Price") %>'></asp:Label>
            </ItemTemplate>
        </asp:DataList>
    </center>
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder1">
                <!doctype html>
                <html>
                <head>
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                    <meta name="author" content="Untree.co">
                    <link rel="shortcut icon" href="favicon.png">
                    <meta name="description" content="" />
                    <meta name="keywords" content="bootstrap, bootstrap4" />

                    <!-- Bootstrap CSS -->
                    <link href="css/bootstrap.min.css" rel="stylesheet">
                    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
                    <link href="css/tiny-slider.css" rel="stylesheet">
                    <link href="css/style.css" rel="stylesheet"><title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co</title>
                </head>
                <body>

                    <!-- Start Header/Navigation -->
                    <nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">
                        <div class="container">
                            <a class="navbar-brand" href="index.aspx">WoodCrafted<span>.</span></a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarsFurni">
                                <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                                    <li class="nav-item active"><a class="nav-link" href="index.aspx">Home</a> </li>
                                    <li><a class="nav-link" href="shop.aspx">Shop</a></li>
                                    <li><a class="nav-link" href="about.aspx">About us</a></li>
                                    <li><a class="nav-link" href="services.aspx">Services</a></li>
                                    <li><a class="nav-link" href="blog.aspx">Blog</a></li>
                                    <li><a class="nav-link" href="contact.aspx">Contact us</a></li>
                                </ul>
                                <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                                    <li><a class="nav-link" href="Register.aspx">
                                        <img src="images/user.svg"></a></li>
                                    <a class="nav-link" href="cart.aspx" id="cartLink">
                                        <img src="images/cart.svg">
                                        <asp:Label ID="cartCounter" runat="server" Text="0" CssClass="cart-counter"></asp:Label>
                                        </a>&nbsp;</ul>
                            </div>
                        </div>
                    </nav>
                    <!-- End Header/Navigation -->
            </asp:Content>
<asp:Content ID="Content6" runat="server" contentplaceholderid="ContentPlaceHolder3">
    <footer class="footer-section">
        <div class="row g-5 mb-5">
            <div class="col-lg-4">
                <div class="mb-4 footer-logo-wrap">
                    <a href="#" class="footer-logo">Furni<span>.</span></a></div>
                <p class="mb-4">
                    Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique. Pellentesque habitant</p>
                <ul class="list-unstyled custom-social">
                    <li><a href="#"><span class="fa fa-brands fa-facebook-f"></span></a></li>
                    <li><a href="#"><span class="fa fa-brands fa-twitter"></span></a></li>
                    <li><a href="#"><span class="fa fa-brands fa-instagram"></span></a></li>
                    <li><a href="#"><span class="fa fa-brands fa-linkedin"></span></a></li>
                </ul>
            </div>
            <div class="col-lg-8">
                <div class="row links-wrap">
                    <div class="col-6 col-sm-6 col-md-3">
                        <ul class="list-unstyled">
                            <li><a href="#">About us</a></li>
                            <li><a href="#">Services</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Contact us</a></li>
                        </ul>
                    </div>
                    <div class="col-6 col-sm-6 col-md-3">
                        <ul class="list-unstyled">
                            <li><a href="#">Support</a></li>
                            <li><a href="#">Knowledge base</a></li>
                            <li><a href="#">Live chat</a></li>
                        </ul>
                    </div>
                    <div class="col-6 col-sm-6 col-md-3">
                        <ul class="list-unstyled">
                            <li><a href="#">Jobs</a></li>
                            <li><a href="#">Our team</a></li>
                            <li><a href="#">Leadership</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                        </ul>
                    </div>
                    <div class="col-6 col-sm-6 col-md-3">
                        <ul class="list-unstyled">
                            <li><a href="#">Nordic Chair</a></li>
                            <li><a href="#">Kruzo Aero</a></li>
                            <li><a href="#">Ergonomic Chair</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="border-top copyright">
            <div class="row pt-4">
                <div class="col-lg-6">
                    <p class="mb-2 text-center text-lg-start">
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script>. All Rights Reserved. &mdash; Designed with love by <a href="https://untree.co">Untree.co</a>
                                        <!-- License information: https://untree.co/license/ -->
                                    </p>
                </div>
                <div class="col-lg-6 text-center text-lg-end">
                    <ul class="list-unstyled d-inline-flex ms-auto">
                        <li class="me-4"><a href="#">Terms &amp; Conditions</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                    </ul>
                </div>
            </div>
        </div>

                    </div>
                </footer>
                <!-- End Footer Section -->


                <script src="js/bootstrap.bundle.min.js"></script>
                <script src="js/tiny-slider.js"></script>
                <script src="js/custom.js"></script>
</body>

</html>

</asp:Content>

