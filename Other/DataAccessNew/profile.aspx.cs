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

public partial class profile : System.Web.UI.Page
{
    string fname = "";
    string lname = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        PnlEdit.Visible = false;
        if (Session["email"] == null)
        {   
            Response.Redirect("login.aspx");
        }
        else DisplayProfile(Session["email"].ToString());
    }


    //this function will pull a list of transactions from this user
    protected void DisplayProfile(string userName)
    {
        PnlDisplay.Visible = true;
        string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);

        //always use try/catch for db connecitons
        try
        {
            string sql = "select fname, lname, email from customer where Email = '" + userName + "'";
            //LblMsg.Text = sql;
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            LblFirstValue.Text= reader["fname"].ToString();
            fname = reader["fname"].ToString();
            LblLastValue.Text = reader["lname"].ToString();
            lname = reader["lname"].ToString();
            LblEmailValue.Text = reader["email"].ToString();
           // LblEmailValue.Text = userName;
        }
        catch (Exception err)
        {
            //Response.Write(err.Message);
            LblMsg.Text =  "Cannot retrieve information now. Please try again later.";
            //LblMsg.Text = err.Message;
        }
        finally //must make sure the connection is properly closed
        { //the finally block will always run whether there is an error or not
            con.Close();
        }

        

    }

    protected void BtnEdit_Click(object sender, EventArgs e)
    {
        PnlEdit.Visible = true;
        PnlDisplay.Visible = false;
        TxtFname.Text = fname;
        TxtLname.Text = lname;
    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {

        fname= TxtFname.Text;
        lname = TxtLname.Text;
        string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);

        //always use try/catch for db connecitons
        try
        {
            string sql = "update customer set fname = '" + fname + "', lname = '" + lname+"' where Email = '" + Session["Email"] + "'";
            //LblMsg.Text = sql;
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.ExecuteNonQuery();
            LblMsg.Text = "Your Information Is Submitted Successfully.";
            DisplayProfile(Session["Email"].ToString());
        }
        catch (Exception err)
        {
            //Response.Write(err.Message);
            LblEditMsg.Text = "Cannot submit information now. Please try again later.";
            //LblMsg.Text = err.Message;
        }
        finally //must make sure the connection is properly closed
        { //the finally block will always run whether there is an error or not
            con.Close();
        }

       
       
    }
}