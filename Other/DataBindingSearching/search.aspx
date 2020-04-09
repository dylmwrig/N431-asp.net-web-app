<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>
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
<script type="text/javascript">
function ctPwdValidate(ctl, args)
{
    args.IsValid=(args.Value.length >=10);

}

</script>
</head>

<body>

<div id="container">

    <!-- This line tells where to insert the reusable code -->
    <general:Frame ID="framework" runat="server" />
	

	<!-- Start of Main Content Area -->

	<div id="main_content">

		<!-- Start of Registration -->

		<div id="registration">

		 <form id="Form1" runat="server">
            
			<div id="registration_info">
			<h1>Search Instruments</h1><br />
			<asp:Label id="LblMsg" Height="40px" Font-Size="18px" ForeColor="Red" runat="server" />
			<h2>Please enter the information below:</h2>
			
			</div>
            
			
   
			<div id="registration_form">
			<table>
			
			<tr>
			    <td>
			        <asp:Label id="LblType" CssClass="registration_label" runat="server">Select Type:</asp:Label>
			    </td>
			    <td>
			        <div class="registration_input">
			        <!-- contents of the drop down list is added dynamically from the database at page load -->
                        <asp:DropDownList ID="DrpType" runat="server" AutoPostBack="true" OnSelectedIndexChanged ="DrpType_Change">
                        
                        </asp:DropDownList>
			       
			        
			        </div>
			    </td>
			</tr>
			
			<tr>
			    <td>
			        <asp:Label id="LblModel" CssClass="registration_label" runat="server">Select Model:</asp:Label>
			    </td>
			    <td>
			        <div class="registration_input">
			             <!-- contents of the drop down list is added dynamically from the database at page load -->
                        <asp:DropDownList ID="DrpModel" runat="server">
                        
                        </asp:DropDownList>
			        
			        </div>
			    </td>
			</tr>
			

            <tr>
			    <td>
			        <asp:Label id="LblName" CssClass="registration_label" runat="server">Name Contains:</asp:Label>
			    </td>
			    <td>
			         <div class="registration_input">
			        <asp:TextBox ID="TxtName" MaxLength = "50"  width="300" Height="20" Text="" runat="server"  Font-Size="12"></asp:TextBox>
			         
			        </div>
			    </td>
			</tr>
            <tr>
			    <td>
			        <asp:Label id="Label1" CssClass="registration_label" runat="server">Price(integer only):</asp:Label>
			    </td>
			    <td>
			         <div class="registration_input">
			         Between<asp:TextBox ID="TxtPrice1" MaxLength = "20"  width="100" Height="20" Text="1" runat="server"  Font-Size="12"></asp:TextBox>
                      <asp:RangeValidator runat="server" Display="Dynamic" ControlToValidate="TxtPrice1" MinimumValue="1"  MaximumValue="2000000" Type="Integer">Greater than 1
                      </asp:RangeValidator>
			         And 
                     <asp:TextBox ID="TxtPrice2" MaxLength = "20"  width="100" Height="20" Text="15000" runat="server"  Font-Size="12"></asp:TextBox>
                     <asp:RangeValidator runat="server" Display="Dynamic" ControlToValidate="TxtPrice2" MinimumValue="1" MaximumValue="2000000" Type="Integer" >Greater than 1
                     </asp:RangeValidator>
              
                         <asp:CompareValidator runat="server" Display="Dynamic" ControlToValidate="TxtPrice2"  ControlToCompare="TxtPrice1" operator="GreaterThanEqual" type="Integer"   > Second Number Must Be Greater
                     </asp:CompareValidator>
                   
			        </div>
			    </td>
			</tr>

            <tr>
			    <td>
			        <asp:Label id="Label2" CssClass="registration_label" runat="server">Stock Date:</asp:Label>
			    </td>
			    <td>
			         <div class="registration_input">
                         <asp:RadioButtonList ID="rblStockDate" runat="server" RepeatDirection ="Horizontal">
                                <asp:ListItem Selected="True" Value="1">On</asp:ListItem>
                                <asp:ListItem Value="2">Before</asp:ListItem>
                                <asp:ListItem Value="3">After</asp:ListItem>
                         </asp:RadioButtonList>
                         <asp:Calendar ID="cldStockDate" runat="server"  OnSelectionChanged="Calendar1_SelectionChanged">
                         </asp:Calendar>
                         <asp:TextBox ID="TxtStockDate" runat="server"></asp:TextBox></div>
			        </div>
			    </td>
			</tr>
             <tr>
			    <td>
			        <asp:Label id="Label3" CssClass="registration_label" runat="server">Order by:</asp:Label>
			    </td>
			    <td>
			        <div class="registration_input">
			             <!-- contents of the drop down list is added dynamically at page load -->
                        <asp:DropDownList ID="DrpOrder" runat="server">
                        
                        </asp:DropDownList>
			        
			        </div>
			    </td>

              
			</tr>
            <tr>
                <td>
			        <asp:Label id="Label4" CssClass="registration_label" runat="server"></asp:Label>
			    </td>
                 <td>
			         <div class="registration_input">
                         <asp:RadioButtonList ID="RblOrder" runat="server" RepeatDirection ="Horizontal">
                                <asp:ListItem Value="">Ascending</asp:ListItem>
                                <asp:ListItem Value=" desc ">Descending</asp:ListItem>        
                         </asp:RadioButtonList>
                        
			        </div>
			    </td>
             
            </tr>

			</table>
		    <div id="BtnSmt" style="margin-top: 20px; margin-left: 150px;" >
		    <asp:Button ForeColor="White" BackColor="#9e9ec3" Font-Size="12" Font-Bold="true" 
                    ID="BtnSubmit" CausesValidation="true"  Visible="true" Text="Submit" 
                    runat="server" onclick="BtnSubmit_Click" />
		   
			</div>
            
				
								
			
				
			</div> <!-- End of registration_form -->

		</form>	

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
