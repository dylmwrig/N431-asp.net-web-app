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
using System.Web.Configuration;

public partial class WebUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblGreetings.Text = WebConfigurationManager.AppSettings["siteName"];
        lblStore.Text = WebConfigurationManager.AppSettings["siteStore"];

        if (Session["email"] == null)
        {
            register.Visible = true;
            login.Visible = true;
            logout.Visible = false;
            main.Visible = false;
            profile.Visible = false;
        }
        else
        {
            register.Visible = false;
            login.Visible = false;
            logout.Visible = true;
            main.Visible = true;
            profile.Visible = true;

        }


    }
}
