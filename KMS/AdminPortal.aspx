<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AdminPortal.aspx.vb" Inherits="UDW.AdminPortal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Portal </title>
    <link href="GeneralStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <div style="background-color: white; font-family: Arial, Helvetica, sans-serif;">
            <table style="width: 100%;">
                <tr>
                    <td style="width: 25%;">
                        <br />
                        &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BackButton" runat="server" Text="Go back" />
                        &nbsp;<br />
                        <br />
                    </td>
                    <td style="width: 50%; text-align: center;">
                        <asp:ImageButton ID="HeaderImageButton" runat="server" ImageUrl="~/NewLogoJPG.jpg" Width="33%" />
                    </td>
                    <td style="width: 25%; text-align: right;">
                        <asp:Label ID="HeaderWelcomeLabel" runat="server" Text="Welcome"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                    <asp:Button runat="server" ID="ManageAccountButton" Visible="False" Text="Account Setting"/>
                        &nbsp;&nbsp;&nbsp;
                    <br />
                        <br />
                        <asp:LoginStatus ID="LoginStatus" runat="server" />
                        &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="HeaderOrLabel" runat="server" Text="or"></asp:Label>
                        &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="HeaderRegisterButton" runat="server" Text="Register"></asp:Button>&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
            <hr />
        </div>
        <!-- end of header -->
        <br />
        <br />

        <!-- main body of elements -->


        <div style="text-align: center">
            <div style="margin-left: auto; margin-right: auto; padding-left: 5%; text-align: left; background-color: white; width: 75%;">
                <br />
                <h1>Admin Portal</h1>
                <asp:Label ID="userTypeLabel" runat="server" Visible="False"></asp:Label>
                 
            &nbsp;<asp:Label ID="messageLabel" runat="server"></asp:Label>
                 
            </div>
            <br />
            <div style="margin-left: auto; margin-right: auto; padding-left: 5%; text-align: left; background-color: white; width: 75%;">
                <br />
                <b>Add Food</b>
                <br />
                <br />
                A new food or food category just got invented?<br />
                <br />
                No problem. Add it to our database today!<br />
                <br />
                <asp:Button ID="AdminPortalAddFood" runat="server" Width="250px" Text="Add Food "></asp:Button>
                &nbsp;<br />
                <br />
            </div>
            
            <br />
            

            <br />

              <div style="margin-left: auto; margin-right: auto; padding-left: 5%; text-align: left; background-color: white; width: 75%;">
                <br />
                <b>Manage Kopitiams and Stalls</b>
                <br />
                <br />
                Kopitiams and it's stalls don't stay the same forever.<br />
                <br />
                Keep the information up to date by managing kopitiams. 
               <br />
                <br />
                From there, you can manage the stalls. 
                       <br />
                <br />
                <asp:Button ID="AdminPortalManageKopitiamButton" runat="server" Width="250px" Text="Manage Kopitiams "></asp:Button>
                &nbsp;<br />
                <br />
            </div>
            <br />

            <div style="margin-left: auto; margin-right: auto; padding-left: 5%; text-align: left; background-color: white; width: 75%;">
                <br />
                <b>Review Suggestions</b>
                <br />
                <br />
                Generals users improves Kopitiam Management System Pro by suggesting.
               <br />
                <br />
                Review these suggestions to approve or disaprove of general users suggestions.<br />
                <br />
                There are 3 types of suggestions: General, Kopitiam and Stall.<br />
                <br />
                <asp:Button ID="AdminPortalReviewGeneralSuggestionButton" runat="server" Width="250px" Text="Review General Suggestions"></asp:Button>
                &nbsp;<br />
                <br />
                <asp:Button ID="AdminPortalReviewKopitiamSuggestionButton" runat="server" Width="250px" Text="Review Kopitiam Suggestions"></asp:Button>
                &nbsp;<br />
                <br />
                <asp:Button ID="AdminPortalReviewStallSuggestionButton" runat="server" Width="250px" Text="Review Stall Suggestions"></asp:Button>
                &nbsp;
               <br />
                <br />
            </div>
            <br />


           

            
            
          
            
             
            <br />
            <br />
            <br />
            <!-- Footer -->
            <div style="background-color: white; font-family: Arial, Helvetica, sans-serif;">
                <hr />
                <table style="width: 100%">
                    <tr>
                        <td style="width: 50%; text-align: center;">Improve Kopitiam Management System Pro by suggesting.
                    <br />
                            <br />
                            <asp:Button ID="SuggestButton" runat="server" Text="Click here to suggest"></asp:Button>
                            <br />
                            <br />
                        </td>
                        <td style="width: 50%; text-align: center;">Kopitiam Management System Pro is a state of the art service for all things Kopitiam in Malaysia
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
