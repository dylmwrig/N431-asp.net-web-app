<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Capstone2nd.AdminPage" %>
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

        <!-- New Admin -->
        <asp:HyperLink CssClass="nav-link js-scroll-trigger" ID="addNewAdminID" runat="server" NavigateUrl="~/addNewAdmin.aspx" Visible ="false">Add New Admin</asp:HyperLink>
        
        <!-- Find and Edit Admin -->
        <asp:Label ID="lblFindAdminID" runat="server" Text="Choose an admin to edit:" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:DropDownList ID="adminList" OnSelectedIndexChanged="Index_Change" AppendDataBoundItems="False" AutoPostBack="true" runat="server"></asp:DropDownList>
        <asp:Button ID="editAdminID" runat="server" Text="Edit" UseSubmitBehavior="false" OnClick="editAdminID_Click" Visible ="false"/><br /><br />


        <!-- new program field -->
        <hr /><asp:Label runat="server" CssClass="FieldOfStudy" Text="Add new field for programs" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:TextBox ID="newField" CssClass="FieldOfStudy" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br />
        <asp:CheckBox ID="newFieldActive" CssClass="FieldOfStudy" runat="server" ForeColor="Black" Font-Size="10pt" Text="Active" />
        <asp:Button CssClass="btn btn-secondary" ID="submitNewField" OnClick="submitNew" runat="server" AutoPostBack="true" Text="Submit"/><br />

        <!-- edit field -->
        <asp:Label runat="server" Text="Edit a field's name and status" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:DropDownList ID="fieldList" OnSelectedIndexChanged="Index_Change" AppendDataBoundItems="False" AutoPostBack="true" runat="server"></asp:DropDownList>
        <asp:CheckBox ID="fieldActive" runat="server" ForeColor="Black" Font-Size="10pt" Text="Active" /><br />
        <asp:Label runat="server" Text="Edit name" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:TextBox ID="editProgField" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br />
        <asp:Button CssClass="btn btn-primary" ID="fieldEdit" OnClick="editSelected" runat="server" AutoPostBack="true" Text="Submit"/><br /><br /><hr />
        
        <!-- new manager role -->
        <asp:Label runat="server" Text="Add new role for manager" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:TextBox ID="newRole" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br />
        <asp:CheckBox ID="newRoleActive" runat="server" ForeColor="Black" Font-Size="10pt" Text="Active" />
        <asp:Button CssClass="btn btn-secondary" ID="submitNewRole" OnClick="submitNew" runat="server" AutoPostBack="true" Text="Submit"/><br />

        <!-- edit manager role -->
        <asp:Label runat="server" Text="Edit a manager role's name and status" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:DropDownList ID="roleList" OnSelectedIndexChanged="Index_Change" AppendDataBoundItems="False" AutoPostBack="true" runat="server"></asp:DropDownList>
        <asp:CheckBox ID="roleActive" runat="server" ForeColor="Black" Font-Size="10pt" Text="Active" /><br />
        <asp:Label runat="server" Text="Edit name" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:TextBox ID="roleEdit" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br />
        <asp:Button CssClass="btn btn-primary" ID="roleEditBtn" OnClick="editSelected" runat="server" AutoPostBack="true" Text="Submit"/><br /><br /><hr />

        <!-- new eligible grade -->
        <asp:Label runat="server" Text="Add new eligible grade" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:TextBox ID="newGrade" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br />
        <asp:CheckBox ID="newGradeActive" runat="server" ForeColor="Black" Font-Size="10pt" Text="Active" />
        <asp:Button CssClass="btn btn-secondary" ID="submitNewGrade" OnClick="submitNew" runat="server" AutoPostBack="true" Text="Submit"/><br />
        
        <!-- edit grade -->
        <asp:Label runat="server" Text="Edit an eligible grade" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:DropDownList ID="gradeList" OnSelectedIndexChanged="Index_Change" AppendDataBoundItems="False" AutoPostBack="true" runat="server"></asp:DropDownList>
        <asp:CheckBox ID="gradeActive" runat="server" ForeColor="Black" Font-Size="10pt" Text="Active" /><br />
        <asp:Label runat="server" Text="Edit grade" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:TextBox ID="gradeEdit" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br />
        <asp:Button CssClass="btn btn-primary" ID="gradeEditBtn" OnClick="editSelected" runat="server" AutoPostBack="true" Text="Submit"/><br /><br /><hr />

        <!-- new residential option -->
        <asp:Label runat="server" Text="Add new residential option" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:TextBox ID="newResidential" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br />
        <asp:CheckBox ID="newResidentialActive" runat="server" ForeColor="Black" Font-Size="10pt" Text="Active" />
        <asp:Button CssClass="btn btn-secondary" ID="submitNewResidential" OnClick="submitNew" runat="server" AutoPostBack="true" Text="Submit"/><br />
        
        <!-- edit residential option -->
        <asp:Label runat="server" Text="Edit a residential option" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:DropDownList ID="residentialList" OnSelectedIndexChanged="Index_Change" AppendDataBoundItems="False" AutoPostBack="true" runat="server"></asp:DropDownList>
        <asp:CheckBox ID="residentialActive" runat="server" ForeColor="Black" Font-Size="10pt" Text="Active" /><br />
        <asp:Label runat="server" Text="Edit residential value" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:TextBox ID="residentialEdit" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br />
        <asp:Button CssClass="btn btn-primary" ID="residentialEditBtn" OnClick="editSelected" runat="server" AutoPostBack="true" Text="Submit"/><br /><br /><hr />
        
        <!-- new cost option -->
        <asp:Label runat="server" Text="Add new cost option" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:TextBox ID="newCost" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br />
        <asp:CheckBox ID="newCostActive" runat="server" ForeColor="Black" Font-Size="10pt" Text="Active" />
        <asp:Button CssClass="btn btn-secondary" ID="submitNewCost" OnClick="submitNew" runat="server" AutoPostBack="true" Text="Submit"/><br />
        
        <!-- edit cost -->
        <asp:Label runat="server" Text="Edit a cost option" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:DropDownList ID="costList" OnSelectedIndexChanged="Index_Change" AppendDataBoundItems="False" AutoPostBack="true" runat="server"></asp:DropDownList>
        <asp:CheckBox ID="costActive" runat="server" ForeColor="Black" Font-Size="10pt" Text="Active" /><br />
        <asp:Label runat="server" Text="Edit cost value" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:TextBox ID="costEdit" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br />
        <asp:Button CssClass="btn btn-primary" ID="costEditBtn" OnClick="editSelected" runat="server" AutoPostBack="true" Text="Submit"/><br /><br /><hr />
        
        <!-- new stipend value -->
        <asp:Label runat="server" Text="Add new stipend option" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:TextBox ID="newStipend" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br />
        <asp:CheckBox ID="newStipendActive" runat="server" ForeColor="Black" Font-Size="10pt" Text="Active" />
        <asp:Button CssClass="btn btn-secondary" ID="submitNewStipend" OnClick="submitNew" runat="server" AutoPostBack="true" Text="Submit"/><br />
        
        <!-- edit stipend -->
        <asp:Label runat="server" Text="Edit a stipend option" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:DropDownList ID="stipendList" OnSelectedIndexChanged="Index_Change" AppendDataBoundItems="False" AutoPostBack="true" runat="server"></asp:DropDownList>
        <asp:CheckBox ID="stipendActive" runat="server" ForeColor="Black" Font-Size="10pt" Text="Active" /><br />
        <asp:Label runat="server" Text="Edit stipend value" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:TextBox ID="stipendEdit" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br />
        <asp:Button CssClass="btn btn-primary" ID="stipendEditBtn" OnClick="editSelected" runat="server" AutoPostBack="true" Text="Submit"/><br /><br /><hr />
        
        <!-- new duration option-->
        <asp:Label runat="server" Text="Add new duration option" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:TextBox ID="newDuration" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br />
        <asp:CheckBox ID="newDurationActive" runat="server" ForeColor="Black" Font-Size="10pt" Text="Active" />
        <asp:Button CssClass="btn btn-secondary" ID="submitNewDuration" OnClick="submitNew" runat="server" AutoPostBack="true" Text="Submit"/><br />
        
        <!-- edit duration -->
        <asp:Label runat="server" Text="Edit a duration option" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:DropDownList ID="durationList" OnSelectedIndexChanged="Index_Change" AppendDataBoundItems="False" AutoPostBack="true" runat="server"></asp:DropDownList>
        <asp:CheckBox ID="durationActive" runat="server" ForeColor="Black" Font-Size="10pt" Text="Active" /><br />
        <asp:Label runat="server" Text="Edit duration value" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:TextBox ID="durationEdit" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br />
        <asp:Button CssClass="btn btn-primary" ID="durationEditBtn" OnClick="editSelected" runat="server" AutoPostBack="true" Text="Submit"/><br /><br /><hr />
        
        <!-- new season option-->
        <asp:Label runat="server" Text="Add new season option" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:TextBox ID="newSeason" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br />
        <asp:CheckBox ID="newSeasonActive" runat="server" ForeColor="Black" Font-Size="10pt" Text="Active" />
        <asp:Button CssClass="btn btn-secondary" ID="submitNewSeason" OnClick="submitNew" runat="server" AutoPostBack="true" Text="Submit"/><br />
        
        <!-- edit season -->
        <asp:Label runat="server" Text="Edit a season option" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:DropDownList ID="seasonList" OnSelectedIndexChanged="Index_Change" AppendDataBoundItems="False" AutoPostBack="true" runat="server"></asp:DropDownList>
        <asp:CheckBox ID="seasonActive" runat="server" ForeColor="Black" Font-Size="10pt" Text="Active" /><br />
        <asp:Label runat="server" Text="Edit season value" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:TextBox ID="seasonEdit" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br />
        <asp:Button CssClass="btn btn-primary" ID="seasonEditBtn" OnClick="editSelected" runat="server" AutoPostBack="true" Text="Submit"/><br /><br /><hr />
        
        <!-- new service area -->
        <asp:Label runat="server" Text="Add new service area" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:TextBox ID="newArea" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br />
        <asp:CheckBox ID="newAreaActive" runat="server" ForeColor="Black" Font-Size="10pt" Text="Active" />
        <asp:Button CssClass="btn btn-secondary" ID="submitNewArea" OnClick="submitNew" runat="server" AutoPostBack="true" Text="Submit"/><br />
        
        <!-- edit service area -->
        <asp:Label runat="server" Text="Edit a service area option" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:DropDownList ID="areaList" OnSelectedIndexChanged="Index_Change" AppendDataBoundItems="False" AutoPostBack="true" runat="server"></asp:DropDownList>
        <asp:CheckBox ID="areaActive" runat="server" ForeColor="Black" Font-Size="10pt" Text="Active" /><br />
        <asp:Label runat="server" Text="Edit service area value" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
        <asp:TextBox ID="areaEdit" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox><br />
        <asp:Button CssClass="btn btn-primary" ID="areaEditBtn" OnClick="editSelected" runat="server" AutoPostBack="true" Text="Submit"/><br /><br /><hr />
    </form>
</body>
</html>