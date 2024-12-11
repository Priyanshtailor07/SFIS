<%@ Page Title="" Language="C#" MasterPageFile="~/FacultyDashboard.Master" AutoEventWireup="true" CodeBehind="FacultyHome.aspx.cs" Inherits="StudentFacultyManagementSystem.FacultyHome" %>

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
            font-size: 24px;
            margin-bottom: 15px;
        }

        .section {
            margin-bottom: 30px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .section input[type="text"] {
            width: 200px;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .section button {
            padding: 10px 15px;
            background-color: #489ef4;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        .section button:hover {
            background-color: #0056b3;
        }

        .section .gridview {
            margin-top: 20px;
            width: 100%;
            border-collapse: collapse;
        }

        .section .gridview th, .section .gridview td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .section .gridview th {
            background-color: #489ef4;
            color: white;
        }

        .label-message {
            color: red;
            margin-top: 10px;
        }

        .section input[type="text"]:focus {
            outline: none;
            border-color: #489ef4;
            box-shadow: 0 0 5px rgba(72, 158, 244, 0.5);
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- View All Created Courses Section -->
    <div class="section">
        <h2>Your Created Courses</h2>
        <asp:GridView ID="gvCreatedCourses" runat="server" AutoGenerateColumns="False" CssClass="gridview">
            <Columns>
                <asp:BoundField DataField="CourseName" HeaderText="Course Name" SortExpression="CourseName" />
                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                <asp:BoundField DataField="CreatedAt" HeaderText="Created At" SortExpression="CreatedAt" DataFormatString="{0:yyyy-MM-dd}" />
            </Columns>
        </asp:GridView>
    </div>

    <br />

    <!-- Course Creation Section -->
    <div class="section">
        <h2>Create New Course</h2>
        <asp:TextBox ID="txtCourseName" runat="server" placeholder="Enter Course Name" class="form-control"></asp:TextBox>
        <asp:TextBox ID="txtDepartment" runat="server" placeholder="Enter Department" class="form-control"></asp:TextBox>

        <asp:Button ID="btnCreateCourse" runat="server" Text="Create Course" OnClick="btnCreateCourse_Click" class="btn btn-primary" />
        <br /><br />

        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red" CssClass="label-message"></asp:Label>
    </div>

    <br />

    <!-- View Enrolled Students Section -->
    <div class="section">
        <h2>View Enrolled Students</h2>
        <asp:TextBox ID="txtCourseSearch" runat="server" placeholder="Enter Course Name to see Enrolled Students" class="form-control" width="200px"></asp:TextBox>
        <asp:Button ID="btnSearchEnrolledStudents" runat="server" Text="View Enrolled Students" OnClick="btnSearchEnrolledStudents_Click" class="btn btn-primary" />

        <br /><br />
        <asp:GridView ID="gvEnrolledStudents" runat="server" AutoGenerateColumns="true" CssClass="gridview"></asp:GridView>
    </div>
</asp:Content>
