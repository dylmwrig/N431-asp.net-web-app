<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgetPwd3.aspx.cs" Inherits="forgetPwd3" %>
<%@ Register TagPrefix="general" TagName="Frame" Src="WebUserControl.ascx" %>
<%@ Register TagPrefix="general" TagName="Footer" Src="FooterUserControl.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Content-Style-Type" content="text/css" />

<title>
Appassionata Music Store: Forget Password
</title>

<link rel="stylesheet" href="style.css" type="text/css" media="screen" />

</head>

<body>

<div id="container">

	<!-- This line tells where to insert the reusable code -->
    <general:Frame ID="framework" runat="server" />

	

	<div id="main_content">

		<!-- Start of forgetPwd -->

		<div id="forgetPwd">

			
        	

			<form ID="Frm1" runat="server">
			
			    <div id="forgetPwd_form">
			        
			        <asp:Panel ID="Pnl1" runat="server" >
			        <asp:Label ID="LblMsg1" Font-Size="16px" ForeColor="Red" Height="20px" runat="server" ></asp:Label>
		
			        <div id="forgetPwd_info">
			            <h1>Forget Password?</h1><br />
			            <h2>Enter Username (the email you registered):</h2>
			
			         </div>
			        <table>
			            <tr>
			                <td>
			                <asp:Label id="LblEm" CssClass="forgetPwd_label" runat="server">Username:</asp:Label>
			                </td>
			                <td>
			                    <div class="forgetPwd_input">
			                        <asp:TextBox ID="TxtEm" MaxLength = "50"  width="300" Height="20" Text="" runat="server"  Font-Size="12"></asp:TextBox>
			                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtEm" ErrorMessage="Required Field" Display="Dynamic">*Required</asp:RequiredFieldValidator>
			       
			                    </div>
			                </td>
			            </tr>
			
			
			        </table>
			        <div id="Div1" style="margin-top: 20px; margin-left: 150px;" >
		                <asp:Button ForeColor="White" BackColor="#9e9ec3" Font-Size="12" Font-Bold="true" 
                            ID="BtnEnter" CausesValidation="true"  Visible="true" Text="Enter" 
                            runat="server" onclick="BtnEnter_Click" />
		   
			        </div>
			        
			        </asp:Panel> <!--End of the first panel -->
			        <br /><br />
			
			
			        <!--This is the second panel, set to invisible first. Will be set to visible if user entered correct username.-->
			        <asp:Panel ID="Pnl2" Visible="false" runat="server">
			            <asp:Label ID="LblMsg2" Font-Size="16px" ForeColor="Red" Height="20px"  runat="server" ></asp:Label>
		
			            <div id="Div2">
			
			                <h2>Enter Security Answers:</h2>
			
			            </div>
			
			            <table>
			                <tr>
			                <td>
			                    <asp:Label id="Label1" CssClass="forgetPwd_label" runat="server">Security Question 1:</asp:Label>
			
			                </td>
			                <td>
			                    <div class="forgetPwd_input">
			                    <asp:Label ID="LblSq1" Height="20px"  runat="server" />
			
			
			                    </div>
			
			                </td>
			            </tr>
			            <tr>
			                <td>
			                    <asp:Label id="Label3" CssClass="forgetPwd_label" runat="server">Answer:</asp:Label>
			
			                 </td>
			                <td>
			                    <div class="forgetPwd_input">
			                        <asp:TextBox ID="TxtAns1" MaxLength = "50"  width="300" Height="20" Text="" runat="server"  Font-Size="12"></asp:TextBox>
			                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtAns1" ErrorMessage="Required Field" Display="Dynamic">*Required</asp:RequiredFieldValidator>
			   
			                    </div>
			
			                </td>
			            </tr>
			            <tr>
			                <td>
			                    <asp:Label id="Label4" CssClass="forgetPwd_label" runat="server">Security Question 2:</asp:Label>
			                </td>
			                <td>
			                    <div class="forgetPwd_input">
			                        <asp:Label ID="LblSq2" Height="20px"  runat="server" />
			
			                    </div>
			
			                </td>
			            </tr>
			            <tr>
			                <td>
			                <asp:Label id="Label6" CssClass="forgetPwd_label" runat="server">Answer:</asp:Label>
			                </td>
			                <td>
			                    <div class="forgetPwd_input">
			                        <asp:TextBox ID="TxtAns2" MaxLength = "50"  width="300" Height="20" Text="" runat="server"  Font-Size="12"></asp:TextBox>
			                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TxtAns2" ErrorMessage="Required Field" Display="Dynamic">*Required</asp:RequiredFieldValidator>
			   
			                    </div>
			
			                </td>
			            </tr>
			
			
			        </table>
	
			
			
			        <div id="Div3" style="margin-top: 20px; margin-left: 150px;" >
		            <asp:Button ID="BtnSubmit" ForeColor="White" BackColor="#9e9ec3" Font-Size="12" 
                    Font-Bold="true" CausesValidation="true"  Visible="true" Text="Submit" 
                    runat="server" onclick="BtnSubmit_Click" />
		   
			        </div>

			        </asp:Panel> <!-- This is the end of the second panel -->
		   
			
			
				
		    </div><!-- end of forgetPwd_form -->

	    </form>

        <!-- The third panel is used to display the retrieved password, set to visible at that time -->
        <asp:Panel ID="Pnl3" Visible="false" runat="server">
        <asp:Label ID="LblPwd"  Text = "test" Height = "20px" runat="server" />
            
        </asp:Panel>
		<div class="clearthis">&nbsp;</div>
		</div><!-- End of forgetPwd -->
	</div><!-- End of Main Content Area -->


	<div class="clearthis">&nbsp;</div>


	<!-- This line tells where to insert the reusable general frame code -->
    <general:Footer ID="footer" runat="server" />
</div> <!-- End of container -->

</body>
</html>

