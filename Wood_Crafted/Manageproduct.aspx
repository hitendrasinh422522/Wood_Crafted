<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Manageproduct.aspx.cs" Inherits="Wood_Crafted.WebForm12" %>

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

        @keyframes slideInRight {
            from {
                transform: translateX(50px);
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
                transform: scale(1.03);
            }

            100% {
                transform: scale(1);
            }
        }

        @keyframes rowHighlight {
            0% {
                background-color: transparent;
            }

            50% {
                background-color: rgba(46, 204, 113, 0.2);
            }

            100% {
                background-color: transparent;
            }
        }

        @keyframes shake {
            0%, 100% {
                transform: translateX(0);
            }

            25% {
                transform: translateX(-5px);
            }

            75% {
                transform: translateX(5px);
            }
        }

        /* GridView Styling */
        #MainContent_GridView1 {
            width: 100%;
            border-collapse: collapse;
            border: none;
            margin: 20px 0;
            animation: slideInRight 0.8s ease-out;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.08);
            border-radius: 12px;
            overflow: hidden;
        }

            #MainContent_GridView1 th {
                background: linear-gradient(135deg, #2c3e50, #34495e);
                color: white;
                padding: 1rem;
                text-align: left;
                font-weight: 600;
                border: none;
                position: sticky;
                top: 0;
                animation: fadeIn 0.6s ease-out;
            }

            #MainContent_GridView1 td {
                padding: 1rem;
                border-bottom: 1px solid #f1f1f1;
                transition: all 0.3s ease;
                animation: fadeIn 0.5s ease-out;
            }

            #MainContent_GridView1 tr {
                background-color: white;
            }

                #MainContent_GridView1 tr:nth-child(even) {
                    background-color: #f9f9f9;
                }

                #MainContent_GridView1 tr:hover td {
                    background-color: #f0f7ff;
                    transform: translateX(5px);
                }

                #MainContent_GridView1 tr.highlight {
                    animation: rowHighlight 1.5s ease;
                }

            /* Image Styling */
            #MainContent_GridView1 img {
                width: 50px;
                height: 50px;
                object-fit: cover;
                border-radius: 6px;
                transition: all 0.3s ease;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            }

                #MainContent_GridView1 img:hover {
                    transform: scale(2.5);
                    z-index: 100;
                    box-shadow: 0 5px 20px rgba(0,0,0,0.2);
                }

            /* Action Buttons */
            #MainContent_GridView1 a {
                padding: 0.5rem 1rem;
                border: none;
                border-radius: 6px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s ease;
                text-decoration: none;
                display: inline-block;
                text-align: center;
                min-width: 80px;
                margin: 0 5px;
            }

                #MainContent_GridView1 a[commandname="cmd_edt"] {
                    background: linear-gradient(135deg, #3498db, #2980b9);
                    color: white;
                }

                    #MainContent_GridView1 a[commandname="cmd_edt"]:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
                    }

                #MainContent_GridView1 a[commandname="cmd_dlt"] {
                    background: linear-gradient(135deg, #e74c3c, #c0392b);
                    color: white;
                }

                    #MainContent_GridView1 a[commandname="cmd_dlt"]:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 5px 15px rgba(231, 76, 60, 0.3);
                        animation: shake 0.5s ease;
                    }

        /* Edit Panel */
        #MainContent_Panel1 {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.08);
            margin-top: 2rem;
            animation: fadeIn 0.6s ease-out;
        }

            #MainContent_Panel1 table {
                width: 100%;
                border-collapse: collapse;
                animation: fadeIn 0.8s ease-out;
            }

            #MainContent_Panel1 td {
                padding: 1rem 0.5rem;
                animation: fadeIn 0.6s ease-out;
            }

                #MainContent_Panel1 td:first-child {
                    font-weight: 600;
                    color: #2c3e50;
                    width: 200px;
                }

        /* Form Controls */
        #MainContent_txtpnm,
        #MainContent_txtprice,
        #MainContent_txtpconfig {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 2px solid #e6e6e6;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

            #MainContent_txtpnm:focus,
            #MainContent_txtprice:focus,
            #MainContent_txtpconfig:focus {
                border-color: #3498db;
                box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
                outline: none;
                transform: translateY(-2px);
            }

        #MainContent_drpdwn {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 2px solid #e6e6e6;
            border-radius: 8px;
            font-size: 1rem;
            background: white;
            transition: all 0.3s ease;
        }

            #MainContent_drpdwn:focus {
                border-color: #3498db;
                box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
                outline: none;
            }

        #MainContent_flpimg {
            width: 100%;
            padding: 0.8rem;
            border: 2px dashed #ccc;
            border-radius: 8px;
            transition: all 0.3s ease;
            background: #f9f9f9;
        }

            #MainContent_flpimg:hover {
                border-color: #3498db;
                background: #eef7ff;
            }

        /* Update Button */
        #MainContent_Button1 {
            background: linear-gradient(135deg, #2ecc71, #27ae60);
            color: white;
            border: none;
            padding: 0.8rem 2rem;
            border-radius: 50px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: block;
            margin: 1.5rem auto 0;
            min-width: 150px;
            animation: fadeIn 1s ease-out;
        }

            #MainContent_Button1:hover {
                transform: translateY(-3px);
                box-shadow: 0 10px 20px rgba(46, 204, 113, 0.3);
                animation: pulse 1s infinite;
            }

        /* Empty State */
        #MainContent_GridView1 tr:only-child td {
            text-align: center;
            padding: 3rem;
            color: #7f8c8d;
            animation: fadeIn 0.8s ease-out;
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            #MainContent_GridView1 {
                overflow-x: auto;
                display: block;
            }
        }

        @media (max-width: 768px) {
            #MainContent_Panel1 td {
                display: block;
                width: 100%;
                padding: 0.5rem 0;
            }

                #MainContent_Panel1 td:first-child {
                    width: 100%;
                    padding-bottom: 0.25rem;
                }

            #MainContent_GridView1 {
                font-size: 0.9rem;
            }

                #MainContent_GridView1 a {
                    padding: 0.4rem 0.8rem;
                    min-width: 70px;
                    font-size: 0.9rem;
                }
        }

        /* Confirmation Dialog Style */
        .delete-confirm {
            animation: shake 0.5s ease;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="Id">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Comp_Name">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Comp_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Prod_Name">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Prod_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Prod_Config">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Prod_Config") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Prod_Price">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Prod_Price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Prod_Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="36px" ImageUrl='<%# Eval("Prod_Image") %>' Width="34px" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt" OnClick="LinkButton1_Click">Edit</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Panel ID="Panel1" runat="server" Visible="false">
        <table style="margin-top: 20px;">
            <tr>
                <td>Company Name:</td>
                <td>
                    <asp:DropDownList ID="drpdwn" runat="server" OnSelectedIndexChanged="drpdwn_SelectedIndexChanged">
                        <asp:ListItem>--Select Company--</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Product Name:</td>
                <td>
                    <asp:TextBox ID="txtpnm" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Product Configuration:</td>
                <td>
                    <asp:TextBox ID="txtpconfig" runat="server"></asp:TextBox>
                </td>
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
                    <asp:FileUpload ID="flpimg" runat="server" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>

    </asp:Panel>
</asp:Content>
