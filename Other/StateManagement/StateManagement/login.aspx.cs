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

using System.Web.SessionState;

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
            

                    string sql = "select count(*) from customer where email = '" + uname + "'";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    con.Open();
                    int count = (int)cmd.ExecuteScalar();
                    if (count != 0)
                    {//email exisits

                        //check if username and pwd is a match
                        //take the user input and insert into database
                        sql = "select count(*) from customer where email = '" + uname + "' and pwd='"+pwd+"'";
                        cmd = new SqlCommand(sql, con);
                        int thisCount = (int)cmd.ExecuteScalar();
                        if (thisCount != 0) //a match
                        {
                            //allow login, transfer to the main page.
                            cmd = new SqlCommand("select fname from customer where email = '" + uname + "'", con);
                            string fn = (string)cmd.ExecuteScalar();

                           //setCookie(uname);

                           Session["email"] = uname;
                           Session["fname"] = fn;

                           
                            Response.Redirect("main.aspx");

                            con.Close();
                        }
                        else LblMsg.Text = "Record doesn't match with our database. Please try again.";
                
               
                    }
                    else //email doesn't exists, ask to enter again
                    {
                        LblMsg.Text = "Record doesn't match with our database. Please try again.";
                
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
    //create a cookie on user's harddrive. Disable cookies on the browser, change the cookie name to try to create a new cookie and cookie values will not be retrieved.
    protected void setCookie(string em)
    {   HttpCookie oCookie = Request.Cookies["Name5"];
        if (oCookie == null)
        {
            HttpCookie cookie = new HttpCookie("Name5");

            cookie["fn"] = CustomerDB.GetOneValue("select fname from customer where  email = '" + em + "';");
            cookie["em"] = em;
            cookie["Language"] = "English";
            cookie.Expires = DateTime.Now.AddYears(1);
        
            Response.Cookies.Add(cookie);

        }
        

    }

}
