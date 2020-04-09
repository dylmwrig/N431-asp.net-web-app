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

public partial class forgetPwd2 :System.Web.UI.Page
{
    string uname;
   
    string cs;
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
       // cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
        //con = new SqlConnection(cs);
        //take the user name passed, and get sq
        uname = Request.QueryString["em"];
        ProcessSq();
        
    }
    
   

    protected void ProcessSq()
    {
        
        try
        {

            cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            con = new SqlConnection(cs);
            //get a list of security questions from the user
            SqlCommand cmd = new SqlCommand("select question from vw_customerSq1 where email = '"+uname+"'", con);
            con.Open();
            
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.SingleRow);

            //LblSq1.Text = reader["question"];
            reader.Read();
            LblSq1.Text = reader.GetValue(0).ToString();
            
            reader.Close();

            cmd = new SqlCommand("select question from vw_customerSq2 where email = '" + uname + "'", con);
            reader = cmd.ExecuteReader(CommandBehavior.SingleRow);
            reader.Read();
            LblSq2.Text = reader.GetValue(0).ToString();
          
            reader.Close();
            con.Close();

        }
        catch (Exception err)
        {

           // LblMsg.Text = "Cannot submit information now. Please try again later.";

        }
        finally //must make sure the connection is properly closed
        { //the finally block will always run whether there is an error or not
            con.Close();
        }

    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        //take the answers and check if correct.
        //if so, set the third panel visible to display the password. 
        //in real cases, the password should be sent to the user email.
       // Pnl3.Visible = true;
        //Pnl2.Visible = true;
        
        //get the security answers, verify if correct.
        try
        {

            cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            con = new SqlConnection(cs);
            //get a list of security questions from the user
            SqlCommand cmd = new SqlCommand("select sa1 from vw_customerSq1 where email = '" + uname + "'", con);
            con.Open();
           // LblPwd.Text = "where1";
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.SingleRow);

            //LblSq1.Text = reader["question"];
            reader.Read();
            //LblPwd.Text = "where2";
            //LblSq1.Text = reader.GetValue(0).ToString();
            string sa1 = reader.GetValue(0).ToString();
            //string sa1 = "";
            //LblPwd.Text = reader.GetValue(0).ToString();
            //LblPwd.Text = "where3";
            reader.Close();
            
            cmd = new SqlCommand("select sa2 from vw_customerSq2 where email = '" + uname + "'", con);
            reader = cmd.ExecuteReader(CommandBehavior.SingleRow);
            reader.Read();
           
            string sa2 = reader.GetValue(0).ToString();
            reader.Close();
            con.Close();
            
            if ((TxtAns1.Text == sa1) && (TxtAns2.Text == sa2))
            {   //get the password
               Pnl2.Visible = false;
               //LblPwd.Text = "Your password is: " + CustomerDB.GetPwd(uname);
               string msg = "<a href=\"http://www.cs.iupui.edu\">Your password </a> is " + CustomerDB.GetPwd(uname);
               if (EmailPwd("n431demo3333@gmail.com", uname, "Password Recovery", msg)) LblMsg.Text = "The password has been sent to your email account. ";
               else LblMsg.Text = "There is an error sending the password. Please try again later.";
             

            }
            else
            {
               //send message
               LblPwd.Text = "in correct answer";
               //Pnl2.Visible = false;
               //Pnl3.Visible = true;
                LblMsg2.Text = "Information you entered is incorrect. Please try again.";
            }


        }
        catch (Exception err)
        {

            // LblMsg.Text = "Cannot submit information now. Please try again later.";

        }
        finally //must make sure the connection is properly closed
        { //the finally block will always run whether there is an error or not
            con.Close();
        }
    }

    //need to include "using System.Net.Mail;" at the top. Mail setting are defined in the web.config file line 111.
    //gmail server is used as the mail host. Some common mail server settings can be found here - http://www.emailaddressmanager.com/tips/mail-settings.html
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
