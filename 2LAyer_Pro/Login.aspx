<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="_2LAyer_Pro.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Shopeeeeeee</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('https://picsum.photos/1920/1080?blur') no-repeat center center/cover;
            font-family: 'Segoe UI', sans-serif;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(12px);
            border-radius: 1rem;
            padding: 2.5rem;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.25);
            width: 100%;
            max-width: 380px;
            color: #fff;
        }

        .glass-card h3 {
            text-align: center;
            margin-bottom: 1.5rem;
            font-weight: 700;
        }

        .form-control {
            border-radius: 0.75rem;
            background: rgba(255, 255, 255, 0.25);
            border: none;
            color: #fff;
        }

        .form-control:focus {
            box-shadow: 0 0 8px rgba(255, 255, 255, 0.6);
        }

        .btn-custom {
            background: linear-gradient(135deg, #4e73df, #1cc88a);
            border: none;
            border-radius: 0.75rem;
            color: #fff;
            font-weight: 600;
            padding: 0.7rem;
            transition: transform 0.2s ease-in-out;
        }

        .btn-custom:hover {
            transform: scale(1.05);
        }

        .register-link {
            text-align: center;
            margin-top: 1rem;
        }

        .register-link a {
            text-decoration: none;
            color: #ffeb3b;
            font-weight: 500;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="glass-card">
            <h3>Login</h3>
            <div class="mb-3">
                <asp:Label ID="Label1" runat="server" Text="Username" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="Label2" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="d-grid">
                <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-custom" OnClick="Button1_Click" />
            </div>
            <div class="register-link">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Register</asp:LinkButton>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
