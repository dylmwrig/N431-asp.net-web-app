using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewSol
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            form2.Visible = false;
            //make user type choosing visible or invisible
            if (radioUserType.Text == "Program Director")
            {
                lblRole.Visible = true;
                role.Visible = true;
                lblOtherRole.Visible = true;
                otherRole.Visible = true;
            }
            else { 
                lblRole.Visible = false;
                role.Visible = false;
                lblOtherRole.Visible = false;
                otherRole.Visible = false;
            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                form1.Visible = false;
                output.Text = "User Type: " + radioUserType.Text +
                    "<br />First name: " + first.Text +
                    "<br />Last name: " + last.Text +
                    "<br />Email: " + email.Text +
                    "<br />Confirm email: " + confirmEmail.Text +
                    "<br />Password length: " + password.Text.Length +
                    "<br />Confirm password length: " + confirmPassword.Text.Length +
                    "<br />Gender: " + radioGender.Text +
                    "<br />Department: " + department.Text +
                    "<br />Status: " + status.Text;
                form2.Visible = true;
            }
        }

        protected void Confirm_Click(object sender, EventArgs e)
        {

        }

        protected void radioUserType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(radioUserType.Text == "Program Director")
            {   //If program director is selected prompt role field and label
                lblRole.Visible = true;
                role.Visible = true;
            }
            if (radioUserType.Text == "Regular User")
            {   //If regular user is selected hide role field and label
                lblRole.Visible = false;
                role.Visible = false;
            }
        }
    }
}