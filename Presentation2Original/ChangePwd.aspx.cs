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
    public partial class ChangePwd : System.Web.UI.Page
    {
        string cs;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("login.aspx");
            }

            cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            con = new SqlConnection(cs);

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                //check if the email already exist, email must be unique as this is the username
                string emailForm = email.Text.Trim();
                string currPassForm = currPass.Text.Trim();
                string newPassForm = newPass.Text.Trim();

                //run search for a match
                string sql = "SELECT COUNT(*) FROM " + Session["userType"] + " WHERE email = '" + emailForm + "' and password = '" + currPassForm + "'";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                int thisCount1 = (int)cmd.ExecuteScalar();

                if (thisCount1 != 0)
                {
                    sql = "UPDATE " + Session["userType"] + " SET password =  '" + newPassForm + "' WHERE email =  '" + emailForm + "'";
                    cmd = new SqlCommand(sql, con);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Logout.aspx", true);
                }
                else
                {
                    lblMessage.Text = "Username or password are incorrect. Please try again.";
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
    }
}