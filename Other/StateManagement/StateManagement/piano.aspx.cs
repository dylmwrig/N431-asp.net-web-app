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
using System.Collections.Generic;
using System.Web.SessionState;

public partial class piano : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {   
        
    }
    protected void pianoGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
       // LblMsg.Text = "You have selected " + e.CommandArgument;


        if (e.CommandName == "addToCart")
        {   string[] arrArguments = new string[2];
            arrArguments = e.CommandArgument.ToString().Split(',');

            string iNumber  = arrArguments[0];
            string price = arrArguments[1];
            string name = arrArguments[2];
            //create a new item and add to session items array
            CartItem it = new CartItem(iNumber, System.Convert.ToDecimal(price), name);
            if (Session["CartItems"] != null)
            {
                List<CartItem> currentList = (List<CartItem>)Session["CartItems"];
                currentList.Add(it);
                Session["CartItems"] = currentList;
                int c = (int)Session["totalCartItems"];
                c = c + 1;
                Session["totalCartItems"] = c;
            }
            else
            {
                List<CartItem> newList = new List<CartItem>();
                newList.Add(it);
                Session["CartItems"] = newList;
                Session["totalCartItems"] = 1;

            }
            //LblMsg.Text = "You have selected " + Session["totalCartItems"];

        }
    }



    
}
