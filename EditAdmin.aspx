<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="EditAdmin.aspx.cs" Inherits="Capstone2nd.EditAdmin" %>
<%@ Register TagPrefix="general" TagName="Nav" Src="Navigation.ascx" %>
<%@ Register TagPrefix="general" TagName="Footer" Src="Footer.ascx" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Edit Admin</title>

  
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

    <div class="row">
        <div class="col-xl-2 col-lg-2">
        </div>

        <div class="col-xl-8 col-lg-8">
        <form id="form1" runat="server">

            <!--Error Message-->
            <asp:Label ID="lblMessage" Height="40px" Font-Size="18px" ForeColor="Red" runat="server" />


                <!--Text Box for Prefix-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label CssClass="input-group-text" ID="lblPrefix" runat="server" Text="Prefix:" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="prefix" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
                    </div>
                </div>

                <!--Text Box for First Name-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label CssClass="input-group-text" ID="lblFirst" runat="server" Text="First Name:*" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="first" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="firstNameValid" runat="server" ForeColor="Red" ErrorMessage="First name is a required field."
                            Display="Dynamic" ControlToValidate="first">*Required</asp:RequiredFieldValidator>
                    </div>
                </div>

                <!--Text Box for Middle Name-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label CssClass="input-group-text" ID="lblMiddle" runat="server" Text="Middle Name" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="middle" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
                    </div>
                </div>

                <!--Text Box for Last Name-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label CssClass="input-group-text" ID="lblLast" runat="server" Text="Last Name:*" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="last" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="lastNameValid" runat="server" ForeColor="Red" ErrorMessage="Last name is a required field."
                            Display="Dynamic" ControlToValidate="last">*Required</asp:RequiredFieldValidator>
                    </div>
                </div>

                <!--Text Box for Sufix-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label CssClass="input-group-text" ID="lblSufix" runat="server" Text="Sufix:" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="sufix" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
                    </div>
                </div>
            

                <!--Text Box for Password-->
                <hr /><div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label CssClass="input-group-text" ID="lblPassword" runat="server" Text="Password:*" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="pass" BackColor="White" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqPassword" runat="server" ForeColor="Red" ErrorMessage="Password is a required field."
                            Display="Dynamic" ControlToValidate="pass">*Required</asp:RequiredFieldValidator>
                    </div>
                </div>
                <asp:RegularExpressionValidator ID="regexPassword" runat="server" ControlToValidate="pass"
                    ErrorMessage="Password must contain: Min length 10; Characters, signs and numbers;" ForeColor="Red"
                    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{10,}$" />

                <!--Text Box for Password confirmation-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label CssClass="input-group-text" ID="lblconfirmPass" runat="server" Text="Confirm Password:*" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="confirmPass" BackColor="White" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqConfPassword" runat="server" ForeColor="Red" ErrorMessage="Confirm Password is a required field."
                            Display="Dynamic" ControlToValidate="confirmPass">*Required</asp:RequiredFieldValidator>
                    </div>
                </div>
                <asp:CompareValidator ID="compPass" runat="server" ForeColor="Red" ErrorMessage="Passwords do not match!"
                    ControlToValidate="confirmPass" ControlToCompare="pass"></asp:CompareValidator>

                <!--Validation Summary-->
                <asp:ValidationSummary ID="ValidationSummary" DisplayMode="List" runat="server" ForeColor="Red" />

                <!--Button for Submitting the Form-->
                <hr /><asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit" UseSubmitBehavior="true" OnClick="BtnSubmit_Click" />
        </form>



        <!--Confirmation Form-->
        <form id="form2" runat="server">
            <asp:Label ID="output" runat="server" ForeColor="Black" Font-Size="14pt"></asp:Label><hr />
            <asp:Button  CssClass="btn btn-success" ID="Confirm" runat="server" Text="Confirm" UseSubmitBehavior="true" OnClick="Confirm_Click" />
        </form>

        </div>
        <div class="col-xl-2 col-lg-2">
        </div>

    </div>
    
    <!-- Footer -->
    <general:Footer ID="footer" runat="server" />

</body>

</html>
