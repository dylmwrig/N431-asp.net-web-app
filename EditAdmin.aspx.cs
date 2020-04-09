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
    public partial class EditAdmin : System.Web.UI.Page
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


            string adminToEdit = Session["adminToEdit"].ToString();
            string prefixCurr = "";
            string firstNameCurr = "";
            string middleNameCurr = "";
            string lastNameCurr = "";
            string sufixCurr = "";
            string passwordCurr = "";
            string altEmailCurr = "";
            string altPasswordCurr = "";
            string phoneCurr = "";
            string addressCurr = "";

            //connect to the database as soon as the page loads so that security questions can be loaded
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            form2.Visible = false;

            SqlCommand cmd = new SqlCommand("SELECT * FROM Admin WHERE email = '" + adminToEdit +"';", con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (!IsPostBack) 
            { 
               while (reader.Read())
                {
                    ListItem NewItem = new ListItem(reader["prefix"].ToString());
                    prefixCurr = NewItem.ToString();
                    firstNameCurr = new ListItem(reader["firstName"].ToString()).ToString();
                    middleNameCurr = new ListItem(reader["middleName"].ToString()).ToString();
                    lastNameCurr = new ListItem(reader["lastName"].ToString()).ToString();
                    sufixCurr = new ListItem(reader["sufix"].ToString()).ToString();
                    passwordCurr = new ListItem(reader["password"].ToString()).ToString();
                    altEmailCurr = new ListItem(reader["altEmail"].ToString()).ToString();
                    altPasswordCurr = new ListItem(reader["altPassword"].ToString()).ToString();
                    phoneCurr = new ListItem(reader["phone"].ToString()).ToString();
                    addressCurr = new ListItem(reader["address"].ToString()).ToString();
                }
                reader.Close();
                con.Close();

                //if email not found
                if (firstNameCurr == "")
                {
                    Session["message"] = "Email not found, try a different one.";
                    Response.Redirect("AdminPage.aspx");
                }

                //populate fields
                prefix.Text = prefixCurr;
                first.Text = firstNameCurr;
                middle.Text = middleNameCurr;
                last.Text = lastNameCurr;
                sufix.Text = sufixCurr;
                password.Text = passwordCurr;
                confirmPassword.Text = passwordCurr;
                altEmail.Text = altEmailCurr;
                altPass.Text = altPasswordCurr;
                phone.Text = phoneCurr;
                address.Text = addressCurr;
            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            string emailCurr = Session["adminToEdit"].ToString();
            string confirmEmailCurr = Session["adminToEdit"].ToString();
            if (Page.IsValid)
            {
                form1.Visible = false;
                output.Text = "First name: " + first.Text +
                    "<br />Last name: " + last.Text +
                    "<br />Email: " + emailCurr +
                    "<br />Confirm email: " + confirmEmailCurr +
                    "<br />Password length: " + password.Text.Length +
                    "<br />Confirm password length: " + confirmPassword.Text.Length;
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
                form1.Visible = false;
                form2.Visible = true;

                con.Open();
                sql = "UPDATE Admin SET prefix = '" + prefixForm + "', firstName = '" + first.Text + "', middleName = '" + middleForm + "', lastName = '" + last.Text +
                    "', sufix = '" + sufixForm + "', password = '" + password.Text + "', altEmail = '" + altEmailForm + "', altPassword = '" + altPassForm +
                    "', phone = '" + phoneForm + "'," + "address = '" + addressForm + "' WHERE email = '" + emailCurr + "';";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();

                con.Close();
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
            Session["message"] = "Changes successfully applied!";
            Response.Redirect("AdminPage.aspx?AdminCreated", true);
        }
    }
}