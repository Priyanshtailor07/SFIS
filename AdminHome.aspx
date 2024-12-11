<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="StudentFacultyManagementSystem.AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Home</title>
    <style>
        /* Custom styles with provided color palette */
        body {
            background-color: #f4f6fb;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #1c273c;
            font-weight: bold;
        }

        .form-label {
            font-weight: bold;
            color: #383560;
        }

        .text-danger {
            color: #b87971;
            font-weight: bold;
        }

        .btn-success {
            background-color: #489ef4;
            border-color: #489ef4;
            color: white;
        }

        .btn-success:hover {
            background-color: #726bfa;
            border-color: #6d5192;
        }

        .table {
            margin-top: 20px;
            border: 1px solid #ddd;
        }

        .table th {
            background-color: #726bfa;
            color: white;
            text-align: center;
            font-size: 14px;
        }

        .table td {
            text-align: center;
            font-size: 13px;
            color: #1c273c;
        }

        .table-striped > tbody > tr:nth-child(odd) {
            background-color: #f4f6fb;
        }

        .table-striped > tbody > tr:nth-child(even) {
            background-color: #ffffff;
        }

        .d-grid {
            display: grid;
            grid-template-columns: 1fr;
        }

        .d-grid .btn {
            width: 100%;
        }

        label {
            color: #383560;
        }

        input {
            border: 1px solid #ccc;
            border-radius: 5px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h2 class="text-center">Admin Management</h2>

        <!-- Table to Display Admin Details -->
        <div class="mt-4">
            <asp:GridView 
                ID="gvAdmins" 
                runat="server" 
                CssClass="table table-striped table-bordered" 
                AutoGenerateColumns="False" 
                DataKeyNames="AdminID"
                OnRowDeleting="gvAdmins_RowDeleting" OnSelectedIndexChanged="gvAdmins_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="AdminID" HeaderText="ID" />
                    <asp:BoundField DataField="Username" HeaderText="Username" />
                    <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="CreatedAt" HeaderText="Created At" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:CommandField ShowDeleteButton="True" HeaderText="Actions" />
                </Columns>
            </asp:GridView>
        </div>

        <!-- Form to Add New Admin -->
        <div class="mt-4">
            <h4>Add New Admin</h4>
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
            <div class="mb-3">
                <label for="txtUsername" class="form-label">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtPassword" class="form-label">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtFullName" class="form-label">Full Name</label>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtEmail" class="form-label">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="d-grid">
                <asp:Button ID="btnAddAdmin" runat="server" CssClass="btn btn-success" Text="Add Admin" OnClick="btnAddAdmin_Click" />
            </div>
        </div>
    </div>
</asp:Content>
