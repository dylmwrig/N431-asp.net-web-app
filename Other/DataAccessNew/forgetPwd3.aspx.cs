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
public partial class forgetPwd3 :System.Web.UI.Page
{
    string uname;
   
    string cs;
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
        con = new SqlConnection(cs);
        if (!Page.IsPostBack)
        {
            
        
        
            uname = "";
            Response.Write("<Script>alert(\"first time load, uname is\" " + uname + ")</script>");
        }
        Response.Write("<Script>alert(\"load again, uname is\" " + uname + ")</script>");

        
    }
    
    protected void BtnEnter_Click(object sender, EventArgs e)
    {
        //get the user name and see if it exists in the database
     
        //always use try/catch for db connections
        try
        {
            //check if the email already exist, email must be unique as this is the username
            string tmpName = TxtEm.Text.Trim();
            string sql = "select count(*) from customer where email = '" + tmpName + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            int count = (int)cmd.ExecuteScalar();
            if (count != 0)
            {//email exisits, set the second panel to be visible, first to be invisible
                //set the global uname to be used by the second panel
                uname = tmpName;
                Pnl1.Visible = false;
               
                ProcessSq();
                Pnl2.Visible = true;
            }
            else {
                LblMsg1.Text = "Username incorrect. Please try again.";
               
                con.Close(); 
            
            }

        }
        catch (Exception err)
        {

            //LblMsg.Text = "Cannot submit information now. Please try again later.";

        }
        finally //must make sure the connection is properly closed
        { //the finally block will always run whether there is an error or not
            con.Close();
        }
        //if so, set the second panel visible and retrieve the sq for the user

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
        Pnl3.Visible = true;
        Pnl2.Visible = true;
        
        //get the security answers
        try
        {

            cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            con = new SqlConnection(cs);
            //get a list of security questions from the user
            SqlCommand cmd = new SqlCommand("select sa1 from vw_customerSq1 where email = '" + uname + "'", con);
            con.Open();
            LblPwd.Text = "where1";
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.SingleRow);

            //LblSq1.Text = reader["question"];
            reader.Read();
            LblPwd.Text = "where2";
            //LblSq1.Text = reader.GetValue(0).ToString();
            //string sa1 = reader.GetValue(0).ToString();
            string sa1 = "";
            LblPwd.Text = reader.GetValue(0).ToString();
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
                LblPwd.Text = "Your password is";
                Pnl3.Visible = true;
               // LblPwd.Text = "where";

            }
            else
            {
               //send message
                LblPwd.Text = "in correct answer";
                Pnl2.Visible = false;
                Pnl3.Visible = true;

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

}
