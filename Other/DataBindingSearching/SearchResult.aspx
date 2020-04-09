<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchResult.aspx.cs" Inherits="SearchResult" %>
<%@ Register TagPrefix="general" TagName="Frame" Src="WebUserControl.ascx" %>
<%@ Register TagPrefix="general" TagName="Footer" Src="FooterUserControl.ascx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Content-Style-Type" content="text/css" />

<title>
    Appassionata Music Store: Main
</title>

<link rel="stylesheet" href="style.css" type="text/css" media="screen" />



</head>

<body>


<div id="container">

    <!-- This line tells where to insert the reusable code -->
    <general:Frame ID="framework" runat="server" />
	

	<!-- Start of Main Content Area -->

	<div id="main_panel">

		<!-- Start of Registration -->

		 <form id="Form1" runat="server">
			
			<!-- This panel is used to displays all the previous transactions -->
             <asp:Panel ID="PnlTrans" CssClass="trans_panel" Width="560px"  runat="server">
			      
			       <asp:Label id="LblMsg" Height="20px" Font-Size="20px" ForeColor="Red" Text="Search Result" runat="server" />
			       <asp:Label id="LblMsgNoResult" Height="20px" Font-Size="15px" ForeColor="Red" Text="" runat="server" />
			        <br /><br />
                    

				                
			 </asp:Panel>
			    
			

			<div class="clearthis">&nbsp;</div>
	

		</form>	


		<!-- End of main panel -->


			
		</div>

	<!-- End of Main Content Area -->


	<div class="clearthis">&nbsp;</div>


	<!-- This line tells where to insert the reusable general frame code -->
    <general:Footer ID="footer" runat="server" />


</div>

</body>
</html>
