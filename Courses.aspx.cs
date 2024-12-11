using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using System.Web.Configuration;


namespace StudentFacultyManagementSystem
{
    public partial class Assignment : System.Web.UI.Page
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["SFISDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFacultyCourses();
            }
        }

        // Load courses assigned to the logged-in faculty
        private void LoadFacultyCourses()
        {
            int facultyId = GetFacultyIDFromSession();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT CourseID, CourseName FROM Courses WHERE FacultyID = @FacultyID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FacultyID", facultyId);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlCourses.DataSource = reader;
                    ddlCourses.DataValueField = "CourseID";
                    ddlCourses.DataTextField = "CourseName";
                    ddlCourses.DataBind();
                }
                catch (Exception ex)
                {
                    // Log error (optional)
                    Response.Write("Error loading courses: " + ex.Message);
                }
                finally
                {
                    conn.Close();
                }
            }

            // Add default option
            ddlCourses.Items.Insert(0, new ListItem("Select Course", "0"));
        }

        // When a faculty selects a course, load the questions for that course
        protected void ddlCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            int courseId = Convert.ToInt32(ddlCourses.SelectedValue);

            if (courseId > 0)
            {
                LoadQuestionsForCourse(courseId);
                gvStudentAnswers.DataSource = null; // Clear student answers table if course changes
                gvStudentAnswers.DataBind();
            }
        }

        // Load questions based on selected course
        private void LoadQuestionsForCourse(int courseId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT QuestionID, QuestionText FROM Questions WHERE CourseID = @CourseID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CourseID", courseId);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlQuestions.DataSource = reader;
                    ddlQuestions.DataValueField = "QuestionID";
                    ddlQuestions.DataTextField = "QuestionText";
                    ddlQuestions.DataBind();
                }
                catch (Exception ex)
                {
                    // Log error (optional)
                    Response.Write("Error loading questions: " + ex.Message);
                }
                finally
                {
                    conn.Close();
                }
            }

            // Add default option
            ddlQuestions.Items.Insert(0, new ListItem("Select Question", "0"));
        }

        // When a question is selected, load the student answers
        protected void ddlQuestions_SelectedIndexChanged(object sender, EventArgs e)
        {
            int questionId = Convert.ToInt32(ddlQuestions.SelectedValue);

            if (questionId > 0)
            {
                LoadStudentAnswers(questionId);
            }
        }

        // Load student answers based on selected question
        private void LoadStudentAnswers(int questionId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT 
                        sa.AnswerID, 
                        CONCAT(s.FirstName, ' ', s.LastName) AS StudentName, 
                        sa.AnswerText, 
                        sa.Grade 
                    FROM 
                        StudentAnswers sa
                    JOIN 
                        Students s ON sa.StudentID = s.StudentID
                    WHERE 
                        sa.QuestionID = @QuestionID";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@QuestionID", questionId);

                try
                {
                    conn.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    gvStudentAnswers.DataSource = dt;
                    gvStudentAnswers.DataBind();
                }
                catch (Exception ex)
                {
                    // Log error (optional)
                    Response.Write("Error loading student answers: " + ex.Message);
                }
                finally
                {
                    conn.Close();
                }
            }
        }

        // When the faculty selects a grade, update the student's grade
        protected void gvStudentAnswers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateGrade")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvStudentAnswers.Rows[rowIndex];

                int answerId = Convert.ToInt32(gvStudentAnswers.DataKeys[row.RowIndex].Value);
                DropDownList ddlGrade = (DropDownList)row.FindControl("ddlGrades");
                string grade = ddlGrade.SelectedValue;

                UpdateStudentGrade(answerId, grade);
            }
        }

        // Update the student's grade in the database
        private void UpdateStudentGrade(int answerId, string grade)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE StudentAnswers SET Grade = @Grade WHERE AnswerID = @AnswerID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Grade", grade);
                cmd.Parameters.AddWithValue("@AnswerID", answerId);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    // Log error (optional)
                    Response.Write("Error updating grade: " + ex.Message);
                }
                finally
                {
                    conn.Close();
                }
            }
        }

        // Get the Faculty ID from session (assuming session contains FacultyID)
        private int GetFacultyIDFromSession()
        {
            // Simulated session for testing. Replace this with actual session variable.
            return 1; // Replace with Session["FacultyID"];
        }
    }
}
