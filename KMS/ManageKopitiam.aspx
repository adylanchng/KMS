<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ManageKopitiam.aspx.vb" Inherits="UDW.Manage_Kopitiam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Manage Kopitiam</title>
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
            <div id="KopitiamListPanel" runat="server"
                style="background-color: white; width: 90%; margin-left: auto; margin-right: auto; padding-left: 5%; text-align: left;">
                <br />
                <br />
                <br />
                <asp:Label runat="server" Text="Your Kopitiam:"></asp:Label>
                <asp:CheckBox runat="server" ID="FilterKopitiamCheckBox" AutoPostBack="true" Text="Filter" />
                <div runat="server" id="FilterKopitiamPanel" visible="false">
                    State:
                    <asp:DropDownList ID="StateDropDownList" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Id">
                        <asp:ListItem Value="-1">all states</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|KMS_DB.mdf;Integrated Security=True" SelectCommand="SELECT [Id], [Name] FROM [State]"></asp:SqlDataSource>
                    &nbsp; Keyword: 
                     <asp:TextBox ID="SearchKeywordTextBox" runat="server" ToolTip="Search Keyword by Kopitiam Name and Address"></asp:TextBox>
                    <br />
                    Status: &nbsp;
                     <asp:RadioButtonList runat="server" ID="SelectOpenFilterRadioButtonList" RepeatDirection="Horizontal">
                         <asp:ListItem Selected="True">All</asp:ListItem>
                         <asp:ListItem Value="OPEN">Now Open</asp:ListItem>
                         <asp:ListItem Value="CLOSED">Closed</asp:ListItem>
                     </asp:RadioButtonList>
                    Operation day: &nbsp;
                    <asp:CheckBoxList runat="server" ID="SelectDayOfWeekFilterCheckBoxList" RepeatDirection="Horizontal">
                        <asp:ListItem Value="Sunday">Sunday</asp:ListItem>
                        <asp:ListItem Value="Monday">Monday</asp:ListItem>
                        <asp:ListItem Value="Tuesday">Tuesday</asp:ListItem>
                        <asp:ListItem Value="Wednesday">Wednesday</asp:ListItem>
                        <asp:ListItem Value="Thursday">Thursday</asp:ListItem>
                        <asp:ListItem Value="Friday">Friday</asp:ListItem>
                        <asp:ListItem Value="Saturday">Saturday</asp:ListItem>
                    </asp:CheckBoxList>
                    <br />
                    <div style="text-align: center">
                        <asp:Button ID="SearchButton" runat="server" Text="Search!" />
                    </div>
                </div>
                <br />
                <asp:GridView ID="KopitiamGridView" runat="server" AllowSorting="true" AutoGenerateColumns="false"
                    OnRowCommand="KopitiamGridView_RowCommand" OnRowDataBound="KopitiamGridView_RowDataBound"
                    Width="98%" AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging" PageSize="10">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="id" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                        <asp:BoundField DataField="OperationHours" HeaderText="Operation Hours"
                            SortExpression="OperationHours" />
                        <asp:BoundField DataField="OpDayOfWeek" HeaderText="Operation Week" />
                        <asp:BoundField DataField="Halal" HeaderText="Halal" SortExpression="Halal" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image runat="server" ID="KopitiamImageData" Height="100px" ImageAlign="Middle" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:Button runat="server" ID="KopitiamEditButton" Text="Edit"
                                    CommandName="KopitiamEdit" CommandArgument="<%# Container.DataItemIndex %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Stalls">
                            <ItemTemplate>
                                <asp:Button runat="server" ID="KopitiamViewStallButton" Text="Select"
                                    CommandName="KopitiamSelect" CommandArgument="<% #Container.DataItemIndex %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Owner">
                            <ItemTemplate>
                                <asp:Button runat="server" ID="KopitiamOwnerButton" Text="Remove"
                                    CommandName="KopitiamRemoveOwner"
                                    CommandArgument="<% #Container.DataItemIndex %>" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
            <div id="KopitiamUpdatePanel" runat="server"
                style="background-color: white; width: 75%; margin-left: auto; margin-right: auto; padding-left: 5%; text-align: left;">
                <br />
                <asp:Label ID="UpdateKopitiamLabel" runat="server" Text="Please update the following particulars:"
                    Style="font-weight: 700"></asp:Label>
                <br />
                Kopitiam ID:
                <asp:Label ID="UpdateKopitiamIdLabel" runat="server"></asp:Label>
                &nbsp
                &nbsp
                <asp:Button runat="server" ID="DisownButton" Text="Disown Kopitiam"
                    ToolTip="Remove kopitiam you owned." />
                <br />
                <br />
                Name:
                <asp:TextBox ID="UpdatePageKopitiamNameTextBox" runat="server"></asp:TextBox>
                <br />
                <br />
                State:
                <asp:DropDownList ID="UpdateKopitiamStateDropDownList" runat="server" />
                <br />
                <br />
                Address:
                <asp:TextBox ID="UpdatePageKopitiamAddressTextBox" runat="server"></asp:TextBox>
                <br />
                <br />
                Operation Hours:
                <asp:DropDownList ID="UpdatePageKopitiamStartHoursDropDownList" runat="server">
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
                <asp:DropDownList ID="UpdatePageKopitiamStartMinutesDropDownList" runat="server">
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>45</asp:ListItem>
                </asp:DropDownList>
                &nbsp;to
                <asp:DropDownList ID="UpdatePageKopitiamEndHoursDropDownList" runat="server">
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
                <asp:DropDownList ID="UpdatePageKopitiamEndMinutesDropDownList" runat="server">
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>45</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                Opening Days:
                <asp:CheckBoxList ID="UpdatePageKopitiamDaysCheckBox" runat="server" />
                <br />

                Halal:
                <asp:RadioButtonList ID="UpdatePageKopitiamHalalRadioButton" runat="server">
                    <asp:ListItem Value="0">No</asp:ListItem>
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                Status:
                <asp:RadioButtonList ID="UpdateKopitiamStatusRadioButton" runat="server">
                    <asp:ListItem Value="In Business">In Business</asp:ListItem>
                    <asp:ListItem Value="Closed Down">Closed Down</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                Picture:
                <asp:FileUpload ID="UpdateKopitiamFileUpload" runat="server" />
                <br />
                <asp:RegularExpressionValidator ID="FileUploadValidator" runat="server" Display="Dynamic"
                    ErrorMessage="Invalid Image Format. File will not be uploaded!"
                    ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.png|.PNG|.jpeg|.JPEG)$"
                    ControlToValidate="UpdateKopitiamFileUpload" ForeColor="Red" />
                <br />
                <br />
                <asp:Label runat="server" ID="NoteLabel"
                    Text="Note: Our website has filter system that need time to verify your image is relevant if updating image">
                </asp:Label>
                <br />
                <br />
                <br />
                <asp:Button runat="server" ID="KopitiamUpdateButton" CausesValidation="false" Text="Update" />
                <asp:Button runat="server" ID="KopitiamCancelButton" CausesValidation="false" Text="Cancel" />
                <br />
                <br />
                <br />
            </div>
            <div id="KopitiamDisownPanel" runat="server" visible="false"
                style="background-color: white; width: 75%; margin-left: auto; margin-right: auto; padding-left: 5%; text-align: left;">
                We will send a suggestion to admin for disowning your kopitiam. Process will take less that a week.
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
                <br />
            </div>
            <div style="background-color: white; width: 75%; margin-left: auto; margin-right: auto; padding-left: 5%; text-align: left;">
                <br />
                <asp:Label runat="server" ID="UpdateStatusLabel" ForeColor="Red" Font-Bold="True"></asp:Label>
                <br />
            </div>
            <br />
            <br />
        </div>
        <br />
        <br />
        <div runat="server" id="ObjectDetectResult" visible="false">
            <asp:GridView runat="server" ID="KopitiamObjectDetectedGridView"></asp:GridView>
        </div>

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
