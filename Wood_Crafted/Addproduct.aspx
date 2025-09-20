<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Addproduct.aspx.cs" Inherits="Wood_Crafted.Addproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Animation Keyframes */
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

        @keyframes slideIn {
            from {
                transform: translateX(-20px);
                opacity: 0;
            }

            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }

            50% {
                transform: scale(1.02);
            }

            100% {
                transform: scale(1);
            }
        }

        @keyframes shimmer {
            0% {
                background-position: -200px 0;
            }

            100% {
                background-position: 200px 0;
            }
        }

        /* Form Container */
        #MainContent_form1 {
            max-width: 600px;
            margin: 2rem auto;
            padding: 2rem;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            animation: fadeIn 0.8s ease-out;
        }

            /* Title Styling */
            #MainContent_form1 h1 {
                text-align: center;
                color: #2c3e50;
                margin-bottom: 2rem;
                font-weight: 700;
                position: relative;
                padding-bottom: 0.5rem;
                animation: slideIn 0.6s ease-out;
            }

                #MainContent_form1 h1:after {
                    content: '';
                    position: absolute;
                    bottom: 0;
                    left: 50%;
                    transform: translateX(-50%);
                    width: 80px;
                    height: 4px;
                    background: linear-gradient(90deg, #3498db, #2ecc71);
                    border-radius: 2px;
                }

            /* Table Styling */
            #MainContent_form1 table {
                width: 100%;
                border-collapse: collapse;
                margin: 0 auto;
            }

            #MainContent_form1 tr {
                animation: fadeIn 0.6s ease-out;
            }

                #MainContent_form1 tr:nth-child(1) {
                    animation-delay: 0.1s;
                }

                #MainContent_form1 tr:nth-child(2) {
                    animation-delay: 0.2s;
                }

                #MainContent_form1 tr:nth-child(3) {
                    animation-delay: 0.3s;
                }

                #MainContent_form1 tr:nth-child(4) {
                    animation-delay: 0.4s;
                }

                #MainContent_form1 tr:nth-child(5) {
                    animation-delay: 0.5s;
                }

            #MainContent_form1 td {
                padding: 1rem 0.5rem;
                vertical-align: middle;
            }

                /* Label Styling */
                #MainContent_form1 td:first-child {
                    font-weight: 600;
                    color: #34495e;
                    text-align: right;
                    padding-right: 1rem;
                    width: 40%;
                }

        /* Input and Dropdown Styling */
        #MainContent_txtpnm,
          #MainContent_txtprice,
        #MainContent_txtpconfig {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 2px solid #e6e6e6;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: #f9f9f9;
        }

            #MainContent_txtpnm:focus,
               #MainContent_txtprice:focus,
            #MainContent_txtpconfig:focus {
                border-color: #3498db;
                box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
                outline: none;
                background: white;
                transform: translateY(-2px);
            }

        /* Dropdown Styling */
        #MainContent_drpdwn {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 2px solid #e6e6e6;
            border-radius: 8px;
            font-size: 1rem;
            background: #f9f9f9;
            transition: all 0.3s ease;
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%23333' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            background-size: 1em;
        }

            #MainContent_drpdwn:focus {
                border-color: #3498db;
                box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
                outline: none;
                background-color: white;
            }

        /* File Upload Styling */
        #MainContent_flpimg {
            width: 100%;
            padding: 0.8rem;
            border: 2px dashed #ccc;
            border-radius: 8px;
            background: #f9f9f9;
            transition: all 0.3s ease;
            box-sizing: border-box;
        }

            #MainContent_flpimg:hover {
                border-color: #3498db;
                background: #eef7ff;
            }

        /* Button Styling */
        #MainContent_Button1 {
            background: linear-gradient(135deg, #3498db, #2ecc71);
            color: white;
            border: none;
            padding: 0.8rem 2rem;
            border-radius: 50px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: block;
            margin: 1.5rem auto 0;
            width: 200px;
            position: relative;
            overflow: hidden;
        }

            #MainContent_Button1:hover {
                transform: translateY(-3px);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
                animation: pulse 1s infinite;
            }

            #MainContent_Button1:active {
                transform: translateY(0);
            }

            #MainContent_Button1:before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
                transition: 0.5s;
            }

            #MainContent_Button1:hover:before {
                left: 100%;
            }

        /* Responsive Design */
        @media (max-width: 768px) {
            #MainContent_form1 {
                margin: 1rem;
                padding: 1.5rem;
            }

                #MainContent_form1 td:first-child {
                    width: 100%;
                    text-align: left;
                    padding-right: 0;
                    padding-bottom: 0.5rem;
                }

                #MainContent_form1 td {
                    display: block;
                    width: 100%;
                    padding: 0.5rem 0;
                }
        }

        /* Loading animation for button when submitting */
        #MainContent_Button1.loading {
            position: relative;
            color: transparent;
        }

            #MainContent_Button1.loading:after {
                content: "";
                position: absolute;
                width: 20px;
                height: 20px;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                margin: auto;
                border: 4px solid transparent;
                border-top-color: #ffffff;
                border-radius: 50%;
                animation: button-loading-spinner 1s ease infinite;
            }

        @keyframes button-loading-spinner {
            from {
                transform: rotate(0turn);
            }

            to {
                transform: rotate(1turn);
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <body>
        <form id="form1">
            <div>
                <center>
                    <h1>Add Product</h1>
                    <table>
                        <tr>
                            <td>Company Name:</td>
                            <td>
                                <asp:DropDownList ID="drpdwn" runat="server" OnSelectedIndexChanged="drpdwn_SelectedIndexChanged">
                                    <asp:ListItem>--Select Company--</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>Product Name:</td>
                            <td>
                                <asp:TextBox ID="txtpnm" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Product Configuration:</td>
                            <td>
                                <asp:TextBox ID="txtpconfig" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Price:</td>
                            <td>
                                <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Image:</td>
                            <td>
                                <asp:FileUpload ID="flpimg" runat="server" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" /></td>
                        </tr>
                    </table>
                </center>
            </div>
        </form>
    </body>
    </html>
</asp:Content>
