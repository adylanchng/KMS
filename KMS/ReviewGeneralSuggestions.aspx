<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ReviewGeneralSuggestions.aspx.vb" Inherits="UDW.ReviewGeneralSuggestions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Review General Suggestions</title>
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

        <!-- main body of elements -->
        
                 <div style="background-color: white; width:75%;margin-left:auto;margin-right:auto;">
                <br />
                     These are general suggestions suggested by users that has not been read.<br />
                <br />
                     To mark a suggestion as &quot;read&quot;, click on &quot;edit&quot; and then on &quot;update&quot;<br />
                     <asp:CheckBox ID="ViewAllCheckBox" runat="server" text="View all suggestions" AutoPostBack="true"/>
                <br />

                <asp:GridView ID="usersGridView" runat="server" DataKeyNames="Id" AllowSorting="true" OnSorting="usersGridView_Sorting" EmptyDataText="No records has been added." autogeneratecolumns="false" AllowPaging="true"
    OnPageIndexChanging="OnPageIndexChanging" PageSize="10">
                    <Columns>
                        <asp:boundfield datafield="Id" readonly="true" headertext="Id" SortExpression="Id"/>
                         <asp:boundfield datafield="UserId" readonly="true" headertext="User Id"  />   
                        <asp:boundfield datafield="Name" readonly="true" headertext="Username" SortExpression="Name"/>
                        <asp:boundfield datafield="Comment" readonly="true" headertext="Comment"/>
                        <asp:boundfield datafield="Date" readonly="true" headertext="Date" SortExpression="Date"/>
                        <asp:boundfield datafield="Status" readonly="true" headertext="Status" SortExpression="Status"/>
                        <asp:TemplateField HeaderText="Select">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="SelectGeneralSuggestionCheckBox"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                    <div style="padding-right:10%;width:90%;text-align:right">
                        <asp:Button runat="server" Text="Select All" ID="AllSelectButton" />
                        <asp:Button runat="server" Text="Invert Selection" ID="InvSelectButton" />
                        <asp:Button runat="server" Text="Clear Selection" ID="ClearSelectButton" />
                    </div>
                <br />
                     <div style="text-align:center">
                     <asp:Label runat="server" Text="" ID="statusLabel"></asp:Label>
                    <br />
                
                    <asp:Button runat="server" Text="Mark as Read" ID="MarkAsReadButton" />
                    <asp:Button runat="server" Text="Mark as Unread" ID="MarkAsUnreadButton" />
                    <asp:Button runat="server" Text="Cancel" ID="CancelButton" />
                    </div>
                <br />
                <br />
              </div>
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
