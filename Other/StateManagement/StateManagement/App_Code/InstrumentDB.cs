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


/// <summary>
/// Summary description for DB
/// This is the utility class for database operations
/// </summary>
/// 



 public class InstrumentDB
 {
        public static SqlConnection con;
        public static String cs;

        static InstrumentDB()
        {
            cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            con = new SqlConnection(cs);
        }

       
        public static Instrument GetInstrumentByID(int ID)
        {
            //SqlConnection con = new SqlConnection(con);
            SqlCommand cmd = new SqlCommand("sp_getInstrumentByID", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 4));
            cmd.Parameters["@id"].Value = ID;

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.SingleRow);

                // Get the first row.
                reader.Read();
                Instrument ins = new Instrument(
                        (int)reader["ID"], (string)reader["name"], (string)reader["itemNumber"],
                        (string)reader["model"], (string)reader["type"], (decimal)reader["price"], (string)reader["description"]);
                reader.Close();
                return ins;
            }
            catch (SqlException err)
            {
                // Replace the error with something less specific.
                // You could also log the error now.
                throw new ApplicationException("Data error.");
            }
            finally
            {
                con.Close();
            }
        }
        public static Instrument GetInstrumentByItemNumber(string i)
        {
          
               

            try
            {   con.Open();
                string sql = "select * from vw_instruInfo where itemNumber = '" + i + "'";
                SqlCommand cmd = new SqlCommand(sql, con);
                
               

                SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.SingleRow);

                // Get the first row.
                reader.Read();
                Instrument ins = new Instrument(
                        (int)reader["ID"], (string)reader["name"], (string)reader["itemNumber"],
                        (string)reader["model"], (string)reader["type"], (decimal)reader["price"], (string)reader["description"]);
                reader.Close();
                return ins;
            }
            catch (SqlException err)
            {
                // Replace the error with something less specific.
                // You could also log the error now.
                throw new ApplicationException("Data error.");
            }
            finally
            {
                con.Close();
            }
        }
       // [DataObjectMethod(DataObjectMethodType.Select, true)]
        public static List<Instrument> GetInstrumentsByType(string instruType)
        {
           
            //SqlConnection con = new SqlConnection(con);
            SqlCommand cmd = new SqlCommand("sp_getInstrumentsByType", con);
            
           
            cmd.Parameters.Add(new SqlParameter("@type", SqlDbType.NVarChar, 50));
            cmd.Parameters["@type"].Value = instruType;
            cmd.CommandType = CommandType.StoredProcedure;


            // Create a collection for all the employee records.
            List<Instrument> instruments = new List<Instrument>();

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Instrument ins = new Instrument(
                        (int)reader["ID"], (string)reader["name"],(string)reader["itemNumber"],
                        (string)reader["model"], (string)reader["type"], (decimal)reader["price"], (string)reader["description"]);
                    instruments.Add(ins);
                }
                reader.Close();

                return instruments;
            }
            catch (SqlException err)
            {
                // Replace the error with something less specific.
                // You could also log the error now.
                throw new ApplicationException("Data error.");
            }
            finally
            {
                con.Close();
            }
        }
       // [DataObjectMethod(DataObjectMethodType.Select, true)]
        public static List<Instrument> GetAllFlute()
        {

            //SqlConnection con = new SqlConnection(con);
            SqlCommand cmd = new SqlCommand("sp_getAllFlute", con);
            cmd.CommandType = CommandType.StoredProcedure;


            // Create a collection for all the employee records.
            List<Instrument> instruments = new List<Instrument>();

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Instrument ins = new Instrument(
                        (int)reader["ID"], (string)reader["name"], (string)reader["itemNumber"],
                        (string)reader["model"], (string)reader["type"], (decimal)reader["price"], (string)reader["description"]);
                    instruments.Add(ins);
                }
                reader.Close();

                return instruments;
            }
            catch (SqlException err)
            {
                // Replace the error with something less specific.
                // You could also log the error now.
                throw new ApplicationException("Data error.");
            }
            finally
            {
                con.Close();
            }
        }
     /*
        public int CountEmployees()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("CountEmployees", con);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                con.Open();
                return (int)cmd.ExecuteScalar();
            }
            catch (SqlException err)
            {
                // Replace the error with something less specific.
                // You could also log the error now.
                throw new ApplicationException("Data error.");
            }
            finally
            {
                con.Close();
            }
        }

     */
 }
