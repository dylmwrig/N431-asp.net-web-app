<%@ Page Language="C#" %>

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
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="AdminPage.aspx">Admin Page</a>
                        </li>
            
                </ul>
            </div>
        </div>
    </nav>

    <!-- Header -->
    <header class="masthead">
        <div class="container d-flex h-100 align-items-center">
            <div class="mx-auto text-center">
                <h1 class="mx-auto my-0 text-uppercase">Admin Options</h1>
                  <!-- <h2 class="text-white-50 mx-auto mt-2 mb-5">A free, responsive, one page Bootstrap theme created by Start Bootstrap.</h2>-->
                <a href="#lblFirst" class="btn btn-primary js-scroll-trigger">Get Started</a>
            </div>
        </div>
    </header>

    <form id="optionsForm" runat="server">   
         
        <asp:Label runat="server" Text="Enter values only where you want to modify your program." ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:Label runat="server" Text="Add a new admin" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        
        <!--Text Box for First Name-->
        <asp:Label ID="lblPre" runat="server" Text="Prefix" ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="Pre" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
            <br>
            
        <asp:Label ID="lblFirst" runat="server" Text="First Name*" ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="first" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
            
        <asp:RequiredFieldValidator ID="firstNameValid" runat="server" ForeColor="Red" ErrorMessage="First name is a required field." Display="Dynamic" ControlToValidate="first">*Required</asp:RequiredFieldValidator><br />
        <!--Text Box for Last Name-->
            
        <asp:Label ID="lblLast" runat="server" Text="Last Name*" ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="last" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
        <asp:RequiredFieldValidator ID="lastNameValid" runat="server" ForeColor="Red" ErrorMessage="Last name is a required field." Display="Dynamic" ControlToValidate="last">*Required</asp:RequiredFieldValidator><br /><br />
        <!--Text Box for Suffix-->
            
        <asp:Label ID="lbSuffix" runat="server" Text="Suffix*" ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="Suffix" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
            <br>
        <!--Text Box for Email Address-->
        <asp:Label ID="lblEmail" runat="server" Text="Email Address*" ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="email" runat="server" BackColor="White"></asp:TextBox>
         <asp:RequiredFieldValidator ID="reqEmail" runat="server" ForeColor="Red" ErrorMessage="Email is a required field." Display="Dynamic" ControlToValidate="email">*Required</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regexEmail" ForeColor="Red" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator><br />
        <!--Text Box for Email Address confirmation-->
        <asp:Label ID="lblConfirmEmail" runat="server" Text="Confirm Email Address*" ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="confirmEmail" runat="server" BackColor="White"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqConfEmail" runat="server" ForeColor="Red" ErrorMessage="Confirm Email is a required field." Display="Dynamic" ControlToValidate="confirmEmail">*Required</asp:RequiredFieldValidator>                        
        <asp:CompareValidator ID="compEmail" runat="server" ForeColor="Red" ErrorMessage="Emails do not match!" ControlToValidate="confirmEmail" ControlToCompare="email"></asp:CompareValidator><br /><br />
        <!--Text Box for Password-->
        <asp:Label ID="lblPassword" runat="server" Text="Password*" ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="password" TextMode="Password" BackColor="White" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqPassword" runat="server" ForeColor="Red" ErrorMessage="Password is a required field." Display="Dynamic" ControlToValidate="password">*Required</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regexPassword" runat="server" ControlToValidate="password"
            ErrorMessage="Password must contain: Min length 10; Characters, signs and numbers;" ForeColor="Red"
            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{10,}$"/><br />
        <!--Text Box for Password confirmation-->
        <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password*" ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="confirmPassword" TextMode="Password" BackColor="White" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqConfPassword" runat="server" ForeColor="Red" ErrorMessage="Confirm Password is a required field." Display="Dynamic" ControlToValidate="confirmPassword">*Required</asp:RequiredFieldValidator>
        <asp:CompareValidator ID="compPass" runat="server" ForeColor="Red" ErrorMessage="Passwords do not match!" ControlToValidate="confirmPassword" ControlToCompare="password"></asp:CompareValidator><br /><br /><br />
            
         <!--Text Box for Phone Number-->
            
        <asp:Label ID="lbPhone" runat="server" Text="Phone*" ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="phone" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
            <br>
            <br>

        
        <!--Drop down list for Description-->
        <asp:Label ID="lblDescription" runat="server" Text="Which Best Describes You" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:DropDownList ID="description" runat="server">
            <asp:ListItem value="Out Reach Program Director"></asp:ListItem>
            <asp:ListItem value="Out Reach Program Staff"></asp:ListItem>
            <asp:ListItem value="University Staff"></asp:ListItem>
            <asp:ListItem value="Parent"></asp:ListItem>
            <asp:ListItem value="Past Participant"></asp:ListItem>
            <asp:ListItem value="School (K-12) Teacher"></asp:ListItem>
             <asp:ListItem value="Other"></asp:ListItem>
        </asp:DropDownList><br /><br /><br />


        <asp:Label ID="lblSubject" runat="server" Text="Change the fields of study that the program includes (Multiple entries allowed)" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:CheckBoxList ID="subject" runat="server" Font-Size="10" Font-Strikeout="False" ForeColor="Black" TextAlign="Left">
            <asp:ListItem value="Biology"></asp:ListItem>
            <asp:ListItem value="Chemistry"></asp:ListItem>
            <asp:ListItem value="Biochemistry"></asp:ListItem>
            <asp:ListItem value="Physics"></asp:ListItem>
            <asp:ListItem value="Astrophysics"></asp:ListItem>
            <asp:ListItem value="Mathematics"></asp:ListItem>
            <asp:ListItem value="Engineering"></asp:ListItem>
            <asp:ListItem value="Computer Science -Programming"></asp:ListItem>
            <asp:ListItem value="Computer Science - Mobile Apps"></asp:ListItem>
            <asp:ListItem value="Computer Science - Web Design"></asp:ListItem>
            <asp:ListItem value="Bioinformatics"></asp:ListItem>
            <asp:ListItem value="Zoology / Animal / Vet Sciences"></asp:ListItem>
            <asp:ListItem value="Agricultural Sciences"></asp:ListItem>
            <asp:ListItem value="Geology & Earth Sciences"></asp:ListItem>
            <asp:ListItem value="Neuroscience"></asp:ListItem>
            <asp:ListItem value="Oncology"></asp:ListItem>
            <asp:ListItem value="Biotechnology"></asp:ListItem>
            <asp:ListItem value="Medicinal Research"></asp:ListItem>
            <asp:ListItem value="Health Science Careers & Occupations"></asp:ListItem>
            <asp:ListItem value="Dentistry & Dental Careers & Occupations"></asp:ListItem>
            <asp:ListItem value="other"></asp:ListItem>
        </asp:CheckBoxList><br />
            
            <asp:Label ID="lbother" runat="server" Text="Other Descriptions: " ForeColor="Black" Font-Size="12pt"></asp:Label><br />
            <asp:TextBox ID="other" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
        
            <br>
            <br>

                    
        <asp:Label ID="lbGrade" runat="server" Text="Change the eligible grades that students must have completed or currently enrolled to participate. (Summer programs are defined by the grade completed, not the one students enter in fall)" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:CheckBoxList ID="grade" runat="server" Font-Size="10" Font-Strikeout="False" ForeColor="Black" TextAlign="Left">
            <asp:ListItem value="Elementary School Grades 1-6"></asp:ListItem>
            <asp:ListItem value="Grade 7"></asp:ListItem>
            <asp:ListItem value="Grade 8"></asp:ListItem>
            <asp:ListItem value="Grade 9"></asp:ListItem>
            <asp:ListItem value="Grade 10"></asp:ListItem>
            <asp:ListItem value="Grade 11"></asp:ListItem>
            <asp:ListItem value="Grade 12"></asp:ListItem>
            <asp:ListItem value="Undergraduate Year 1"></asp:ListItem>
            <asp:ListItem value="Undergraduate Year 2"></asp:ListItem>
            <asp:ListItem value="Other"></asp:ListItem>
        </asp:CheckBoxList><br /><br />
            <br>
        
        <asp:Label ID="lbstreetaddress" runat="server" Text="Change the address where this program operates" ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="StreetAddress" runat="server" BackColor="White" onfocus="this.select()" TextMode="MultiLine" Rows="10" />
            <br>
            <br>
            
            
        <asp:Label ID="lbprogramcounty" runat="server" Text="Change the program county " ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="ProgramCounty" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
        
            <br>
            <br>
            
            
        <asp:Label ID="lbprogramcity" runat="server" Text="Change the program city " ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="ProgramCity" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
        
            <br>
            <br>
            
            
            
        <asp:Label ID="lbProgramZip" runat="server" Text="Change the program Zip " ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="ProgramZip" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
        
            <br>
            <br>
            

        <asp:Label ID="lbcost" runat="server" Text="Change Program Cost" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:RadioButtonList ID="radioCost" runat="server" Font-Size="10" Font-Strikeout="False" ForeColor="Black" TextAlign="Left">
                
            <asp:ListItem value="Free to all participants"></asp:ListItem>
            <asp:ListItem value="Cost determined by demonstrated financial need"></asp:ListItem>
            <asp:ListItem value="Less than $50"></asp:ListItem>
            <asp:ListItem value="$300-$1000"></asp:ListItem>
            <asp:ListItem value="More than $1000"></asp:ListItem>
            
        </asp:RadioButtonList><br /><br />
            
        <p>Explain if cost can be free or reduced to a specific amount and explain the eligibility for</p> 
        <p>cost reduction and if any documentation is necessary.</p>
            
        <asp:TextBox ID="exp" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
            <br>
            <br>
            <br>
        
        <asp:Label ID="lblstipend" runat="server" Text="Change Program Stipend" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Font-Size="10" Font-Strikeout="False" ForeColor="Black" TextAlign="Left">
            <asp:ListItem value="No participants receive a stipend"></asp:ListItem>
            <asp:ListItem value="Some participants receive a stipend"></asp:ListItem>
            <asp:ListItem value="All participants receive a stipend"></asp:ListItem>    
        </asp:RadioButtonList><br /><br />
        
        <asp:Label ID="lblduration" runat="server" Text="Change the duration of the program" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
            
        <asp:RadioButtonList ID="Progduration" runat="server">
                
            <asp:ListItem value="Partial day event"></asp:ListItem>
            <asp:ListItem value="1 day"></asp:ListItem>
            <asp:ListItem value="2-3 days"></asp:ListItem>
            <asp:ListItem value="3-7 days"></asp:ListItem>
            <asp:ListItem value="2 weeks"></asp:ListItem>
            <asp:ListItem value="3 weeks"></asp:ListItem>
            <asp:ListItem value="4 weeks"></asp:ListItem>
            <asp:ListItem value="5 weeks"></asp:ListItem>
            <asp:ListItem value="6 weeks"></asp:ListItem>
                
            <asp:ListItem value="7 weeks"></asp:ListItem>
            <asp:ListItem value="8 weeks"></asp:ListItem>
            <asp:ListItem value="9 weeks"></asp:ListItem>
            <asp:ListItem value="10 weeks"></asp:ListItem>
            <asp:ListItem value="Other"></asp:ListItem>
                
        </asp:RadioButtonList><br /><br /><br />
            
        
        <asp:Label ID="lblseason" runat="server" Text="Change the season in which the program operates" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
            
        <asp:RadioButtonList ID="Season" runat="server">
                
            <asp:ListItem value="Summer"></asp:ListItem>
            <asp:ListItem value="Fall Semester"></asp:ListItem>
            <asp:ListItem value="Winter Break"></asp:ListItem>
            <asp:ListItem value="Spring Semester"></asp:ListItem>
            <asp:ListItem value="Year-Round Academic Year"></asp:ListItem>               
        </asp:RadioButtonList><br /><br /><br />
           
        <asp:Label ID="lblserviceArea" runat="server" Text="Change the service area from where you want to draw candidates" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
            
        <asp:DropDownList ID="ServiceArea" runat="server">
                
            <asp:ListItem value="Same City"></asp:ListItem>
            <asp:ListItem value="Same County"></asp:ListItem>
            <asp:ListItem value="Surrounding County"></asp:ListItem>
            <asp:ListItem value="Indiana State Wide"></asp:ListItem>
            <asp:ListItem value="Nation Wide"></asp:ListItem>
            <asp:ListItem value="Other"></asp:ListItem>
                
        </asp:DropDownList><br /><br /><br />
        
        <!--Button for Submitting the Form-->
        <asp:Button ID="BtnSubmit" runat="server" Text="Submit" UseSubmitBehavior="true"/>
    </form>
</body>
</html>
