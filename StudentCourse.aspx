<%@ Page Title="Enrolled Courses" Language="C#" MasterPageFile="~/StudentMasterPage.Master" AutoEventWireup="true" CodeBehind="StudentCourse.aspx.cs" Inherits="StudentFacultyManagementSystem.Studentcourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6fb;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            font-size: 28px;
            color: #1c273c;
            margin: 30px 0;
        }

        .course-table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        .course-table th, .course-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
            font-size: 16px;
        }

        .course-table th {
            background-color: #489ef4;
            color: white;
        }

        .course-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .course-table tr:hover {
            background-color: #f1f1f1;
        }

        .course-table td {
            color: #333;
        }

        .course-table td a {
            color: #489ef4;
            text-decoration: none;
        }

        .course-table td a:hover {
            text-decoration: underline;
        }

        .pagination {
            text-align: center;
            margin-top: 20px;
        }

        .pagination a {
            text-decoration: none;
            padding: 8px 16px;
            margin: 0 5px;
            background-color: #489ef4;
            color: white;
            border-radius: 5px;
            font-size: 16px;
        }

        .pagination a:hover {
            background-color: #218838;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Enrolled Courses</h2>
    <asp:GridView ID="gvCourses" runat="server" CssClass="course-table" AutoGenerateColumns="False" 
                  OnRowDataBound="gvCourses_RowDataBound">
        <Columns>
            <asp:BoundField DataField="CourseName" HeaderText="Course Name" SortExpression="CourseName" />
            <asp:BoundField DataField="FacultyName" HeaderText="Faculty Name" SortExpression="FacultyName" />
        </Columns>
    </asp:GridView>

    <!-- Pagination (if needed) -->
    <div class="pagination">
        <asp:Button ID="btnPrevious" runat="server" Text="Previous" CssClass="pagination" />
        <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="pagination" />
    </div>
</asp:Content>
