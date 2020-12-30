<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ReviewStallSuggestions.aspx.vb" Inherits="UDW.ReviewStallSuggestions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Review Stall Suggestions</title>
     <link href="GeneralStyle.css" rel="stylesheet" type="text/css" />
        <style>
        table img {
            height: 150px;
            width: 150px;
        }
    </style>
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

     
           <center>
                 <div style="background-color: white; width:75%;">
               <br />
               <br />

               <b>List of pending kopitiam suggestions:</b>
               <asp:CheckBox ID="ViewAllCheckBox" runat="server" text="View all suggestions" AutoPostBack="true"/>
               <br />
               <br />
               <asp:GridView ID="StallSuggestionGridView" runat="server" AutoGenerateColumns="false" OnSorting="StallSuggestionGridView_Sorting" AllowSorting="true" AllowPaging="true"
    OnPageIndexChanging="OnPageIndexChanging" PageSize="10">
                   <Columns>
                       <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                       <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                       <asp:BoundField DataField="kId" HeaderText="StateId" SortExpression="StateId" />
                       <asp:BoundField DataField="KopitiamName" HeaderText="KopitiamName" SortExpression="KopitiamName" />
                       <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                       <asp:BoundField DataField="OpHourSt" HeaderText="OpHourSt" SortExpression="OpHourSt" />
                       <asp:BoundField DataField="OpHourEn" HeaderText="OpHourEn" SortExpression="OpHourEn" />
                       <asp:BoundField DataField="OpDayOfWeek" HeaderText="OpDayOfWeek" SortExpression="OpDayOfWeek" />
                       <asp:BoundField DataField="FoodId" HeaderText="FoodId" SortExpression="Date" />
                       <asp:BoundField DataField="FoodName" HeaderText ="FoodName" SortExpression="FoodName" />
                       <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                       <asp:BoundField DataField="Halal" HeaderText="Halal" SortExpression="Halal" />
                       <asp:BoundField DataField="StallStatus" HeaderText="Status" SortExpression="Status" />
                        <asp:ImageField DataImageUrlField="imagePath" HeaderText="Image"   ControlStyle-Width="300px"  />
                       <asp:TemplateField HeaderText="Select">
                           <ItemTemplate>
                                <asp:CheckBox ID="SelectStallSuggestionCheckBox" runat="server"></asp:CheckBox>
                           </ItemTemplate>
                       </asp:TemplateField>
                   </Columns>
               </asp:GridView>
              <br />
                 <div style="padding-right:10%;width:90%;text-align:right">
                     <asp:Button runat="server" Text="Select All" ID="AllSelectButton" />
                     <asp:Button runat="server" Text="Invert Selection" ID="InvSelectButton" />
                     <asp:Button runat="server" Text="Clear Selection" ID="ClearSelectButton" />
                 </div>
               <br />

               <div style="text-align:center">
                     <asp:Label runat="server" Text="" ID="Label1"></asp:Label>
                    <br />
                
                    <asp:Button runat="server" Text="Aprove Selected" ID="ApproveButton" />
                    <asp:Button runat="server" Text="Reject Selected" ID="DisapproveButton" />
                    <asp:Button runat="server" Text="Mark as Pending" ID="PendingButton" />
                    <asp:Button runat="server" Text="Cancel" ID="CancelButton" />
               </div>
               <br />
               <br />
               <br />
               <asp:Label ID="statusLabel" runat="server"></asp:Label>
               <br />
               <br />
               <br />
               <asp:Label ID="LabelId" runat="server" Visible ="false" ></asp:Label>
               <asp:Label ID="LabelUserId" runat="server" Visible ="false"></asp:Label>
               <asp:Label ID="LabelkId" runat="server" Visible ="false" ></asp:Label>
               <asp:Label ID="LabelName" runat="server" Visible ="false"></asp:Label>
               <asp:Label ID="LabelOpHourSt" runat="server" Visible ="false"></asp:Label>
               <asp:Label ID="LabelOpHourEn" runat="server" Visible ="false"></asp:Label>
               <asp:Label ID="LabelOpDayOfWeek" runat="server" Visible ="false"></asp:Label>
              <asp:Label ID="LabelFoodId" runat="server" Visible ="false"></asp:Label>
               <asp:Label ID="LabelDate" runat="server" Visible ="false"></asp:Label>
               <asp:Label ID="LabelStatus" runat="server" Visible ="false"></asp:Label>
               <asp:Label ID="LabelHalal" runat="server" Visible ="false" ></asp:Label>
              <asp:Label ID="LabelImage" runat="server" Visible ="false"></asp:Label>
               <asp:Label ID="LabelId2" runat="server" Visible ="false"></asp:Label>
            </div>
                     </center>
     
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
