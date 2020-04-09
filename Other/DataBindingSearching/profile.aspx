<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>
<%@ Register TagPrefix="general" TagName="Frame" Src="WebUserControl.ascx" %>
<%@ Register TagPrefix="general" TagName="Footer" Src="FooterUserControl.ascx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Content-Style-Type" content="text/css" />

<title>
    Appassionata Music Store: Profile
</title>

<link rel="stylesheet" href="style.css" type="text/css" media="screen" />



</head>

<body>

<div id="container">

    <!-- This line tells where to insert the reusable code -->
    <general:Frame ID="framework" runat="server" />
	

	<!-- Start of Main Content Area -->

	<div id="main_content">
		

		 <form id="Form1" runat="server">
            		
			<!-- This panel is used for profile display -->
             <asp:Panel ID="PnlDisplay"  Width="525px"  runat="server">
                  <asp:Label ID="LblMsg" ForeColor="#8A4117" Font-Size="16px"  runat="server"  Height="20px" />
	                <br /><br /> 
                    <asp:Label ID="LblProfile" ForeColor="#8A4117" Font-Size="16px" Font-Bold="true" runat="server" Text="Your Profile" Height="20px" />
		            <br /><br /> 
                    <asp:Label ID="LblLast" Height="15px" Font-Size="15px" ForeColor="Red" runat="server" Text="Last Name: " />
                    <asp:Label ID="LblLastValue" Height="15px" Font-Size="15px" ForeColor="Black" runat="server" />
			        <br /><br />

                    <asp:Label ID="LblFirst" Height="15px" Font-Size="15px" ForeColor="Red" runat="server" Text="First Name: " />
                    <asp:Label ID="LblFirstValue" Height="15px" Font-Size="15px" ForeColor="Black" runat="server" />
			        <br /><br />
			
	                <asp:Label ID="LblEmail" Height="15px" Font-Size="15px" ForeColor="Red" runat="server" Text="Email: " />
                    <asp:Label ID="LblEmailValue" Height="15px" Font-Size="15px" ForeColor="Black" runat="server" />
			        <br /><br />
			
			        <asp:Button ID="BtnEdit" Height="25px" ForeColor="Red"  Width="66px" Font-Bold="true" Text="Edit" runat="server" OnClick="BtnEdit_Click" />
			         <br /><br />




			      <!-- Here will be a list of profile values displayed as a table to be added dynamically onto this panel 
			       <asp:Panel ID="PnlTable" Width="420px" Height="200px" runat="server">
			       
			       
			       </asp:Panel>
			        <asp:Label ID="LblTest" Height="30px" ForeColor="Red"  runat="server" />
				  --> 
			 </asp:Panel>
			 
			    
			  <!-- This panel is for profile editing     -->
			 <asp:Panel ID="PnlEdit"  Width="525px" runat="server">
			       <asp:Label ID="LblEditMsg" ForeColor="#8A4117" Font-Size="16px"  runat="server"  Height="20px" />
	                <br /><br /> 
                    <asp:Label ID="LblEditProfile" ForeColor="#8A4117" Font-Size="16px" Font-Bold="true" runat="server" Text="Edit Your Profile" Height="20px" />
		            <br /><br /> 
                    <asp:Label ID="LblEditLname" Height="15px" Font-Size="15px" ForeColor="Red" runat="server" Text="Last Name: " />
                     <asp:TextBox ID="TxtLname" runat="server"></asp:TextBox>
			        <br /><br />

                    <asp:Label ID="LblEditFname" Height="15px" Font-Size="15px" ForeColor="Red" runat="server" Text="First Name: " />
                    <asp:TextBox ID="TxtFname" runat="server"></asp:TextBox>

			        <br /><br />
			
	              
			
			        <asp:Button ID="BtnSumit" Height="25px" ForeColor="Red"  Width="66px" Font-Bold="true" Text="Submit" runat="server" OnClick="BtnSubmit_Click" />
			         <br /><br />
			 </asp:Panel>

              
			
		
   
			
            
				
								
			
				
			

		</form>	

			<div class="clearthis">&nbsp;</div>
	

		<!-- End of main panel -->


		
		
		
		
			
			
			

			
		</div>


	

	<!-- End of Main Content Area -->


	<div class="clearthis">&nbsp;</div>


	<!-- This line tells where to insert the reusable general frame code -->
    <general:Footer ID="footer" runat="server" />


</div>

</body>
</html>
