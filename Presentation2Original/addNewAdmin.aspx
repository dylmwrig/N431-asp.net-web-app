<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addNewAdmin.aspx.cs" Inherits="Capstone2nd.addNewAdmin" %>
<%@ Register TagPrefix="general" TagName="Nav" Src="Navigation.ascx" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Add New Admin</title>

  
		<!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  
		<!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  
		<!-- Custom styles for this template -->
  <link href="css/grayscale.min.css" rel="stylesheet">
  <link href="css/myCss.css" rel="stylesheet">

</head>

<body id="page-top">

    
	    <!-- Navigation -->
    <general:Nav ID="naviation" runat="server" />

    
		<!-- Header -->
    <header class="masthead">
        <div class="container d-flex h-100 align-items-center">
            <div class="mx-auto text-center">
            </div>
        </div>
    </header>

    <form id="form1" runat="server">
		<!--Error Message-->
        <asp:Label id="lblMessage" Height="25px" Font-Size="18px" ForeColor="Red" runat="server" /><br />

        <!--Text Box for Prefix-->
        <asp:Label ID="lblPrefix" runat="server" Text="Prefix:" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="prefix" runat="server" backColor="White" onfocus="this.select()"></asp:TextBox><br />

		<!--Text Box for First Name-->
        <asp:Label ID="lblFirst" runat="server" Text="First Name:*" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="first" runat="server" backColor="White" onfocus="this.select()"></asp:TextBox>
        <asp:RequiredFieldValidator ID="firstNameValid" runat="server" ForeColor="Red" ErrorMessage="First name is a required field." Display="Dynamic" ControlToValidate="first">*Required</asp:RequiredFieldValidator><br />
        
        <!--Text Box for Middle Name-->
        <asp:Label ID="lblMiddle" runat="server" Text="Middle Name" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="middle" runat="server" backColor="White" onfocus="this.select()"></asp:TextBox><br />

		<!--Text Box for Last Name-->
        <asp:Label ID="lblLast" runat="server" Text="Last Name:*" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="last" runat="server" backColor="White" onfocus="this.select()"></asp:TextBox>
        <asp:RequiredFieldValidator ID="lastNameValid" runat="server" ForeColor="Red" ErrorMessage="Last name is a required field." Display="Dynamic" ControlToValidate="last">*Required</asp:RequiredFieldValidator><br />
        
        <!--Text Box for Sufix-->
        <asp:Label ID="lblSufix" runat="server" Text="Sufix:" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="sufix" runat="server" backColor="White" onfocus="this.select()"></asp:TextBox><br /><br />

		<!--Text Box for Email Address-->
        <asp:Label ID="lblEmail" runat="server" Text="Email Address:*" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="email" runat="server" backColor="White"></asp:TextBox>
         <asp:RequiredFieldValidator ID="reqEmail" runat="server" ForeColor="Red" ErrorMessage="Email is a required field." Display="Dynamic" ControlToValidate="email">*Required</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regexEmail" ForeColor="Red" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator><br />
        
		<!--Text Box for Email Address confirmation-->
        <asp:Label ID="lblConfirmEmail" runat="server" Text="Confirm Email Address:*" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="confirmEmail" runat="server" backColor="White"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqConfEmail" runat="server" ForeColor="Red" ErrorMessage="Confirm Email is a required field." Display="Dynamic" ControlToValidate="confirmEmail">*Required</asp:RequiredFieldValidator>                        
        <asp:CompareValidator ID="compEmail" runat="server" ForeColor="Red" ErrorMessage="Emails do not match!" ControlToValidate="confirmEmail" ControlToCompare="email"></asp:CompareValidator><br /><br />
        
		<!--Text Box for Password-->
        <asp:Label ID="lblPassword" runat="server" Text="Password:*" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="password" backColor="White" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqPassword" runat="server" ForeColor="Red" ErrorMessage="Password is a required field." Display="Dynamic" ControlToValidate="password">*Required</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regexPassword" runat="server" ControlToValidate="password"
            ErrorMessage="Password must contain: Min length 10; Characters, signs and numbers;" ForeColor="Red"
            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{10,}$"/><br />
        
		<!--Text Box for Password confirmation-->
        <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:*" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="confirmPassword" backColor="White" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqConfPassword" runat="server" ForeColor="Red" ErrorMessage="Confirm Password is a required field." Display="Dynamic" ControlToValidate="confirmPassword">*Required</asp:RequiredFieldValidator>
        <asp:CompareValidator ID="compPass" runat="server" ForeColor="Red" ErrorMessage="Passwords do not match!" ControlToValidate="confirmPassword" ControlToCompare="password"></asp:CompareValidator><br /><br /><br />
        
        <!--Text Box for Alt Email Address-->
        <asp:Label ID="lblAltEmail" runat="server" Text="Alternative Email Address:" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="altEmail" runat="server" backColor="White"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regexAltEmail" ForeColor="Red" runat="server" 
            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="altEmail" ErrorMessage="Invalid Alternative Email Format"></asp:RegularExpressionValidator><br />

        <!--Text Box for Alt Password-->
        <asp:Label ID="lblAltPass" runat="server" Text="Alternative Email's Password:" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="altPass" backColor="White" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regexAltPass" runat="server" ControlToValidate="altPass"
            ErrorMessage="Alternative Email's Password must contain: Min length 10; Characters, signs and numbers;" ForeColor="Red"
            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{10,}$"/><br /><br />

         <!--Text Box for Phone-->
        <asp:Label ID="lblPhone" runat="server" Text="Phone number:" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="phone" TextMode="Phone" backColor="White" runat="server"></asp:TextBox><br /><br />

         <!--Text Box for Address-->
        <asp:Label ID="lblAddress" runat="server" Text="Address:" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="address" runat="server" backColor="White" onfocus="this.select()"></asp:TextBox><br /><br />

		<!--Radio Button List for Gender-->
        <asp:Label ID="lblGender" runat="server" Text="Gender:" foreColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:RadioButtonList ID="radioGender" runat="server" Font-Size="10" Font-Strikeout="False" foreColor="Black" TextAlign="Left">
            <asp:ListItem value="Male"></asp:ListItem>
            <asp:ListItem value="Female"></asp:ListItem>
        </asp:RadioButtonList><br />

		<!--Validation Summary-->
        <asp:ValidationSummary ID="ValidationSummary" DisplayMode="List" runat="server" ForeColor="Red"/>
        
		<!--Button for Submitting the Form-->
        <asp:Label ID="lblBtnSubmit" runat="server" ForeColor="Blue" Font-Size="18pt"></asp:Label><br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" UseSubmitBehavior="true" OnClick="BtnSubmit_Click"/>
    </form>



	<!--Confirmation Form-->
    <form id="form2" runat="server">
        <asp:Label ID="output" runat="server" ForeColor="Black" Font-Size="14pt"></asp:Label><br /><br />
        <asp:Button ID="Confirm" runat="server" Text="Confirm" UseSubmitBehavior="true" OnClick="Confirm_Click"/>
    </form>

    
	<!-- Footer -->
    <footer class="bg-black small text-center text-white-50">
        <div class="container">
            Copyright &copy; Your Website 2019
        </div>
    </footer>

    
		<!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    
		<!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    
		<!-- Custom scripts for this template -->
    <script src="js/grayscale.min.js"></script>

</body>

</html>