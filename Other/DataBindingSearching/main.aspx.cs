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


public partial class main : System.Web.UI.Page
{
    string uname = "";
    string fname = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else {
            pnlDownload.Visible = false;
            uname = Session["email"].ToString();
            fname = Session["firstName"].ToString();
            hiddenEmail.Text = uname;
            Page.DataBind(); //must call this method in order to do single-value binding
            //or this.DataBind();

            //using data binding features to replace this function
          // DisplayTransaction(uname);

            /*************************************Bind to a DataReader ****************************************/
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            //always use try/catch for db connecitons
            try
            {
                con.Open();
                string sql = "select itemNumber from vw_customerTransaction where email = '" + uname + "'";
                SqlCommand cmd = new SqlCommand(sql, con);
           
                SqlDataReader reader = cmd.ExecuteReader();

                //bind to the single column, main.aspx ln 73
                lstItem.DataSource = reader;
                lstItem.DataBind();
                reader.Close(); //must close the reader. The DataReader is a forward-only cursor. Cannot use it to bind to multiple records, thus must close the existing reader and create a new reader. 

                //bind to the grid
                sql = "select itemNumber as \"Item Number \", name, saleDate, priceSold from vw_customerTransaction where email = '" + uname + "' order by saleDate";
                SqlCommand cmd2 = new SqlCommand(sql, con);
                SqlDataReader reader2 = cmd2.ExecuteReader();
                lstItemGrid.DataSource = reader2;
                lstItemGrid.DataBind();
                reader2.Close();    
           
            }
            catch (Exception err)
            {

                LblMsg.Text = "Cannot retrieve information now. Please try again later.";

            }
            finally //must make sure the connection is properly closed
            { //the finally block will always run whether there is an error or not
                con.Close();
            
            }
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


    protected void Download_Click(object sender, EventArgs e)
    {
        pnlDownload.Visible = true;

        //create a file write to write to the file, if the doesn't exist, it will be created. If it exists, it will be overwritten.
        System.IO.StreamWriter file = new System.IO.StreamWriter(@"C:\Users\LingmaLocal\Desktop\N431\N431WebApp\DataBindingSearching/data.csv");
       
        ArrayList res = new ArrayList();
        res = CustomerDB.GetRows("select saleDate,name,itemNumber, priceSold from vw_customerTransaction where email = '" + uname + "'");
       
        //write the header line
        file.WriteLine("Date, Name, ItemNumber, Price Sold");
        //write the values
        for (int j = 0; j < res.Count; j++)
        {
            //loop through each row to get the content, create each line with values as comman seperated and write each line to the file
            ArrayList oneRow = new ArrayList();
            oneRow = (ArrayList)res[j];
            string line = "";
            for (int field = 0; field < oneRow.Count; field++)
            {
                //there should be no comma after the last value, carriage return in CSV files indicate a new row
                if (field == (oneRow.Count-1)) line = line + oneRow[field].ToString();
                else line = line + oneRow[field].ToString() + ",";
    
            }
          
            file.WriteLine(line);
        }
        file.Flush();
        file.Close();
     
        HyperLink.Text = "Click here to download CSV file";

        //replace the root URL with your local host URL or a live URL
        HyperLink.NavigateUrl = "http://localhost:50142/data.csv";

    }
}
