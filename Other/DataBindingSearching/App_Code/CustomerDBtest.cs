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


/// <summary>
/// Summary description for DB
/// This is the utility class for database operations
/// </summary>
/// 

namespace Peopletest
{
    public class CustomterDBtest
    {
        public static SqlConnection con;
        public static String cs;

        public static void CustomerDB()
        {
            cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            con = new SqlConnection(cs);
        }

        public static Boolean VerifyEmail(string em)
        {
            return true;
        }
        public static string GetPwd(string em)
        {
            string sql = "select pwd from customer where email = '" + em + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            string pwd = (string)cmd.ExecuteScalar();
            return pwd;
            con.Close();
        }
    }
}