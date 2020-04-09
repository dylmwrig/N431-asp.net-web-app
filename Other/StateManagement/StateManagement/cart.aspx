<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>
<%@ Register TagPrefix="general" TagName="Frame" Src="WebUserControl.ascx" %>
<%@ Register TagPrefix="general" TagName="Footer" Src="FooterUserControl.ascx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Content-Style-Type" content="text/css" />

<title>
    Appassionata Music Store: Shopping Cart
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
             <asp:Panel ID="PnlTrans" CssClass="trans_panel" Width="425px"  runat="server">
             <asp:AdRotator runat="server" AdvertisementFile="AdsWide.xml" id="rotator" Target="_blank" />
            
			    </asp:Panel>
			    
			  <!-- This panel is for showing shopping cart  -->
			 <asp:Panel ID="PnlCart" CssClass="cart_panel" Width="206px" runat="server">
			    <br />
			    
			    <asp:Label ID="Label1" Height="30px" ForeColor="White" Font-Size="14px" Text="Total:" Font-Bold="true" runat="server" />
			    
			   
			    <asp:TextBox ID="TxtTotal" Height="30px" BackColor="Black" ForeColor="White" runat="server" Font-size="14px" Text="$0.00" ReadOnly="true" />
			    <br /><br />
			    <asp:Button ID="BtnCheckout" Height="25px" ForeColor="Red"  Width="66px" Font-Bold="true" Text="Check Out" runat="server" />
			    
			 </asp:Panel>
			
			
		    <asp:Panel ID = "PnlItems" CssClass ="cart_items" Width = "623px" runat = "server">
		    
		        <asp:Label ID = "LblCartTitle" Height = "30px" ForeColor = "Maroon" Font-Size = "20px" Text = "Shopping Cart" runat = "server"></asp:Label>
		        <br /><br />
		        <asp:Label ID = "LblCartEmpty" Height = "30px" ForeColor = "Blue" Font-Size = "20px" Text = "" runat = "server"></asp:Label>
		    
		       <asp:Panel ID="PnlCartTable" HorizontalAlign="Center" Width="620px" runat="server">
			      
			       
			   </asp:Panel>
		        
		        --------------------------------------------------------------------------------------------------------------------------------------
		        <br /><br />
		        <div style="margin-left:410px">
		        <asp:Button  ID="BtnUpdate" runat="server" Text="  Update Cart  " OnClick ="BtnUpdate_Click" />
		        </div>
		        
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
