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


/// <summary>
/// Summary description for DB
/// This is the utility class for database operations
/// </summary>
/// 



 public class CartItem
 {
        //private SqlConnection con;
       // private String cs;
    private int id = 0;
    private string name = "";
    private string itemNumber = "";
    private string model = "";
    private decimal price = 0.00m;
    private string type = "";
    private string desc ="";
    private string category = "";
     private int discount = 0 ;
     private string address = "";
     private int quantity = 0;

        
     public CartItem()
     {
           
     }

     public CartItem(string i, decimal p, string n)
     {
         this.itemNumber = i;
         this.price = p;
         this.name = n;
     }
     public CartItem(int i, string n, string iNum, string m, string t, decimal p, string d, int di, string c, int q)
     {

         this.id = i;
         this.name = n;
         this.model = m;
         this.itemNumber = iNum;
         this.type = t;
         this.price = p;
         this.desc = d;
         this.discount = di;
         this.category = c;
         this.quantity = q;

     }


      

        
     public int ID
     {
            get { return id; }
            set { id = value; }
     }
        
     public string Name
     {
           get { return name; }
           set { name = value; }
     }
     public string ItemNumber
     {
         get { return itemNumber; }
         set { itemNumber = value; }
     }       
     public string Model
     {
           get { return model; }
           set { model = value; }
     }
        
     public string Type     
     {
                
         get { return type; }
                
         set { type = value; }
            
     }
     public string Description
     {

         get { return desc; }

         set { desc = value; }

     }
     public decimal Price
     {
            get { return price; }
            set { price = value; }
     }

     public int Discount
     {
         get { return discount; }
         set { discount = value; }
     }

     public string Category
     {
         get { return category; }
         set { category = value; }
     } 
    
 }
