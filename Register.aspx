<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Capstone2nd.Register" %>

<%@ Register TagPrefix="general" TagName="Nav" Src="Navigation.ascx" %>

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
        <form id="form1" runat="server">

            <!--Error Message-->
            <asp:Label ID="lblMessage" Height="40px" Font-Size="18px" ForeColor="Red" runat="server" />


            <div class="col-xl-2 col-lg-2">
            </div>

            <div class="col-xl-8 col-lg-8">
                <!--Check Box List for User Type-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label CssClass="input-group-text" ID="lblUserType" runat="server" Text="User Type*" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:RadioButtonList AutoPostBack="true" ID="radioUserType" runat="server" Font-Size="10" Font-Strikeout="False" ForeColor="Black"
                            TextAlign="Left" OnSelectedIndexChanged="radioUserType_SelectedIndexChanged">
                            <asp:ListItem Value="Program Manager"></asp:ListItem>
                            <asp:ListItem Selected Value="Guest"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>

                <!--Drop down list for Role-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label CssClass="input-group-text" ID="lblRole" runat="server" Text="Role*" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:DropDownList ID="role" runat="server" AutoPostBack="true">
                        </asp:DropDownList>
                    </div>
                </div>

                <!--Text Box for Other Role Name-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label CssClass="input-group-text" ID="lblOtherRole" runat="server" Text="Other Role Name:" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="otherRole" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
                        
                    </div>
                </div>

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

                <!--Text Box for Email Address-->
                <hr />
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label CssClass="input-group-text" ID="lblEmail" runat="server" Text="Email Address:*" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="email" runat="server" BackColor="White"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqEmail" runat="server" ForeColor="Red" ErrorMessage="Email is a required field."
                            Display="Dynamic" ControlToValidate="email">*Required</asp:RequiredFieldValidator>
                    </div>
                </div>
                <asp:RegularExpressionValidator ID="regexEmail" ForeColor="Red" runat="server"
                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email"
                    ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>

                <!--Text Box for Email Address confirmation-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label CssClass="input-group-text" ID="lblConfirmEmail" runat="server" Text="Confirm Email Address:*" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="confirmEmail" runat="server" BackColor="White"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqConfEmail" runat="server" ForeColor="Red" ErrorMessage="Confirm Email is a required field."
                            Display="Dynamic" ControlToValidate="confirmEmail">*Required</asp:RequiredFieldValidator>
                    </div>
                </div>
                <asp:CompareValidator ID="compEmail" runat="server" ForeColor="Red" ErrorMessage="Emails do not match!"
                    ControlToValidate="confirmEmail" ControlToCompare="email"></asp:CompareValidator>
                

                <!--Text Box for Password-->
                <div class="input-group">
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
                

                <!--Text Box for Alt Email Address-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label CssClass="input-group-text" ID="lblAltEmail" runat="server" Text="Alternative Email Address:" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="altEmail" runat="server" BackColor="White"></asp:TextBox>
                    </div>
                </div>
                <asp:RegularExpressionValidator ID="regexAltEmail" ForeColor="Red" runat="server"
                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="altEmail"
                    ErrorMessage="Invalid Alternative Email Format"></asp:RegularExpressionValidator>



                <!--Text Box for Phone-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label CssClass="input-group-text" ID="lblPhone" runat="server" Text="Phone number:" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="phone" TextMode="Phone" BackColor="White" runat="server"></asp:TextBox>
                        
                    </div>
                </div>


                <!--Validation Summary-->
                <asp:ValidationSummary ID="ValidationSummary" DisplayMode="List" runat="server" ForeColor="Red" />

                <!--Button for Submitting the Form-->
                <hr /><asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit" UseSubmitBehavior="true" OnClick="BtnSubmit_Click" />
        </form>



        <!--Confirmation Form-->
        <form id="form2" runat="server">
            <asp:Label ID="output" runat="server" ForeColor="Black" Font-Size="14pt"></asp:Label>
            <asp:Button  CssClass="btn btn-success" ID="Confirm" runat="server" Text="Confirm" UseSubmitBehavior="true" OnClick="Confirm_Click" />
        </form>

        </div>
        <div class="col-xl-2 col-lg-2">
        </div>

        </div>

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
