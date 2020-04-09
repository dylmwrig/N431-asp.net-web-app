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
        private SqlConnection con;
        private String cs;

        public InstrumentDB()
        {
            cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            con = new SqlConnection(cs);
        }

       
        public Instrument GetInstrumentByID(int ID)
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
                        (string)reader["model"], (string)reader["type"], (int)reader["price"], (string)reader["description"]);
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
        public List<Instrument> GetInstrumentsByType(string instruType)
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
        public List<Instrument> GetAllFlute()
        {

            //SqlConnection con = new SqlConnection(con);
            SqlCommand cmd = new SqlCommand("sp_getAllFlute", con);
            cmd.CommandType = CommandType.StoredProcedure;


            // Create a collection for all the instrument records.
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
     //this method is used in the UpdateMethod in ObjectDataSource. The parameter list must match with the parameters used in the selectMethod. See flute.aspx Ln26
        public void updateFlute(int ID, string name, string itemNumber, string model, decimal price, string description)
        {

             /****************** ASP.NET transaction handling ***********************/
            //Notice that the two commands must both be executed or none should be execute. Thus must wrap inside a transaction
            //This can also be achieved by writing a stored procedure which contains two update statements. There must be transaction handling inside the stored procedure.
            string sql = "update instrument set name = '" + name + "', type = 3, itemNumber = '" + itemNumber + "', model = '" + model +  "', description = '" + description + "' where id = " + ID;
            SqlCommand cmd1 = new SqlCommand(sql, con);

            string sql2 = "update instruStock set price = " + price + " where instruID = " + ID;
            SqlCommand cmd2 = new SqlCommand(sql2, con);

            SqlTransaction tran = null;

            try
            {
                con.Open();
                tran = con.BeginTransaction();

                //enlist two commands in the transaction
                cmd1.Transaction = tran;
                cmd2.Transaction = tran;

                cmd1.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();

               //commit the transaction
                tran.Commit();


            }
            catch (SqlException err)
            {
                //Rollback the transaction if there is an error
                tran.Rollback();

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
