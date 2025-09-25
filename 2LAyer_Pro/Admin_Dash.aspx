<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Dash.aspx.cs" Inherits="_2LAyer_Pro.WebForm2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
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
        input[type="file"] {
            padding: 12px 16px;
            border-radius: 10px;
            border: 2px solid rgba(255, 255, 255, 0.2);
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            font-size: 14px;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }

        input[type="text"]:focus {
            outline: none;
            border-color: rgba(255, 255, 255, 0.4);
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
            transform: translateY(-2px);
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

        .category-image {
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

        .cancel-btn {
            background: linear-gradient(45deg, #ff6b6b, #e74c3c);
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
                <h1 class="dashboard-title">Admin Dashboard</h1>
                <p class="dashboard-subtitle">Manage your categories and products efficiently</p>
            </div>

            <!-- Add Category Section -->
            <div class="glass-card form-section">
                <h2>Add New Category</h2>
                
                <div class="form-grid">
                    <div class="form-group">
                        <label>
                            <asp:Label ID="Label1" runat="server" Text="Category Name"></asp:Label>
                        </label>
                        <asp:TextBox ID="txtCategoryName" runat="server" placeholder="Enter category name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCategoryName" runat="server"
                            ControlToValidate="txtCategoryName"
                            ErrorMessage="Category name is required" ForeColor="Red"
                            ValidationGroup="AddCategory">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label>
                            <asp:Label ID="Label3" runat="server" Text="Category Photo"></asp:Label>
                        </label>
                        <asp:FileUpload ID="fuCategoryImage" runat="server" />
                    </div>

                    <div class="form-group full-width">
                        <label>
                            <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label>
                        </label>
                        <asp:TextBox ID="txtCategoryDesc" runat="server" placeholder="Enter category description"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCategoryDesc" runat="server"
                            ControlToValidate="txtCategoryDesc"
                            ErrorMessage="Description is required" ForeColor="Red"
                            ValidationGroup="AddCategory">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-actions">
                    <asp:LinkButton ID="LinkButton1" runat="server"
                        OnClick="LinkButton1_Click"
                        CausesValidation="False"
                        CssClass="btn btn-secondary">
                        Go to Product Page
                    </asp:LinkButton>

                    <asp:Button ID="btnAddCategory" runat="server"
                        Text="Add Category"
                        OnClick="btnAddCategory_Click"
                        ValidationGroup="AddCategory"
                        CssClass="btn btn-primary" />
                </div>

                <asp:Label ID="Label10" runat="server" Text="" CssClass="status-message" Visible="false"></asp:Label>
            </div>

            <!-- Categories Grid Section -->
            <div class="glass-card grid-container">
                <h2>Manage Categories</h2>
                
                <div class="gridview-wrapper">
                    <asp:GridView ID="GridView1" runat="server"
                        AutoGenerateColumns="False"
                        CausesValidation="False"
                        DataKeyNames="Cat_id"
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
                                    <asp:Image ID="imgCat" runat="server" 
                                               ImageUrl='<%# Eval("Cat_Image") %>' 
                                               Width="80px" Height="80px"
                                               CssClass="category-image" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:FileUpload ID="fuCatImg" runat="server" />
                                    <br />
                                    <asp:Image ID="imgPreview" runat="server"
                                               ImageUrl='<%# Eval("Cat_Image") %>' 
                                               Width="80px" Height="80px"
                                               CssClass="category-image" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Category Name">
                                <ItemTemplate>
                                    <%# Eval("Cat_Name") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCatName" runat="server" 
                                                 Text='<%# Bind("Cat_Name") %>'
                                                 CssClass="edit-input" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Description">
                                <ItemTemplate>
                                    <%# Eval("cat_disc") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCatDesc" runat="server" 
                                                 Text='<%# Bind("cat_disc") %>'
                                                 CssClass="edit-input" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <script>
            // Add loading animation and smooth interactions
            document.addEventListener('DOMContentLoaded', function() {
                // Add smooth loading for buttons
                const buttons = document.querySelectorAll('.btn');
                buttons.forEach(btn => {
                    btn.addEventListener('click', function() {
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
            });
        </script>
    </form>
</body>
</html>