<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FocusAndDefault.aspx.cs" Inherits="FocusAndDefault" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Focus and Default Button</title>
</head>
<body>
    <form id="Form1" defaultbutton="btnSubmit" defaultfocus="txtBox1"  runat="server">
    <div>
    <br />
    <br />
    <br />
    <br />   
    <!-- AccessKey is set.  When Alt+1 is pressed, focus will be set to TextBox1 -->    
    TextBox1:
    <asp:textbox id="txtBox1"
      runat="server" AccessKey="1" BackColor="Blue"></asp:textbox>  
    <br />
    TextBox2:
    <asp:textbox id="txtBox2"
      runat="server" AccessKey="2"></asp:textbox>
    <br /><br />

    <asp:button id="btnSetFocus1" text="Set Focus #1" 
        runat="server" OnClick="cmdSetFocus1_Click">
    </asp:button>&nbsp;
    <asp:button id="btnSetFocus2" text="Set Focus #2"
        runat="server" OnClick="cmdSetFocus2_Click" >
    </asp:button>&nbsp;
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="cmdSubmit_Click" />
      <hr />

        <!-- IF EnableViewState is set to true,  values will be remembered across multiple HTTP requests. 
            Set it to false to clean out the message.  
            See more at https://msdn.microsoft.com/en-us/library/system.web.ui.control.enableviewstate(v=vs.110).aspx
        -->
      <asp:label id="lblMsg" runat="Server" EnableViewState="False"></asp:label>   
     </div>
   </form>


</body>
</html>
