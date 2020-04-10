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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //connect to the database as soon as the page loads so that security questions can be loaded
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            //always use try/catch for db connections
            try
            {

                //get a list of security questions, create list items and add to the drop down list
                //See below using a data access component to replace repetitive codes
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



                // //use the CustomerDB utility class to retrieve data
                // ArrayList result = CustomerDB.GetRows("select question, ID from SecurityQuestion");
                //// Response.Write("<script>alert(\"result is " + result.Count + "\")</script>");

                // for (int i=0; i<result.Count; i++)
                // {
                //     ArrayList row = (ArrayList)result[i];
                //     //Response.Write("<script>alert(\"" + row[0].ToString() + "\")</script>");
                //     ListItem NewItem = new ListItem(row[0].ToString(), row[1].ToString());
                //     DrpSq1.Items.Add(NewItem);
                //     DrpSq2.Items.Add(NewItem);


                // }

                // lblMessage.Text = "server versions is: " + con.ServerVersion;
                //ASP.NET has no MessageBox class, must use JavaScript alert to send 
                //some alert
                //Response.Write("<script>alert('try');</script>"); 

            }
            catch (Exception err)
            {
                Response.Write("<script>alert(\"" + err.Message + "\");</script>");
                Response.Write(err.Message);
                lblMessage.Text = null;
                lblMessage.Text = "Cannot submit information now. Please try again later.";

            }
            finally //must make sure the connection is properly closed
            { //the finally block will always run whether there is an error or not
                con.Close();
            }

            form2.Visible = false;
            //make user type choosing visible or invisible
            if (radioUserType.Text == "Program Manager")
            {
                lblRole.Visible = true;
                role.Visible = true;
                lblOtherRole.Visible = true;
                otherRole.Visible = true;
            }
            else
            {
                lblRole.Visible = false;
                role.Visible = false;
                lblOtherRole.Visible = false;
                otherRole.Visible = false;
            }

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                form1.Visible = false;
                output.Text = "User Type: " + radioUserType.Text +
                    "<br />Role: " + role.SelectedItem.Text +
                    "<br />First name: " + first.Text +
                    "<br />Last name: " + last.Text +
                    "<br />Email: " + email.Text +
                    "<br />Confirm email: " + confirmEmail.Text +
                    "<br />Password length: " + password.Text.Length +
                    "<br />Confirm password length: " + confirmPassword.Text.Length +
                    "<br />Gender: " + radioGender.Text +
                    "<br />Department: " + department.Text +
                    "<br />Status: " + status.Text;
                form2.Visible = true;
            }

            //variables
            string roleIDForm = "";
            string radioUserTypeForm = radioUserType.Text;
            string roleNameForm = role.SelectedItem.Text;
            string prefixForm = prefix.Text;
            string middleForm = middle.Text;
            string sufixForm = sufix.Text;
            string altEmailForm = altEmail.Text;
            string altPassForm = altPass.Text;
            string phoneForm = phone.Text;
            string addressForm = address.Text;
            string currentTime = DateTime.Now.ToString(); //for register date
            string strCodeForm = rndGenString();
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

                else
                {
                    form1.Visible = false;
                    form2.Visible = true;
                    //take the user input and INSERT INTO  database
                    //if radioUserTypeForm = Program Manager
                    if (radioUserTypeForm == "Program Manager")
                    {
                        //insert into role

                        sql = "SELECT  roleID FROM ManagerRole WHERE roleName = '" + roleNameForm + "';";
                        cmd = new SqlCommand(sql, con);
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            //find the role
                            roleIDForm = reader["roleID"].ToString();
                        }
                        reader.Close();

                        //insert
                        sql = "INSERT INTO  ProgramManager  (roleID, prefix, firstName, middleName, lastName, sufix, email, password, altEmail, altPassword, phone," +
                            "address, registerDate, lastLogin, approved, currLoggedIn, rndCode)" +
                            "values('" + roleIDForm + "','" + prefixForm + "' , '" + first.Text + "', '" + middleForm + "','" + last.Text + "', '" + sufixForm + "' ,'"
                            + email.Text + "','" + password.Text + "', '" + altEmailForm + "', '" + altPassForm + "', '" + phoneForm + "', '" + addressForm + "', '"
                            + currentTime + "', NULL, 'no', 'no', '" + strCodeForm + "');";
                        cmd = new SqlCommand(sql, con);
                        cmd.ExecuteNonQuery();
                    }

                    else
                    { //if radioUserTypeForm = Guest
                        sql = "INSERT INTO  Guest  (prefix, firstName, middleName, lastName, sufix, email, password, altEmail, altPassword, phone," +
                        "address, registerDate, lastLogin, approved, currLoggedIn, rndCode)" +
                        "values('" + prefixForm + "' , '" + first.Text + "', '" + middleForm + "','" + last.Text + "', '" + sufixForm + "' ,'"
                        + email.Text + "','" + password.Text + "', '" + altEmailForm + "', '" + altPassForm + "', '" + phoneForm + "', '" + addressForm + "', '"
                        + currentTime + "', NULL, 'no', 'no', '" + strCodeForm + "');";
                        cmd = new SqlCommand(sql, con);
                        cmd.ExecuteNonQuery();
                    }
                    con.Close();
                }
            }
            catch (Exception err)
            {
                lblMessage.Text = "Cannot submit information now. Please try again later.";
            }
            finally //must make sure the connection is properly closed
            { //the finally block will always run whether there is an error or not
                con.Close();
            }
        }

        protected void Confirm_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", true);
        }

        protected void radioUserType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(radioUserType.Text == "Program Manager")
            {   //If Program Manager is selected prompt role field and label
                lblRole.Visible = true;
                role.Visible = true;
            }
            if (radioUserType.Text == "Guest")
            {   //If Guest is selected hide role field and label
                lblRole.Visible = false;
                role.Visible = false;
            }
        }

        protected string rndGenString()
        {
            int length = 50;
            char letter;
            
            Random random = new Random();
            string myStr = "";
            for (int i = 0; i<length; i++)
            {
                double flt = random.NextDouble();
                int shift = Convert.ToInt32(Math.Floor(25 * flt));
                letter = Convert.ToChar(shift + 65);
                myStr = myStr + letter;
            }
            return myStr;
        }
    }
}