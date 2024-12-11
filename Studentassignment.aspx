<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMasterPage.Master" AutoEventWireup="true" CodeBehind="Studentassignment.aspx.cs" Inherits="StudentFacultyManagementSystem.Studentassignment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6fb;
            margin: 0;
            padding: 0;
        }

        h2, h3 {
            color: #1c273c;
            font-size: 24px;
            text-align: center;
            margin-bottom: 20px;
        }

        h3 {
            font-size: 22px;
        }

        .course-container, .question-container {
            margin: 20px auto;
            width: 80%;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .course-table, .question-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .course-table th, .question-table th,
        .course-table td, .question-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
            font-size: 16px;
        }

        .course-table th, .question-table th {
            background-color: #489ef4;
            color: white;
        }

        .course-table tr:nth-child(even), .question-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .course-table tr:hover, .question-table tr:hover {
            background-color: #f1f1f1;
        }

        .answer-textbox {
            width: 95%;
            padding: 8px;
        }

        .btn-submit-answer {
            padding: 6px 12px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .btn-submit-answer:hover {
            background-color: #218838;
        }

        .grade-label {
            font-weight: bold;
            color: #333;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="course-container">
        <h2>Your Enrolled Courses</h2>
        <asp:GridView ID="gvCourses" runat="server" AutoGenerateColumns="False" CssClass="course-table">
            <Columns>
                <asp:BoundField DataField="CourseName" HeaderText="Course Name" />
                <asp:BoundField DataField="Department" HeaderText="Department" />
                <asp:TemplateField HeaderText="View Questions">
                    <ItemTemplate>
                        <asp:Button ID="btnViewQuestions" runat="server" Text="View Questions"
                            CommandArgument='<%# Eval("CourseID") %>' OnClick="ViewQuestions" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <div class="question-container" runat="server" id="questionsSection" visible="false">
        <h3>Questions for Course: <asp:Label ID="lblCourseName" runat="server"></asp:Label></h3>
        <asp:GridView ID="gvQuestions" runat="server" AutoGenerateColumns="False" CssClass="question-table">
            <Columns>
                <asp:BoundField DataField="QuestionText" HeaderText="Question" />
                <asp:BoundField DataField="FacultyName" HeaderText="Faculty" />
                <asp:TemplateField HeaderText="Your Answer">
                    <ItemTemplate>
                        <asp:TextBox ID="txtAnswer" runat="server" Text='<%# Eval("StudentAnswer") %>' CssClass="answer-textbox"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Grade">
                    <ItemTemplate>
                        <asp:Label ID="lblGrade" runat="server" Text='<%# Eval("Grade") %>' CssClass="grade-label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="btnSubmitAnswer" runat="server" Text="Submit Answer" 
                            CommandArgument='<%# Eval("QuestionID") %>' OnClick="SubmitAnswer" CssClass="btn-submit-answer" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
