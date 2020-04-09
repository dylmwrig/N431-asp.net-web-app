<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Copy of forgetPwd.aspx.cs" Inherits="forgetPwd" %>
<%@ Register TagPrefix="general" TagName="Frame" Src="WebUserControl.ascx" %>
<%@ Register TagPrefix="general" TagName="Footer" Src="FooterUserControl.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Content-Style-Type" content="text/css" />

<title>
Appassionata Music Store: Forget Password
</title>

<link rel="stylesheet" href="style.css" type="text/css" media="screen" />

</head>

<body>

<div id="container">

	<!-- This line tells where to insert the reusable code -->
    <general:Frame ID="framework" runat="server" />

	

	<div id="main_content">

		<!-- Start of Registration -->

		<div id="registration">

			<div id="registration_info">
			<h1>Forget Password?</h1><br />
			<h2>Enter information below to retrieve your password:</h2>
			
			</div>
        
			

			<form runat="server">
			<div id="registration_form">
			<table>
			<tr>
			<td>
			<asp:Label id="LblEm" CssClass="registration_label" runat="server">Username:</asp:Label>
			</td>
			<td>
			<div class="registration_input">
			    <asp:TextBox ID="TxtEm" MaxLength = "50"  width="300" Height="20" Text="" runat="server"  Font-Size="12"></asp:TextBox>
			    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtEm" ErrorMessage="Required Field" Display="Dynamic">*Required</asp:RequiredFieldValidator>
			       
			</div>
			</td>
			</tr>
			<tr>
			<td>
			<asp:Label id="LblSw1" CssClass="registration_label" runat="server">Security Question 1:</asp:Label>
			
			</td>
			<td>
			<div class="registration_input">
			<asp:Label ID="LblSq1" runat="server" />
			
			
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
			    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtAns1" ErrorMessage="Required Field" Display="Dynamic">*Required</asp:RequiredFieldValidator>
			   
			   </div>
			
			</td>
			</tr>
			<tr>
			<td>
			<asp:Label id="LblSw2" CssClass="registration_label" runat="server">Security Question 2:</asp:Label>
			</td>
			<td>
			<div class="registration_input">
			<asp:Label ID="LblSq2" runat="server" />
			
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
			    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtAns2" ErrorMessage="Required Field" Display="Dynamic">*Required</asp:RequiredFieldValidator>
			   
			   </div>
			
			</td>
			</tr>
			</table>
		    <div id="BtnSmt" style="margin-top: 20px; margin-left: 150px;" >
		    <asp:Button ForeColor="White" BackColor="#9e9ec3" Font-Size="12" Font-Bold="true" ID="BtnSubmit" CausesValidation="true"  Visible="true" Text="Submit" runat="server" />
		   
			</div>
				
								
			
				
			</div>

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

