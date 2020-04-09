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
    public partial class RegisterPM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["roleChosen"] != null) {
                if (Session["roleChosen"].ToString() == "Other")
                {
                    lblOtherRole.Visible = true;
                    otherRole.Visible = true;
                }
            }

            else
            {
                lblOtherRole.Visible = false;
                otherRole.Visible = false;
            }

            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM ManagerRole", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (!IsPostBack)
                {
                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["roleName"].ToString(), reader["other"].ToString());
                        role.Items.Add(NewItem);
                    }
                    reader.Close();
                }
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
            }

            form2.Visible = false;
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                form1.Visible = false;
                //save pass
                Session["passRegForm"] = pass.Text;

                output.Text = "Role: " + role.SelectedItem.Text +
                    "<br />First name: " + first.Text +
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
            string roleIDForm = "";
            string roleNameForm = role.SelectedItem.Text;
            string prefixForm = prefix.Text;
            string firstNameForm = first.Text;
            string middleNameForm = middle.Text;
            string lastNameForm = last.Text;
            string sufixForm = sufix.Text;
            string altEmailForm = altEmail.Text;
            string phoneForm = phone.Text.Replace("+", "").Replace(" ", "").Replace("(", "").Replace(")", "").Replace("-", "");
            string currentTime = DateTime.Now.ToString(); //for register date
            string strCodeForm = rndGenString();
            string emailForm = email.Text;

            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();

            try
            {
                //take the user input and INSERT INTO  database
                //insert into role
                string sql = "SELECT  roleID FROM ManagerRole WHERE roleName = @roleNameForm;";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add(new SqlParameter("@roleNameForm", roleNameForm));
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    //find the role
                    roleIDForm = reader["roleID"].ToString();
                }
                reader.Close();

                //insert
                sql = "INSERT INTO  ProgramManager  (roleID, prefix, firstName, middleName, lastName, sufix, email, password, altEmail, phone," +
                "registerDate, lastLogin, approved, currLoggedIn, rndCode)" +
                "values(@roleID, @prefix, @firstName, @middleName, @lastName, @sufix, @email, @pass, @altEmail, @phone," +
                "@registerDate, NULL, 'no', 'no', @rndCode);";
                cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add(new SqlParameter("@roleID", roleIDForm));
                cmd.Parameters.Add(new SqlParameter("@prefix", prefixForm));
                cmd.Parameters.Add(new SqlParameter("@firstName", firstNameForm));
                cmd.Parameters.Add(new SqlParameter("@middleName", middleNameForm));
                cmd.Parameters.Add(new SqlParameter("@lastName", lastNameForm));
                cmd.Parameters.Add(new SqlParameter("@sufix", sufixForm));
                cmd.Parameters.Add(new SqlParameter("@email", emailForm));
                cmd.Parameters.Add(new SqlParameter("@pass", Session["passRegForm"]));
                cmd.Parameters.Add(new SqlParameter("@altEmail", altEmailForm));
                cmd.Parameters.Add(new SqlParameter("@phone", phoneForm.Replace("+", "").Replace(" ", "").Replace("(", "").Replace(")", "").Replace("-", "")));
                cmd.Parameters.Add(new SqlParameter("@registerDate", currentTime));
                cmd.Parameters.Add(new SqlParameter("@rndCode", strCodeForm));
                cmd.ExecuteNonQuery();
            }
            catch (Exception err)
            {
                lblMessage.Text = "Cannot submit information now. Please try again later.";
            }
            finally
            {
                con.Close();
                Response.Redirect("Default.aspx", true);
            }
        }


        protected string rndGenString()
        {
            int length = 50;
            char letter;

            Random random = new Random();
            string myStr = "";
            for (int i = 0; i < length; i++)
            {
                double flt = random.NextDouble();
                int shift = Convert.ToInt32(Math.Floor(25 * flt));
                letter = Convert.ToChar(shift + 65);
                myStr = myStr + letter;
            }
            return myStr;
        }

        protected void role_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (role.SelectedItem.Text == "Other")
            {
                lblOtherRole.Visible = true;
                otherRole.Visible = true;
            }


            else
            {
                lblOtherRole.Visible = false;
                otherRole.Visible = false;
            }
        }
    }
}