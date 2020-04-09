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



 public class CustomerDB
 {
        public static SqlConnection con;
        public static String cs;

        static CustomerDB()
        {
            cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            con = new SqlConnection(cs);
        }

        public static Boolean VerifyEmail(string em)
        {
            try
            {
                con.Open();
                string sql = "select count(*) from customer where email = '" + em + "'";
                SqlCommand cmd = new SqlCommand(sql, con);

                int count = (int)cmd.ExecuteScalar();

                con.Close();

                if (count == 0)
                    return false;
                else return true;
            }
            catch (Exception err)
            {
                err.ToString();
                return false;
            }
            finally
            {
                con.Close();

            }
        }

        public static Boolean VerifyCustomer(string em, string pwd)
        {
            try
            {
                con.Open();
                string sql = "select count(*) from customer where email = '" + em + "' and pwd='"+pwd+"'";
                SqlCommand cmd = new SqlCommand(sql, con);

                int count = (int)cmd.ExecuteScalar();

                con.Close();

                if (count == 0)
                    return false;
                else return true;
            }
            catch (Exception err)
            {
                err.ToString();
                return false;
            }
            finally
            {
                con.Close();

            }
        }
        public static int GetIdByEmail(string em)
        {
            try
            {
                string sql = "select ID from customer where email = '" + em + "'";
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);

                int id = (int)cmd.ExecuteScalar();

                con.Close();

                return id;
            }
            catch (Exception err)
            {
                err.ToString();
                return -1;
            }
            finally
            {
                con.Close();

            }
        }

        public static string GetPwd(string em)
        {
            try
            {
                string sql = "select pwd from customer where email = '" + em + "'";
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);

                string pwd = (string)cmd.ExecuteScalar();

                con.Close();

                return pwd;
            }
            catch (Exception err)
            {
                err.ToString();
                return "";
            }
            finally
            {
                con.Close();
                
            }
        }

        public static string GetOneValue(string sql)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                
                string value = (string)cmd.ExecuteScalar();

                con.Close();

                return value;
            }
            catch (Exception err)
            {
                err.ToString();
                return "";
            }
            finally
            {
                con.Close();
                
            }
        }

        public static int GetOneInt(string sql)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);

                int value = (int)cmd.ExecuteScalar();

                con.Close();

                return value;
            }
            catch (Exception err)
            {
                err.ToString();
                return -9999;
            }
            finally
            {
                con.Close();
                
            }
        }

        public static ArrayList GetOneRow(string sql)
        {
            try
            {
                ArrayList res = new ArrayList();
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);


                SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.SingleRow);


                reader.Read();
                for (int field = 0; field < reader.FieldCount; field++)
                {
                    string oneValue = reader.GetValue(field).ToString();

                    res.Add(oneValue);
                }


                reader.Close();

                con.Close();

                return res;
            }
            catch (Exception err)
            {
                err.ToString();
                ArrayList r = new ArrayList();
                return r;
            }
            finally
            {
                con.Close();
                
            }

        }

        public static ArrayList GetRows(string sql)
        {
            
            try
            {
                ArrayList res = new ArrayList();
                con.Open();
                
                SqlCommand cmd = new SqlCommand(sql, con);


                SqlDataReader reader = cmd.ExecuteReader();
                // int rowCount = 0;
                while (reader.Read())
                {
                    ArrayList row = new ArrayList();
                    for (int field = 0; field < reader.FieldCount; field++)
                    {
                        string oneValue = reader.GetValue(field).ToString();

                        row.Add(oneValue);
                    }
                    //add the row to the table
                    res.Add(row);
                    //rowCount++;
                }
                reader.Close();
                con.Close();

                return res;
            }
            catch (Exception err)
            {
                err.ToString();
                ArrayList r = new ArrayList();
                return r;
            }
            finally
            {
                con.Close();
                
            }
        }
     /* 
       [DataObjectMethod(DataObjectMethodType.Select, false)]
     public static Customer GetRegistration(int ID)
       {
           SqlCommand cmd = new SqlCommand("GetRegistration", con);
           cmd.CommandType = CommandType.StoredProcedure;

           cmd.Parameters.Add(new SqlParameter("@EmployeeID", SqlDbType.Int, 4));
           cmd.Parameters["@EmployeeID"].Value = employeeID;

           try
           {
               
               con.Open();

               SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.SingleRow);

               // Get the first row.
               reader.Read();
               EmployeeDetails emp = new EmployeeDetails(
                   (int)reader["EmployeeID"], (string)reader["FirstName"],
                   (string)reader["LastName"], (string)reader["TitleOfCourtesy"]);
               reader.Close();
               return emp;
           }
           catch (Exception err)
           {
               err.ToString();
               throw new ApplicationException("Database error.");
           }
           finally
           {
               con.Close();

           }
       }

    */



 }
