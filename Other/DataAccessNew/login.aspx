<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
<%@ Register TagPrefix="general" TagName="Frame" Src="WebUserControl.ascx" %>
<%@ Register TagPrefix="general" TagName="Footer" Src="FooterUserControl.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Content-Style-Type" content="text/css" />

<title>
Appassionata Music Store: Login
</title>

<link rel="stylesheet" href="style.css" type="text/css" media="screen" />

</head>

<body>

<div id="container">

	<!-- This line tells where to insert the reusable code -->
    <general:Frame ID="framework" runat="server" />


	<!-- Start of Main Content Area -->

	<div id="main_content">

		<!-- Start of registration -->

		<div id="registration">

			<div id="registration_info">
			<h1>
			
			<asp:Label id="LblLg" Text="Login" Height="15px" runat="server"></asp:Label></h1><br />
			
			<asp:Label id="LblMsg" Height="40px" Font-Size="18px" ForeColor="Red" runat="server" />
			
			</div>
        
			
 <form id="Form1" runat="server">
			<div id="registration_form">
			<table>
			<tr>
			<td>
			<asp:Label id="LblEm" CssClass="registration_label" runat="server">Username:</asp:Label>
			</td>
			<td>
			<div class="registration_input">
			    <asp:TextBox ID="TxtEm" MaxLength = "50"  width="300" Height="20" Text="test1@gmail.com" runat="server"  Font-Size="12"></asp:TextBox>
			    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtEm" ErrorMessage="Required Field" Display="Dynamic">*Required</asp:RequiredFieldValidator>
			       
			</div>
			</td>
			</tr>
			<tr>
			<td>
			<asp:Label id="LblPwd" CssClass="registration_label" runat="server">Password:</asp:Label>       
			 
			</td>
			<td>
			<div class="registration_input">
			        <asp:TextBox ID="TxtPwd" MaxLength = "150"  width="300" Height="20" Text="aaaaaa222222" runat="server"  Font-Size="12"></asp:TextBox>
			       
			        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtPwd" ErrorMessage="Required Field" Display="Dynamic">*Required</asp:RequiredFieldValidator>
		  </div>
			
			&nbsp;&nbsp;<a href="forgetPwd.aspx">Forgot password?</a>
			</td>
			</tr>
			
			</table>
		   <div id="BtnSmt" style="margin-top: 20px; margin-left: 150px;" >
		    <asp:Button ForeColor="White" BackColor="#9e9ec3" Font-Size="12" Font-Bold="true" 
                   ID="BtnSubmit" CausesValidation="true"  Visible="true" Text="Submit" 
                   runat="server" onclick="BtnSubmit_Click" />
		   
			</div>
				
								
			
				
			</div>
</form>
			

			<div class="clearthis">&nbsp;</div>
		</div>

		<!-- End of Registration-->


		
		
		
		
			
			
			

			
		</div>


	

	<!-- End of Main Content Area -->


	<!-- This line tells where to insert the reusable general frame code -->
    <general:Footer ID="footer" runat="server" />


</body>
</html>

