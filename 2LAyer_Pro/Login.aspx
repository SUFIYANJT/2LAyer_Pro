<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="_2LAyer_Pro.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Shopeeeeeee</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(135deg, #4e73df, #1cc88a);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', sans-serif;
        }
           body, form {
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
        .login-card {
            background: #fff;
            padding: 2.5rem;
            border-radius: 1rem;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }

        .login-card h3 {
            margin-bottom: 1.5rem;
            font-weight: 700;
            text-align: center;
            color: #4e73df;
        }

        .form-control {
            border-radius: 50px;
            padding: 0.7rem 1rem;
        }

        .btn-custom {
            background: #1cc88a;
            color: #fff;
            border-radius: 50px;
            padding: 0.6rem;
            width: 100%;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn-custom:hover {
            background: #17a673;
        }

        .register-link {
            text-align: center;
            margin-top: 1rem;
        }

        .register-link a {
            text-decoration: none;
            color: #4e73df;
            font-weight: 500;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-card">
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
