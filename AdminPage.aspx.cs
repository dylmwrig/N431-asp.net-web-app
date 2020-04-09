using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Capstone2nd
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("login.aspx");
            }
            //if super admin
            if (Session["accessLevel"].ToString() == "s")
            {
                addNewAdminID.Visible = true;
                lblFindAdminID.Visible = true;
                findAdminID.Visible = true;
                editAdminID.Visible = true;
            }

            if (Session["message"] != null)
            {
                lblMessage.Text = Session["message"].ToString();
                Session["message"] = null;
            }

            populateData(false);
        }

        protected void editAdminID_Click(object sender, EventArgs e)
        {
            Session["adminToEdit"] = findAdminID.Text;
            Response.Redirect("EditAdmin.aspx");
        }

        //if the entry is new it will postback
        protected void populateData(bool isNew)
        {
            if (!IsPostBack || isNew)
            {
                string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);

                //populate the dropdown lists 
                try
                {

                    //populate field dropdown
                    int selectedIndex = fieldList.SelectedIndex;

                    fieldList.Items.Clear();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM FieldOfStudy", con);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["value"].ToString());
                        fieldList.Items.Add(NewItem);
                    }

                    fieldList.SelectedIndex = selectedIndex;
                    reader.Close();

                    //populate role dropdown
                    selectedIndex = roleList.SelectedIndex;

                    roleList.Items.Clear();
                    cmd = new SqlCommand("SELECT * FROM ManagerRole", con);
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["roleName"].ToString());
                        roleList.Items.Add(NewItem);
                    }

                    roleList.SelectedIndex = selectedIndex;
                    reader.Close();

                    //populate grade dropdown
                    selectedIndex = gradeList.SelectedIndex;

                    gradeList.Items.Clear();
                    cmd = new SqlCommand("SELECT * FROM Grades", con);
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["value"].ToString());
                        gradeList.Items.Add(NewItem);
                    }
                    gradeList.SelectedIndex = selectedIndex;
                    reader.Close();

                    //populate residential dropdown
                    selectedIndex = residentialList.SelectedIndex;

                    residentialList.Items.Clear();
                    cmd = new SqlCommand("SELECT * FROM Residental", con);
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["value"].ToString());
                        residentialList.Items.Add(NewItem);
                    }

                    residentialList.SelectedIndex = selectedIndex;
                    reader.Close();

                    //populate cost dropdown
                    selectedIndex = costList.SelectedIndex;

                    costList.Items.Clear();
                    cmd = new SqlCommand("SELECT * FROM ProgramCost", con);
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["value"].ToString());
                        costList.Items.Add(NewItem);
                    }
                    costList.SelectedIndex = selectedIndex;
                    reader.Close();

                    //populate stipend dropdown
                    selectedIndex = stipendList.SelectedIndex;

                    stipendList.Items.Clear();
                    cmd = new SqlCommand("SELECT * FROM Stipend", con);
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["value"].ToString());
                        stipendList.Items.Add(NewItem);
                    }
                    stipendList.SelectedIndex = selectedIndex;
                    reader.Close();

                    //populate duration dropdown
                    selectedIndex = durationList.SelectedIndex;

                    durationList.Items.Clear();
                    cmd = new SqlCommand("SELECT * FROM Duration", con);
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["value"].ToString());
                        durationList.Items.Add(NewItem);
                    }
                    durationList.SelectedIndex = selectedIndex;
                    reader.Close();

                    //populate season dropdown
                    selectedIndex = seasonList.SelectedIndex;

                    seasonList.Items.Clear();
                    cmd = new SqlCommand("SELECT * FROM Season", con);
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["value"].ToString());
                        seasonList.Items.Add(NewItem);
                    }
                    seasonList.SelectedIndex = selectedIndex;
                    reader.Close();

                    //populate area dropdown
                    selectedIndex = areaList.SelectedIndex;

                    areaList.Items.Clear();
                    cmd = new SqlCommand("SELECT * FROM ServiceArea", con);
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["value"].ToString());
                        areaList.Items.Add(NewItem);
                    }
                    areaList.SelectedIndex = selectedIndex;
                    reader.Close();

                    con.Close();
                }

                catch (Exception err)
                {
                    Response.Write("<script>alert(\"" + err.Message + "\");</script>");
                    Response.Write(err.Message);
                    //lblMessage.Text = "Cannot submit information now. Please try again later.";
                }

                Index_Change(null, null);
            }
        }

        //set the checkbox to the appropriate value
        protected void Index_Change(object sender, EventArgs e)
        {
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM FieldOfStudy;", con);

                SqlDataReader reader = cmd.ExecuteReader();
                string field = fieldList.SelectedItem.Value;

                while (reader.Read())
                {
                    if (field == reader["value"].ToString())
                    {
                        if (reader["status"].ToString() == "active")
                        {
                            fieldActive.Checked = true;
                        }
                        else
                        {
                            fieldActive.Checked = false;
                        }
                    }
                }
                reader.Close();

                con.Close();
            }

            catch (Exception err)
            {
                Response.Write("<script>alert(\"" + err.Message + "\");</script>");
                Response.Write(err.Message);
            }
        }

        protected void submitNew(object sender, EventArgs e)
        {
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            try
            {
                con.Open();
                string isActive = "active";

                //find which button called this function and set the table name appropriately
                Button clicked = sender as Button;
                string senderID = clicked.ID;
                string tableName = "";
                string value = "";
                string valName = "";

                if (senderID == "submitNewField")
                {
                    tableName = "FieldOfStudy";
                    value = newField.Text;
                    valName = "value";
                    newField.Text = string.Empty;

                    if (newFieldActive.Checked == false)
                    {
                        isActive = "inactive";
                    }
                }

                else if (senderID == "submitNewRole")
                {
                    tableName = "ManagerRole";
                    value = newRole.Text;
                    valName = "roleName";
                    newRole.Text = string.Empty;

                    if (newRoleActive.Checked == false)
                    {
                        isActive = "inactive";
                    }
                }

                else if (senderID == "submitNewGrade")
                {
                    tableName = "Grades";
                    value = newGrade.Text;
                    valName = "value";
                    newGrade.Text = string.Empty;

                    if (newGradeActive.Checked == false)
                    {
                        isActive = "inactive";
                    }
                }

                else if (senderID == "submitNewResidential")
                {
                    tableName = "Residental";
                    value = newResidential.Text;
                    valName = "value";
                    newResidential.Text = string.Empty;

                    if (newResidentialActive.Checked == false)
                    {
                        isActive = "inactive";
                    }
                }

                else if (senderID == "submitNewCost")
                {
                    tableName = "ProgramCost";
                    value = newCost.Text;
                    valName = "value";
                    newCost.Text = string.Empty;

                    if (newCostActive.Checked == false)
                    {
                        isActive = "inactive";
                    }
                }

                else if (senderID == "submitNewStipend")
                {
                    tableName = "Stipend";
                    value = newStipend.Text;
                    valName = "value";
                    newStipend.Text = string.Empty;

                    if (newStipendActive.Checked == false)
                    {
                        isActive = "inactive";
                    }
                }

                else if (senderID == "submitNewDuration")
                {
                    tableName = "Duration";
                    value = newDuration.Text;
                    valName = "value";
                    newDuration.Text = string.Empty;

                    if (newDurationActive.Checked == false)
                    {
                        isActive = "inactive";
                    }
                }

                else if (senderID == "submitNewSeason")
                {
                    tableName = "Season";
                    value = newSeason.Text;
                    valName = "value";
                    newSeason.Text = string.Empty;

                    if (newSeasonActive.Checked == false)
                    {
                        isActive = "inactive";
                    }
                }

                else if (senderID == "submitNewArea")
                {
                    tableName = "ServiceArea";
                    value = newArea.Text;
                    valName = "value";
                    newArea.Text = string.Empty;

                    if (newAreaActive.Checked == false)
                    {
                        isActive = "inactive";
                    }
                }

                string sql = "INSERT INTO " + tableName + " (" + valName + ", status) values(@value, @isActive);";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add(new SqlParameter("@value", value));
                cmd.Parameters.Add(new SqlParameter("@isActive", isActive));
                cmd.ExecuteNonQuery();
            }

            catch (Exception err)
            {
                Response.Write("<script>alert(\"" + err.Message + "\");</script>");
                Response.Write(err.Message);
            }

            con.Close();
            populateData(true);
        }

        protected void editSelected(object sender, EventArgs e)
        {
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            try
            {
                con.Open();
                string isActive = "active";
                string value = String.Empty;
                string newValue = String.Empty;
                string status = String.Empty;
                string editValue = String.Empty;
                string newStatus = "";
                string sql = "";

                //find which button called this function and set the table name appropriately
                Button clicked = sender as Button;
                string senderID = clicked.ID;
                string tableName = "";
                string idName = "";
                if (senderID == "fieldEdit")
                {
                    tableName = "FieldOfStudy";
                    value = fieldList.SelectedItem.Value;
                    newValue = editProgField.Text;
                    idName = "value";

                    if (fieldActive.Checked)
                    {
                        newStatus = "active";
                    }

                    else
                    {
                        newStatus = "inactive";
                    }

                    editValue = editProgField.Text;
                    editProgField.Text = string.Empty;
                }

                if (senderID == "roleEditBtn")
                {
                    tableName = "ManagerRole";
                    value = roleList.SelectedItem.Value;
                    newValue = roleEdit.Text;
                    idName = "roleName";

                    if (roleActive.Checked)
                    {
                        newStatus = "active";
                    }

                    else
                    {
                        newStatus = "inactive";
                    }

                    editValue = roleEdit.Text;
                    roleEdit.Text = string.Empty;
                }

                if (senderID == "gradeEditBtn")
                {
                    tableName = "Grades";
                    value = gradeList.SelectedItem.Value;
                    newValue = gradeEdit.Text;
                    idName = "value";

                    if (gradeActive.Checked)
                    {
                        newStatus = "active";
                    }

                    else
                    {
                        newStatus = "inactive";
                    }

                    editValue = gradeEdit.Text;
                    gradeEdit.Text = string.Empty;
                }

                if (senderID == "residentialEditBtn")
                {
                    tableName = "Residental";
                    value = residentialList.SelectedItem.Value;
                    newValue = residentialEdit.Text;
                    idName = "value";

                    if (residentialActive.Checked)
                    {
                        newStatus = "active";
                    }

                    else
                    {
                        newStatus = "inactive";
                    }

                    editValue = residentialEdit.Text;
                    residentialEdit.Text = string.Empty;
                }

                if (senderID == "costEditBtn")
                {
                    tableName = "ProgramCost";
                    value = costList.SelectedItem.Value;
                    newValue = costEdit.Text;
                    idName = "value";

                    if (costActive.Checked)
                    {
                        newStatus = "active";
                    }

                    else
                    {
                        newStatus = "inactive";
                    }

                    editValue = costEdit.Text;
                    costEdit.Text = string.Empty;
                }

                if (senderID == "stipendEditBtn")
                {
                    tableName = "Stipend";
                    value = stipendList.SelectedItem.Value;
                    newValue = stipendEdit.Text;
                    idName = "value";

                    if (stipendActive.Checked)
                    {
                        newStatus = "active";
                    }

                    else
                    {
                        newStatus = "inactive";
                    }

                    editValue = stipendEdit.Text;
                    stipendEdit.Text = string.Empty;
                }

                if (senderID == "durationEditBtn")
                {
                    tableName = "Duration";
                    value = durationList.SelectedItem.Value;
                    newValue = durationEdit.Text;
                    idName = "value";

                    if (durationActive.Checked)
                    {
                        newStatus = "active";
                    }

                    else
                    {
                        newStatus = "inactive";
                    }

                    editValue = durationEdit.Text;
                    durationEdit.Text = string.Empty;
                }

                if (senderID == "seasonEditBtn")
                {
                    tableName = "Season";
                    value = seasonList.SelectedItem.Value;
                    newValue = seasonEdit.Text;
                    idName = "value";

                    if (seasonActive.Checked)
                    {
                        newStatus = "active";
                    }

                    else
                    {
                        newStatus = "inactive";
                    }

                    editValue = seasonEdit.Text;
                    seasonEdit.Text = string.Empty;
                }

                if (senderID == "areaEditBtn")
                {
                    tableName = "ServiceArea";
                    value = areaList.SelectedItem.Value;
                    newValue = areaEdit.Text;
                    idName = "value";

                    if (areaActive.Checked)
                    {
                        newStatus = "active";
                    }

                    else
                    {
                        newStatus = "inactive";
                    }

                    editValue = areaEdit.Text;
                    areaEdit.Text = string.Empty;
                }

                if (value != String.Empty)
                {
                    SqlCommand cmd = new SqlCommand("SELECT status FROM " + tableName + " WHERE " + idName + "= @value;", con);
                    cmd.Parameters.Add(new SqlParameter("@value", value));

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        status = reader["status"].ToString();
                    }

                    reader.Close();

                    if (status != String.Empty)
                    {
                        sql = "UPDATE " + tableName + " SET status= @status WHERE " + idName + "= @value;";
                        cmd = new SqlCommand(sql, con);
                        cmd.Parameters.Add(new SqlParameter("@value", value));
                        cmd.Parameters.Add(new SqlParameter("@status", newStatus));
                        cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                    }

                    //update field name then clear the text box
                    if (editValue != String.Empty)
                    {
                        sql = "UPDATE " + tableName + " SET " + idName + "= @newValue WHERE " + idName + "= @value;";
                        cmd = new SqlCommand(sql, con);
                        cmd.Parameters.Add(new SqlParameter("@value", value));
                        cmd.Parameters.Add(new SqlParameter("@newValue", newValue));
                        cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                    }
                }
            }

            catch (Exception err)
            {
                Response.Write("<script>alert(\"" + err.Message + "\");</script>");
                Response.Write(err.Message);
            }

            //refresh drop down lists
            populateData(true);
        }
    }
}
