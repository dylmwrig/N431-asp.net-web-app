<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Capstone2nd.Login" %>
<%@ Register TagPrefix="general" TagName="Nav" Src="Navigation.ascx" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Login Page</title>

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
        <!--Text Box for user Name-->
        <asp:Label ID="lbluser" runat="server" Text="Username" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="userName" runat="server" TextMode="SingleLine" backColor="White" onfocus="this.select()"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqUsername" runat="server" ForeColor="Red" ErrorMessage="Username is required." 
            Display="Dynamic" ControlToValidate="userName">*Required</asp:RequiredFieldValidator><br />
        
        <!--Text Box for Password-->
        <asp:Label ID="lblPassword" runat="server" Text="Password" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="password" TextMode="Password" backColor="White" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator  ID="reqPass" runat="server"  ErrorMessage="Password is required" 
            Display="dynamic" ControlToValidate="password">*Required</asp:RequiredFieldValidator><br />

        <!--Link to forgot pwd page-->
        <asp:HyperLink ID="forgotID" runat="server" NavigateUrl="~/ForgetPwd.aspx" Visible="true">Forgot password?</asp:HyperLink><br />

        <!--Link to register page-->
        <asp:HyperLink ID="registerID" runat="server" NavigateUrl="~/Register.aspx" Visible="true">Don't have an account yet?</asp:HyperLink>

        <!--Button for Submitting the Form-->
        <asp:Label ID="lblSubmit" runat="server" ForeColor="Blue" Font-Size="18pt"></asp:Label><br />
        <asp:Button ID="BtnSubmit" runat="server" Text="Submit" UseSubmitBehavior="true" OnClick="BtnSubmit_Click"/>

        <!--Message-->
        <asp:Label id="lblMessage" Height="40px" Font-Size="18px" ForeColor="Red" runat="server" />
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


</body>

</html>