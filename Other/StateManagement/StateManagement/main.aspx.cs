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
using System.Web.SessionState;
using System.Collections.Generic;


public partial class main : System.Web.UI.Page
{
    string uname = "";
    string fname = "";

    protected void Page_Load(object sender, EventArgs e)
    {
      

         //use cookies to get information
       string v1 = "";
        string v2 = "";
        HttpCookie cookie = Request.Cookies["Name"];
        if (cookie != null) //need to check in case the user disabled cookies
        {
            v1 = cookie["fn"];
            v2 = cookie["em"];
        }
        /*if ((v1=="") && (v2==""))
        {   //this will be replaced later with Session variables so it can be handled better.
            //It should happen that if the user clicks on the my account link after logging in, they will be taken to the main page.
            //But if they click on the link without loggin in, they will be taken to the login page.
            //Right now, if the user clicks on the My Account link any time, it will go to the login page.
            Response.Redirect("login.aspx");
        }*/
        if (v1 != null)
        {
           // LblMsg.Text = "Welcome " + v1 + " !";
            fname = v1;

        }
        
        
        if (v2 != null)
        {
            uname = v2;
            hiddenEmail.Text = uname;
        }

        this.DataBind(); //must call this method in order to do single-value binding
      
        

        

        if (Session["email"] != null)
        {
            hiddenEmail.Text = (string)Session["email"];
            uname = (string)Session["email"];
            fname = CustomerDB.GetOneValue("Select fname from customer where email = '" + (string)Session["email"] + "';");

           
        }
        else Response.Redirect("login.aspx"); //if the user access the my account page without login, it will go to the login page

        //update the shopping cart
        if (Session["totalCartItems"] != null)
        {
            TxtTotal.Text = "$" + System.Convert.ToString(Cart.GetTotalAmount((List<CartItem>)Session["CartItems"]));

            //Build the table and add cart details
            HtmlTable transTable = new HtmlTable();
            transTable.Border = 1;
            transTable.CellPadding = 3;
            transTable.CellSpacing = 3;
            transTable.BorderColor = "White";

            HtmlTableRow row;
            HtmlTableCell cell;
            row = new HtmlTableRow();
            cell = new HtmlTableCell();
            int rowCount = 0;
            List<CartItem> items = (List<CartItem>)Session["CartItems"];
            cell.InnerHtml = "<b>ItemNumber</b>";
            row.Cells.Add(cell);
            cell = new HtmlTableCell();
            cell.InnerHtml = "<b>Quantity</b>";
            row.Cells.Add(cell);
            transTable.Rows.Add(row);
            for (int i = 0; i < items.Count; i++)
            {
                row = new HtmlTableRow();
               
                cell = new HtmlTableCell();
                cell.Width = "100px";
                cell.InnerHtml = items[i].ItemNumber;
                row.Cells.Add(cell);

                cell = new HtmlTableCell();
                cell.Width = "100px";
                cell.InnerHtml = "1";
                row.Cells.Add(cell);

                transTable.Rows.Add(row);

            }
            LstItems.Controls.Add(transTable);

        }
        else LstMsg.Text = "No Items in Cart"; 
          
    }

    //This method is created to enable single value data binding
    protected string FirstName
    {
        get { return fname; }
    }

    //This method is created to enable single value data binding
    protected string getDate()
    {
        return DateTime.Now.ToString();
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
                cell.InnerHtml = "No transactions found.";
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
