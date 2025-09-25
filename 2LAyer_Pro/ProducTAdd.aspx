<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProducTAdd.aspx.cs" Inherits="_2LAyer_Pro.ProducTAdd" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Management</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px;
            overflow-x: auto;
        }

        /* Animated background particles */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="20" cy="20" r="2" fill="rgba(255,255,255,0.1)"/><circle cx="80" cy="40" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="40" cy="80" r="1.5" fill="rgba(255,255,255,0.1)"/><circle cx="90" cy="10" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="10" cy="90" r="2" fill="rgba(255,255,255,0.1)"/></svg>') repeat;
            animation: float 20s infinite linear;
            pointer-events: none;
            z-index: -1;
        }

        @keyframes float {
            0% { transform: translateY(0px) rotate(0deg); }
            100% { transform: translateY(-100px) rotate(360deg); }
        }

        .dashboard-container {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1fr;
            gap: 30px;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 
                0 25px 45px rgba(0, 0, 0, 0.1),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: #fff;
            position: relative;
            overflow: hidden;
            animation: glow 4s ease-in-out infinite alternate;
        }

        .glass-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            transition: left 0.5s;
        }

        .glass-card:hover::before {
            left: 100%;
        }

        @keyframes glow {
            from {
                box-shadow: 
                    0 25px 45px rgba(0, 0, 0, 0.1),
                    inset 0 1px 0 rgba(255, 255, 255, 0.2),
                    0 0 20px rgba(255, 255, 255, 0.05);
            }
            to {
                box-shadow: 
                    0 25px 45px rgba(0, 0, 0, 0.1),
                    inset 0 1px 0 rgba(255, 255, 255, 0.2),
                    0 0 30px rgba(255, 255, 255, 0.1);
            }
        }

        .dashboard-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .dashboard-title {
            font-size: 32px;
            font-weight: 700;
            background: linear-gradient(45deg, #fff, #f0f8ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
            margin-bottom: 10px;
        }

        .dashboard-subtitle {
            font-size: 16px;
            color: rgba(255, 255, 255, 0.8);
            font-weight: 300;
        }

        .form-section h2 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 20px;
            color: #fff;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
            border-bottom: 2px solid rgba(255, 255, 255, 0.2);
            padding-bottom: 10px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .form-group label {
            font-weight: 600;
            margin-bottom: 8px;
            color: rgba(255, 255, 255, 0.9);
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
        }

        input[type="text"], 
        input[type="file"],
        select {
            padding: 12px 16px;
            border-radius: 10px;
            border: 2px solid rgba(255, 255, 255, 0.2);
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            font-size: 14px;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }

        input[type="text"]:focus,
        select:focus {
            outline: none;
            border-color: rgba(255, 255, 255, 0.4);
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
            transform: translateY(-2px);
        }

        select {
            cursor: pointer;
        }

        select option {
            background: #444;
            color: #fff;
        }

        input[type="file"] {
            padding: 10px;
            cursor: pointer;
        }

        input::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }

        .btn {
            padding: 12px 24px;
            border-radius: 10px;
            border: none;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-primary {
            background: linear-gradient(45deg, #1cc88a, #17a673);
            color: #fff;
            box-shadow: 0 4px 15px rgba(28, 200, 138, 0.3);
        }

        .btn-primary:hover {
            background: linear-gradient(45deg, #17a673, #13855c);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(28, 200, 138, 0.4);
        }

        .btn-secondary {
            background: linear-gradient(45deg, #667eea, #5a67d8);
            color: #fff;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }

        .btn-secondary:hover {
            background: linear-gradient(45deg, #5a67d8, #4c51bf);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }

        .form-actions {
            display: flex;
            gap: 15px;
            justify-content: flex-end;
            align-items: center;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .status-message {
            padding: 10px 15px;
            border-radius: 8px;
            margin-top: 15px;
            font-weight: 500;
            background: rgba(28, 200, 138, 0.1);
            border: 1px solid rgba(28, 200, 138, 0.3);
            color: #1cc88a;
        }

        /* Validation message styling */
        span[style*="color:Red"] {
            color: #ff6b6b !important;
            font-size: 12px;
            font-weight: 500;
            display: block;
            margin-top: 5px;
            background: rgba(255, 107, 107, 0.1);
            padding: 5px 10px;
            border-radius: 6px;
            border-left: 3px solid #ff6b6b;
        }

        /* GridView Styling */
        .grid-container {
            margin-top: 20px;
        }

        .grid-container h2 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 20px;
            color: #fff;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
        }

        .gridview-wrapper {
            overflow-x: auto;
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: transparent;
        }

        th {
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            font-weight: 600;
            padding: 15px 12px;
            text-align: left;
            border-bottom: 2px solid rgba(255, 255, 255, 0.2);
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            color: rgba(255, 255, 255, 0.9);
            font-size: 14px;
        }

        tr:hover {
            background: rgba(255, 255, 255, 0.05);
        }

        .product-image {
            border-radius: 8px;
            object-fit: cover;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        /* Edit mode styling */
        .edit-input {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 6px;
            padding: 8px 10px;
            color: #fff;
            width: 100%;
            font-size: 13px;
        }

        .edit-input:focus {
            outline: none;
            border-color: rgba(255, 255, 255, 0.5);
            background: rgba(255, 255, 255, 0.15);
        }

        .edit-select {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 6px;
            padding: 8px 10px;
            color: #fff;
            width: 100%;
            font-size: 13px;
        }

        .edit-select option {
            background: #444;
            color: #fff;
        }

        /* Action buttons in grid */
        .grid-action-btn {
            padding: 6px 12px;
            border-radius: 6px;
            border: none;
            font-size: 12px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            color: #fff;
            margin-right: 5px;
        }

        .edit-btn {
            background: linear-gradient(45deg, #667eea, #5a67d8);
        }

        .edit-btn:hover {
            background: linear-gradient(45deg, #5a67d8, #4c51bf);
            transform: translateY(-1px);
        }

        .update-btn {
            background: linear-gradient(45deg, #1cc88a, #17a673);
        }

        .update-btn:hover {
            background: linear-gradient(45deg, #17a673, #13855c);
            transform: translateY(-1px);
        }

        .cancel-btn {
            background: linear-gradient(45deg, #ff6b6b, #e74c3c);
        }

        .cancel-btn:hover {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            transform: translateY(-1px);
        }

        .delete-btn {
            background: linear-gradient(45deg, #ff4757, #ff3742);
        }

        .delete-btn:hover {
            background: linear-gradient(45deg, #ff3742, #ff2632);
            transform: translateY(-1px);
        }

        /* Price formatting */
        .price-cell {
            font-weight: 600;
            color: #1cc88a;
        }

        .stock-cell {
            font-weight: 600;
        }

        .stock-low {
            color: #ff6b6b;
        }

        .stock-medium {
            color: #feca57;
        }

        .stock-high {
            color: #1cc88a;
        }

        /* Navigation */
        .nav-link {
            background: linear-gradient(45deg, #764ba2, #667eea);
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .nav-link:hover {
            background: linear-gradient(45deg, #667eea, #764ba2);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(118, 75, 162, 0.3);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
                gap: 15px;
            }
            
            .form-actions {
                flex-direction: column;
                align-items: stretch;
            }
            
            .btn {
                width: 100%;
                margin-bottom: 10px;
            }
            
            .glass-card {
                padding: 20px;
            }
            
            .dashboard-title {
                font-size: 24px;
            }
        }

        @media (max-width: 480px) {
            .dashboard-container {
                padding: 10px;
            }
            
            th, td {
                padding: 8px 6px;
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <!-- Dashboard Header -->
            <div class="dashboard-header">
                <h1 class="dashboard-title">Product Management</h1>
                <p class="dashboard-subtitle">Add and manage your product inventory</p>
            </div>

            <!-- Add Product Section -->
            <div class="glass-card form-section">
                <h2>Add New Product</h2>
                
                <div class="form-grid">
                    <div class="form-group">
                        <label>
                            <asp:Label ID="Label4" runat="server" Text="Product Name"></asp:Label>
                        </label>
                        <asp:TextBox ID="txtProductName" runat="server" placeholder="Enter product name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvProductName" runat="server" 
                            ControlToValidate="txtProductName" 
                            ErrorMessage="Product name is required" ForeColor="Red"
                            ValidationGroup="AddProduct">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label>
                            <asp:Label ID="Label5" runat="server" Text="Product Image"></asp:Label>
                        </label>
                        <asp:FileUpload ID="fuProductImage" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvProductImage" runat="server" 
                            ControlToValidate="fuProductImage" 
                            ErrorMessage="Product image is required" ForeColor="Red"
                            ValidationGroup="AddProduct">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label>
                            <asp:Label ID="Label7" runat="server" Text="Product Price"></asp:Label>
                        </label>
                        <asp:TextBox ID="txtProductPrice" runat="server" placeholder="Enter price"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvProductPrice" runat="server" 
                            ControlToValidate="txtProductPrice" 
                            ErrorMessage="Product price is required" ForeColor="Red"
                            ValidationGroup="AddProduct">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label>
                            <asp:Label ID="Label8" runat="server" Text="Product Stock"></asp:Label>
                        </label>
                        <asp:TextBox ID="txtProductStock" runat="server" placeholder="Enter stock quantity"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvProductStock" runat="server" 
                            ControlToValidate="txtProductStock" 
                            ErrorMessage="Product stock is required" ForeColor="Red"
                            ValidationGroup="AddProduct">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label>
                            <asp:Label ID="Label9" runat="server" Text="Select Category"></asp:Label>
                        </label>
                        <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCategorySelect" runat="server" 
                            ControlToValidate="ddlCategory" 
                            ErrorMessage="Please select a category" ForeColor="Red"
                            ValidationGroup="AddProduct">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group full-width">
                        <label>
                            <asp:Label ID="Label6" runat="server" Text="Product Details"></asp:Label>
                        </label>
                        <asp:TextBox ID="txtProductDetails" runat="server" placeholder="Enter product description"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvProductDetails" runat="server" 
                            ControlToValidate="txtProductDetails" 
                            ErrorMessage="Product details are required" ForeColor="Red"
                            ValidationGroup="AddProduct">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-actions">
                    <a href="Admin_Dash.aspx" class="nav-link">Back to Dashboard</a>
                    <asp:Button ID="btnAddProduct" runat="server" 
                        Text="Add Product" 
                        OnClick="btnAddProduct_Click"
                        ValidationGroup="AddProduct"
                        CssClass="btn btn-primary" />
                </div>

                <asp:Label ID="Label11" runat="server" Text="" CssClass="status-message" Visible="false"></asp:Label>
            </div>

            <!-- Products Grid Section -->
            <div class="glass-card grid-container">
                <h2>Manage Products</h2>
                
                <div class="gridview-wrapper">
                    <asp:GridView ID="GridView1" runat="server"
                        AutoGenerateColumns="False"
                        CausesValidation="False"
                        DataKeyNames="Product_Id"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit"
                        OnRowEditing="GridView1_RowEditing"
                        OnRowUpdating="GridView1_RowUpdating"
                        GridLines="None"
                        CssClass="modern-grid">

                        <Columns>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="EditBtn" runat="server" 
                                                    CommandName="Edit" 
                                                    CssClass="grid-action-btn edit-btn"
                                                    CausesValidation="False">
                                        Edit
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="DeleteBtn" runat="server" 
                                                    CommandName="Delete" 
                                                    CssClass="grid-action-btn delete-btn"
                                                    CausesValidation="False"
                                                    OnClientClick="return confirm('Are you sure you want to delete this product?');">
                                        Delete
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="UpdateBtn" runat="server" 
                                                    CommandName="Update" 
                                                    CssClass="grid-action-btn update-btn">
                                        Update
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="CancelBtn" runat="server" 
                                                    CommandName="Cancel" 
                                                    CssClass="grid-action-btn cancel-btn"
                                                    CausesValidation="False">
                                        Cancel
                                    </asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ID="imgProduct" runat="server" 
                                               ImageUrl='<%# Eval("Product_Image") %>' 
                                               Width="80px" Height="80px"
                                               CssClass="product-image" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:FileUpload ID="fuProImg" runat="server" />
                                    <br />
                                    <asp:Image ID="imgPreview" runat="server"
                                               ImageUrl='<%# Eval("Product_Image") %>' 
                                               Width="80px" Height="80px"
                                               CssClass="product-image" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Product Name">
                                <ItemTemplate>
                                    <%# Eval("Product_name") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtProName" runat="server" 
                                                 Text='<%# Bind("Product_name") %>'
                                                 CssClass="edit-input" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Details">
                                <ItemTemplate>
                                    <%# Eval("Product_Details") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtProDetails" runat="server" 
                                                 Text='<%# Bind("Product_Details") %>'
                                                 CssClass="edit-input" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    <span class="price-cell">₹<%# Eval("Product_Price") %></span>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtProPrice" runat="server" 
                                                 Text='<%# Bind("Product_Price") %>'
                                                 CssClass="edit-input" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Stock">
                                <ItemTemplate>
                                    <span class='<%# Convert.ToInt32(Eval("Product_Stock")) < 10 ? "stock-cell stock-low" : 
                                                    Convert.ToInt32(Eval("Product_Stock")) < 50 ? "stock-cell stock-medium" : 
                                                    "stock-cell stock-high" %>'>
                                        <%# Eval("Product_Stock") %>
                                    </span>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtProStock" runat="server" 
                                                 Text='<%# Bind("Product_Stock") %>'
                                                 CssClass="edit-input" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Category">
                                <ItemTemplate>
                                    <%# Eval("Cat_Name") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlEditCategory" runat="server" 
                                                     CssClass="edit-select">
                                    </asp:DropDownList>
                                </EditItemTemplate> 
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <script>
            // Add loading animation and smooth interactions
            document.addEventListener('DOMContentLoaded', function () {
                // Add smooth loading for buttons
                const buttons = document.querySelectorAll('.btn, .grid-action-btn');
                buttons.forEach(btn => {
                    btn.addEventListener('click', function () {
                        this.style.transform = 'scale(0.98)';
                        setTimeout(() => {
                            this.style.transform = 'scale(1)';
                        }, 150);
                    });
                });

                // Show status message if present
                const statusMsg = document.querySelector('.status-message');
                if (statusMsg && statusMsg.textContent.trim()) {
                    statusMsg.style.display = 'block';
                    setTimeout(() => {
                        statusMsg.style.opacity = '0';
                        setTimeout(() => {
                            statusMsg.style.display = 'none';
                        }, 300);
                    }, 3000);
                }

                // Add hover effects to table rows
                const tableRows = document.querySelectorAll('tr');
                tableRows.forEach(row => {
                    row.addEventListener('mouseenter', function () {
                        this.style.transform = 'scale(1.01)';
                    });
                    row.addEventListener('mouseleave', function () {
                        this.style.transform = 'scale(1)';
                    });
                });
            });
        </script>
    </form>
</body>
</html>