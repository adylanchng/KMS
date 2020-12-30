<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ManageStall.aspx.vb" Inherits="UDW.ManageStall" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Manage Stall</title>
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
                        <asp:ImageButton ID="HeaderImageButton" runat="server" ImageUrl="~/NewLogoJPG.jpg"
                            Width="33%" />
                    </td>
                    <td style="width: 25%; text-align: right;">
                        <asp:Label ID="HeaderWelcomeLabel" runat="server" Text="Welcome"></asp:Label>
                        <asp:Label ID="UserTypeLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Button runat="server" ID="ManageAccountButton" Visible="False" Text="Account Setting"/>
                        &nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                        <asp:LoginStatus ID="LoginStatus" runat="server" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="HeaderOrLabel" runat="server" Text="or"></asp:Label>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="HeaderRegisterButton" runat="server" Text="Register"></asp:Button>
                        &nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
            <hr />
        </div>
        <!-- end of header -->
        <br />
        <br />

        <!-- main body of elements -->
        <div style="text-align: center;">
            <div style="background-color: white; width: 90%; margin-left: auto; margin-right: auto; padding-left: 5%; text-align: left;">

                <div runat="server" id="StallPanel">
                    <asp:Label runat="server" ID="KopitiamNameLabel" Font-Size="20px" Font-Bold="true"></asp:Label>
                    <asp:Button runat="server" ID="KopitiamReviewButton" Text="Kopitiam Reviews" />
                    <br />
                    <asp:Button runat="server" ID="AddStallButton" Text="Add Stall"
                        ToolTip="You will be redirect to suggestion page to add for admin for approval" />
                    <br />
                    <asp:GridView ID="StallGridView" runat="server" AllowSorting="true" AutoGenerateColumns="false"
                        OnRowCommand="StallGridView_RowCommand" OnSorting="StallGridView_Sorting"
                        OnRowDataBound="StallGridView_RowDataBound" AllowPaging="true"
    OnPageIndexChanging="OnPageIndexChanging" PageSize="10">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="OperationHours" HeaderText="Operation Hours" />
                            <asp:BoundField DataField="OpDayOfWeek" HeaderText="Operation Days" />
                            <asp:BoundField DataField="Food" HeaderText="Food" SortExpression="Food" />
                            <asp:BoundField DataField="FoodCategory" HeaderText="FoodCategory"
                                SortExpression="FoodCategory" />
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image runat="server" ID="StallImageData" Height="100px" ImageAlign="Middle" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:Button runat="server" ID="SelectStallButton" Text="Select"
                                        CommandName="StallEditSelect"
                                        CommandArgument="<%# Container.DataItemIndex %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Review">
                                <ItemTemplate>
                                    <asp:Button runat="server" ID="SelectStallReviewButton" Text="Review"
                                        CommandName="StallReviewSelect"
                                        CommandArgument="<%# Container.DataItemIndex %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div runat="server" id="StallEditPanel" visible="false">
                    <br />
                    <asp:Label ID="UpdateLabel" runat="server" Text="Please update the following particulars:"
                        Style="font-weight: 700"></asp:Label>
                    <br />
                    <br />
                    Stall ID:
                    <asp:Label ID="UpdateStallIdLabel" runat="server"></asp:Label>
                    &nbsp
                    &nbsp
                    <asp:Button runat="server" ID="RemoveStallButton" Text="Remove Stall" ToolTip="Remove stall." />
                    <br />
                    <br />
                    Name:
                    <asp:TextBox ID="UpdateStallNameTextBox" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    Food:
                    <asp:DropDownList ID="UpdateStallFoodCategoryDropDownList" runat="server" AutoPostBack="true">
                    </asp:DropDownList>
                    <asp:DropDownList ID="UpdateStallFoodDropDownList" runat="server"></asp:DropDownList>
                    <br />
                    <br />
                    Operation Hours:
                    <asp:DropDownList ID="UpdateStallStartHoursDropDownList" runat="server">
                        <asp:ListItem>00</asp:ListItem>
                        <asp:ListItem>01</asp:ListItem>
                        <asp:ListItem>02</asp:ListItem>
                        <asp:ListItem>03</asp:ListItem>
                        <asp:ListItem>04</asp:ListItem>
                        <asp:ListItem>05</asp:ListItem>
                        <asp:ListItem>06</asp:ListItem>
                        <asp:ListItem>07</asp:ListItem>
                        <asp:ListItem>08</asp:ListItem>
                        <asp:ListItem>09</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                       
                    </asp:DropDownList>
                    <asp:DropDownList ID="UpdateStallStartMinutesDropDownList" runat="server">
                        <asp:ListItem>00</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>45</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;to
                    <asp:DropDownList ID="UpdateStallEndHoursDropDownList" runat="server">
                        <asp:ListItem>00</asp:ListItem>
                        <asp:ListItem>01</asp:ListItem>
                        <asp:ListItem>02</asp:ListItem>
                        <asp:ListItem>03</asp:ListItem>
                        <asp:ListItem>04</asp:ListItem>
                        <asp:ListItem>05</asp:ListItem>
                        <asp:ListItem>06</asp:ListItem>
                        <asp:ListItem>07</asp:ListItem>
                        <asp:ListItem>08</asp:ListItem>
                        <asp:ListItem>09</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                       
                    </asp:DropDownList>
                    <asp:DropDownList ID="UpdateStallEndMinutesDropDownList" runat="server">
                        <asp:ListItem>00</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>45</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    Opening Days:
                    <asp:CheckBoxList ID="UpdateStallDaysCheckBox" runat="server" />
                    <br />
                    Picture:
                    <asp:FileUpload ID="UpdateStallFileUpload" runat="server" />
                    <br />
                    <asp:RegularExpressionValidator ID="FileUploadValidator" runat="server" Display="Dynamic"
                        ErrorMessage="Invalid Image Format. File will not be uploaded!"
                        ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.png|.PNG|.jpeg|.JPEG)$"
                        ControlToValidate="UpdateStallFileUpload" ForeColor="Red" />
                    <br />
                    <br />
                    <br />
                    <asp:Button runat="server" ID="StallUpdateButton" CausesValidation="false" Text="Update" />
                    <asp:Button runat="server" ID="StallCancelButton" CausesValidation="false" Text="Cancel" />
                    <br />
                    <br />
                    <br />
                </div>
                <div runat="server" id="ReviewPanel">
                    <asp:Label runat="server" ID="StallNameLabel" Font-Size="20px" Font-Bold="true"></asp:Label>
                    <br />
                    <asp:GridView ID="StallReviewGridView" runat="server" AllowSorting="true"
                        AutoGenerateColumns="false" OnSorting="StallReviewGridView_Sorting" ShowHeaderWhenEmpty="true">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Comment" HeaderText="Comment" />
                            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                            <asp:BoundField DataField="OverallRating" HeaderText="Overall Rating"
                                SortExpression="OverallRating" />
                            <asp:BoundField DataField="FoodRating" HeaderText="Food" SortExpression="FoodRating" />
                            <asp:BoundField DataField="HygieneRating" HeaderText="Hygiene"
                                SortExpression="HygieneRating" />
                            <asp:BoundField DataField="ServiceRating" HeaderText="Service"
                                SortExpression="ServiceRating" />
                            <asp:BoundField DataField="ValueRating" HeaderText="Value" SortExpression="ValueRating" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <br />
                </div>
                <div id="StallDisownPanel" runat="server" visible="false">
                    We will proceed for disowning your stall.
                    <br />
                    <br />
                    Are you sure you want to disown your kopitiam? This action cannot be undone.
                    <br />
                    <asp:RadioButtonList ID="ConfirmRadioButtonList" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="No" Selected="True" />
                        <asp:ListItem Value="Yes" />
                    </asp:RadioButtonList>
                    <br />
                    <asp:Label runat="server" ID="RecomfirmLabel" Text="Type: DISOWN to continue" />
                    <br />
                    <asp:TextBox runat="server" ID="DisownTextBox" />
                    <br />
                    <br />
                    <asp:Button runat="server" Text="Submit" ID="DisownSubmitButton" />
                    <asp:Button runat="server" Text="Cancel" ID="DisownCancelButton" />
                </div>
                <div>
                    <br />
                    <asp:Label runat="server" ID="UpdateStatusLabel" ForeColor="Red" Font-Bold="True"></asp:Label>
                    <br />
                    <br />
                </div>
            </div>
        </div>
        <asp:GridView runat="server" ID="StallObjectDetectedGridView"></asp:GridView>
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
