<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentLogin.aspx.cs" Inherits="StudentFacultyManagementSystem.StudentLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Login</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f6fb;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 350px;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .container img {
            width: 100px;
            height: 100px;
            margin-bottom: 20px;
            border-radius: 50%;
            border: 2px solid #007bff;
        }

        h2 {
            margin-bottom: 20px;
            color: #1c273c;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        label {
            font-weight: bold;
            color: #1c273c;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 5px;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        /* Login Button Style */
        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* New Student Link Styling */
        .new-student {
            margin-top: 15px;
            background-color: #e7f3fe;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
        }

        .new-student a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        .new-student a:hover {
            text-decoration: underline;
        }
        .btn-primary {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <img src="studentlogin.jpg" alt="Student Icon" />
            <h2>Student Login</h2>
            <div class="form-group">
                <label for="email">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter email"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Text="Login" OnClick="btnLogin_Click" BackColor="#0D6EFD" Height="33px" Width="354px" />
            </div>
            <div class="new-student">
                <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="StudentRegister.aspx">New Student? Register Here</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
