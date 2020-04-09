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

public partial class ChangeEvents : System.Web.UI.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		if (!Page.IsPostBack)
		{   
			//when page loads, add additional list items to the DropDownList
            ListItem l1 = new ListItem();
            l1.Text = "March";
            l1.Value = "3";
            ddList.Items.Add(l1);

            ListItem l2 = new ListItem();
            l2.Text = "April";
            l2.Value = "4";
            ddList.Items.Add(l2);

            ListItem l3 = new ListItem();
            l3.Text = "May";
            l3.Value = "5";
            ddList.Items.Add(l3);

		}
	}

	protected void Ctrl_ServerChange(object sender, EventArgs e)
	{
		Response.Write("<li>ServerChange detected for " +
		  ((Control)sender).ID + ". Value in the textbox is \"" +txtBox.Text +"\".</li>");
	}

    protected void Check_ServerChange(object sender, EventArgs e)
    {
        Response.Write("<li>ServerChange detected for " +
          ((Control)sender).ID + ". Box checked is \"" + chkBox.Checked + "\".</li>");
    }
	protected void List1_ServerChange(object sender, EventArgs e)
	{
		Response.Write("<li>ServerChange detected for DropDownList. " +
     "The selected item is:" + ddList.SelectedItem.Value + "</li>");
		
       

	}
	protected void Submit_ServerClick(object sender, EventArgs e)
	{
		Response.Write("<li>ServerClick detected for Submit1.</li>");
        pnlEvent.Visible = false; //hide all other event objects

	}
}
