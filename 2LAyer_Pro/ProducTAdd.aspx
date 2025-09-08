<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProducTAdd.aspx.cs" Inherits="_2LAyer_Pro.ProducTAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
                <div class="form-box">
            <h2>Add Product</h2>
            <asp:Label ID="Label4" runat="server" Text="Product Name"></asp:Label><br />
            <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="rfvProductName" runat="server" ControlToValidate="txtProductName" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />

            <asp:Label ID="Label5" runat="server" Text="Product Image"></asp:Label><br />
            <asp:FileUpload ID="fuProductImage" runat="server" /><br />
            <asp:RequiredFieldValidator ID="rfvProductImage" runat="server" ControlToValidate="fuProductImage" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />

            <asp:Label ID="Label6" runat="server" Text="Product Details"></asp:Label><br />
            <asp:TextBox ID="txtProductDetails" runat="server"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="rfvProductDetails" runat="server" ControlToValidate="txtProductDetails" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />

            <asp:Label ID="Label7" runat="server" Text="Product Price"></asp:Label><br />
            <asp:TextBox ID="txtProductPrice" runat="server"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="rfvProductPrice" runat="server" ControlToValidate="txtProductPrice" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />

            <asp:Label ID="Label8" runat="server" Text="Product Stock"></asp:Label><br />
            <asp:TextBox ID="txtProductStock" runat="server"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="rfvProductStock" runat="server" ControlToValidate="txtProductStock" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />

            <asp:Label ID="Label9" runat="server" Text="Select Category"></asp:Label><br />
            <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList><br />
            <asp:RequiredFieldValidator ID="rfvCategorySelect" runat="server" ControlToValidate="ddlCategory" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />

            <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" OnClick="btnAddProduct_Click" />
            <br />
            <br />
            <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
        </div>
        <div>
        </div>
    </form>
</body>
</html>
