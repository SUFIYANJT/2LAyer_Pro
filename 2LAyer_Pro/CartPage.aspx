<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="_2LAyer_Pro.CartPage"EnableEventValidation="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shopping Cart</title>
    <style>
        body { 
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        .cart-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 20px;
        }

        .cart-item {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            padding: 15px;
            text-align: center;
            transition: 0.3s;
        }

        .cart-item:hover {
            transform: scale(1.03);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .cart-item img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }

        .cart-item a {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #007bff;
            text-decoration: none;
        }

        .cart-item a:hover {
            text-decoration: underline;
        }

        .cart-item .price {
            display: block;
            margin-top: 8px;
            color: #28a745;
            font-size: 18px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="cart-container">
            <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow" OnItemCommand="DataList1_ItemCommand">
                <ItemTemplate>
                    <div class="cart-item">
<asp:ImageButton 
    ID="ImageButton1" 
    runat="server" 
    Height="152px" 
    Width="143px"
    ImageUrl='<%# Eval("Product_Image") %>' 
    CommandName="SelectProduct" 
    CommandArgument='<%# Eval("Product_Id") %>' />

<asp:LinkButton 
    ID="LinkButton1" 
    runat="server" 
    Text='<%# Eval("Product_Name") %>' 
    CommandName="SelectProduct" 
    CommandArgument='<%# Eval("Product_Id") %>' />
                        <asp:Label 
                            ID="Label2" 
                            runat="server" 
                            CssClass="price"
                            Text='<%# "$" + Eval("Product_Price") %>'
                              CommandName="SelectProduct" >
                        </asp:Label>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
</body>
</html>
