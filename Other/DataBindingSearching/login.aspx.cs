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

        //SQL injection happens here
        //insecure implementation
        //* SQL injection demo
        //Type in any value in the password field and append with injected code. E.g. adad' or 1=1 -- (add a space after --) or adf' or 'x' = 'x
        //User can login without a valid password.
/*
        string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);

        // always use try/catch for db connections
        try
        {
            //check if the email exists, if so, check if matches the pwd
            string uname = TxtEm.Text;
            string pwd = TxtPwd.Text;

            string sql = "select count(*) from customer where email = '" + uname + "' and pwd = '" + pwd + "'";
            LblMsg.Text = sql;
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            int thisCount = (int)cmd.ExecuteScalar();
            LblMsg.Text = LblMsg.Text + " And count is " + thisCount;
            if (thisCount != 0) //a match
            {
                LblMsg.Text = "login successflul! " + LblMsg.Text;
                //allow login, transfer to the main page.
                cmd = new SqlCommand("select fname from customer where email = '" + uname + "'", con);
                string fn = (string)cmd.ExecuteScalar();
                
               // Response.Redirect("main.aspx?fn=" + fn + "&em=" + TxtEm.Text, true);
                con.Close();
            }
            else LblMsg.Text = "Record doesn't match with our database. Please try again.";



        }
        catch (Exception err)
        {

            LblMsg.Text = LblMsg.Text + "Cannot submit information now. Please try again later.";

        }
        finally //must make sure the connection is properly closed
        { //the finally block will always run whether there is an error or not
            con.Close();
        }

*/
        

 
     //secure implementation
     //Prevent sql injections:
     // 1. If possible, use input validations
     // 2. Use stored procedures with parameters and use them correctly (stored procedure that simply executes a statement is still vulnerable)
     // 3. Avoid disclosing error messages
     //Use a stored procedure to get the count, sp_VerfityCustomer
     //The procedure is defined as:
     //Create PROCEDURE [dbo].[sp_verifyCustomer] @em nvarchar(100), @pwd nvarchar(50) AS SELECT count(*) FROM customer WHERE email = @em and pwd = @pwd;
                              
     string uname = TxtEm.Text;
     string pwd = TxtPwd.Text;
     Boolean isCustomer = CustomerDB.SecureVerifyCustomer1(uname, pwd); //if the parameter list is short
     //Boolean isCustomer = CustomerDB.SecureVerifyCustomer2(uname, pwd);//if the parameter list is long, needs data passing out of the procedure
     //sql = "select count(*) from customer where email = '" + uname + "' and pwd='" + pwd + "'";
     if (isCustomer == true) //a match
     {
           LblMsg.Text = "Login successful";
           string fn = CustomerDB.GetOneValue("select fname from customer where email = '" + uname + "';");
            Session["email"]= uname;
            Session["firstName"]= fn;
           Response.Redirect("main.aspx");

     }
     else LblMsg.Text = "Record doesn't match with our database. Please try again.";
     

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
