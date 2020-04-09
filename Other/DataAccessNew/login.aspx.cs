using System;
using System.Collections;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

//must include this namespace
using System.Data.SqlClient;
using System.Web.Configuration;

using System.Net.Mail;


public partial class login : System.Web.UI.Page
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
                    string uname = TxtEm.Text;
                    string pwd = TxtPwd.Text;
            

                   // string sql = "select count(*) from customer where email = '" + uname + "'";
                   // SqlCommand cmd = new SqlCommand(sql, con);
                   // con.Open();
                   // int count = (int)cmd.ExecuteScalar();
                  //  if (count != 0)
                   // {//email exisits


                      string sql = "select count(*) from customer where email = '" + uname + "' and pwd = '" + pwd + "'";
                        SqlCommand cmd = new SqlCommand(sql, con);
                        con.Open();
                        int thisCount = (int)cmd.ExecuteScalar();
                        if (thisCount != 0) //a match
                        {
                            LblMsg.Text = "login successflul! " + sql;
                            //allow login, transfer to the main page.
                            cmd = new SqlCommand("select fname from customer where email = '" + uname + "'", con);
                            string fn = (string)cmd.ExecuteScalar();
                            Session["email"] = uname;
                            // Response.Redirect("main.aspx?fn="+fn+"&em=" + TxtEm.Text, true);
                            Response.Redirect("main.aspx");

                 con.Close();
                        }
                        else LblMsg.Text = "Record doesn't match with our database. Please try again.";
                
               
                   // }
                   // else //email doesn't exists, ask to enter again
                  //  {
                      //  LblMsg.Text = LblMsg.Text + "Record doesn't match with our database. Please try again.";
                
                   // }
                }
                catch (Exception err)
                {
                    Response.Write(err.Message);
                    LblMsg.Text = LblMsg.Text + "Cannot submit information now. Please try again later.";

                }
                finally //must make sure the connection is properly closed
                { //the finally block will always run whether there is an error or not
                    con.Close();
                }
        
       
                          //string uname = TxtEm.Text;
                          //string pwd = TxtPwd.Text;
                          //string sql = "";
                          //int count = CustomerDB.GetOneInt("select count(*) from customer where email = '" + uname + "'");
                          //if (count != 0)
                          //{//email exisits
   
                          //    Boolean isCustomer = CustomerDB.VerifyCustomer(uname,pwd); //bring this line out to demonstrate sql injection
                          //      //check if username and pwd is a match
                          //      //take the user input and insert into database
                          //      //sql = "select count(*) from customer where email = '" + uname + "' and pwd='"+pwd+"'";
                       
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

                          //    //Boolean isCustomer = CustomerDB.SecureVerifyCustomer1(uname, pwd); //if the parameter list is short
                          //  // Boolean isCustomer = CustomerDB.SecureVerifyCustomer2(uname, pwd);//if the parameter list is long, needs data passing out of the procedure
                          //    //sql = "select count(*) from customer where email = '" + uname + "' and pwd='" + pwd + "'";
                          //    if (isCustomer == true) //a match
                          //    {
                          //        LblMsg.Text = "Login successful";
                          //        string fn = CustomerDB.GetOneValue("select fname from customer where email = '" + uname + "';");
                                  
                          //        string msg = "<a href=\"http://www.cs.iupui.edu\">Your password </a> is " + CustomerDB.GetPwd(uname);
                          //        if (EmailPwd("n431demo3333@gmail.com", uname, "Password Recovery", msg)) LblMsg.Text = "The password has been sent to your email account. ";
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
