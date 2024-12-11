using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace StudentFacultyManagementSystem
{
    public partial class Studentassignment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEnrolledCourses();
            }
        }

        // Load the courses the student is enrolled in
        private void LoadEnrolledCourses()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["StudentFacultyDatabase"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT c.CourseID, c.CourseName, c.Department
                    FROM Courses c
                    JOIN StudentCourses sc ON c.CourseID = sc.CourseID
                    WHERE sc.StudentID = @StudentID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@StudentID", Session["StudentID"]);

                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable courses = new DataTable();
                adapter.Fill(courses);

                gvCourses.DataSource = courses;
                gvCourses.DataBind();
            }
        }

        // View the questions for a specific course
        protected void ViewQuestions(object sender, EventArgs e)
        {
            string courseId = ((System.Web.UI.WebControls.Button)sender).CommandArgument;
            string connectionString = WebConfigurationManager.ConnectionStrings["StudentFacultyDatabase"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Fetch course name to display
                string courseNameQuery = "SELECT CourseName FROM Courses WHERE CourseID = @CourseID";
                SqlCommand courseNameCommand = new SqlCommand(courseNameQuery, connection);
                courseNameCommand.Parameters.AddWithValue("@CourseID", courseId);

                connection.Open();
                string courseName = courseNameCommand.ExecuteScalar().ToString();
                lblCourseName.Text = courseName;

                // Fetch questions for the course
                string questionsQuery = @"
                    SELECT q.QuestionID, q.QuestionText, f.FirstName + ' ' + f.LastName AS FacultyName,
                           q.StudentAnswer, q.Grade
                    FROM Questions q
                    JOIN Courses c ON q.CourseID = c.CourseID
                    JOIN Faculty f ON c.FacultyID = f.FacultyID
                    WHERE c.CourseID = @CourseID";

                SqlCommand questionsCommand = new SqlCommand(questionsQuery, connection);
                questionsCommand.Parameters.AddWithValue("@CourseID", courseId);

                SqlDataAdapter adapter = new SqlDataAdapter(questionsCommand);
                DataTable questions = new DataTable();
                adapter.Fill(questions);

                gvQuestions.DataSource = questions;
                gvQuestions.DataBind();

                connection.Close();
            }

            questionsSection.Visible = true; // Display the questions section
        }

        // Submit an answer for a question
        protected void SubmitAnswer(object sender, EventArgs e)
        {
            Button btnSubmitAnswer = (Button)sender;
            GridViewRow row = (GridViewRow)btnSubmitAnswer.NamingContainer;
            int questionId = Convert.ToInt32(btnSubmitAnswer.CommandArgument);
            string studentAnswer = (row.FindControl("txtAnswer") as TextBox).Text;

            string connectionString = WebConfigurationManager.ConnectionStrings["StudentFacultyDatabase"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    UPDATE Questions
                    SET StudentAnswer = @StudentAnswer
                    WHERE QuestionID = @QuestionID";

                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@StudentAnswer", studentAnswer);
                cmd.Parameters.AddWithValue("@QuestionID", questionId);

                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
            }

            // After submitting, reload the questions
            ViewQuestions(sender, e);
        }

        // Show grades after faculty has graded the student's answer
        protected void ViewGrades(object sender, EventArgs e)
        {
            // You can modify this function to show grades more clearly if necessary
            GridViewRow row = (GridViewRow)((Button)sender).NamingContainer;
            string grade = (row.FindControl("lblGrade") as Label).Text;

            if (string.IsNullOrEmpty(grade))
            {
                grade = "Not Graded Yet";
            }

            // Show grade for this particular question.
            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Grade: {grade}');", true);
        }
    }
}
