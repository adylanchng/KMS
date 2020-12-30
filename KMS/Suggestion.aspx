<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Suggestion.aspx.vb" Inherits="KMS.Suggestion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Suggestion</title>
    <link href="GeneralStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
       <div style=" text-align: center;">
            <div
                style="background-color: white;  width:75%; margin-left: auto; margin-right: auto; padding-left:5%; text-align:left;">
                <p></p>
                <br />
                <h1><u>Kopitiam Management System</u></h1>
                <h2>Find and discover kopitiams across Malaysia.</h2>
                <br />
            </div>
        </div>

        <!-- main body of elements -->
        <div runat="server" id="FirstGreyBar" style="text-align: Left;">
            <div
                style="background-color: #3E4041; color:white; width:75%; margin-left: auto; margin-right: auto; padding-left:5%; ">
                <br />
                                  <asp:Button ID="BackButton" runat="server" Text="&lt;--- Go Back" />
                
                <br /> 
                <br />
            </div>
            </div>  
        <div style="text-align:center;">
            <div id="mainselection"
                style="background-color: white; width:75%; margin-left: auto; margin-right: auto; padding-left:5%; text-align:left;">
                
                <strong>
                <br />
                <div style="text-align:center"><b>Suggestion Page</b></div>
                <br />
                <asp:Label ID="suggestionPageErrorLabel" runat="server" EnableTheming="True" Font-Bold="True"></asp:Label>
                <asp:Label ID="suggestionPageErrorLabel0" runat="server" EnableTheming="True" Font-Bold="True"></asp:Label>
                <br />
                <br />
                Step 1 out 2) Please select the type of suggestion you want to provide</strong>

                <br />

                <asp:RadioButtonList ID="mainRadioButtonList" runat="server" AutoPostBack="True">
                    <asp:ListItem>General</asp:ListItem>
                    <asp:ListItem>Add Kopitiam</asp:ListItem>
                    <asp:ListItem>Add Stall to Kopitiam</asp:ListItem>
                
                </asp:RadioButtonList>

                <br />
            </div>
        </div>
        <br />

        <!-- start of general suggestion elements -->
        <div style="text-align:center;">
            <div runat="server" id="general"
                style="background-color: white; width:75%; margin-left: auto; margin-right: auto; padding-left:5%; text-align:left;">
                <br />
                <asp:Label ID="suggestionPageGeneralLabel" runat="server" Text="Step 2 out of 2) Please enter your message:"
                    style="font-weight: 700"></asp:Label>
                <br />
                <br />
                <asp:TextBox ID="suggestionPageGeneralTextBox" runat="server" Height="87px" TextMode="MultiLine"
                    Width="287px"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="GeneralSubmitButton" runat="server" Text="Finished? Click here to submit." />
                <br />
                <br />
            </div>
        </div>


        <!-- start of add a kopitiam suggestion elements -->
        <div style="text-align:center;">
            <div runat="server" id="kopitiam"
                style="background-color: white; width:75%; margin-left: auto; margin-right: auto; padding-left:5%; text-align:left;">

                <br />

                <asp:Label ID="suggestionPageKopitiamLabel" runat="server"
                    Text="Step 2 out 2) Please enter the following particulars:" style="font-weight: 700"></asp:Label>
                <br />
                <br />
                State:
                <asp:DropDownList ID="suggestionPageKopitiamStateDropDownList" runat="server"
                    DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|KMS_DB.mdf;Integrated Security=True"
                    SelectCommand="SELECT [Name] FROM [State]"></asp:SqlDataSource>
                <br />
                <br />
                Name:
                <asp:TextBox ID="suggestionPageKopitiamNameTextBox" runat="server"></asp:TextBox>
                <br />
                <br />
                Operation Hours:
                <asp:DropDownList ID="suggestionPageKopitiamStartHoursDropDownList" runat="server">
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
                <asp:DropDownList ID="suggestionPageKopitiamStartMinutesDropDownList" runat="server">
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>45</asp:ListItem>
                </asp:DropDownList>
                &nbsp;to
                <asp:DropDownList ID="suggestionPageKopitiamEndHoursDropDownList" runat="server">
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
                <asp:DropDownList ID="suggestionPageKopitiamEndMinutesDropDownList" runat="server">
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>45</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                Opening Days:
                <asp:CheckBoxList ID="suggestionPageKopitiamDaysCheckBox" runat="server">
                    <asp:ListItem>Monday</asp:ListItem>
                    <asp:ListItem>Tuesday</asp:ListItem>
                    <asp:ListItem>Wednesday</asp:ListItem>
                    <asp:ListItem>Thursday</asp:ListItem>
                    <asp:ListItem>Friday</asp:ListItem>
                    <asp:ListItem>Saturday</asp:ListItem>
                    <asp:ListItem>Sunday</asp:ListItem>
                </asp:CheckBoxList>

                <br />
                Address: <asp:TextBox ID="suggestionPageKopitiamAddressTextBox" runat="server"></asp:TextBox>
                <br />
                <br />
                Halal:
                <asp:RadioButtonList ID="suggestionPageKopitiamHalalRadioButton" runat="server">
                    <asp:ListItem Value="No"></asp:ListItem>

                    <asp:ListItem>Yes</asp:ListItem>

                </asp:RadioButtonList>


                <br />
                <asp:Button ID="KopitiamSubmitButton" runat="server" Text="Finished? Click here to submit." />
                <br />


                <br />


            </div>
        </div>


        <!-- start of stall suggestion elements -->
        <div style="text-align:center;">
            <div runat="server" id="stall"
                style="background-color: white; width:75%; margin-left: auto; margin-right: auto; padding-left:5%; text-align:left;">
                <br />
                <asp:Label ID="suggestionPageStallLabel" runat="server"
                    Text="Step 2 out of 2) Please enter the following particulars:" style="font-weight: 700"></asp:Label>
                <br />
                <br />
                Kopitiam:&nbsp;
                <asp:DropDownList ID="ListKopitiamDropDownList" runat="server">
                    </asp:DropDownList>
                    <asp:CheckBox runat="server" ID="MoreFilterCheckBox" Text="More Filter" AutoPostBack="true"/>
                    <div runat="server" id="MoreFilterPanel" style="border:dotted;border-width:2px" visible="false">
                    Filter By:
                    <br />
                    Kopitiam Name:
                        <asp:TextBox runat="server" ID="KopitiamNameTextBox"></asp:TextBox>
                    <br />
                    Address:
                        <asp:TextBox runat="server" ID="KopitiamAddressTextBox"></asp:TextBox>
                    <br />
                    State:
                        <asp:DropDownList runat="server" ID="KopitiamStateDropDownList"></asp:DropDownList>
                    <br />
                        <asp:Button runat="server" ID="SearchButton" Text="Search" />
                    </div>
                    <br />
                &nbsp;<br />
                <br />
                Food:
                <asp:DropDownList ID="suggestionPageStallFoodDropDown" runat="server" DataSourceID="SqlDataSource2"
                    DataTextField="Name" DataValueField="Id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|KMS_DB.mdf;Integrated Security=True"
                    SelectCommand="SELECT [Id], [Name] FROM [Food]"></asp:SqlDataSource>
                <br />
                <br />
                Name:
                <asp:TextBox ID="suggestionPageStallNameTextBox" runat="server"></asp:TextBox>
                <br />
                <br />
                Operation Hours:
                <asp:DropDownList ID="suggestionPageStallStartHoursDropDownList" runat="server">
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
                <asp:DropDownList ID="suggestionPageStallStartMinutesDropDownList" runat="server">
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>45</asp:ListItem>
                </asp:DropDownList>
                &nbsp;to
                <asp:DropDownList ID="suggestionPageStallEndHoursDropDownList" runat="server">
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
                <asp:DropDownList ID="suggestionPageStallEndMinutesDropDownList" runat="server">
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>45</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                Opening Days:
                <asp:CheckBoxList ID="suggestionPageStallDaysCheckBox" runat="server">
                    <asp:ListItem>Monday</asp:ListItem>
                    <asp:ListItem>Tuesday</asp:ListItem>
                    <asp:ListItem>Wednesday</asp:ListItem>
                    <asp:ListItem>Thursday</asp:ListItem>
                    <asp:ListItem>Friday</asp:ListItem>
                    <asp:ListItem>Saturday</asp:ListItem>
                    <asp:ListItem>Sunday</asp:ListItem>
                </asp:CheckBoxList>

                <br />
                Halal:
                <asp:RadioButtonList ID="suggestionPageStallHalalRadioButton" runat="server" TextAlign="Left">
                    <asp:ListItem Value="No"></asp:ListItem>

                    <asp:ListItem>Yes</asp:ListItem>

                </asp:RadioButtonList>
                <br />
                <asp:Button ID="StallSubmitButton" runat="server" Text="Finished? Click here to submit." />
                <br />
                <br />
            </div>

            <br />
            <br />

        </div>
    </form>
</body>
</html>
