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


public partial class main : System.Web.UI.Page
{
    string uname = "";
    protected void Page_Load(object sender, EventArgs e)
    {   
        string v1 = Request.QueryString["fn"];
        string v2 = Request.QueryString["em"];
        if ((v1==null) && (v2==null))
        {   //this will be replaced later with Session variables so it can be handled better.
            //It should happen that if the user clicks on the my account link after logging in, they will be taken to the main page.
            //But if they click on the link without loggin in, they will be taken to the login page.
            //Right now, if the user clicks on the My Account link any time, it will go to the login page.
            Response.Redirect("login.aspx");
        }
        if (v1 != null)
        {
            LblMsg.Text = "Welcome " + v1 + " !";

        }
        
        
        if (v2 != null)
        {
            uname = v2;

        }

      
        DisplayTransaction(uname);

    }

    
    //this function will pull a list of transactions from this user
    protected void DisplayTransaction(string userName)
    {
       
            HtmlTable transTable = new HtmlTable();
            transTable.Border = 1;
            transTable.CellPadding = 3;
            transTable.CellSpacing = 3;
            transTable.BorderColor = "Gray";

            HtmlTableRow row;
            HtmlTableCell cell;
            int rowCount=0;
            
            //create the header row and add to the table
            row = new HtmlTableRow();
            cell = new HtmlTableCell();
            cell.InnerHtml = "<b>Date of Sale</b>";
            cell.Height = "25px";
            cell.Width = "100px";
            row.Cells.Add(cell);
            cell = new HtmlTableCell();
            cell.InnerHtml = "<b>Item Name</b>";
            cell.Height = "20px";
            cell.Width = "100px";
            row.Cells.Add(cell);
            cell = new HtmlTableCell();
            cell.InnerHtml = "<b>Item Number</b>";
            cell.Height = "20px";
            cell.Width = "100px";
            row.Cells.Add(cell);
            cell = new HtmlTableCell();
            cell.InnerHtml = "<b>Price</b>";
            cell.Height = "20px";
            cell.Width = "80px";
            row.Cells.Add(cell);
            transTable.Rows.Add(row);
           
           
            int count = 0;
            count = CustomerDB.GetOneInt("select count(*) from vw_customerTransaction where email = '" + userName + "'");

            if (count == 0)
            {//no transaction, create an empty row 
                row = new HtmlTableRow();
                cell = new HtmlTableCell();
                cell.InnerHtml = "No transactions.";
                cell.ColSpan = 4;
                cell.Height = "20px";
                row.Cells.Add(cell);
                transTable.Rows.Add(row);
                PnlTable.Controls.Add(transTable);
              
            }
            else
            {


                ArrayList res = new ArrayList();
                res = CustomerDB.GetRows("select saleDate,name,itemNumber, priceSold from vw_customerTransaction where email = '" + userName + "'");
              
               
                for (int j=0; j<res.Count; j++)
                {
                    rowCount++;
                    //create a new row
                    row = new HtmlTableRow();

                    row.BgColor = (rowCount % 2 == 0 ? "white" : "#cccccc");

                    //now loop through each row to get the cell content
                    ArrayList oneRow = new ArrayList();
                    oneRow = (ArrayList)res[j];
                   
                  for (int field = 0; field < oneRow.Count; field++)
                    {
                        //create a cell and set the content
                        cell = new HtmlTableCell();
                        //each row will show the transaction date, item number and price

                      
                        cell.InnerHtml = oneRow[field].ToString();
                        row.Cells.Add(cell);
                    }
                    //add the row to the table
                    transTable.Rows.Add(row);
                }
                //add the table to the panel
                PnlTable.Controls.Add(transTable);
               
            }
     
    }
   
}
