<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="_2LAyer_Pro.Orders" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Orders</title>
    <style>
        body {
            font-family: Arial;
            margin: 30px;
            background-color: #f4f4f4;
        }

        h2 {
            color: #333;
        }

        .order-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .order-table th, .order-table td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        .order-table th {
            background-color: #0078d7;
            color: white;
        }

        .order-table tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Your Orders</h2>
        <asp:GridView ID="GridViewOrders" runat="server" AutoGenerateColumns="False" CssClass="order-table">
            <Columns>
                <asp:BoundField DataField="Order_ID" HeaderText="Order ID" />
                <asp:BoundField DataField="Order_Date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:BoundField DataField="Total_Amount" HeaderText="Total (₹)" />
                <asp:BoundField DataField="Order_Status" HeaderText="Status" />
                <asp:BoundField DataField="Payment_Method" HeaderText="Payment" />
                <asp:BoundField DataField="Tracking_Number" HeaderText="Tracking No" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
