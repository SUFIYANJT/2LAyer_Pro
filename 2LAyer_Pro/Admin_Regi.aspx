<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Regi.aspx.cs" Inherits="_2LAyer_Pro.Admin_Regi" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Registration</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px;
        }

        /* Animated background particles */
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="20" cy="20" r="2" fill="rgba(255,255,255,0.1)"/><circle cx="80" cy="40" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="40" cy="80" r="1.5" fill="rgba(255,255,255,0.1)"/><circle cx="90" cy="10" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="10" cy="90" r="2" fill="rgba(255,255,255,0.1)"/></svg>') repeat;
            animation: float 20s infinite linear;
            pointer-events: none;
        }

        @keyframes float {
            0% { transform: translateY(0px) rotate(0deg); }
            100% { transform: translateY(-100px) rotate(360deg); }
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 25px;
            box-shadow: 
                0 25px 45px rgba(0, 0, 0, 0.1),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.1);
            width: 100%;
            max-width: 420px;
            color: #fff;
            position: relative;
            overflow: hidden;
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

        .glass-card h3 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: 700;
            font-size: 24px;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
            background: linear-gradient(45deg, #fff, #f0f8ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .auto-style1 {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 8px;
        }

        .auto-style1 td {
            vertical-align: top;
            padding: 3px 8px;
        }

        .auto-style1 td:first-child {
            width: 35%;
            font-weight: 600;
            color: rgba(255, 255, 255, 0.9);
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
        }

        input[type="text"], 
        input[type="password"], 
        input[type="number"] {
            width: 100%;
            padding: 10px 14px;
            border-radius: 10px;
            border: 2px solid rgba(255, 255, 255, 0.2);
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            font-size: 14px;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }

        input[type="text"]:focus, 
        input[type="password"]:focus, 
        input[type="number"]:focus {
            outline: none;
            border-color: rgba(255, 255, 255, 0.4);
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
            transform: translateY(-2px);
        }

        input::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }

        .btn {
            width: 100%;
            padding: 12px 18px;
            border-radius: 10px;
            background: linear-gradient(45deg, #1cc88a, #17a673);
            color: #fff;
            border: none;
            font-weight: 600;
            font-size: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(28, 200, 138, 0.3);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 15px;
        }

        .btn:hover {
            background: linear-gradient(45deg, #17a673, #13855c);
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(28, 200, 138, 0.4);
        }

        .btn:active {
            transform: translateY(-1px);
            box-shadow: 0 4px 15px rgba(28, 200, 138, 0.3);
        }

        /* Validation message styling */
        span[style*="color:Red"] {
            color: #ff6b6b !important;
            font-size: 11px;
            font-weight: 500;
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
            display: block;
            margin-top: 3px;
            background: rgba(255, 107, 107, 0.1);
            padding: 3px 6px;
            border-radius: 5px;
            border-left: 2px solid #ff6b6b;
        }

        /* Responsive design */
        @media (max-width: 600px) {
            .glass-card {
                padding: 25px;
                margin: 10px;
            }
            
            .glass-card h3 {
                font-size: 24px;
            }
            
            .auto-style1 {
                border-spacing: 0 10px;
            }
            
            .auto-style1 td:first-child {
                width: 100%;
                display: block;
                margin-bottom: 5px;
            }
            
            .auto-style1 td:last-child {
                width: 100%;
                display: block;
            }
        }

        /* Loading animation for button */
        .btn.loading {
            position: relative;
            color: transparent;
        }

        .btn.loading::after {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            top: 50%;
            left: 50%;
            margin-left: -10px;
            margin-top: -10px;
            border: 2px solid #ffffff;
            border-radius: 50%;
            border-top-color: transparent;
            animation: spin 1s ease-in-out infinite;
        }

        @keyframes spin {
            to {
                transform: rotate(360deg);
            }
        }

        /* Form field animation */
        .form-field {
            position: relative;
            margin-bottom: 20px;
        }

        .form-field input:focus + .form-label,
        .form-field input:valid + .form-label {
            transform: translateY(-20px) scale(0.8);
            color: #1cc88a;
        }

        /* Subtle glow effect */
        .glass-card {
            animation: glow 4s ease-in-out infinite alternate;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="glass-card">
            <h3>Admin Registration</h3>
            <table class="auto-style1">
                <tr>
                    <td><asp:Label ID="Label1" runat="server" Text="Name"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter your full name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label2" runat="server" Text="Email"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter your email address"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please enter a valid email address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label3" runat="server" Text="Phone"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter your phone number"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please enter a valid phone number" ForeColor="Red" ValidationExpression="^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label7" runat="server" Text="Age"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server" TextMode="Number" placeholder="Enter your age"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox7" ErrorMessage="Age must be between 18 and 100" ForeColor="Red" MaximumValue="100" MinimumValue="18" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label4" runat="server" Text="Username"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" placeholder="Choose a username"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="Username is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label5" runat="server" Text="Password"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" TextMode="Password" placeholder="Create a strong password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label6" runat="server" Text="Confirm Password"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server" TextMode="Password" placeholder="Confirm your password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox5" ControlToValidate="TextBox6" ErrorMessage="Passwords do not match" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Create Account" CssClass="btn" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>

    <script>
        // Add loading animation to button on click
        document.addEventListener('DOMContentLoaded', function () {
            const submitBtn = document.querySelector('.btn');
            if (submitBtn) {
                submitBtn.addEventListener('click', function () {
                    this.classList.add('loading');
                });
            }
        });
    </script>
</body>
</html>