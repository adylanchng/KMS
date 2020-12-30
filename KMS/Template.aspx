<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Template.aspx.vb" Inherits="UDW.FAQ" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Template</title>
    <link href="GeneralStyle.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        
    <!-- Header -->
    <div style="background-color: white; font-family: Arial, Helvetica, sans-serif;">
        <table style="width:100%;">
            <tr>
                <td style="width:25%;">
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BackButton" runat="server" Text="Go back" /> &nbsp;<br />
                    <br />
                </td>
                <td style=" width:50%; text-align: center;">
                    <asp:ImageButton ID="HeaderImageButton" runat="server" ImageUrl="~/NewLogoJPG.jpg" Width="33%" />
                </td>
                <td style="width:25%; text-align:right;">
                    <asp:Label ID="HeaderWelcomeLabel" runat="server" Text="Welcome"></asp:Label>
                    <asp:Label ID="UserTypeLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Button runat="server" ID="ManageAccountButton" Visible="False" Text="Account Setting"/>
                    &nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <asp:LoginStatus ID="LoginStatus" runat="server" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="HeaderOrLabel" runat="server" Text="or"></asp:Label> &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="HeaderRegisterButton" runat="server" Text="Register"></asp:Button>&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
        </table>
        <hr />
    </div>
    <!-- end of header -->
        <br />
        <br />
       <div style=" text-align: center;">    
            <div style="background-color: white;  width:75%; margin-left: auto; margin-right: auto; padding-left:5%; text-align:left;">   
 
              Test
              </div>
 </div>
         
         <br />
        <br />

    <!-- Footer -->
    <div style="background-color: white; font-family: Arial, Helvetica, sans-serif;">
        <hr />
        <table style="width:100%">
            <tr>
                <td style="width:50%; text-align: center;">
                    Improve Kopitiam Management System Pro by suggesting.
                    <br />
                    <br />
                    <asp:Button ID="SuggestButton" runat="server" Text="Click here to suggest"></asp:Button>
                    <br />
                    <br />
                </td>
                <td style="width:50%; text-align: center;">
                    Kopitiam Management System Pro is a state of the art service for all things Kopitiam in Malaysia
                    <br />
                    <br />
                    <asp:Button ID="MoreButton" runat="server"
                        Text="Click here to learn more about Kopitiam Management System Pro"></asp:Button>
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
