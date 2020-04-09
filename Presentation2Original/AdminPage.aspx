<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Capstone2nd.AdminPage" %>
<%@ Register TagPrefix="general" TagName="Nav" Src="Navigation.ascx" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Admin Page</title>    
    
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
        <asp:Label id="lblMessage" Height="25px" Font-Size="18px" ForeColor="Red" runat="server"/><br />

             <!-- new admin -->
        <asp:HyperLink CssClass="nav-link js-scroll-trigger" ID="addNewAdminID" runat="server" NavigateUrl="~/addNewAdmin.aspx" Visible ="false">Add New Admin</asp:HyperLink>
        
        <asp:Label runat="server" Text="Enter values only where you want to modify your program." ForeColor="Black" Font-Size="14pt"></asp:Label><br /><br />
        
        <!-- Find and Edit Admin -->
        <asp:Label runat="server" ID="lblFindAdminID" Text="Find admin by email search:" ForeColor="Black" Font-Size="14pt" Visible ="false"><br /></asp:Label>
        <asp:TextBox ID="findAdminID" runat="server" BackColor="White" onfocus="this.select()" Visible ="false"></asp:TextBox>
        <asp:Button ID="editAdminID" runat="server" Text="Edit" UseSubmitBehavior="false" OnClick="editAdminID_Click" Visible ="false"/><br /><br />

        <!-- new program field -->
        <asp:Label runat="server" Text="Add new field for programs" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:TextBox ID="newField" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br /><br />
        
        <!-- new manager role -->
        <asp:Label runat="server" Text="Add new role for manager" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:TextBox ID="newRole" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br /><br />

        <!-- new eligible grade -->
        <asp:Label runat="server" Text="Add new eligible grade" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:TextBox ID="newGrade" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br /><br />
        
        <!-- new residential option -->
        <asp:Label runat="server" Text="Add new residential option" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:TextBox ID="newResidential" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br /><br />
        
        <!-- new cost option -->
        <asp:Label runat="server" Text="Add new cost option" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:TextBox ID="newCost" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br /><br />
        
        <!-- new stipend value -->
        <asp:Label runat="server" Text="Add new stipend option" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:TextBox ID="newStipend" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br /><br />
        
        <!-- new duration option-->
        <asp:Label runat="server" Text="Add new duration option" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:TextBox ID="newDuration" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br /><br />
        
        <!-- new season option-->
        <asp:Label runat="server" Text="Add new season option" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:TextBox ID="newSeason" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br /><br />
        
        <!-- new service area -->
        <asp:Label runat="server" Text="Add new service area" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:TextBox ID="newServiceArea" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br /><br />
        
        <!--Button for Submitting the Form-->
        <asp:Button ID="BtnSubmit" runat="server" Text="Submit" UseSubmitBehavior="true"/>
    </form>
</body>
</html>