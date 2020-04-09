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
using System.Runtime.InteropServices;


public partial class SearchResult : System.Web.UI.Page
{
    string uname = "";
    string fname = "";

    protected void Page_Load(object sender, EventArgs e)
    {  
        if (Session["email"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {

            //using data binding features to replace this function
          DisplayTransaction(Session["headSQL"].ToString(), Session["whereSQL"].ToString(), Session["orderSQL"].ToString());

        }
    }



    //This method is created to enable single value data binding
    protected string FirstName
    {
        get { return fname; }

    }

    protected string getFirstName()
    {
        return fname;
    }


    //This method is created to enable single value data binding
    protected string getDate()
    {
        return DateTime.Now.ToString();
    }

    //this function will pull a list of transactions from this user
    //three sql clauses must be sent as they are used because order by cannot be used in the count(*) statement
    protected void DisplayTransaction(string headSql, string whereSql, string orderSql)
    {
        //headSql is "select ID, name, itemNumber, type, model, stockAmount, stockDate, cost, price, description from vw_instruInfo ";
        //whereSql defines the where clause

        int count = 0;
        count = CustomerDB.GetOneInt("select count(*) from vw_instruInfo " + whereSql);
        //LblMsg.Text = "select count(*) from vw_instruInfo " + whereSql + orderSql;
        if (count == 0)
        {//no transaction, create an empty row 
            LblMsgNoResult.Text = "No Result is Found";

        }
        else
        {

            ArrayList res = new ArrayList();
            res = CustomerDB.GetRows(headSql + whereSql + orderSql);
          //  LblMsg.Text = headSql + whereSql + orderSql;

            for (int j = 0; j < res.Count; j++)
            {
                //loop through each row to get the content and create a panel to add to the web page
                ArrayList oneRow = new ArrayList();
                oneRow = (ArrayList)res[j];
                Panel panel = new Panel();
                //use unique IDs to dynamically create new web object to gurantee that each object has a unique ID
                panel.ID = "pnlResult"+ oneRow[0].ToString();
                
                Label lblName = new Label();
                lblName.ID = "lblName" + oneRow[0].ToString();
                lblName.Text = "Name:";
                lblName.Height = 20;
                lblName.Font.Size = 13;
                lblName.ForeColor = System.Drawing.Color.Red;
                panel.Controls.Add(lblName);

                Label lblNameValue = new Label();
                lblNameValue.ID = "lblNameValue" + oneRow[0].ToString();
                lblNameValue.Height = 18;
                lblNameValue.Font.Size = 12;
                lblNameValue.ForeColor = System.Drawing.Color.Black;
                lblNameValue.Text = oneRow[1].ToString();
                panel.Controls.Add(lblNameValue);

                Label lblItemNumber = new Label();
                lblItemNumber.ID = "lblItemNumber" + oneRow[0].ToString();
                lblItemNumber.Text = "Item Number:";
                lblItemNumber.Height = 20;
                lblItemNumber.Font.Size = 13;
                lblItemNumber.ForeColor = System.Drawing.Color.Red;
                panel.Controls.Add(lblItemNumber);

                Label lblItemNumberValue = new Label();
                lblItemNumberValue.ID = "lblItemNumberValue" + oneRow[0].ToString();
                lblItemNumberValue.Height = 18;
                lblItemNumberValue.Font.Size = 12;
                lblItemNumberValue.ForeColor = System.Drawing.Color.Black;
                lblItemNumberValue.Text = oneRow[2].ToString();
                panel.Controls.Add(lblItemNumberValue);

                Label lblType = new Label();
                lblType.ID = "lblType" + oneRow[0].ToString();
                lblType.Text = "Type:";
                lblType.Height = 20;
                lblType.Font.Size = 13;
                lblType.ForeColor = System.Drawing.Color.Red;
                panel.Controls.Add(lblType);

                Label lblTypeValue = new Label();
                lblTypeValue.ID = "lblItemNumberValue" + oneRow[0].ToString();
                lblTypeValue.Height = 18;
                lblTypeValue.Font.Size = 12;
                lblTypeValue.ForeColor = System.Drawing.Color.Black;
                lblTypeValue.Text = oneRow[3].ToString();
                panel.Controls.Add(lblTypeValue);


                Label lblModel = new Label();
                lblModel.ID = "lblModel" + oneRow[0].ToString();
                lblModel.Text =  "Model:";
                lblModel.Height = 20;
                lblModel.Font.Size = 13;
                lblModel.ForeColor = System.Drawing.Color.Red;
                panel.Controls.Add(lblModel);

                Label lblModelValue = new Label();
                lblModelValue.ID = "lblModelValue" + oneRow[0].ToString();
                lblModelValue.Height = 18;
                lblModelValue.Font.Size = 12;
                lblModelValue.ForeColor = System.Drawing.Color.Black;
                lblModelValue.Text = oneRow[4].ToString();
                panel.Controls.Add(lblModelValue);


                Label lblPrice = new Label();
                lblPrice.ID = "lblPrice" + oneRow[0].ToString();
                lblPrice.Text = "Price:";
                lblPrice.Height = 20;
                lblPrice.Font.Size = 13;
                lblPrice.ForeColor = System.Drawing.Color.Red;
                panel.Controls.Add(lblPrice);

                Label lblPriceValue = new Label();
                lblPriceValue.ID = "lblPriceValue" + oneRow[0].ToString();
                lblPriceValue.Height = 18;
                lblPriceValue.Font.Size = 12;
                lblPriceValue.ForeColor = System.Drawing.Color.Black;
                lblPriceValue.Text = oneRow[8].ToString();
                panel.Controls.Add(lblPriceValue);


                Label lblDescription = new Label();
                lblDescription.ID = "lblDescription" + oneRow[0].ToString();
                lblDescription.Text = "Description:";
                lblDescription.Height = 20;
                lblDescription.Font.Size = 13;
                lblDescription.ForeColor = System.Drawing.Color.Red;
                panel.Controls.Add(lblDescription);

                Label lblDescriptionValue = new Label();
                lblDescriptionValue.ID = "lblDescriptionValue" + oneRow[0].ToString();
                lblDescriptionValue.Height = 18;
                lblDescriptionValue.Font.Size = 12;
                lblDescriptionValue.ForeColor = System.Drawing.Color.Black;
                lblDescriptionValue.Text = oneRow[9].ToString();
                panel.Controls.Add(lblDescriptionValue);

                panel.BorderWidth = Unit.Pixel(5);

                PnlTrans.Controls.Add(panel);
                

            }
            
        }

    }


  
}