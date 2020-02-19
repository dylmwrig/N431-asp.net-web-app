<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="NewSol.Register" %>



<!DOCTYPE html>
<html lang="en">

<head runat="server">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Grayscale - Start Bootstrap Theme</title>

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
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">Start Bootstrap</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="Default.aspx">Home Page</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Header -->
    <header class="masthead">
        <div class="container d-flex h-100 align-items-center">
            <div class="mx-auto text-center">
                <h1 class="mx-auto my-0 text-uppercase">Register</h1>
                 <h2 class="text-white-50 mx-auto mt-2 mb-5">Before starting the form choose the role</h2>
            </div>
        </div>
    </header>

    <form id="form1" runat="server">
         <!--Check Box List for User Type-->
        <asp:Label ID="lblUserType" runat="server" Text="User Type*" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:RadioButtonList AutoPostBack="true" ID="radioUserType" runat="server" Font-Size="10" Font-Strikeout="False" foreColor="Black" TextAlign="Left" OnSelectedIndexChanged="radioUserType_SelectedIndexChanged">
	        <asp:ListItem value="Program Director"></asp:ListItem>
	        <asp:ListItem value="Guest"></asp:ListItem>
        </asp:RadioButtonList><br />
         <!--Drop down list for Role-->
        <asp:Label ID="lblRole" runat="server" Text="Role*" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:DropDownList ID="role" runat="server">
            <asp:ListItem value="Not Selected"></asp:ListItem>
	        <asp:ListItem value="Outreach Program Director"></asp:ListItem>
	        <asp:ListItem value="Outreach Program Staff"></asp:ListItem>
	        <asp:ListItem value="CTSI K-12 Program Staff"></asp:ListItem>
	        <asp:ListItem value="Past Program Participant"></asp:ListItem>
            <asp:ListItem value="Past Program Parent"></asp:ListItem>
            <asp:ListItem value="School Teacher or Staff"></asp:ListItem>
            <asp:ListItem value="Other"></asp:ListItem>
        </asp:DropDownList><br />
        <asp:RequiredFieldValidator ID="roleValid" runat="server" ForeColor="Red" ErrorMessage="Role name is required." Display="Dynamic" ControlToValidate="role">*Required</asp:RequiredFieldValidator>
        <!--Text Box for Other Role Name-->
        <asp:Label ID="lblOtherRole" runat="server" Text="Other Role Name" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="otherRole" runat="server" backColor="White" onfocus="this.select()"></asp:TextBox><br /><br />
        <!--Text Box for First Name-->
        <asp:Label ID="lblFirst" runat="server" Text="First Name*" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="first" runat="server" backColor="White" onfocus="this.select()"></asp:TextBox>
        <asp:RequiredFieldValidator ID="firstNameValid" runat="server" ForeColor="Red" ErrorMessage="First name is a required field." Display="Dynamic" ControlToValidate="first">*Required</asp:RequiredFieldValidator><br />
        <!--Text Box for Last Name-->
        <asp:Label ID="lblLast" runat="server" Text="Last Name*" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="last" runat="server" backColor="White" onfocus="this.select()"></asp:TextBox>
        <asp:RequiredFieldValidator ID="lastNameValid" runat="server" ForeColor="Red" ErrorMessage="Last name is a required field." Display="Dynamic" ControlToValidate="last">*Required</asp:RequiredFieldValidator><br /><br />
        <!--Text Box for Email Address-->
        <asp:Label ID="lblEmail" runat="server" Text="Email Address*" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="email" runat="server" backColor="White"></asp:TextBox>
         <asp:RequiredFieldValidator ID="reqEmail" runat="server" ForeColor="Red" ErrorMessage="Email is a required field." Display="Dynamic" ControlToValidate="email">*Required</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regexEmail" ForeColor="Red" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator><br />
        <!--Text Box for Email Address confirmation-->
        <asp:Label ID="lblConfirmEmail" runat="server" Text="Confirm Email Address*" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="confirmEmail" runat="server" backColor="White"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqConfEmail" runat="server" ForeColor="Red" ErrorMessage="Confirm Email is a required field." Display="Dynamic" ControlToValidate="confirmEmail">*Required</asp:RequiredFieldValidator>						
        <asp:CompareValidator ID="compEmail" runat="server" ForeColor="Red" ErrorMessage="Emails do not match!" ControlToValidate="confirmEmail" ControlToCompare="email"></asp:CompareValidator><br /><br />
        <!--Text Box for Password-->
        <asp:Label ID="lblPassword" runat="server" Text="Password*" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="password" TextMode="Password" backColor="White" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqPassword" runat="server" ForeColor="Red" ErrorMessage="Password is a required field." Display="Dynamic" ControlToValidate="password">*Required</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regexPassword" runat="server" ControlToValidate="password"
	        ErrorMessage="Password must contain: Min length 10; Characters, signs and numbers;" ForeColor="Red"
	        ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{10,}$"/><br />
        <!--Text Box for Password confirmation-->
        <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password*" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="confirmPassword" TextMode="Password" backColor="White" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqConfPassword" runat="server" ForeColor="Red" ErrorMessage="Confirm Password is a required field." Display="Dynamic" ControlToValidate="confirmPassword">*Required</asp:RequiredFieldValidator>
        <asp:CompareValidator ID="compPass" runat="server" ForeColor="Red" ErrorMessage="Passwords do not match!" ControlToValidate="confirmPassword" ControlToCompare="password"></asp:CompareValidator><br /><br /><br />
        <!--Radio Button List for Gender-->
        <asp:Label ID="lblGender" runat="server" Text="GENDER" foreColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:RadioButtonList ID="radioGender" runat="server" Font-Size="10" Font-Strikeout="False" foreColor="Black" TextAlign="Left">
	        <asp:ListItem value="Male"></asp:ListItem>
	        <asp:ListItem value="Female"></asp:ListItem>
        </asp:RadioButtonList><br /><br />
        <!--Drop down list for Department-->
        <asp:Label ID="lblDepartment" runat="server" Text="DEPARTMENT" foreColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:DropDownList ID="department" runat="server">
	        <asp:ListItem value="Not Selected"></asp:ListItem>
	        <asp:ListItem value="Math"></asp:ListItem>
	        <asp:ListItem value="Science"></asp:ListItem>
	        <asp:ListItem value="Engineering"></asp:ListItem>
	        <asp:ListItem value="Medicine"></asp:ListItem>
        </asp:DropDownList><br /><br /><br />
        <!--Check Box List for Status-->
        <asp:Label ID="lblStatus" runat="server" Text="STATUS" foreColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:CheckBoxList ID="status" runat="server" Font-Size="10" Font-Strikeout="False" foreColor="Black" TextAlign="Left">
	        <asp:ListItem value="Student"></asp:ListItem>
	        <asp:ListItem value="Faculty"></asp:ListItem>
	        <asp:ListItem value="Staff"></asp:ListItem>
        </asp:CheckBoxList><br /><br />
        <!--Check Box for Accepting Terms-->
        <asp:Label ID="lblAgree" runat="server" Text="I agree to terms and policies." foreColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:CheckBox ID="agree" runat="server" /><br />
        <!--Validation Summary-->
        <asp:ValidationSummary ID="ValidationSummary1" DisplayMode="List" runat="server" ForeColor="Red"/>
        <!--Button for Submitting the Form-->
        <asp:Label ID="Label1" runat="server" ForeColor="Blue" Font-Size="18pt"></asp:Label><br />
        <asp:Button ID="Button1" runat="server" Text="Submit" UseSubmitBehavior="true" OnClick="BtnSubmit_Click"/>
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

