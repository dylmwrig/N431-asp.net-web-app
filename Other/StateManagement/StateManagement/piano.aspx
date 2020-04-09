<%@ Page Language="C#" AutoEventWireup="true" Debug="true"  CodeFile="piano.aspx.cs" Inherits="piano" %>
<%@ Register TagPrefix="general" TagName="Frame" Src="WebUserControl.ascx" %>
<%@ Register TagPrefix="general" TagName="Footer" Src="FooterUserControl.ascx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Content-Style-Type" content="text/css" />

<title>
    Appassionata Music Store: Piano
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
			      <asp:Label id="LblMsg" Height="20px" Font-Size="15px"   Text=" " ForeColor="Red" runat="server" />
			        <br /><br />
			
			      <asp:Label ID="LblTrans"  ForeColor="#8A4117" Font-Size="16px" Font-Bold="true" runat="server" Text="PIANOS" Height="20px" />
		            <br /><br />
			      <!-- Here will be a list of transactions displayed as a table to be added dynamically onto this panel -->
			       <asp:Panel ID="PnlTable" Width="620px" runat="server">
			       
			      
			        <asp:GridView ID="pianoGrid" runat="server" DataSourceID = "AllFlute" 
                           CellPadding="15" CellSpacing="15" 
                        Font-Names="Verdana" Font-Size="Small" ForeColor="#333333" GridLines= "Both"
                        AutoGenerateColumns="False" DataKeyNames="ItemNumber" 
                        EnableSortingAndPagingCallbacks="False" PageSize="5" OnRowCommand="pianoGrid_RowCommand">
                          
                                  
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
            
                <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
          <div style="width:620px; float:left; text-align:left; margin: 10px 10px 10px 10px;">
                         <b>
                        <%# Eval("Name") %>,  <%# Eval("ItemNumber") %>,  <%# Eval("Model") %> 
                        </b>
                    
                        <br /><br />
                        <img src= '<%# "images/" + Eval("ItemNumber") + ".jpg" %>' alt = "piano" height="160" width="160" />
                        
                         <br /><br />
                        
                        <%# Eval("Description")%> 
                        
                        <br />  <br />
                        Price: $ <%# Eval("Price") %> 
                        <br />  <br />
                        <asp:Button ID="selectButton"  Text="Add to Cart" runat="server" CommandName="addToCart" CommandArgument='<%# Eval("ItemNumber") + "," + Eval("Price") + "," + Eval("Name")%>' />
                       
                    </ItemTemplate>
                
                </asp:TemplateField>
                 
                 
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




</body>
</html>
