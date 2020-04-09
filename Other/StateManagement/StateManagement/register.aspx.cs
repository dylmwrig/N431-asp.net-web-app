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
using System.Collections;

//must include this namespace
using System.Data.SqlClient;
using System.Web.Configuration;


public partial class register : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    { //No need the following code if using the data binding feature 
        /*
            //use the CustomerDB utility class to retrieve data
            ArrayList result = CustomerDB.GetRows("select question, ID from SecurityQuestion");
           // Response.Write("<script>alert(\"result is " + result.Count + "\")</script>");
                   
            for (int i=0; i<result.Count; i++)
            {
                ArrayList row = (ArrayList)result[i];
                //Response.Write("<script>alert(\"" + row[0].ToString() + "\")</script>");
                ListItem NewItem = new ListItem(row[0].ToString(), row[1].ToString());
                DrpSq1.Items.Add(NewItem);
                DrpSq2.Items.Add(NewItem);

                
            }

          */
       

    }
    protected void PwdFormatValidate(Object sender, ServerValidateEventArgs args)
    {
        
        try
        {
            
           if (args.Value.Length >= 10)
               args.IsValid = true;
           else args.IsValid = false;

        }
        catch
        {

            args.IsValid = false;
        }

    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        
        //always use try/catch for db connecitons
        try
        {
            //check if the email already exist, email must be unique as this is the username
            string uname = TxtEm.Text;
            string sql = "select count(*) from customer where email = '" + uname + "'";
            con.Open();
            
            SqlCommand cmd = new SqlCommand(sql, con);
           
            int count = (int)cmd.ExecuteScalar();
              
            //int count= CustomerDB.GetOneInt("select count(*) from customer where email = '" + uname + "'");
            if (count != 0)
            {//email already exisits
                LblMsg.Text = "The email you entered already exists in the database. Please login to access your account or register with a different email. ";

            }
            else 
            {
                //take the user input and insert into database
                sql = "insert into customer  (fname, lname, email, pwd, sq1, sa1, sq2, sa2) values('" + TxtFn.Text + "','" + TxtLn.Text + "','" + TxtEm.Text + "','" + TxtPwd.Text + "'," + (DrpSq1.SelectedIndex+1) + ",'" + TxtAns1.Text + "'," + (DrpSq2.SelectedIndex+1) + ",'" + TxtAns2.Text + "');";

                cmd = new SqlCommand(sql,con);

                cmd.ExecuteNonQuery();

                //now take the first name and email to pass to the main page
                //first name will be used for greeting, email will be used to retrieve other user related data
                //in later lab assignment, we can use session variables to pass information
                //Take the user to the main page
                Response.Redirect("main.aspx?fn=" + TxtFn.Text + "&em=" + TxtEm.Text, true);
                //Server.Transfer("main.aspx?fn="+TxtFn.Text+"&em="+TxtEm.Text, true);
                con.Close();
            }
        }
        catch (Exception err)
        {
           
            
            LblMsg.Text = "Cannot submit information now. Please try again later.";
            
        }
        finally //must make sure the connection is properly closed
        { //the finally block will always run whether there is an error or not
            con.Close();
        }
    }
}
