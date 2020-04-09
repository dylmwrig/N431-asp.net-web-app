<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>
<%@ Register TagPrefix="general" TagName="Frame" Src="WebUserControl.ascx" %>
<%@ Register TagPrefix="general" TagName="Footer" Src="FooterUserControl.ascx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Content-Style-Type" content="text/css" />

<title>
    Appassionata Music Store
</title>

<link rel="stylesheet" href="style.css" type="text/css" media="screen" />
<script type="text/javascript">
function ctPwdValidate(ctl, args)
{
    args.IsValid=(args.Value.length >=10);

}

</script>
</head>

<body>
<asp:SqlDataSource ID="SQ" runat="server" ProviderName = "System.Data.SqlClient" ConnectionString = "<%$ ConnectionStrings:localConnection %>" 
SelectCommand = "select question from SecurityQuestion order by ID" 
/>


<div id="container">

    <!-- This line tells where to insert the reusable code -->
    <general:Frame ID="framework" runat="server" />
	

	<!-- Start of Main Content Area -->

	<div id="main_content">

		<!-- Start of Registration -->

		<div id="registration">

		 <form id="Form1" runat="server">
            
			<div id="registration_info">
			<h1>Registration</h1><br />
			<asp:Label id="LblMsg" Height="40px" Font-Size="18px" ForeColor="Red" runat="server" />
			<h2>Please enter the information below:</h2>
			
			</div>
            
			
   
			<div id="registration_form">
			<table>
			<tr>
			<td>
			<asp:Label id="LblFn" CssClass="registration_label" runat="server">First Name:</asp:Label>
			</td>
			<td>
			<div class="registration_input">
			    <asp:TextBox ID="TxtFn" MaxLength = "30"  width="300" Height="20" Text="" runat="server"  Font-Size="12"></asp:TextBox>
			    <asp:RequiredFieldValidator runat="server" ControlToValidate="TxtFn" ErrorMessage="Required Field" Display="Dynamic">*Required</asp:RequiredFieldValidator>
			</div>
			</td>
			</tr>
			<tr>
			    <td>
			        <asp:Label id="LblLn" CssClass="registration_label" runat="server">Last Name:</asp:Label>
			    </td>
			    <td>
			        <div class="registration_input">
			        <asp:TextBox ID="TxtLn" MaxLength = "30"  width="300" Height="20" Text="" runat="server"  Font-Size="12"></asp:TextBox>
			         <asp:RequiredFieldValidator runat="server" ControlToValidate="TxtFn" ErrorMessage="Required Field" Display="Dynamic">*Required</asp:RequiredFieldValidator>
			        </div>
			    </td>
			</tr>
			<tr>
			    <td>
			        <asp:Label id="LblEm" CssClass="registration_label" runat="server">Email:</asp:Label>
			        
			    </td>
			    <td>
			        <div class="registration_input">
			        <asp:TextBox ID="TxtEm" MaxLength = "50"  width="300" Height="20" Text="" runat="server"  Font-Size="12"></asp:TextBox>
			        <asp:RegularExpressionValidator runat="server" ControlToValidate="TxtEm" ValidationExpression=".*@.{2,}\..{2,}" ErrorMessage="Email is not a valid format" Display="Dynamic">*Invalid 
                        Format</asp:RegularExpressionValidator>
			        <asp:RequiredFieldValidator runat="server" ControlToValidate="TxtEm" ErrorMessage="Required Field" Display="Dynamic">*Required</asp:RequiredFieldValidator>
			        </div>
			        &nbsp;&nbsp;This will be used as your username.
			    </td>
			</tr>
			<tr>
			    <td>
			        <asp:Label id="LblCem" CssClass="registration_label" runat="server">Confirm 
                    Email:</asp:Label>
			    </td>
			    <td>
			         <div class="registration_input">
			        <asp:TextBox ID="TxtCem" MaxLength = "50"  width="300" Height="20" Text="" runat="server"  Font-Size="12"></asp:TextBox>
			        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtCem" ErrorMessage="Required Field" Display="Dynamic">*Required</asp:RequiredFieldValidator>
			        <asp:CompareValidator runat="server" Display="Dynamic" ControlToValidate="TxtEm" ControlToCompare="TxtCem" Type="String">*Emails 
                         don't match</asp:CompareValidator>
			        </div>
			    </td>
			</tr>
			<tr>
			    <td>
			        <asp:Label id="LblPwd" CssClass="registration_label" runat="server">Password:</asp:Label>
			    </td>
			    <td>
			         <div class="registration_input">
			        <asp:TextBox ID="TxtPwd" MaxLength = "50"  width="300" Height="20" TextMode="Password" Text="" runat="server"  Font-Size="12"></asp:TextBox>
			       
			        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtPwd" ErrorMessage="Required Field" Display="Dynamic">*Required</asp:RequiredFieldValidator>
			        <asp:RegularExpressionValidator runat="server" ControlToValidate="TxtPwd" ValidationExpression="[a-zA-Z]\w*\d+\w*\d*" ErrorMessage="Password does not contain letters or digits" Display="Dynamic">*Password 
                         must contain letters and digits</asp:RegularExpressionValidator>
			        
			        <asp:CustomValidator runat="server" ControlToValidate="TxtPwd" ClientValidationFunction="ctPwdValidate" OnServerValidate="PwdFormatValidate" ErrorMessage="Password must be longer than 10 characters" Display="Dynamic">*Password 
                         must be longer than 10 characters</asp:CustomValidator>
			        </div>
			        
			    </td>
			</tr>
			<tr>
			<td> </td>
			<td>Password must start with a letter and have at least one digit and be longer than 10 
                characters.</td>
			</tr>
			<tr>
			    <td>
			        <asp:Label id="LblCpwd" CssClass="registration_label" runat="server">Confirm 
                    Password:</asp:Label>
			    </td>
			    <td>
			         <div class="registration_input">
			        <asp:TextBox ID="TxtCpwd" MaxLength = "50"  width="300" Height="20" Text="" TextMode="Password"  runat="server"  Font-Size="12"></asp:TextBox>
			       
			        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtCpwd" ErrorMessage="Required Field" Display="Dynamic">*Required</asp:RequiredFieldValidator>
			        <asp:CompareValidator ID="CompareValidator1" runat="server" Display="Dynamic" ControlToValidate="TxtPwd" ControlToCompare="TxtCpwd" Type="String">*Passwords 
                         don't match</asp:CompareValidator>
			
			        </div>
			    </td>
			</tr>
			<tr>
			    <td>
			        <asp:Label id="LblSq1" CssClass="registration_label" runat="server">Security 
                    Question 1:</asp:Label>
			    </td>
			    <td>
			        <div class="registration_input">
			        <!-- contents of the drop down list is added dynamically from the database at page load -->
                        <asp:DropDownList ID="DrpSq1" DataSourceID="SQ" runat="server" DataTextField = "question">
                        
                        </asp:DropDownList>
			       
			        
			        </div>
			    </td>
			</tr>
			<tr>
			    <td>
			        <asp:Label id="LblAns1" CssClass="registration_label" runat="server">Answer:</asp:Label>
			    </td>
			    <td>
			         <div class="registration_input">
			        <asp:TextBox ID="TxtAns1" MaxLength = "50"  width="300" Height="20" Text="" runat="server"  Font-Size="12"></asp:TextBox>
			        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtAns1" ErrorMessage="Required Field" Display="Dynamic">*Required</asp:RequiredFieldValidator>
			        
			        </div>
			    </td>
			</tr>
			<tr>
			    <td>
			        <asp:Label id="LblSq2" CssClass="registration_label" runat="server">Security 
                    Question 2:</asp:Label>
			    </td>
			    <td>
			        <div class="registration_input">
			             <!-- contents of the drop down list is added dynamically from the database at page load -->
                        <asp:DropDownList ID="DrpSq2" DataSourceID="SQ" runat="server" DataTextField = "question">
                        
                        </asp:DropDownList>
			        
			        </div>
			    </td>
			</tr>
			<tr>
			    <td>
			       <asp:Label id="LblAns2" CssClass="registration_label" runat="server">Answer:</asp:Label>
			    </td>
			    <td>
			         <div class="registration_input">
			        <asp:TextBox ID="TxtAns2" MaxLength = "50"  width="300" Height="20" Text="" runat="server"  Font-Size="12"></asp:TextBox>
			        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TxtAns2" ErrorMessage="Required Field" Display="Dynamic">*Required</asp:RequiredFieldValidator>
			        
			        </div>
			    </td>
			</tr>
			</table>
		    <div id="BtnSmt" style="margin-top: 20px; margin-left: 150px;" >
		    <asp:Button ForeColor="White" BackColor="#9e9ec3" Font-Size="12" Font-Bold="true" 
                    ID="BtnSubmit" CausesValidation="true"  Visible="true" Text="Submit" 
                    runat="server" onclick="BtnSubmit_Click" />
		   
			</div>
            
				
								
			
				
			</div> <!-- End of registration_form -->

		</form>	

			<div class="clearthis">&nbsp;</div>
		</div>

		<!-- End of Registration -->


		
		
		
		
			
			
			

			
		</div>


	

	<!-- End of Main Content Area -->


	<div class="clearthis">&nbsp;</div>


	<!-- This line tells where to insert the reusable general frame code -->
    <general:Footer ID="footer" runat="server" />


</div>

</body>
</html>
