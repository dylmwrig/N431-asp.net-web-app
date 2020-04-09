<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Capstone2nd.Register" %>
<%@ Register TagPrefix="general" TagName="Nav" Src="Navigation.ascx" %>
<%@ Register TagPrefix="general" TagName="Footer" Src="Footer.ascx" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Register Page</title>


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
    <general:nav id="naviation" runat="server" />


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

            <!-- Register as Guest -->
            <asp:HyperLink CssClass="btn btn-primary" ID="regGuest" runat="server" NavigateUrl="~/RegisterGuest.aspx">Register as Guest</asp:HyperLink><hr />

            <!-- Register as PM -->
            <asp:HyperLink CssClass="btn btn-primary" ID="regPM" runat="server" NavigateUrl="~/RegisterPM.aspx">Register as Program Manager</asp:HyperLink>
            
        </form>
        </div>

        <div class="col-xl-2 col-lg-2">
        </div>

    </div>

    <!-- Footer -->
    <general:Footer ID="footer" runat="server" />

</body>
</html>