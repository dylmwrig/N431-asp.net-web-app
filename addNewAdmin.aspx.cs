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
                output.Text = "First name: " + first.Text +
                    "<br />Last name: " + last.Text +
                    "<br />Email: " + email.Text +
                    "<br />Confirm email: " + confirmEmail.Text +
                    "<br />Password length: " + password.Text.Length +
                    "<br />Confirm password length: " + confirmPassword.Text.Length +
                    "<br />Gender: " + radioGender.Text;
                form2.Visible = true;
            }

            //variables
            string prefixForm = prefix.Text;
            string middleForm = middle.Text;
            string sufixForm = sufix.Text;
            string altEmailForm = altEmail.Text;
            string altPassForm = altPass.Text;
            string phoneForm = phone.Text.Replace("+", "").Replace(" ", "").Replace("(", "").Replace(")", "").Replace("-", "");
            string addressForm = address.Text;
            string currentTime = DateTime.Now.ToString(); //for register date
            //SQL
            string sql; //statemenet to to manipulate
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            //always use try/catch for db connecitons
            try
            {
                //check if the email already exist, email must be unique as this is the username
                con.Open();
                string uname = email.Text;

                //check for PM
                sql = "SELECT COUNT(*) FROM ProgramManager WHERE email = '" + uname + "'";
                SqlCommand cmd = new SqlCommand(sql, con);
                int count1 = (int)cmd.ExecuteScalar();

                //check for guest
                sql = "SELECT COUNT(*) FROM Guest WHERE email = '" + uname + "'";
                cmd = new SqlCommand(sql, con);
                int count2 = (int)cmd.ExecuteScalar();

                //check for admin
                sql = "SELECT COUNT(*) FROM Admin WHERE email = '" + uname + "'";
                cmd = new SqlCommand(sql, con);
                int count3 = (int)cmd.ExecuteScalar();

                if (count1 != 0 || count2 != 0 || count3 != 0)
                {//email already exisits
                    form2.Visible = false;
                    form1.Visible = true;
                    lblMessage.Text = "The email you entered already exists in the database. Please try a different email address.";
                }

                else //make admin
                {
                    form1.Visible = false;
                    form2.Visible = true;

                    sql = "INSERT INTO  Admin  (accessLevel, prefix, firstName, middleName, lastName, sufix, email, password, altEmail, altPassword, phone," +
                    "address, registerDate, lastLogin, currLoggedIn)" +
                    "values('a', '" + prefixForm + "' , '" + first.Text + "', '" + middleForm + "','" + last.Text + "', '" + sufixForm + "' ,'"
                    + email.Text + "','" + password.Text + "', '" + altEmailForm + "', '" + altPassForm + "', '" + phoneForm + "', '" + addressForm + "', '"
                    + currentTime + "', NULL, 'no');";
                    cmd = new SqlCommand(sql, con);
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }
            catch (Exception err)
            {
                lblMessage.Text = null;
                lblMessage.Text = "Cannot submit information now. Please try again later.";
            }
            finally //must make sure the connection is properly closed
            { //the finally block will always run whether there is an error or not
                con.Close();
            }
        }

        protected void Confirm_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx?AdminCreated", true);
        }
    }
}