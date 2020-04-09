<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangeEvents.aspx.cs" Inherits="ChangeEvents" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Change Events</title>
</head>
<body>
    <form id="form1" runat="server" >
    <asp:Panel ID="pnlEvent" runat="server">
        <div>
            Drop down list event:
            <asp:DropDownList ID="ddList" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="List1_ServerChange">
                <asp:ListItem Enabled="true" Text="Select Month" Value="-1"></asp:ListItem>
                <asp:ListItem Text="January" Value="1"></asp:ListItem>
                <asp:ListItem Text="February" Value="2"></asp:ListItem>

            </asp:DropDownList>
        </div>
        <div>
            Textbox text change event:
            <asp:TextBox ID="txtBox" runat="server" AutoPostBack="true" OnTextChanged="Ctrl_ServerChange">Enter Something </asp:TextBox>
        </div>
         <div>
             Check box change event:
        <asp:CheckBox ID="chkBox" runat="server" AutoPostBack="true" OnCheckedChanged="Check_ServerChange" />  
        </div>
        </asp:Panel>
        <div>
            Submit event:
            <asp:Button ID="btnText" runat="server"  Text="Enter" OnClick="Submit_ServerClick" />

        </div>
     </form>
</body>
</html>
