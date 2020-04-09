<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="Label1" runat="server" Font-Size="20px" ForeColor="Maroon">Login</asp:Label>
    <br /><br />

     <div id ="lblMsg" runat="server" style="font-size:18px;color:maroon">


     </div>
    <asp:Label ID="uname" runat="server">Username:</asp:Label>
        <asp:TextBox runat="server" Width="200px" ID="txtEmail" />
						<asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="E-mail is required" Display="dynamic"
							ID="Requiredfieldvalidator2">*
				</asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator runat="server" ID="ValidateEmail" ControlToValidate="txtEmail" validationExpression=".*@.{2,}\..{2,}"
							ErrorMessage="E-mail is not in a valid format" Display="dynamic">*
    				</asp:RegularExpressionValidator>
        <br /> <br />
    <asp:Label ID="pwd" runat="server">Password:</asp:Label>
        <asp:TextBox TextMode="Password" runat="server" Width="200px" ID="txtPassword" />
						<asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required"
							Display="dynamic" ID="Requiredfieldvalidator3" Name="Requiredfieldvalidator3">
							<img src="imgError.gif" alt="Missing required field." />
						</asp:RequiredFieldValidator>
         <br /> <br />
        <asp:Button ID="enter" runat="server" Text="Submit"/>
    </div>
    </form>
</body>
</html>
