<%@ Page Language="C#" AutoEventWireup="true" Debug="true"  CodeFile="product.aspx.cs" Inherits="product" %>
<%@ Register TagPrefix="general" TagName="Frame" Src="WebUserControl.ascx" %>
<%@ Register TagPrefix="general" TagName="Footer" Src="FooterUserControl.ascx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Content-Style-Type" content="text/css" />

<title>
    Appassionata Music Store: Product
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
             <asp:Panel ID="PnlTrans" CssClass="instru_panel" Width="625px"  runat="server">
			      <asp:Label id="LblMsg" Height="20px" Font-Size="15px"   Text="" ForeColor="Red" runat="server" />
			        <br /><br />
			
			      <asp:Label ID="LblTrans"  ForeColor="#8A4117" Font-Size="16px" Font-Bold="true" runat="server" Text="Product Detail" Height="20px" />
		            <br /><br />
			      <!-- Here will be a list of transactions displayed as a table to be added dynamically onto this panel -->
			       <asp:Panel ID="PnlTable" Width="720px" runat="server">
			       
			      
			        
                      
                       <div style="width:620px; float:left; font-size: 15px; text-align:left; margin: 10px 10px 10px 10px;">
                         <b>
                         <asp:Label ID="lblName" runat="server" Height = "20px" />, 
                         <asp:Label ID="lblItemNumber" runat="server" Height = "20px" />, 
                         <asp:Label ID="lblModel" runat="server" Height = "20px" />
                         
                       
                        </b>
                    
                        <br /><br />
                        <img src= '<%# "images/" + ItemNumber + ".jpg" %>' alt = "product" height="160" width="160" />
                        
                         <br /><br />
                        
                         <asp:Label ID="lblDesc" runat="server" Height = "100%" />
                        
                        <br />  <br />
                        <asp:Label ID="lblPrice" runat="server" Height = "20px" />
                        
                          <br />
                         </div>
                    
                
                
                
			       </asp:Panel>
			        
			
			
			    </asp:Panel>
			    
		

		</form>

			<div class="clearthis">&nbsp;</div>
	
  
		<!-- End of main panel -->


			
		</div>


	

	<!-- End of Main Content Area -->


	<div class="clearthis">&nbsp;</div>




</body>
</html>
