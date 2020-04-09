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


public partial class flute : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {   
        
    }
    protected void fluteGrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        int index = fluteGrid.SelectedIndex;
        string itemNumber = (string)fluteGrid.SelectedDataKey.Values["itemNumber"];

        string itemName = fluteGrid.SelectedRow.Cells[0].Text;
        string model = fluteGrid.SelectedRow.Cells[2].Text;
        string price = (string)fluteGrid.SelectedRow.Cells[3].Text;
        LblMsg.Text = "You have selected " + itemName + " " + itemNumber + " " + model + ", at the price of " + price;
    }


   
}
