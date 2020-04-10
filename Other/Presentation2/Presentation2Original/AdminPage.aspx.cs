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
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if not logged in
            if (Session["email"] == null)
             {
                 Response.Redirect("Login.aspx");
             }

            //if super admin
             if (Session["accessLevel"].ToString() == "s")
             {
                 addNewAdminID.Visible = true;
                lblFindAdminID.Visible = true;
                findAdminID.Visible = true;
                editAdminID.Visible = true;
             }

             if(Session["message"] != null)
            {
                lblMessage.Text = Session["message"].ToString();
                Session["message"] = null;
            }
        }

        protected void editAdminID_Click(object sender, EventArgs e)
        {
            Session["adminToEdit"] = findAdminID.Text;
            Response.Redirect("EditAdmin.aspx");
        }
    }
}