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


public partial class product : System.Web.UI.Page
{
    string type = "";
    string itemNumber = "";

    protected void Page_Load(object sender, EventArgs e)
    {
       type = Request.QueryString["t"];
       itemNumber = Request.QueryString["item"];

       findDetail(); 
       this.DataBind();

    }
    protected void findDetail()
    {
        if (type == "i")
        {
            Instrument ins = InstrumentDB.GetInstrumentByItemNumber(itemNumber);
            lblItemNumber.Text = ins.ItemNumber;
            lblModel.Text = ins.Model;
            lblDesc.Text = ins.Description;
            lblPrice.Text = "Price: $" + ins.Price;
            lblName.Text = ins.Name;

        }

    }
    protected string ItemNumber
    {
        get { return itemNumber; }

        set {value = itemNumber;}

    }
}
