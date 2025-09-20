<%@ Page Title="Message Management" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="Wood_Crafted.Message" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       .message-container {
    padding: 20px;
    background-color: #f8f9fa;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    margin: 20px 0;
}

.grid-view {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.grid-view th {
    background-color: #4a6f8a;
    color: white;
    padding: 12px;
    text-align: left;
}

.grid-view td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

.grid-view tr:nth-child(even) {
    background-color: #f2f2f2;
}

.grid-view tr:hover {
    background-color: #e9ecef;
}

.btn-view {
    background-color: #17a2b8;
    color: white;
    border: none;
    padding: 5px 10px;
    border-radius: 4px;
    cursor: pointer;
}

.btn-delete {
    background-color: #dc3545;
    color: white;
    border: none;
    padding: 5px 10px;
    border-radius: 4px;
    cursor: pointer;
}

.btn-view:hover {
    background-color: #138496;
}

.btn-delete:hover {
    background-color: #c82333;
}

.message-details {
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    margin-top: 20px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.message-header {
    background-color: #4a6f8a;
    color: white;
    padding: 15px;
    border-radius: 5px 5px 0 0;
    margin: -20px -20px 20px -20px;
}

.no-messages {
    text-align: center;
    padding: 30px;
    color: #6c757d;
    font-style: italic;
}

.filters {
    display: flex;
    gap: 15px;
    margin-bottom: 20px;
    flex-wrap: wrap;
}

.filter-item {
    display: flex;
    flex-direction: column;
}

.filter-item label {
    font-weight: bold;
    margin-bottom: 5px;
    color: #495057;
}
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="message-container">
        <h2>Contact Message Management</h2>
   
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="Id">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FirstName">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LastName">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Message">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Message") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

      
</asp:Content>