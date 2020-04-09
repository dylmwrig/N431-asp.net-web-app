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

public partial class logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //destroy all session variables and redirect to home page
        Session.Abandon();

        //use an absolute URL to force a new session to be created. Watch for the session ID change when cookieless = "useUri" in the config file.
        Response.Redirect("login.aspx");
    }
    

}
