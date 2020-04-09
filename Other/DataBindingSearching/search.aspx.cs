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
using System.Collections;

//must include this namespace
using System.Data.SqlClient;
using System.Web.Configuration;


public partial class search: System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["email"] == null)
        {
            Response.Redirect("login.aspx");
        }

        DrpType.Items.Add(new ListItem("All", "-1"));
        DrpModel.Items.Add(new ListItem("All", "-1"));
        
       
        PopulateOrderList();
       
        if (!IsPostBack)
        {
            //connect to the database as soon as the page loads so that security questions can be loaded
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            //always use try/catch for db connections
            try
            {

                //get a list of security questions, create list items and add to the drop down list
                //See below using a data access component to replace repetitive codes
                SqlCommand cmd = new SqlCommand("select ID, type from instrumentType", con);
                con.Open();

                // https://msdn.microsoft.com/en-us/library/system.data.sqlclient.sqlcommand_methods(v=vs.110).aspx
                // Three frequently used SqlCommand methods are ExecuteReader(for retrieving an array of values), ExecuteScalar(for retrieving a single value), and ExecuteNonQuery(for insert/delete/update statements), all illustrated in this file
                SqlDataReader reader = cmd.ExecuteReader();
                DrpType.Items.Clear();
                //Add the empty row
                DrpType.Items.Add(new ListItem("All", "-1"));
                while (reader.Read())
                {
                    ListItem NewItem = new ListItem(reader["type"].ToString(), reader["ID"].ToString());
                    DrpType.Items.Add(NewItem);

                }

                con.Close();



            }
            catch (Exception err)
            {
                Response.Write("<script>alert(\"" + err.Message + "\");</script>");
                Response.Write(err.Message);
                LblMsg.Text = "Cannot submit information now. Please try again later.";

            }
            finally //must make sure the connection is properly closed
            { //the finally block will always run whether there is an error or not
                con.Close();
            }
        }

    }

    protected void PopulateOrderList()
    {
        DrpOrder.Items.Clear();
        DrpOrder.Items.Add(new ListItem("Type", "type"));
        DrpOrder.Items.Add(new ListItem("Model", "model"));
        DrpOrder.Items.Add(new ListItem("Name", "name"));
        DrpOrder.Items.Add(new ListItem("Price", "price"));
        DrpOrder.Items.Add(new ListItem("Stock Date", "stockDate"));
       
    }
    protected void PwdFormatValidate(Object sender, ServerValidateEventArgs args)
    {

        try
        {

            if (args.Value.Length >= 10)
                args.IsValid = true;
            else args.IsValid = false;

        }
        catch
        {

            args.IsValid = false;
        }

    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);

        //always use try/catch for db connecitons
        try
        {
            //compose a SQL query to retrieve information based on user selection

            string headSql = "";
            string whereSql = "where ";
            string typeSql = "";
            string modelSql = "";
            string nameSql = "";
            string priceSql = "";
            string stockDateSql = "";
            string orderSql = "";

            headSql = "select ID, name, itemNumber, type, model, stockAmount, stockDate, cost, price, description from vw_instruInfo ";

            //get the selected type value, -1 means all
            if (DrpType.SelectedItem.Value != "-1") typeSql = "TypeID = " + Int32.Parse(DrpType.SelectedItem.Value);

            //get the selected model value, -1 means all; if type is -1, model will be -1 too thus string remains empty 
            if (DrpModel.SelectedItem.Value != "-1") 
            {
                modelSql = " and model = '" + DrpType.SelectedItem.Value + "'";
            }

            //get the name pattern, always trim a textbox entry to remove white spaces around
            //Make sure change both table values and entry values to lower case when comparing to void case matches
            if (TxtName.Text.Trim() != "")
            {  if (typeSql == "" && modelSql == "") //if the first two strings are empty, this is the start of the where part, no need "And"
                    nameSql = "Lower(name) LIKE '%"+ TxtName.Text.Trim().ToLower() + "%' ";
                else nameSql = " and Lower(name) LIKE '%" + TxtName.Text.Trim().ToLower() + "%' ";

            }


            //get the price range
            if (typeSql == "" && modelSql == "" && nameSql == "") 
            {
                if (Int32.Parse(TxtPrice1.Text.Trim()) == Int32.Parse(TxtPrice2.Text.Trim())) priceSql = "  price = " + Int32.Parse(TxtPrice1.Text.Trim());
                else priceSql = " price >= " + Int32.Parse(TxtPrice1.Text.Trim()) + " and price <= " + Int32.Parse(TxtPrice2.Text.Trim());

            }
            else
            {
                if (Int32.Parse(TxtPrice1.Text.Trim()) == Int32.Parse(TxtPrice2.Text.Trim())) priceSql = " and price = " + Int32.Parse(TxtPrice1.Text.Trim());
                else priceSql = " and price >= " + Int32.Parse(TxtPrice1.Text.Trim()) + " and price <= " + Int32.Parse(TxtPrice2.Text.Trim());
            }


            //get the stockDate, only compose the sql if the user selected a date
            if (TxtStockDate.Text.Trim()!= "")
            {
                if (rblStockDate.SelectedValue == "1") stockDateSql = " and stockDate ='" + TxtStockDate.Text.Trim()+"'";
                if (rblStockDate.SelectedValue == "2") stockDateSql = " and stockDate <= '" + TxtStockDate.Text.Trim() + "'";
                if (rblStockDate.SelectedValue == "3") stockDateSql = " and stockDate >= '" + TxtStockDate.Text.Trim() + "'";
            }

            //get the order by
          
            orderSql = " order by " + DrpOrder.SelectedItem.Text + RblOrder.SelectedValue;
            whereSql = whereSql + typeSql + modelSql + nameSql + priceSql + stockDateSql;
           // LblMsg.Text = headSql + whereSql + orderSql;
            Session["headSQL"]= headSql;
            Session["whereSQL"]= whereSql;
            Session["orderSQL"] = orderSql;
            Response.Redirect("SearchResult.aspx");

          
        }
        catch (Exception err)
        {

            LblMsg.Text = "Cannot submit information now. Please try again later.";

        }
        finally //must make sure the connection is properly closed
        { //the finally block will always run whether there is an error or not
            con.Close();
        }
    }
    protected void DrpType_Change(object sender, EventArgs e)
    {
        LblType.Text= LblType.Text + DrpType.SelectedItem.Value;
        string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);

        //always use try/catch for db connections
        try
        {

            //get a list of security questions, create list items and add to the drop down list
            //See below using a data access component to replace repetitive codes
            SqlCommand cmd = new SqlCommand("select distinct model from instrument where type = " + DrpType.SelectedItem.Value, con);
            con.Open();

            // https://msdn.microsoft.com/en-us/library/system.data.sqlclient.sqlcommand_methods(v=vs.110).aspx
            // Three frequently used SqlCommand methods are ExecuteReader(for retrieving an array of values), ExecuteScalar(for retrieving a single value), and ExecuteNonQuery(for insert/delete/update statements), all illustrated in this file
            SqlDataReader reader = cmd.ExecuteReader();
            DrpModel.Items.Clear();
            DrpModel.Items.Add(new ListItem("All", "-1"));
            while (reader.Read())
            {
                ListItem NewItem = new ListItem(reader["model"].ToString(), reader["model"].ToString());
                DrpModel.Items.Add(NewItem);
                //DrpSq2.Items.Add(NewItem);
            }
            reader.Close();
            con.Close();



        }
        catch (Exception err)
        {
            Response.Write("<script>alert(\"" + err.Message + "\");</script>");
            Response.Write(err.Message);
            LblMsg.Text = "Cannot submit information now. Please try again later.";

        }
        finally //must make sure the connection is properly closed
        { //the finally block will always run whether there is an error or not
            con.Close();
        }


    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TxtStockDate.Text = cldStockDate.SelectedDate.ToString();
    }
}