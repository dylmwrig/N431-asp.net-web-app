using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//must include this namespace
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Capstone2nd
{
    public partial class addNewAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null || Session["userType"].ToString() == "Guest" || Session["userType"].ToString() == "ProgramManager")
            {
                Response.Redirect("Login.aspx");
            }

            if (Session["userType"].ToString() == "Admin" && Session["accessLevel"].ToString() == "a")
            {
                Response.Redirect("AdminPage.aspx");
            }

            //connect to the database as soon as the page loads so that security questions can be loaded
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            form2.Visible = false;
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                form1.Visible = false;
                //save pass
                Session["passRegForm"] = pass.Text;

                output.Text = "First name: " + first.Text +
                    "<br />Last name: " + last.Text +
                    "<br />Email: " + email.Text +
                    "<br />Confirm email: " + confirmEmail.Text +
                    "<br />pass length: " + pass.Text.Length +
                    "<br />Confirm pass length: " + confirmPass.Text.Length;
                form2.Visible = true;
            }

            //SQL
            string sql; //statemenet to to manipulate
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            try
            {
                con.Open();
                string emailForm = email.Text;

                //check for PM
                sql = "SELECT COUNT(*) FROM ProgramManager WHERE email = @email;";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add(new SqlParameter("@email", emailForm));
                int count1 = (int)cmd.ExecuteScalar();

                //check for guest
                sql = "SELECT COUNT(*) FROM Guest WHERE email = @email;";
                cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add(new SqlParameter("@email", emailForm));
                int count2 = (int)cmd.ExecuteScalar();

                //check for admin
                sql = "SELECT COUNT(*) FROM Admin WHERE email = @email;";
                cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add(new SqlParameter("@email", emailForm));
                int count3 = (int)cmd.ExecuteScalar();

                if (count1 != 0 || count2 != 0 || count3 != 0)
                {//email already exisits
                    form2.Visible = false;
                    form1.Visible = true;
                    lblMessage.Text = "The email you entered already exists in the database. Please try a different email address.";
                }

                else
                {
                    form1.Visible = false;
                    form2.Visible = true;
                }
            }
            catch (Exception err)
            {
                lblMessage.Text = "Cannot submit information now. Please try again later.";
            }
            finally
            {
                con.Close();
            }

        }

        protected void Confirm_Click(object sender, EventArgs e)
        {
            //variables
            string prefixForm = prefix.Text;
            string firstForm = first.Text;
            string middleForm = middle.Text;
            string lastForm = last.Text;
            string sufixForm = sufix.Text;
            string currentTime = DateTime.Now.ToString(); //for register date
            string emailForm = email.Text;
            string passwordForm = Session["passRegForm"].ToString();
            //SQL
            string sql; //statemenet to to manipulate
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            //always use try/catch for db connecitons
            try
            {
                //check if the email already exist, email must be unique as this is the username
                con.Open();
                form1.Visible = false;
                form2.Visible = true;

                sql = "INSERT INTO  Admin  (accessLevel, prefix, firstName, middleName, lastName, sufix, email, password, registerDate, lastLogin, currLoggedIn)" +
                "values('a', @prefix, @firstName, @middleName, @lastName, @sufix, @email, @password, @registerDate, NULL, 'no');";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add(new SqlParameter("@prefix", prefixForm));
                cmd.Parameters.Add(new SqlParameter("@firstName", firstForm));
                cmd.Parameters.Add(new SqlParameter("@middleName", middleForm));
                cmd.Parameters.Add(new SqlParameter("@lastName", lastForm));
                cmd.Parameters.Add(new SqlParameter("@sufix", sufixForm));
                cmd.Parameters.Add(new SqlParameter("@email", emailForm));
                cmd.Parameters.Add(new SqlParameter("@password", passwordForm));
                cmd.Parameters.Add(new SqlParameter("@registerDate", currentTime));
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception err)
            {
                lblMessage.Text = null;
                lblMessage.Text = "Cannot submit information now. Please try again later.";
            }
            finally
            {
                con.Close();
                Response.Redirect("AdminPage.aspx?AdminCreated", true);
            }
        }
    }
}