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

                if (count != 0) //this is an insecured way
                    return true;
                else return false;
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

        //if the paramter list is short
        public static Boolean SecureVerifyCustomer1(string em, string pwd)
        {
            try
            {
                con.Open();
                //string sql = "select count(*) from customer where email = '" + em + "' and pwd='" + pwd + "'";

                //Create PROCEDURE [dbo].[sp_verifyCustomer]
                //@em nvarchar(100),
                //@pwd nvarchar(50)
                //AS 
                //SELECT count(*)
                //FROM customer
                //WHERE email = @em and pwd = @pwd;
                string sql = "execute sp_verifyCustomer '" + em + "','" + pwd +"'";
                SqlCommand cmd = new SqlCommand(sql, con);

                int count = (int)cmd.ExecuteScalar();

                con.Close();

                if (count == 1) //specify the exact expected number, instead of count > 0
                    return true;
                else return false;
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

        //Supply paramters, provide an OUT variable(if data need to be passed out of the call, e.g. get an autoincremented value)
        //A more standard way.
        public static Boolean SecureVerifyCustomer2(string email, string pwd)
        {
            try
            {
                con.Open();
                //string sql = "select count(*) from customer where email = '" + em + "' and pwd='" + pwd + "'";
               
                /*
                create procedure sp_verifyCustomer2
                @em nvarchar(100),
                @pwd nvarchar(50),
                @count int OUTPUT
                As
                set @count = (select count(*) from customer where email = @em and pwd=@pwd);
                 */
                SqlCommand cmd = new SqlCommand("sp_verifyCustomer2", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@em", SqlDbType.NVarChar, 100));
                cmd.Parameters["@em"].Value = email;

                cmd.Parameters.Add(new SqlParameter("@pwd", SqlDbType.NVarChar, 50));
                cmd.Parameters["@pwd"].Value = pwd;

                cmd.Parameters.Add(new SqlParameter("@count", SqlDbType.Int,4));
                cmd.Parameters["@count"].Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();

                //int c = (int)cmd.ExecuteScalar();
                int count = (int)cmd.Parameters["@count"].Value;
                con.Close();

                if (count == 1) //specify the exact expected number, instead of count > 0
                    return true;
                else return false;
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



        

    }
