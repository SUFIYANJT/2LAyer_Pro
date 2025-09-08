<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Dash.aspx.cs" Inherits="_2LAyer_Pro.WebForm2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .form-box {
            border: 1px solid #ccc;
            padding: 20px;
            margin: 15px 0;
            width: 500px;
        }
        h2 {
            margin-top: 0;
            color: darkblue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Category Form -->
        <div class="form-box">
            <h2>Add Category</h2>
            <asp:Label ID="Label1" runat="server" Text="Category Name"></asp:Label><br />
            <asp:TextBox ID="txtCategoryName" runat="server"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="rfvCategoryName" runat="server" 
                ControlToValidate="txtCategoryName" 
                ErrorMessage="Required Field" ForeColor="Red">
            </asp:RequiredFieldValidator><br /><br />

            <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label><br />
            <asp:TextBox ID="txtCategoryDesc" runat="server"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="rfvCategoryDesc" runat="server" 
                ControlToValidate="txtCategoryDesc" 
                ErrorMessage="Required Field" ForeColor="Red">
            </asp:RequiredFieldValidator><br /><br />

            <asp:Label ID="Label3" runat="server" Text="Photo"></asp:Label><br />
            <asp:FileUpload ID="fuCategoryImage" runat="server" /><br />
           
           
            <asp:LinkButton ID="LinkButton1" runat="server" 
                OnClick="LinkButton1_Click" 
                CausesValidation="False">
                Go to Product Page
            </asp:LinkButton>
            <br /><br />

           
            <asp:Button ID="btnAddCategory" runat="server" 
                Text="Add Category" 
                OnClick="btnAddCategory_Click" />
            <br /><br />

            <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
