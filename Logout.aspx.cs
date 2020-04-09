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
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //update status to not active
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            string sql = "UPDATE " + Session["userType"] + " SET lastLogin =  '" + Session["startTime"] + "', currLoggedIn = 'no' WHERE email =  '" + Session["email"] + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            
            cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            
            //clear session close and redirect
            Session.Abandon();
            con.Close();
            Response.Redirect("Login.aspx");
        }
    }
}