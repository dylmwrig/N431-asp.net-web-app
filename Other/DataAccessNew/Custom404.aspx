<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Custom404.aspx.cs" Inherits="Custom404" %>

<%@ Register TagPrefix="general" TagName="Frame" Src="WebUserControl.ascx" %>
<%@ Register TagPrefix="general" TagName="Footer" Src="FooterUserControl.ascx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Content-Style-Type" content="text/css" />

<title>
    Error
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
                  <asp:Label ID="LblMsg" ForeColor="#8A4117" Font-Size="16px"  runat="server"  Height="20px" Text="A technical difficulty has occurred. Please contact the system administrator. " />
	               

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

