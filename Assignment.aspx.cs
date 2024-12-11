using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace StudentFacultyManagementSystem
{
    public partial class Assignment : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["StudentFacultyDatabase"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCourses();
            }
        }

        private void BindCourses()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT CourseID, CourseName FROM Courses";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlCourses.DataSource = dt;
                ddlCourses.DataTextField = "CourseName";
                ddlCourses.DataValueField = "CourseID";
                ddlCourses.DataBind();
            }

            ddlCourses.Items.Insert(0, new ListItem("-- Select Course --", ""));
        }

        protected void ddlCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindQuestions();
        }

        private void BindQuestions()
        {
            if (!string.IsNullOrEmpty(ddlCourses.SelectedValue))
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT QuestionID, QuestionText FROM Questions WHERE CourseID = @CourseID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@CourseID", ddlCourses.SelectedValue);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    ddlQuestions.DataSource = dt;
                    ddlQuestions.DataTextField = "QuestionText";
                    ddlQuestions.DataValueField = "QuestionID";
                    ddlQuestions.DataBind();
                }

                ddlQuestions.Items.Insert(0, new ListItem("-- Select Question --", ""));
            }
        }

        protected void ddlQuestions_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindStudentAnswers();
        }

        private void BindStudentAnswers()
        {
            if (!string.IsNullOrEmpty(ddlQuestions.SelectedValue))
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT 
                            sa.AnswerID, 
                            s.FirstName + ' ' + s.LastName AS StudentName, 
                            sa.AnswerText, 
                            sa.Grade 
                        FROM StudentAnswers sa
                        INNER JOIN Students s ON sa.StudentID = s.StudentID
                        WHERE sa.QuestionID = @QuestionID";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@QuestionID", ddlQuestions.SelectedValue);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvStudentAnswers.DataSource = dt;
                    gvStudentAnswers.DataBind();
                }
            }
        }

        protected void gvStudentAnswers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateGrade")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvStudentAnswers.Rows[rowIndex];
                int answerID = Convert.ToInt32(gvStudentAnswers.DataKeys[rowIndex].Value);
                DropDownList ddlGrades = (DropDownList)row.FindControl("ddlGrades");

                if (ddlGrades != null)
                {
                    string selectedGrade = ddlGrades.SelectedValue;

                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        string query = "UPDATE StudentAnswers SET Grade = @Grade WHERE AnswerID = @AnswerID";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@Grade", selectedGrade);
                        cmd.Parameters.AddWithValue("@AnswerID", answerID);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }

                    BindStudentAnswers();
                }
            }
        }
    }
}
