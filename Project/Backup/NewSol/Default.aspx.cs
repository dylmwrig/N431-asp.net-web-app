using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewSol
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            form2.Visible = false;
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Submitted" + "');", true);


            }
        }

        protected void Confirm_Click(object sender, EventArgs e)
        {

        }
    }
}