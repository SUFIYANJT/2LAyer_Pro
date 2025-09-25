<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product1.aspx.cs" Inherits="_2LAyer_Pro.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" RepeatDirection="Horizontal">
    <ItemTemplate>
        <asp:ImageButton 
            ID="ImageButton1" 
            runat="server" 
            Height="152px" 
            Width="143px"
            ImageUrl='<%# Eval("Product_Image") %>' 
            CommandName="SelectProduct" 
            CommandArgument='<%# Eval("Product_id") %>' />
        <br />
        <asp:LinkButton 
            ID="LinkButton1" 
            runat="server" 
            Text='<%# Eval("Product_name") %>' 
            CommandName="SelectProduct" 
            CommandArgument='<%# Eval("Product_id") %>' />
        <br />
        <asp:Label 
            ID="Label2" 
            runat="server" 
            Text='<%# Eval("Product_Price") %>'>
        </asp:Label>
    </ItemTemplate>
</asp:DataList>

</asp:Content>
