<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultyLogin.aspx.cs" Inherits="StudentFacultyManagementSystem.FacultyLogin" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Login</title>
    <style>
        /* Custom styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6fb;
            color: #1c273c;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 350px;
            margin: 100px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        h2 {
            text-align: center;
            color: #383560;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        label {
            display: block;
            font-weight: bold;
            color: #1c273c;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #489ef4;
            outline: none;
            box-shadow: 0 0 5px rgba(72, 158, 244, 0.5);
        }

        button, .form-group asp:Button {
            width: 100%;
            padding: 12px;
            background-color: #489ef4;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            font-weight: bold;
        }

        button:hover, .form-group asp:Button:hover {
            background-color: #726bfa;
        }

        .form-group asp:Button {
            display: inline-block;
            font-size: inherit;
            font-weight: inherit;
            padding: inherit;
        }

        .text-center {
            text-align: center;
        }

        .link {
            color: #489ef4;
            text-decoration: none;
            font-size: 14px;
        }

        .link:hover {
            text-decoration: underline;
        }

        .faculty-image {
            width: 113px;
            height: 111px;
            border-radius: 50%;
            margin-bottom: 20px;
            border: 3px solid #489ef4;
            object-fit: cover;
        }
        .btn {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Faculty Image -->
            <img src="facultylogin.jpg" alt="Faculty Image" class="faculty-image" />

            <div class="form-group">
                <label for="email">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter email"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" BackColor="#0D6EFD" Height="41px" Width="350px" />
            </div>
            <div class="text-center">
                <a href="#" class="link">Forgot Password?</a>
            </div>
        </div>
    </form>
</body>
</html>
