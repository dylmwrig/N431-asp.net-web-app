using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone2nd
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("login.aspx");
            }

            //else prompt home page
            lblHello.Text = "Hello " + Session["firstName"].ToString() + " " + Session["middleName"].ToString() + " " + Session["lastName"].ToString() + "!";
        }
    }
}