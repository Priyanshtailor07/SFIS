<%@ Page Title="" Language="C#" MasterPageFile="~/FacultyDashboard.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="StudentFacultyManagementSystem.Courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f6fb;
            color: #1c273c;
        }

        h2 {
            color: #1c273c;
            font-size: 28px;
            margin-bottom: 20px;
        }

        h3 {
            color: #1c273c;
            font-size: 22px;
            margin-top: 30px;
        }

        .message {
            margin: 10px 0;
        }

        .panel {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .panel select, .panel textarea, .panel input[type="button"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .panel select {
            width: 200px;
        }

        .panel textarea {
            width: 100%;
            min-height: 150px;
            resize: vertical;
        }

        .panel input[type="button"] {
            background-color: #489ef4;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border: none;
        }

        .panel input[type="button"]:hover {
            background-color: #0056b3;
        }

        .btn-danger {
            background-color: red;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .table th, .table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .table th {
            background-color: #489ef4;
            color: white;
        }

        .table td {
            background-color: #f9f9f9;
        }

        .table .btn {
            padding: 5px 10px;
            font-size: 14px;
            border-radius: 5px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Manage Course Questions</h2>

    <!-- Message Labels -->
    <div class="message">
        <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
    </div>

    <!-- Course Selection and Upload Form -->
    <asp:Panel ID="pnlCourses" runat="server" CssClass="panel">
        <h3>Select a Course</h3>
        <asp:DropDownList ID="ddlCourses" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCourses_SelectedIndexChanged">
        </asp:DropDownList>
        <br /><br />

        <h3>Upload a Question</h3>
        <asp:TextBox ID="txtQuestion" runat="server" TextMode="MultiLine" Rows="5" Width="400px" placeholder="Enter your question here..."></asp:TextBox>
        <br /><br />
        <asp:Button ID="btnUpload" runat="server" Text="Upload Question" OnClick="btnUpload_Click" CssClass="btn btn-primary" />
    </asp:Panel>

    <br />

    <!-- Questions Table for Selected Course -->
    <h3>Questions for Selected Course</h3>
    <asp:GridView ID="gvQuestions" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
        <Columns>
            <asp:BoundField DataField="QuestionID" HeaderText="Question ID" />
            <asp:BoundField DataField="QuestionText" HeaderText="Question" />
            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("QuestionID") %>' CssClass="btn btn-danger" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
