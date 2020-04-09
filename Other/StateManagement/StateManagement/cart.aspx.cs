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


public partial class cart : System.Web.UI.Page
{
   

    protected void Page_Load(object sender, EventArgs e)
    {  
        //get the session cart items

        if (Session["totalCartItems"] == null)
        {
            LblCartEmpty.Text = "Shopping Cart is Empty.";
        }
        else
        {
            if ((int)Session["totalCartItems"] == 0)
            {
                LblCartEmpty.Text = "Shopping Cart is Empty.";
                BtnUpdate.Visible = false;
            }
            else
            {
                TxtTotal.Text = "$" + System.Convert.ToString(getTotal());
                showCart();
            }

        }
       
    }



    protected decimal getTotal()
    {
        if (Session["totalCartItems"] != null)
            return Cart.GetTotalAmount((List<CartItem>)Session["CartItems"]);
        else return 0.0m;

    }

    protected void showCart()
    {
        HtmlTable transTable = new HtmlTable();
        transTable.Border = 1;
        transTable.CellPadding = 3;
        transTable.CellSpacing = 3;
        transTable.BorderColor = "White";

        HtmlTableRow row;
        HtmlTableCell cell;
        int rowCount = 0;
      
        //create the header row and add to the table
        row = new HtmlTableRow();
        cell = new HtmlTableCell();
        cell.InnerHtml = "<b>Remove</b>";
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

        cell = new HtmlTableCell();
        cell.InnerHtml = "<b>Quantity</b>";
        cell.Height = "20px";
        cell.Width = "80px";
        row.Cells.Add(cell);

        transTable.Rows.Add(row);
        

        int count = 1;
       // count = CustomerDB.GetOneInt("select count(*) from vw_customerTransaction where email = '" + userName + "'");

        if (count == 0)
        {//no transaction, create an empty row 
            row = new HtmlTableRow();
            cell = new HtmlTableCell();
            cell.InnerHtml = "No transactions found.";
            cell.ColSpan = 4;
            cell.Height = "20px";
            row.Cells.Add(cell);
            transTable.Rows.Add(row);
            PnlCartTable.Controls.Add(transTable);

        }
        else
        {
            //get the list
            List<CartItem> itemList = (List<CartItem>)Session["CartItems"];

            //loop through the list and get each item
            for (int i = 0; i < itemList.Count; i++)
            {
                rowCount++;
                //create a new row
                row = new HtmlTableRow();

                row.BgColor = (rowCount % 2 == 0 ? "white" : "#cccccc");
                CartItem oneItem = itemList[i];

                //now get the member variables from each item and add to the table display
                cell = new HtmlTableCell();
                cell.InnerHtml = "<input type=\"checkbox\" id=\"chk" + rowCount + "\"  />"; ;
                row.Cells.Add(cell);

              
                cell = new HtmlTableCell();
                cell.InnerHtml = "<a href=\"product.aspx?t=i&item=" + oneItem.ItemNumber + "\">" + oneItem.Name + "</a>";
                row.Cells.Add(cell);

                cell = new HtmlTableCell();
                cell.InnerHtml = oneItem.ItemNumber;
                row.Cells.Add(cell);

                cell = new HtmlTableCell();
                cell.InnerHtml = "$" + System.Convert.ToString(oneItem.Price);
                row.Cells.Add(cell);

                cell = new HtmlTableCell();
                cell.InnerHtml = "<input type=\"text\" value=\"1\" id=\"qn" + rowCount + "\" >";
                row.Cells.Add(cell);

                transTable.Rows.Add(row);
            }
            PnlCartTable.Controls.Add(transTable);

            

        }

        
    }

    protected void BtnUpdate_Click(Object sender, EventArgs e)
    {

    }
    
   
}
