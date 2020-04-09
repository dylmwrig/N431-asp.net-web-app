﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
//using System.Xml.Linq;

public partial class FooterUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) RefreshTime();
    }


    protected void inlTime_Click(object sender, EventArgs e)
    {
        RefreshTime();
    }

    public void RefreshTime()
    {
        lnkTime.Text = DateTime.Now.ToLongTimeString();
    }
}
