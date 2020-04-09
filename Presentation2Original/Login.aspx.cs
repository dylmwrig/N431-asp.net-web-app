using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//must include this namespace
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net.Mail;

namespace Capstone2nd
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            //always use try/catch for db connecitons
            try
            {
                //check if the email exists, if so, check if matches the pwd
                string email = userName.Text;
                string pwd = password.Text;

                //run search for PM
                string sql = "SELECT COUNT(*) FROM ProgramManager WHERE email = '" + email + "' and password = '" + pwd + "'";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                int thisCount1 = (int)cmd.ExecuteScalar();
                if (thisCount1 != 0) //a match in PM
                {
                    Session["userType"] = "ProgramManager";
                }

                //run for guest
                sql = "SELECT COUNT(*) FROM Guest WHERE email = '" + email + "' and password = '" + pwd + "'";
                cmd = new SqlCommand(sql, con);
                int thisCount2 = (int)cmd.ExecuteScalar();
                if (thisCount2 != 0) //a match in PM
                {
                    Session["userType"] = "Guest";
                }

                //run for admin
                sql = "SELECT COUNT(*) FROM Admin WHERE email = '" + email + "' and password = '" + pwd + "'";
                cmd = new SqlCommand(sql, con);
                int thisCount3 = (int)cmd.ExecuteScalar();
                if (thisCount3 != 0) //a match in Admin
                {
                    Session["userType"] = "Admin";
                    //get access level
                    cmd = new SqlCommand("SELECT accessLevel FROM Admin WHERE email =  '" + email + "'", con);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["accessLevel"].ToString());
                        Session["accessLevel"] = NewItem;
                    }
                    reader.Close();
                }

                if (thisCount1 != 0 || thisCount2 != 0 || thisCount3 != 0) //count1 if found PM, count2 if found guest, count3 is admin found
                {
                    lblMessage.Text = "Login successful! " + sql;
                    //allow login, transfer to the main page.
                    cmd = new SqlCommand("SELECT firstName FROM " + Session["userType"] + " WHERE email = '" + email + "'", con);
                    string fn = (string)cmd.ExecuteScalar();
                    Session["email"] = email;

                    //update user login time and active
                    sql = "UPDATE " + Session["userType"] + " SET lastLogin =  '" + Session["startTime"] + "', currLoggedIn = 'yes' WHERE email =  '" + email + "'";
                    cmd = new SqlCommand(sql, con);
                    cmd.ExecuteNonQuery();

                    //get first middle and last name
                    cmd = new SqlCommand("SELECT firstName, middleName, lastName FROM " + Session["userType"] + " WHERE email =  '" + email + "'", con);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        //get full name
                        ListItem NewItem = new ListItem(reader["firstName"].ToString());
                        Session["firstName"] = NewItem;
                        Session["middleName"] = new ListItem(reader["middleName"].ToString());
                        Session["lastName"] = new ListItem(reader["lastName"].ToString()); ;
                    }

                    //con close and redirect
                    con.Close();
                    Response.Redirect("Default.aspx?fn =" + fn + "&em=" + email, true);
                }
                else
                {
                    lblMessage.Text = null;
                    lblMessage.Text = "Record doesn't match with our database. Please try again.";
                }
            }
            catch (Exception err)
            {
                Response.Write(err.Message);
                lblMessage.Text = null;
                lblMessage.Text = lblMessage.Text + "Cannot submit information now. Please try again later.";

            }
            finally //must make sure the connection is properly closed
            { //the finally block will always run whether there is an error or not
                con.Close();
            }


            //string email = TxtEm.Text;
            //string pwd = TxtPwd.Text;
            //string sql = "";
            //int count = CustomerDB.GetOneInt("select count(*) from customer where email = '" + email + "'");
            //if (count != 0)
            //{//email exisits

            //    Boolean isCustomer = CustomerDB.VerifyCustomer(email,pwd); //bring this line out to demonstrate sql injection
            //      //check if username and pwd is a match
            //      //take the user input and insert into database
            //      //sql = "select count(*) from customer where email = '" + email + "' and pwd='"+pwd+"'";

            //      // **********************************************************************************
            //       //* SQL injection demo
            //       //* Type in any value in the password field and append with injected code. E.g. (adad' or 1=1 -- ) or (adf' or 'x' = 'x)
            //      //// * The user can login without a valid password.
            //       //* Prevent sql injections:
            //     //  * 1. If possible, use input validations
            //      // * 2. Use stored procedures with parameters and use them correctly (stored procedure that simply executes a statement is still vulnerable)
            //     //  * 3. Avoid disclosing error messages
            //      // 

            //      //Use a stored procedure to get the count, sp_VerfityCustomer
            //      //The procedure is defined as:
            //      //Create PROCEDURE [dbo].[sp_verifyCustomer]
            //      //@em nvarchar(100),
            //      //@pwd nvarchar(50)
            //      //AS 
            //      //SELECT count(*)
            //      //FROM customer
            //      //WHERE email = @em and pwd = @pwd;

            //    //Boolean isCustomer = CustomerDB.SecureVerifyCustomer1(email, pwd); //if the parameter list is short
            //  // Boolean isCustomer = CustomerDB.SecureVerifyCustomer2(email, pwd);//if the parameter list is long, needs data passing out of the procedure
            //    //sql = "select count(*) from customer where email = '" + email + "' and pwd='" + pwd + "'";
            //    if (isCustomer == true) //a match
            //    {
            //        LblMsg.Text = "Login successful";
            //        string fn = CustomerDB.GetOneValue("select fname from customer where email = '" + email + "';");

            //        string msg = "<a href=\"http://www.cs.iupui.edu\">Your password </a> is " + CustomerDB.GetPwd(email);
            //        if (EmailPwd("n431demo3333@gmail.com", email, "Password Recovery", msg)) LblMsg.Text = "The password has been sent to your email account. ";
            //        else LblMsg.Text = "There is an error sending the password. Please try again later.";

            //       // Response.Redirect("main.aspx?fn="+fn+"&em=" + TxtEm.Text, true);

            //    }
            //    else LblMsg.Text = "Record doesn't match with our database. Please try again.";

            //}
            //else //email doesn't exists, ask to enter again
            //{
            //    LblMsg.Text = "Record doesn't match with our database. Please try again.";

            //}



        }

        bool EmailPwd(string from, string to, string subject, string body)
        {
            try
            {  // Construct a new e-mail message 
                SmtpClient client = new SmtpClient();
                client.EnableSsl = true;

                //the simplest way to send a message. More info at http://msdn.microsoft.com/en-us/library/system.net.mail.smtpclient.aspx
                client.Send(from, to, subject, body);

                return true;
            }
            catch (SmtpException ex)
            {
                return false;

            }
        }
    }
}