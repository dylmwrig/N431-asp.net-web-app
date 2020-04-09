using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

//must include this namespace

namespace Capstone2nd
{
    public partial class NewProgram : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            form2.Visible = false;
            if (Session["email"] == null)
            {
                Response.Redirect("login.aspx");
            }

            //connect to the database as soon as the page loads so that security questions can be loaded
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            //always use try/catch for db connections
            try
            {

                //get a list of security questions, create list items and add to the drop down list
                //See below using a data access component to replace repetitive codes

                if (!IsPostBack)
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM FieldOfStudy", con);
                    con.Open();

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            subject.Items.Add(NewItem);
                        }
                    }
                    con.Close();

                    cmd = new SqlCommand("SELECT * FROM Grades", con);
                    con.Open();

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            grade.Items.Add(NewItem);
                        }
                    }
                    con.Close();

                    cmd = new SqlCommand("SELECT * FROM Residental", con);
                    con.Open();

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            Progdescription.Items.Add(NewItem);
                        }
                    }
                    con.Close();

                    cmd = new SqlCommand("SELECT * FROM ProgramCost", con);
                    con.Open();

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            radioCost.Items.Add(NewItem);
                        }
                    }
                    con.Close();

                    cmd = new SqlCommand("SELECT * FROM Stipend", con);
                    con.Open();

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            stipendlist.Items.Add(NewItem);
                        }
                    }
                    con.Close();

                    cmd = new SqlCommand("SELECT * FROM Duration", con);
                    con.Open();

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            Progduration.Items.Add(NewItem);
                        }
                    }
                    con.Close();

                    cmd = new SqlCommand("SELECT * FROM Season", con);
                    con.Open();

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            Season.Items.Add(NewItem);
                        }
                    }
                    con.Close();

                    cmd = new SqlCommand("SELECT * FROM ServiceArea", con);
                    con.Open();

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            ServiceArea.Items.Add(NewItem);
                        }
                    }
                    con.Close();
                }

            }

            catch (Exception err)
            {
                Response.Write("<script>alert(\"" + err.Message + "\");</script>");
                Response.Write(err.Message);
                lblMessage.Text = "Cannot submit information now. Please try again later.";

            }
            finally //must make sure the connection is properly closed
            { //the finally block will always run whether there is an error or not
                con.Close();
            }

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            string uname = Session["email"].ToString();

            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            //always use try/catch for db connections
            try
            {
                con.Open();
                SqlCommand cmd;
                int findUserID = 0;

                if (Session["userType"].ToString() == "ProgramManager")
                {
                    cmd = new SqlCommand("SELECT progManagerID FROM ProgramManager WHERE email = @ManagerEmail;", con);
                    cmd.Parameters.Add(new SqlParameter("@ManagerEmail", uname));
                    findUserID = (int)cmd.ExecuteScalar();
                }

                if (Session["userType"].ToString() == "Admin")
                {
                    cmd = new SqlCommand("SELECT adminID FROM Admin WHERE email = @adminEmail;", con);
                    cmd.Parameters.Add(new SqlParameter("@adminEmail", uname));
                    findUserID = (int)cmd.ExecuteScalar();
                }

                cmd = new SqlCommand("INSERT INTO ContactPerson (firstName, email, phone) VALUES (@firstname, @email, @phone);", con);
                cmd.Parameters.Add(new SqlParameter("@firstname", proContact.Text));
                cmd.Parameters.Add(new SqlParameter("@email", proContactEmail.Text));
                cmd.Parameters.Add(new SqlParameter("@phone", proContactPhone.Text.Replace("+", "").Replace(" ", "").Replace("(", "").Replace(")", "").Replace("-", "")));
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("Select contactID FROM ContactPerson WHERE firstName = @contactname;", con);
                cmd.Parameters.Add(new SqlParameter("@contactname", proContact.Text));

                int contactID = (int)cmd.ExecuteScalar();

                String sql = "INSERT INTO Program (progManagerID, name, acronym, contactID, resiID, programCostID, durationID, seasonID, " +
                    "serviceAreaID, stipendID, addNotes, appDeadline, eligibilityRes, streetAddress, progWebsite, progDescription) VALUES" +
                    "(@findUserID, @progname, @acronym, @progContact, @resident, @cost, @duration, @season, @serviceArea, @stipend, " +
                    "@notes, @deadline, @eligibility, @address, @website, @description);";


                cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add(new SqlParameter("@findUserID", findUserID));
                cmd.Parameters.Add(new SqlParameter("@progname", pname.Text));
                cmd.Parameters.Add(new SqlParameter("@acronym", acnym.Text));
                cmd.Parameters.Add(new SqlParameter("@progContact", contactID));
                cmd.Parameters.Add(new SqlParameter("@resident", (Progdescription.SelectedIndex + 1)));
                cmd.Parameters.Add(new SqlParameter("@cost", (radioCost.SelectedIndex + 1)));
                cmd.Parameters.Add(new SqlParameter("@duration", (Progduration.SelectedIndex + 1)));
                cmd.Parameters.Add(new SqlParameter("@season", (Season.SelectedIndex + 1)));
                cmd.Parameters.Add(new SqlParameter("@serviceArea", (ServiceArea.SelectedIndex + 1)));
                cmd.Parameters.Add(new SqlParameter("@stipend", (stipendlist.SelectedIndex + 1)));
                cmd.Parameters.Add(new SqlParameter("@notes", Additional_Notes.Text));
                cmd.Parameters.Add(new SqlParameter("@deadline", AppDeadline.Text));
                cmd.Parameters.Add(new SqlParameter("@eligibility", elig.Text));
                cmd.Parameters.Add(new SqlParameter("@address", StreetAddress.Text));
                cmd.Parameters.Add(new SqlParameter("@website", ProgramSite.Text));
                cmd.Parameters.Add(new SqlParameter("@description", ProgDes.Text));
                cmd.ExecuteNonQuery();

                form1.Visible = false;
                form2.Visible = true;

                output.Text = "Program Information Submitted Successfully!";

                con.Close();

            }

            catch (Exception err)
            {
                Response.Write("<script>alert(\"" + err.Message + "\");</script>");
                Response.Write(err.Message);
                lblMessage.Text = "Cannot submit information now. Please try again later.";

            }
            finally //must make sure the connection is properly closed
            { //the finally block will always run whether there is an error or not
                con.Close();
            }

        }

        protected void Confirm_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void list_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (subject.Text == "other")
            {   //If Program Manager is selected prompt role field and label
                lbother.Visible = true;
                other.Visible = true;
            }

            if (Progdescription.SelectedIndex == 2)
            {   //If Program Manager is selected prompt role field and label
                lbresidentother.Visible = true;
                residentother.Visible = true;
            }

            if (radioCost.SelectedIndex == 1)
            {   //If Program Manager is selected prompt role field and label
                explainlabel.Visible = true;
                exp.Visible = true;
            }

            if (UniAff.Text == "Yes")
            {   //If Program Manager is selected prompt role field and label
                unilabel.Visible = true;
                uni.Visible = true;
            }

            if (OutReach.Text == "Yes")
            {   //If Program Manager is selected prompt role field and label
                companylabel.Visible = true;
                company.Visible = true;
            }

            if (ServiceArea.Text == "other")
            {   //If Program Manager is selected prompt role field and label
                serviceareaotherlabel.Visible = true;
                serviceareaother.Visible = true;
            }
        }
    }
}