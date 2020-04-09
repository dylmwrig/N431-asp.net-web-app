<%@ Page Language="C#" AutoEventWireup="true" Debug="true"  CodeFile="flute.aspx.cs" Inherits="flute" %>
<%@ Register TagPrefix="general" TagName="Frame" Src="WebUserControl.ascx" %>
<%@ Register TagPrefix="general" TagName="Footer" Src="FooterUserControl.ascx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Content-Style-Type" content="text/css" />

<title>
    Appassionata Music Store: Flute
</title>

<link rel="stylesheet" href="style.css" type="text/css" media="screen" />



</head>

<body>

<asp:ObjectDataSource ID="AllFlute" runat="server" TypeName = "InstrumentDB" SelectMethod = "GetAllFlute">

    
</asp:ObjectDataSource> 


<div id="container">

    <!-- This line tells where to insert the reusable code -->
    <general:Frame ID="framework" runat="server" />
	

	<!-- Start of Main Content Area -->

	<div id="main_panel">

		<!-- Start of Registration -->

		

		 <form id="Form1" runat="server">
            
			
			
			<!-- This panel is used to displays all the previous transactions -->
             <asp:Panel ID="PnlTrans" CssClass="instru_panel" Width="725px"  runat="server">
			      <asp:Label id="LblMsg" Height="20px" Font-Size="15px"  ForeColor="Red" runat="server" />
			        <br /><br />
			
			      <asp:Label ID="LblTrans"  ForeColor="#8A4117" Font-Size="16px" Font-Bold="true" runat="server" Text="Flute" Height="20px" />
		            <br /><br />
			      <!-- Here will be a list of transactions displayed as a table to be added dynamically onto this panel -->
			       <asp:Panel ID="PnlTable" Width="720px" runat="server">
			       
			      
			        <asp:GridView ID="fluteGrid" runat="server" DataSourceID = "AllFlute" 
                           CellPadding="5" CellSpacing="5" 
                        Font-Names="Verdana" Font-Size="Small" ForeColor="#333333" GridLines= "Both"
                        AutoGenerateColumns="False" DataKeyNames="itemNumber" 
                        EnableSortingAndPagingCallbacks="False" PageSize="5" 
                        onselectedindexchanged="fluteGrid_SelectedIndexChanged">           
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
            
            
                    <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Item Name" SortExpression="Name"> <ItemStyle Width="80" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ItemNumber" HeaderText="Item Number" SortExpression="ItemNumber">
                        <ItemStyle Width="80" />
                    </asp:BoundField>
      
                    <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model"> <ItemStyle Width="80" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price"> <ItemStyle Width="80" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"> <ItemStyle Width="215" />
                    </asp:BoundField>
                    <asp:CommandField ShowSelectButton="true" ButtonType = "Button"  ItemStyle-Width = "60" SelectText = "  Add to Cart  " />
                    </Columns>
			        
			        
		</asp:GridView>
			      
			       
			       </asp:Panel>
			        <asp:Label ID="LblTest" Height="30px" ForeColor="Red"  runat="server" />
			
			
			    </asp:Panel>
			    
		

		</form>

			<div class="clearthis">&nbsp;</div>
	

		<!-- End of main panel -->


		
		
		
		
			
			
			

			
		</div>


	

	<!-- End of Main Content Area -->


	<div class="clearthis">&nbsp;</div>


	<!-- This line tells where to insert the reusable general frame code -->
    <general:Footer ID="footer" runat="server" />


</body>
</html>