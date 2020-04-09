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
//for sending emails
using System.Net.Mail;
//using People;

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
              LblPwd.Text = "Your password isadsfdf: " + CustomerDB.GetPwd(uname);
              Pnl3.Visible = true;
             
                //Alternative, send password to email, this part is not working yet. Need to check the server mail package installation
               // string pwdMsg = "Your password is " + CustomerDB.GetPwd(uname);
               //if (!EmailPwd("Admin", uname, "Your Password", pwdMsg)) LblPwd.Text = "Password cannot be sent due to technical difficulties. Please try again later.";
               //else LblPwd.Text = "Your password has been sent to your registered email account. ";

              
            }
            else
            {
               //send message
               //Pnl2.Visible = false;
               //Pnl3.Visible = true;
                LblMsg2.Text = "Information you entered is incorrect. Please try again.";
            }


        }
        catch (Exception err)
        {
            Pnl2.Visible = true;
            LblMsg2.Text = "Cannot submit information now. Please try again later.";

        }
        finally //must make sure the connection is properly closed
        { //the finally block will always run whether there is an error or not
            con.Close();
        }
      
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
