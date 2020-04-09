<%@ Application Language="C#" %>

<script runat="server">

    void Application_OnEndRequest()
    {   //Code runs when an request is completed
        Response.Write("<hr /> This page was served at " + DateTime.Now.ToString());

    }

    // Code that runs on application startup
    void Application_Start(object sender, EventArgs e)
    {
       

    }
    //  Code that runs on application shutdown
    void Application_End(object sender, EventArgs e)
    {


    }
    // Code that runs when an unhandled error occurs  
    // Errors are normally handled on each page. In case an unhandled error occurs, it can be handled here. 
    void Application_Error(object sender, EventArgs e)
    {

        //Turn on the error at line 40 of home.aspx to see behavior

        // Response.Write("<b> The system is encountering some technical difficulties. Please come back later or contact the customer support. </b>");
        // Server.ClearError();

        //or redirect to a custom 404 page
        Response.Redirect("custom404.aspx");
    }

    // Code that runs when a new session is started
    void Session_Start(object sender, EventArgs e)
    {    
        Session["startTime"] = DateTime.Now.ToString(); //result shown on home.aspx, line 41

    }
    // Code that runs when a session ends 
    void Session_End(object sender, EventArgs e)
    {   //redirect user to the login page whenever session expires
        //session duration can be set on IIS, e.g. set to expire if application is dorman for 30 minutes
        Response.Redirect("login.aspx");
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>
