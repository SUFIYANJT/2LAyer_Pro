<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductbuyPage.aspx.cs" Inherits="_2LAyer_Pro.ProductbuyPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 40px auto;
            background: #fff;
            padding: 20px 30px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        .auto-style1 {
            width: 100%;
            border-collapse: collapse;
        }
        .auto-style1 td {
            padding: 12px;
            vertical-align: top;
        }
        .product-title {
            font-size: 22px;
            font-weight: bold;
            color: #333;
        }
        .product-desc {
            font-size: 15px;
            color: #666;
        }
        .product-price {
            font-size: 20px;
            font-weight: bold;
            color: #e63946;
        }
        .quantity-box {
            padding: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
            width: 70px;
        }
        .btn-add {
            background: #007acc;
            color: #fff;
            border: none;
            padding: 10px 18px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn-add:hover {
            background: #005fa3;
        }
        .error-msg {
            font-size: 13px;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td rowspan="4" style="width:260px">
                        <asp:Image ID="Image1" runat="server" Height="300px" Width="230px" />
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" CssClass="product-title" Text="Product Name"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" CssClass="product-desc" Text="Product Description"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" CssClass="product-price" Text="₹999"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Quantity:" />
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="quantity-box" TextMode="Number" />
                        <asp:RangeValidator ID="RangeValidator1" runat="server" 
                            ControlToValidate="TextBox1" 
                            ErrorMessage="Enter between 1 and 10" 
                            CssClass="error-msg"
                            ForeColor="Red" MaximumValue="10" MinimumValue="1"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-top:20px;">
                        <asp:Button ID="Button1" runat="server" CssClass="btn-add" Text="BUY NOW" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
