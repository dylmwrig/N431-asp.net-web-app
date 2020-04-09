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



 public class Instrument
 {
        //private SqlConnection con;
       // private String cs;
        private int id;
        private string name;
        private string itemNumber;
        private string model;
        private decimal price;
        private string type;
        private string desc;


        
     public Instrument()
     {
           // cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
           // con = new SqlConnection(cs);
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
     public Instrument(int i, string n,string iNum, string m,string t,  decimal p, string d)
            
     {
                
         this.id = i;
         this.name = n;
         this.model = m;
         this.itemNumber = iNum;
         this.type = t;
         this.price = p;
         this.desc = d;

           
     }

            //public Instrument() { }
      



 }
