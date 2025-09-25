<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="_2LAyer_Pro.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .category-container {
            text-align: center;
            margin: 15px;
        }
        .category-container img {
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 5px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" RepeatDirection="Horizontal">
        <ItemTemplate>
            <asp:ImageButton 
                ID="ImageButton1" 
                runat="server" 
                Height="152px" 
                Width="143px"
                ImageUrl='<%# Eval("cat_disc") %>' 
                CommandName="SelectCategory" 
                CommandArgument='<%# Eval("Cat_id") %>' />
            <br />
            <asp:LinkButton 
                ID="LinkButton1" 
                runat="server" 
                Text='<%# Eval("Cat_Name") %>' 
                CommandName="SelectCategory" 
                CommandArgument='<%# Eval("Cat_id") %>' />
            <br />
            <aspLabel 
                ID="Label2" 
                runat="server" 
                Text='<%# Eval("cat_Image") %>'>
            </aspLabel>
        </ItemTemplate>
    </asp:DataList>

    <br />
    <a href="WebForm1.aspx"></a>
</asp:Content>
