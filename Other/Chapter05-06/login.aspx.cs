using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {   
        string name = Session["Name"].ToString();
        string empID = Session["EmpID"].ToString();
        string email = Session["Email"].ToString();
        string pwd = Session["Password"].ToString();
        
        //or
       /* string name = Request.QueryString["n"];
        string empID = Request.QueryString["e"];
        string email = Request.QueryString["m"];
        string pwd = Request.QueryString["p"];
        */
        lblMsg.InnerHtml = "The submitted info is: <br/>Name:" + name + "<br/>Employee ID:" + empID + "<br/>Email:" + email + "<br/>Password:" + pwd;
        lblMsg.InnerHtml = lblMsg.InnerHtml + "<br /><br /> Thank you for registering. Please login with registered information.";
    }
}