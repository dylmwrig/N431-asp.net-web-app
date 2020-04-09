<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>
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
<asp:Label ID="hiddenEmail" runat="server"  Visible ="false" />
<asp:SqlDataSource ID="customerTransaction" runat="server" ProviderName = "System.Data.SqlClient" ConnectionString = "<%$ ConnectionStrings:localConnection %>" 
SelectCommand = "sp_getTransactionByEmail" SelectCommandType = "StoredProcedure">

    <SelectParameters>
        <asp:ControlParameter ControlID = "hiddenEmail" Name = "em" PropertyName ="Text" />
    </SelectParameters>
</asp:SqlDataSource> 
<div id="container">

    <!-- This line tells where to insert the reusable code -->
    <general:Frame ID="framework" runat="server" />
	

	<!-- Start of Main Content Area -->

	<div id="main_panel">

		<!-- Start of Registration -->

		

		 <form id="Form1" runat="server">
            
			
			
			<!-- This panel is used to displays all the previous transactions -->
             <asp:Panel ID="PnlTrans" CssClass="trans_panel" Width="425px"  runat="server">
			      <asp:Label id="LblMsg" Height="20px" Font-Size="15px" Text = "" ForeColor="Red" runat="server" />
			      
			        <br /><br />
			
			      <asp:Label ID="LblTrans" ForeColor="#8A4117" Font-Size="16px" Font-Bold="true" runat="server" Text="Previous Transactions" Height="20px" />
		            <br /><br />
			      <!-- Here will be a list of transactions displayed as a table to be added dynamically onto this panel -->
			       <asp:Panel ID="PnlTable" Width="420px" runat="server">
			        <asp:GridView ID="transGrid" runat="server" DataSourceID = "customerTransaction" CellPadding="5" CellSpacing="5" 
         Font-Names="Verdana" Font-Size="Small" ForeColor="#333333" GridLines= "Both"
         AutoGenerateColumns="False" DataKeyNames="itemNumber" EnableSortingAndPagingCallbacks="True" PageSize="5">           
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
            
            <Columns>
            <asp:BoundField DataField="itemNumber" HeaderText="Item Number" />
                <asp:BoundField DataField="name" HeaderText="Item Name" />
                <asp:BoundField DataField="saleDate" HeaderText="Date"  />
                <asp:BoundField DataField="priceSold" HeaderText="Price Sold"  />
                
            </Columns>
			        
			        
			        </asp:GridView>
			       
			       </asp:Panel>
			        <asp:Label ID="LblTest" Height="30px" ForeColor="Red"  runat="server" />
			
			<asp:Label id="Label2" Height="20px" Font-Size="15px" Text = '<%# getDate() %>' ForeColor="Red" runat="server" />
			 </asp:Panel>
			    
			    
			  <!-- This panel is for showing shopping cart  -->
			 <asp:Panel ID="PnlCart" CssClass="main_cart_panel" Width="200px" runat="server">
			    <br />
			    <asp:Label ID="LblCart" Height="30px" ForeColor="#8A4117" Font-Size="15px" Font-Bold="true" Text="Shopping Cart" runat="server" />
			   <br />
			    <asp:Label ID="Label1" Height="30px" ForeColor="White" Font-Size="14px" Text="Total:" Font-Bold="true" runat="server" />
			    
			   
			    <asp:TextBox ID="TxtTotal" Height="30px" BackColor="Black" ForeColor="White" runat="server" Font-size="14px" Text="$0.00" ReadOnly="true" />
			    <br />
			    <asp:Button ID="BtnCheckout" Height="25px" ForeColor="Red"  Width="66px" Font-Bold="true" Text="Check Out" runat="server" />
			    <br /><br />
			    
			    <asp:Panel ID="LstItems" CssClass="cart_list_items" runat="server" ScrollBars="Auto">
			    <asp:Label ID="LstMsg" Text="No Items In Cart" runat="server" />
			   
			    
			    </asp:Panel>
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
