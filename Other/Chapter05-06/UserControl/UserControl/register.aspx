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

</head>

<body>
<form id="regForm" runat="server">
<div id="container">

    <!-- This line tells where to insert the reusable code -->
    <general:Frame ID="framework" runat="server" />
	

	<!-- Start of Main Content Area -->

	<div id="main_content">

		<!-- Start of Registration -->

		<div id="registration">

			<div id="registration_info">
			<h1>Registration</h1><br />
			<h2>Please enter the information below:</h2>
			
			</div>
        
			

			<div id="registration_form">
			<table>
			<tr>
			<td>
			<span class="registration_label">First Name:</span>
			</td>
			<td>
			<div class="registration_input"><input type="text" value="" id="fn" style="height:20px;" size="60" /></div>
			</td>
			</tr>
			<tr>
			    <td>
			        <span class="registration_label">Last Name:</span>
			    </td>
			    <td>
			        <div class="registration_input"><input type="text" value="" id="ln" style="height:20px;" size="60" /></div>
			    </td>
			</tr>
			<tr>
			    <td>
			        <span class="registration_label">Email:</span>
			        
			    </td>
			    <td>
			        <div class="registration_input"><input type="text" value="" id="em" style="height:20px;" size="60" /></div>
			    &nbsp;&nbsp;This will be used as your username.
			    </td>
			</tr>
			<tr>
			    <td>
			        <span class="registration_label">Confirm Email:</span>
			    </td>
			    <td>
			        <div class="registration_input"><input type="text" value="" id="cem" style="height:20px;" size="60" /></div>
			    </td>
			</tr>
			<tr>
			    <td>
			        <span class="registration_label">Password:</span>
			    </td>
			    <td>
			        <div class="registration_input"><input type="text" value="" id="pwd" style="height:20px;" size="60" /></div>
			        &nbsp;&nbsp;Password must be at least 10 characters long with both letters and digits.
			    </td>
			</tr>
			<tr>
			    <td>
			        <span class="registration_label">Confirm Password:</span>
			    </td>
			    <td>
			        <div class="registration_input"><input type="text" value="" id="cpwd" style="height:20px;" size="60" /></div>
			    </td>
			</tr>
			<tr>
			    <td>
			        <span class="registration_label">Security Question 1:</span>
			    </td>
			    <td>
			        <div class="registration_input">
			        <select>
			                <option value="1">In what city did you meet your spouse/significant other?</option>
			                <option value="1">What was your childhood nickname?</option>
			                <option value="1">What is the name of your favorite childhood friend?</option>
			                <option value="1">What street did you live on in third grade?</option>
			                <option value="1">What is your oldest sibling's birth month?</option>
			                <option value="1">What is the middle name of your youngest child?</option>
			                <option value="1">What is your first pet's name?</option>
			                <option value="1">What school did you attend for sixth grade?</option>
			                <option value="1">In what city or town did your father and mother meet?</option>
			                <option value="1">What was the last name of your third grade teacher?</option>
			                <option value="1">What is your mother's maiden name?</option>
			                <option value="1">In what town was your first job?</option>
			            </select>
			        
			        </div>
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
			        <div class="registration_input">
			            <select>
			                <option value="1">In what city did you meet your spouse/significant other?</option>
			                <option value="1">What was your childhood nickname?</option>
			                <option value="1">What is the name of your favorite childhood friend?</option>
			                <option value="1">What street did you live on in third grade?</option>
			                <option value="1">What is your oldest sibling's birth month?</option>
			                <option value="1">What is the middle name of your youngest child?</option>
			                <option value="1">What is your first pet's name?</option>
			                <option value="1">What school did you attend for sixth grade?</option>
			                <option value="1">In what city or town did your father and mother meet?</option>
			                <option value="1">What was the last name of your third grade teacher?</option>
			                <option value="1">What is your mother's maiden name?</option>
			                <option value="1">In what town was your first job?</option>
			            </select>
			        
			        </div>
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
</form>
</body>
</html>
