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
            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            string emailCurr = Session["adminToEdit"].ToString();
            string confirmEmailCurr = Session["adminToEdit"].ToString();
            //save pass
            Session["passRegForm"] = pass.Text;

            if (Page.IsValid)
            {
                form1.Visible = false;
                output.Text = "First name: " + first.Text +
                    "<br />Last name: " + last.Text +
                    "<br />Email: " + emailCurr +
                    "<br />Confirm email: " + confirmEmailCurr;
                form2.Visible = true;
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
            string emailForm = Session["adminToEdit"].ToString();
            string passwordForm = Session["passRegForm"].ToString();

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
                sql = "UPDATE Admin SET prefix = @prefix, firstName = @firstName, middleName = @middleName, lastName = @lastName, sufix = @sufix" +
                    ", password = @password WHERE email = @email;";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add(new SqlParameter("@prefix", prefixForm));
                cmd.Parameters.Add(new SqlParameter("@firstName", firstForm));
                cmd.Parameters.Add(new SqlParameter("@middleName", middleForm));
                cmd.Parameters.Add(new SqlParameter("@lastName", lastForm));
                cmd.Parameters.Add(new SqlParameter("@sufix", sufixForm));
                cmd.Parameters.Add(new SqlParameter("@password", passwordForm));
                cmd.Parameters.Add(new SqlParameter("@email", emailForm));
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
                Session["message"] = "Changes successfully applied!";
                Response.Redirect("AdminPage.aspx?AdminCreated", true);
            }
        }
    }
}