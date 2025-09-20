<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="Wood_Crafted.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* === Category Page Styling === */
        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f8f9fa;
            margin: 0;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
            font-weight: bold;
        }

        /* Full center wrapper */
        .center-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 85vh; /* use full screen height (minus header/footer of master) */
        }

        /* Box design */
        .category-box {
            background: #fff;
            border-radius: 12px;
            padding: 25px;
            width: 400px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
            text-align: center;
        }

        .category-box table {
            width: 100%;
            border: none;
        }

        .category-box td {
            padding: 12px;
            font-size: 16px;
        }

        /* Textbox styling */
        .category-box input[type="text"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            transition: 0.3s;
        }

        .category-box input[type="text"]:focus {
            border-color: #0d6efd;
            box-shadow: 0 0 5px rgba(13, 110, 253, 0.3);
            outline: none;
        }

        /* Button styling */
        .category-box .aspNetButton {
            background: #0d6efd;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease;
            font-size: 16px;
        }

        .category-box .aspNetButton:hover {
            background: #0b5ed7;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="center-wrapper">
        <div class="category-box">
            <h2>Add Category</h2>
            <table>
                <tr>
                    <td>Name:</td>
                    <td>
                        <asp:TextBox ID="txtnm" runat="server" placeholder="Enter Category Name"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Add" CssClass="aspNetButton" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
