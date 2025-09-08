<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="_2LAyer_Pro.CartPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand">
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
        </div>
    </form>
</body>
</html>
