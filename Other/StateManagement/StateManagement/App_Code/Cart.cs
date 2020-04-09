using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections;
using System.ComponentModel;
using System.Collections.Generic;
using System.Web.SessionState;

/// <summary>
/// Summary description for DB
/// This is the utility class for database operations
/// </summary>
/// 



 public class Cart
 {
       

     private int totalItems;
     private decimal totalAmount;
     private string shippingMethod;
     private string shippingAddress;
     private Customer customer;
     private List<CartItem> cartItems;
        
     public Cart()
     {
           
     }

     public Cart(int t)
     {

         this.totalItems = t;
         this.totalAmount = 0.00m;
         shippingMethod = "";
         shippingAddress = "";
         cartItems = new List<CartItem>();


     }


      

        
     public int TotalItems
     {
            get { return totalItems; }
            set { totalItems = value; }
     }
     public decimal TotalAmount
     {
         get { return totalAmount; }
         set { totalAmount = value; }
     } 
     
     public List<CartItem> GetCartItems()
     {   List<CartItem> items = new List<CartItem>(); 
         //yet to fill details here
         return items;

     }

     public static decimal GetTotalAmount(List<CartItem> citems)
     {
         //List<CartItem> citems = new List<CartItem>();
         decimal total = 0.00m;
         for (int i = 0; i<citems.Count; i++){
             CartItem ct = citems[i];
             total = total + ct.Price;

         }

         return total;
     }
     public void AddItem(CartItem one)
     {
         cartItems.Add(one);
     }
 }
