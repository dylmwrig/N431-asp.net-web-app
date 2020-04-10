<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePwd.aspx.cs" Inherits="Capstone2nd.ChangePwd" %>
<%@ Register TagPrefix="general" TagName="Nav" Src="Navigation.ascx" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Change Password Page</title>    
    
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

        <!--Text Box for Email Address-->
        <asp:Label ID="lblEmail" runat="server" Text="Email Address*" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="email" runat="server" backColor="White"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqEmail" runat="server" ForeColor="Red" ErrorMessage="Email is a required field." Display="Dynamic" ControlToValidate="email">*Required</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regexEmail" ForeColor="Red" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator><br />

        <!--Text Box for Current Password-->
        <asp:Label ID="lblCurPass" runat="server" Text="Current Password*" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="currPass" BackColor="White" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqCurPass" runat="server" ForeColor="Red" ErrorMessage="Current Password is a required field." 
            Display="Dynamic" ControlToValidate="currPass">*Required</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regexCurrPass" runat="server" ControlToValidate="currPass"
            ErrorMessage="Password must contain: Min length 10; Characters, signs and numbers;" ForeColor="Red"
            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{10,}$"/><br />
        
        <!--Text Box for New Password-->
        <asp:Label ID="lblNewPass" runat="server" Text="New Password*" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="newPass" backColor="White" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqNewPass" runat="server" ForeColor="Red" ErrorMessage="New Password is a required field." 
            Display="Dynamic" ControlToValidate="newPass">*Required</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regexNewPass" runat="server" ControlToValidate="newPass"
            ErrorMessage="Password must contain: Min length 10; Characters, signs and numbers;" ForeColor="Red"
            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{10,}$"/><br />
        
        <!--Text Box for Password confirmation-->
        <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password*" foreColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="confirmPassword" backColor="White" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqConfPassword" runat="server" ForeColor="Red" ErrorMessage="Confirm Password is a required field." 
            Display="Dynamic" ControlToValidate="confirmPassword">*Required</asp:RequiredFieldValidator>
        <asp:CompareValidator ID="compPass" runat="server" ForeColor="Red" ErrorMessage="Passwords do not match!" 
            ControlToValidate="confirmPassword" ControlToCompare="newPass"></asp:CompareValidator><br /><br />
        
        <!--Button for Submitting the Form-->
        <asp:Button ID="BtnSubmit" runat="server" Text="Submit" UseSubmitBehavior="true" OnClick="BtnSubmit_Click"/>

        <!--Message-->
        <asp:Label ID="lblMessage" Font-Size="16px" ForeColor="Red" Height="20px" runat="server" ></asp:Label>
    </form>
</body>
</html>