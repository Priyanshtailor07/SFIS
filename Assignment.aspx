<%@ Page Title="" Language="C#" MasterPageFile="~/FacultyDashboard.Master" AutoEventWireup="true" CodeBehind="Assignment.aspx.cs" Inherits="StudentFacultyManagementSystem.Assignment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-control {
            width: 300px;
            margin-bottom: 20px;
        }
        .btn-submit {
            margin-top: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Assignment Grading</h2>

    <!-- Dropdown to select course -->
    <div>
        <label for="ddlCourses">Select Course:</label>
        <asp:DropDownList ID="ddlCourses" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCourses_SelectedIndexChanged">
        </asp:DropDownList>
    </div>

    <!-- Dropdown to select question -->
    <div>
        <label for="ddlQuestions">Select Question:</label>
        <asp:DropDownList ID="ddlQuestions" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlQuestions_SelectedIndexChanged">
        </asp:DropDownList>
    </div>

    <!-- GridView to display student answers -->
    <asp:GridView ID="gvStudentAnswers" runat="server" AutoGenerateColumns="False" CssClass="table" DataKeyNames="AnswerID" OnRowCommand="gvStudentAnswers_RowCommand">
        <Columns>
            <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
            <asp:BoundField DataField="AnswerText" HeaderText="Answer" />
            <asp:BoundField DataField="Grade" HeaderText="Current Grade" />
            <asp:TemplateField HeaderText="Update Grade">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlGrades" runat="server">
                        <asp:ListItem Text="A" Value="A"></asp:ListItem>
                        <asp:ListItem Text="B" Value="B"></asp:ListItem>
                        <asp:ListItem Text="C" Value="C"></asp:ListItem>
                        <asp:ListItem Text="D" Value="D"></asp:ListItem>
                        <asp:ListItem Text="F" Value="F"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button CommandName="UpdateGrade" CommandArgument="<%# Container.DataItemIndex %>" Text="Save" runat="server" CssClass="btn btn-primary btn-submit" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>