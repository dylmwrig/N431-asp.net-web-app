using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;


/// <summary>
/// Summary description for Customer
/// This class describes a Customer object
/// </summary>
public class Customer
{   
private string fName;
private string lName;
private string email;
private string pwd;
private string sq1;
private string sa1;
private string sq2;
private string sa2;
private Array transactions;



	public Customer(string fn, string ln, string em, string pwd, string sq1, string sa1, string sq2, string sa2)
	{//using properties to set the member variables
        Fname = fn;
        Lname = ln;
        Email = em;
        Pwd = pwd;
        Sq1 = sq1;
        Sa1 = sa1;
        Sq2 = sq2;
        Sa2 = sa2;

	}

    public string Fname
    {

        get { return fName; }
        set { fName = value; }
    }
    public string Lname
    {

        get { return lName; }
        set { lName = value; }
    }
    public string Email
    {

        get { return email; }
        set { email = value; }
    }
    public string Pwd
    {

        get { return pwd; }
        set { pwd = value; }
    }

    public string Sq1
    {

        get { return sq1; }
        set { sq1 = value; }
    }
    public string Sa1
    {

        get { return sa1; }
        set { sa1 = value; }
    }
    public string Sq2
    {

        get { return sq1; }
        set { sq1 = value; }
    }
    public string Sa2
    {

        get { return sa2; }
        set { sa2 = value; }
    }


}
