<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="_2LAyer_Pro.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 208px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand">
    <ItemTemplate>
        <asp:ImageButton 
            ID="ImageButton1" 
            runat="server" 
            Height="152px" 
            Width="143px"
            ImageUrl='<%# Eval("cat_Image") %>' 
            CommandName="SelectCategory" 
            CommandArgument='<%# Eval("Cat_id") %>' />
        <br />
        <asp:LinkButton 
            ID="LinkButton1" 
            runat="server" 
            Text='<%# Eval("Cat_name") %>' 
            CommandName="SelectCategory" 
            CommandArgument='<%# Eval("Cat_id") %>' />
        <br />
     
    </ItemTemplate>
</asp:DataList>


</asp:Content>
