﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Validators.aspx.cs" Inherits="Validators" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript">
      function EmpIDClientValidate(ctl, args)
      {

        // the value is a multiple of 5 if the module by 5 is 0
        //args.IsValid=(args.Value%5 == 0);
        if (args.Value%5 == 0) args.IsValid == true;
        else alert("ID field not valid");
        
      }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
				<tr>
					<td>Description
                        <asp:ValidationSummary runat="server" ID="Summary" DisplayMode="BulletList" HeaderText="<b>Please review the following errors:</b>" />



					</td>
					<td/>
				</tr>
				<tr>
					<td>Name:</td> 
					<td>
					
						<asp:TextBox runat="server" Width="200px" ID="txtName" Text="test" />
						<asp:RequiredFieldValidator runat="server" ID="ValidateName"  ControlToValidate="txtName" 
							Display="dynamic">Required</asp:RequiredFieldValidator>
							
							
						<asp:RegularExpressionValidator runat="server" ID="ValidateName2" ControlToValidate="txtName" validationExpression="[a-z A-Z]*"
							ErrorMessage="Name cannot contain digits" Display="dynamic">Cannot contain digits
    			</asp:RegularExpressionValidator>


					</td>
				</tr>
				<tr>
					<td>ID (multiple of 5):</td>
					<td>
                        <input type="text" runat="server" ID="txtEmpID" value="15" />
					
						<asp:RequiredFieldValidator runat="server" ID="ValidateEmpID" ControlToValidate="txtEmpID" ErrorMessage="ID is required"
							Display="dynamic">*
				</asp:RequiredFieldValidator>
						<asp:CustomValidator runat="server" ID="ValidateEmpID2" ControlToValidate="txtEmpID" ClientValidationFunction="EmpIDClientValidate"
							ErrorMessage="ID must be a multiple of 5" Display="dynamic" OnServerValidate="ValidateEmpID2_ServerValidate">*
    			</asp:CustomValidator>
					</td>
				</tr>
				<tr>
					<td>Day off:<br/><small>08/05/2008-08/20/2008</small></td>
					<td>
						<asp:TextBox runat="server" Width="200px" ID="txtDayOff" Text="08/19/2008" />
						<asp:RequiredFieldValidator runat="server" ID="ValidateDayOff" ControlToValidate="txtDayOff" ErrorMessage="Day Off is required"
							Display="dynamic">*
				</asp:RequiredFieldValidator>
						<asp:RangeValidator runat="server" ID="ValidateDayOff2" ControlToValidate="txtDayOff" MinimumValue="08/05/2008"
							MaximumValue="08/20/2008" Type="Date" ErrorMessage="Day Off is not within the valid interval" Display="dynamic" SetFocusOnError="True">*
    			</asp:RangeValidator>
					</td>
				</tr>
				<tr>
					<td>Age&nbsp<small>( >= 18 )</small>:</td>
					<td>
						<asp:TextBox runat="server" Width="200px" ID="txtAge" Text="20" />
						<asp:RequiredFieldValidator runat="server" ControlToValidate="txtAge" ErrorMessage="Age is required" Display="dynamic"
							ID="Requiredfieldvalidator1">*
				</asp:RequiredFieldValidator>
						<asp:CompareValidator runat="server" ID="ValidateAge" ControlToValidate="txtAge" ValueToCompare="18" Type="Integer"
							Operator="GreaterThanEqual" ErrorMessage="You must be at least 18-year-old" Display="dynamic">*
    			</asp:CompareValidator>
					</td>
				</tr>
				<tr>
					<td style="height: 26px">E-mail:</td>
					<td style="height: 26px">
						<asp:TextBox runat="server" Width="200px" ID="txtEmail" Text="test@iupui.edu" />
						<asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="E-mail is required" Display="dynamic"
							ID="Requiredfieldvalidator2">*
				</asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator runat="server" ID="ValidateEmail" ControlToValidate="txtEmail" validationExpression=".*@.{2,}\..{2,}"
							ErrorMessage="E-mail is not in a valid format" Display="dynamic">*
    				</asp:RegularExpressionValidator>
					</td>
				</tr>
				<tr>
					<td>Password:</td>
					<td>
						<asp:TextBox TextMode="Password" runat="server" Width="200px" ID="txtPassword" Text="111" />
						<asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required"
							Display="dynamic" ID="Requiredfieldvalidator3" Name="Requiredfieldvalidator3">
							<img src="imgError.gif" alt="Missing required field." />
						</asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td>Re-enter Password:</td>
					<td>
						<asp:TextBox runat="server" TextMode="Password" Width="200px" ID="txtPassword2" Text="111" />
						<asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword2" ErrorMessage="Password2 is required"
							Display="dynamic" ID="Requiredfieldvalidator4" Name="Requiredfieldvalidator4">
							<img src="imgError.gif" alt="Missing required field." />
						</asp:RequiredFieldValidator>
						<asp:CompareValidator runat="server" ControlToValidate="txtPassword2" ControlToCompare="txtPassword" Type="String"
							ErrorMessage="The passwords don't match" Display="dynamic" ID="Comparevalidator1" Name="Comparevalidator1">
							<img src="imgError.gif" alt="Fields don't match." />
						</asp:CompareValidator>
					</td>
				</tr>
			</table><br />
			<asp:Button runat="server" Text="Submit" ID="Submit" OnClick="Submit_Click" /><br />
			<br />
			<asp:CheckBox runat="server" ID="chkEnableValidators" Checked="True" AutoPostBack="True" Text="Validators enabled" OnCheckedChanged="OptionsChanged" />
			<br />
			<asp:CheckBox runat="server" ID="chkEnableClientSide" Checked="True" AutoPostBack="True" Text="Client-side validation enabled" OnCheckedChanged="OptionsChanged" />
			<br />
			<asp:CheckBox runat="server" ID="chkShowSummary" Checked="True" AutoPostBack="True" Text="Show summary" OnCheckedChanged="OptionsChanged" />
			<br />
			<asp:CheckBox runat="server" ID="chkShowMsgBox" Checked="False" AutoPostBack="True" Text="Show message box" OnCheckedChanged="OptionsChanged" />
			<br />
			<br />
			
				<asp:Label runat="server" ID="lblResult" ForeColor="magenta" Font-Bold="true" EnableViewState="False" />
			
    </div>
    </form>
</body>
</html>
