<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="admHome.aspx.cs" Inherits="admHome" %>

<%@ Register TagPrefix="general" TagName="Footer" Src="../FooterUserControl.ascx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Content-Style-Type" content="text/css" />

<title>
Appassionata Admin Site
</title>

<link rel="stylesheet" href="style.css" type="text/css" media="screen" />

</head>

<body>
   

	 <form id="form1" runat="server">

   
	

     <asp:Label ID="lblAdmGreetings"  CssClass="admWelcome" runat="server" > </asp:Label> 
	    
	       
	       
    
     </form>
     
     
	
<div id="container">

	

<!-- This line tells where to insert the reusable general frame code -->
    <general:Footer ID="footer" runat="server" />
    
</div>
          
    

	
</body>
</html>
