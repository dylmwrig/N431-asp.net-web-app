<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navigation.ascx.cs" Inherits="Capstone2nd.Navigation" %>

    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
        <div class="container">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="Default.aspx">Home Page</a>
                        </li>
                        <li class="nav-item">
                             <form action="Default.aspx">
                                <asp:HyperLink CssClass="nav-link js-scroll-trigger" ID="loginID" runat="server" NavigateUrl="~/Login.aspx" Visible="true">Login</asp:HyperLink>
                            </form>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink CssClass="nav-link js-scroll-trigger" ID="registerID" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink CssClass="nav-link js-scroll-trigger" ID="changePwdID" runat="server" NavigateUrl="~/ChangePwd.aspx">Change Password</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink CssClass="nav-link js-scroll-trigger" ID="adminPageID" runat="server" NavigateUrl="~/AdminPage.aspx">Admin Page</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink CssClass="nav-link js-scroll-trigger" ID="newProgID" runat="server" NavigateUrl="~/NewProgram.aspx">Add New Program</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <form action="Default.aspx">
                                <asp:HyperLink CssClass="nav-link js-scroll-trigger" ID="logoutID" runat="server" NavigateUrl="~/Logout.aspx">Logout</asp:HyperLink>
                            </form>
                        </li>
                </ul>
            </div>
        </div>
    </nav>