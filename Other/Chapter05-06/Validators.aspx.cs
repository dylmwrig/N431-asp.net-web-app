using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Validators : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
	protected void Submit_Click(object sender, EventArgs e)
	{
		if (Page.IsValid)
        {
            Session["Name"] = txtName.Text.Trim();
            Session["EmpID"] = txtEmpID.Value.Trim();
            Session["Email"] = txtEmail.Text.Trim();
            Session["Password"] = txtPassword.Text.Trim();
            //Response.Redirect("login.aspx");
            //or
            Response.Redirect("login.aspx?n=" + txtName.Text.Trim() + "&e=" + txtEmpID.Value.Trim() + "&m=" + txtEmail.Text.Trim() + "&p=" + txtPassword.Text.Trim());
        }
		
	}

	protected void OptionsChanged(object sender, EventArgs e)
	{
        // Examine all the validators on the back.
        foreach (BaseValidator validator in Page.Validators)
        {
            // Turn the validators on or off, depending on the value
            // of the "Validators enabled" check box (chkEnableValidators).
            validator.Enabled = chkEnableValidators.Checked;

            // Turn client-side validation on or off, depending on the value
            // of the "Client-side validation enabled" check box
            // (chkEnableClientSide).
            validator.EnableClientScript = chkEnableClientSide.Checked;
        }

        // Configure the validation summary based on the final two check boxes.
        Summary.ShowMessageBox = chkShowMsgBox.Checked;
        Summary.ShowSummary = chkShowSummary.Checked;
	}

	protected void ValidateEmpID2_ServerValidate(object source, ServerValidateEventArgs args)
	{
		try
		{
			args.IsValid = (int.Parse(args.Value) % 5 == 0);
		}
		catch
		{
			args.IsValid = false;
		}
	}
}
