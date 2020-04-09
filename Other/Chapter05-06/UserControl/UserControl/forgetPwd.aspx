<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgetPwd.aspx.cs" Inherits="forgetPwd" %>
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
        
			

			<div id="registration_form">
			<table>
			<tr>
			<td>
			<span class="registration_label">Username:</span>
			</td>
			<td>
			<div class="registration_input"><input type="text" value="" id="em" style="height:20px;" size="60" /></div>
			</td>
			</tr>
			<tr>
			<td>
			<span class="registration_label">Security Question 1:</span>
			</td>
			<td>
			<div class="registration_input">What is the name of your first pet?</div>
			
			</td>
			</tr>
			<tr>
			<td>
			<span class="registration_label">Answer:</span>
			</td>
			<td>
			<div class="registration_input"><input type="text" value="" id="ans1" style="height:20px;" size="60" /></div>
			
			</td>
			</tr>
			<tr>
			<td>
			<span class="registration_label">Security Question 2:</span>
			</td>
			<td>
			<div class="registration_input">What is your mother's maiden name?</div>
			
			</td>
			</tr>
			<tr>
			<td>
			<span class="registration_label">Answer:</span>
			</td>
			<td>
			<div class="registration_input"><input type="text" value="" id="ans2" style="height:20px;" size="60" /></div>
			
			</td>
			</tr>
			</table>
		    <div id="sbm" style="margin-top: 20px; margin-left: 150px;" ><input type="button" style="color:white; background-color:#9e9ec3; font-size:14px; font-weight:bold;" id="regSubmit" value="Submit" />
			</div>
            
				
								
			
				
			</div>

			

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

