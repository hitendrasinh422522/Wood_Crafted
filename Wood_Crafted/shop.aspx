<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="shop.aspx.cs" Inherits="Wood_Crafted.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Add animation CSS -->
    <style>
        /* Animation keyframes */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes float {
            0% {
                transform: translateY(0px);
            }

            50% {
                transform: translateY(-10px);
            }

            100% {
                transform: translateY(0px);
            }
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }

            50% {
                transform: scale(1.05);
            }

            100% {
                transform: scale(1);
            }
        }

        @keyframes addToCart {
            0% {
                transform: scale(1);
            }

            50% {
                transform: scale(1.2);
            }

            100% {
                transform: scale(1);
            }
        }

        /* Hero section animations */
        .hero {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            padding: 5rem 0;
            position: relative;
            overflow: hidden;
        }

            .hero::before {
                content: '';
                position: absolute;
                top: -50%;
                left: -50%;
                width: 200%;
                height: 200%;
                background: radial-gradient(circle, rgba(255,255,255,0.8) 0%, rgba(255,255,255,0) 60%);
                animation: pulse 15s infinite ease-in-out;
                z-index: 0;
            }

        .intro-excerpt {
            position: relative;
            z-index: 1;
        }

            .intro-excerpt h1 {
                font-size: 3.5rem;
                font-weight: 700;
                color: #2f2f2f;
                margin-bottom: 1rem;
                animation: fadeIn 1s ease-out;
            }

        /* Product card styling */
        .product-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            height: 100%;
            animation: fadeIn 0.8s ease-out;
            position: relative;
        }

            .product-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 15px 30px rgba(0,0,0,0.15);
            }

        .product-image {
            height: 220px;
            overflow: hidden;
            position: relative;
        }

            .product-image img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: transform 0.5s ease;
            }

        .product-card:hover .product-image img {
            transform: scale(1.1);
        }

        .product-info {
            padding: 1.5rem;
        }

        .product-name {
            font-size: 1.25rem;
            font-weight: 600;
            color: #2f2f2f;
            margin-bottom: 0.5rem;
        }

        .product-config {
            color: #6c757d;
            margin-bottom: 1rem;
            font-size: 0.9rem;
        }

        .product-price {
            font-size: 1.2rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 1rem;
        }

        .add-to-cart-btn {
            background: linear-gradient(135deg, #2ecc71, #27ae60);
            color: white;
            border: none;
            padding: 0.8rem 1.5rem;
            border-radius: 50px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            position: relative;
            overflow: hidden;
        }

            .add-to-cart-btn:hover {
                background: linear-gradient(135deg, #27ae60, #219653);
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(46, 204, 113, 0.3);
            }

            .add-to-cart-btn.adding {
                animation: addToCart 0.5s ease;
            }

        /* Cart counter */
        .cart-counter {
            position: absolute;
            top: -8px;
            right: -8px;
            background: #e74c3c;
            color: white;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            font-size: 0.8rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            animation: pulse 1s infinite;
        }

        /* DataList customization */
        .datalist-container {
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            padding: 2rem 0;
        }

            .datalist-container .item {
                background: none;
                border: none;
                width: calc(33.333% - 30px);
                margin-bottom: 30px;
            }

        /* Navigation buttons */
        .pagination-nav {
            display: flex;
            justify-content: center;
            padding: 2rem 0;
        }

        .page-btn {
            background: #2f2f2f;
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
            margin: 0 0.5rem;
            text-decoration: none;
            display: inline-block;
        }

            .page-btn:hover {
                background: #4f4f4f;
                transform: translateY(-3px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
                color: white;
                text-decoration: none;
            }

        /* Toast notification */
        .cart-toast {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: #2ecc71;
            color: white;
            padding: 1rem 1.5rem;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            z-index: 1000;
            transform: translateY(100px);
            opacity: 0;
            transition: all 0.3s ease;
        }

            .cart-toast.show {
                transform: translateY(0);
                opacity: 1;
            }

        /* Responsive adjustments */
        @media (max-width: 992px) {
            .datalist-container .item {
                width: calc(50% - 30px);
            }
        }

        @media (max-width: 768px) {
            .datalist-container .item {
                width: 100%;
                max-width: 400px;
            }

            .intro-excerpt h1 {
                font-size: 2.5rem;
            }
        }

        /* Animation for page load */
        .animate-on-load {
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.8s ease, transform 0.8s ease;
        }

        .loaded .animate-on-load {
            opacity: 1;
            transform: translateY(0);
        }
    </style>

</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
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
        <link href="css/style.css" rel="stylesheet">
        <title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co</title>
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
                        <li><a class="nav-link" href="cart.aspx">
                            <img src="images/cart.svg"></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- End Header/Navigation -->
</asp:Content>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-5">
                    <div class="intro-excerpt">
                        <h1 class="animate-on-load">Shop</h1>
                        <p class="animate-on-load" style="animation-delay: 0.2s;">Discover our handcrafted furniture collection</p>
                    </div>
                </div>
                <div class="col-lg-7"></div>
            </div>
        </div>
    </div>
    <!-- End Hero Section -->

    <form id="form1">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center mb-5">
                    <h2 class="animate-on-load" style="animation-delay: 0.4s;">Our Products</h2>
                </div>
            </div>

            <div class="datalist-container">
                <asp:DataList ID="DataList1" runat="server" CellPadding="10" RepeatDirection="Horizontal"
                    CellSpacing="50" OnItemCommand="DataList1_ItemCommand">
                    <ItemTemplate>
                        <div class="product-card animate-on-load">
                            <div class="product-image">
                                <asp:Image ID="Image1" runat="server" Height="100%" Width="100%" ImageUrl='<%# Eval("Prod_Image") %>' />
                            </div>
                            <div class="product-info">
                                <h3 class="product-name">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Prod_Name") %>'></asp:Label>
                                </h3>
                                <p class="product-config">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Prod_Config") %>'></asp:Label>
                                </p>
                                <div class="product-price">
                                    ₹<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Prod_Price", "{0:0.00}") %>'></asp:Label>
                                </div>
                                <asp:LinkButton ID="btnAddToCart" runat="server" CssClass="add-to-cart-btn"
                                    CommandName="AddToCart" CommandArgument='<%# Eval("Id") %>'>
                                    Add to Cart
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnView" runat="server" CssClass="add-to-cart-btn"
                                    CommandName="cmd_view" CommandArgument='<%# Eval("Id") %>'>
                                    View Detail
                                </asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>

            <div class="pagination-nav animate-on-load" style="animation-delay: 0.8s;">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="page-btn">Previous</asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" CssClass="page-btn">Next</asp:LinkButton>
            </div>
        </div>
    </form>

    <!-- Toast Notification -->
    <div class="cart-toast" id="cartToast" runat="server" visible="false">
        <i class="fas fa-check-circle"></i>Product added to cart!
    </div>


    <script>
        // Add loaded class to body to trigger animations
        document.addEventListener('DOMContentLoaded', function () {
            document.body.classList.add('loaded');
        });
    </script>
</asp:Content>


<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- Footer content remains the same -->
    <footer class="footer-section">
        <div class="container relative">

            <div class="row g-5 mb-5">
                <div class="col-lg-4">
                    <div class="mb-4 footer-logo-wrap">
                        <a href="#" class="footer-logo">Furni<span>.</span></a>
                    </div>
                    <p class="mb-4">
                        Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique. Pellentesque habitant
                    </p>
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
