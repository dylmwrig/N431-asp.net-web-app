using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.Web.Configuration;

public partial class admHome : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblAdmGreetings.Text = WebConfigurationManager.AppSettings["siteName"] + "<br />" + WebConfigurationManager.AppSettings["siteWelcome"];

    }
}
