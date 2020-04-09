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
                SqlCommand cmd = new SqlCommand("SELECT * FROM FieldOfStudy", con);
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                if (!IsPostBack)
                {
                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            subject.Items.Add(NewItem);
                        }
                    }
                }
                con.Close();

                cmd = new SqlCommand("SELECT * FROM Grades", con);
                con.Open();

                reader = cmd.ExecuteReader();

                if (!IsPostBack)
                {
                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            grade.Items.Add(NewItem);
                        }
                    }
                }
                con.Close();

                cmd = new SqlCommand("SELECT * FROM Residental", con);
                con.Open();

                reader = cmd.ExecuteReader();

                if (!IsPostBack)
                {
                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            Progdescription.Items.Add(NewItem);
                        }
                    }
                }
                con.Close();

                cmd = new SqlCommand("SELECT * FROM ProgramCost", con);
                con.Open();

                reader = cmd.ExecuteReader();

                if (!IsPostBack)
                {
                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            radioCost.Items.Add(NewItem);
                        }
                    }
                }
                con.Close();

                cmd = new SqlCommand("SELECT * FROM Stipend", con);
                con.Open();

                reader = cmd.ExecuteReader();

                if (!IsPostBack)
                {
                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            stipendlist.Items.Add(NewItem);
                        }
                    }
                }
                con.Close();

                cmd = new SqlCommand("SELECT * FROM Duration", con);
                con.Open();

                reader = cmd.ExecuteReader();

                if (!IsPostBack)
                {
                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            Progduration.Items.Add(NewItem);
                        }
                    }
                }
                con.Close();

                cmd = new SqlCommand("SELECT * FROM Season", con);
                con.Open();

                reader = cmd.ExecuteReader();

                if (!IsPostBack)
                {
                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            Season.Items.Add(NewItem);
                        }
                    }
                }
                con.Close();

                cmd = new SqlCommand("SELECT * FROM ServiceArea", con);
                con.Open();

                reader = cmd.ExecuteReader();

                if (!IsPostBack)
                {
                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            ServiceArea.Items.Add(NewItem);
                        }
                    }
                }
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

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            string uname = Session["email"].ToString();

            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            //always use try/catch for db connections
            try
            {
                con.Open();

                string sql = "SELECT progManagerID FROM ProgramManager WHERE email = '" + uname + "';";
                SqlCommand cmd = new SqlCommand(sql, con);

                int progManagerID = (int)cmd.ExecuteScalar();

                sql = "INSERT INTO ContactPerson(firstName, email, phone) values('" + proContact.Text + "' , '" + proContactEmail.Text + "' , '" + proContactPhone.Text + "');";
                cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();

                sql = "Select contactID FROM ContactPerson WHERE firstName = '" + proContact.Text + "';";
                cmd = new SqlCommand(sql, con);

                int contactID = (int)cmd.ExecuteScalar();

                //use this one instead once fahran adds maintenance tables
                  sql = "INSERT INTO Program(progManagerID, name, acronym, contactID, resiID, programCostID, durationID, seasonID, " +
                    "serviceAreaID, stipendID, addNotes, appDeadline, eligibilityRes, streetAddress, progWebsite, " +
                    "progDescription) VALUES (" + progManagerID + " , '" + pname.Text + "' , '" + acnym.Text + "' , " + contactID + " , " + 
                    (Progdescription.SelectedIndex + 1) + " , " + (radioCost.SelectedIndex + 1) + " , " + (Progduration.SelectedIndex + 1) + " , " +
                    (Season.SelectedIndex + 1) + " , " + (ServiceArea.SelectedIndex + 1) + " , " + (stipendlist.SelectedIndex + 1) + " , '" + 
                    Additional_Notes.Text + "' , '" + AppDeadline.Text + "' , '" + elig.Text + "' , '" + 
                    StreetAddress.Text + "' , '" + ProgramSite.Text + "' , '" + ProgDes.Text + "');";
                /* use this once database fields for maintenance tables is added 

                /*sql = "INSERT INTO Program(progManagerID, name, acronym, contactID, addNotes, appDeadline, eligibilityRes, streetAddress, " +
                    "progWebsite, ProgDescription) VALUES (" + progManagerID + " , '" + pname.Text + "' , '" + acnym.Text + "' , " + contactID + " , '" +
                    Additional_Notes.Text + "' , '" + AppDeadline.Text + "' , '" + elig.Text + "' , '" +
                    StreetAddress.Text + "' , '" + ProgramSite.Text + "' , '" + ProgDes.Text + "');";*/


                cmd = new SqlCommand(sql, con);
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

        protected void subject_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (subject.Text == "Other")
            {   //If Program Manager is selected prompt role field and label
                lbother.Visible = true;
                other.Visible = true;
            }
        }

        protected void Progdescription_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Progdescription.SelectedIndex == 2)
            {   //If Program Manager is selected prompt role field and label
                lbresidentother.Visible = true;
                residentother.Visible = true;
            }
        }

        protected void radioCost_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (radioCost.SelectedIndex == 1)
            {   //If Program Manager is selected prompt role field and label
                explainlabel.Visible = true;
                exp.Visible = true;
            }
        }

        protected void UniAff_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (UniAff.Text == "Yes")
            {   //If Program Manager is selected prompt role field and label
                unilabel.Visible = true;
                uni.Visible = true;
            }
        }

        protected void OutReach_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (OutReach.Text == "Yes")
            {   //If Program Manager is selected prompt role field and label
                companylabel.Visible = true;
                company.Visible = true;
            }
        }

        protected void ServiceArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ServiceArea.Text == "Other")
            {   //If Program Manager is selected prompt role field and label
                serviceareaotherlabel.Visible = true;
                serviceareaother.Visible = true;
            }
        }
    }
}