<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Home.aspx.vb" Inherits="KMS.Home" EnableEventValidation = "false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Home</title>
    <link href="GeneralStyle.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <form id="form1" runat="server">

        <div style=" text-align: center;">
            <div
                style="background-color: white;  width:75%; margin-left: auto; margin-right: auto; padding-left:5%; text-align:left;">
               
                <br />
                <h1><u>Kopitiam Management System</u></h1>
                <h2>Find and discover kopitiams across Malaysia.</h2>
                <br />
            </div>
        </div>

        <!-- main body of elements -->
        <div runat="server" id="FirstGreyBar" style="text-align: Left;">
            <div
                style="background-color: #3E4041; color:white; width:75%; margin-left: auto; margin-right: auto; padding-left:5%; text-align:center;">
                <br />
                <b>Showing kopitiams in:
                    <asp:DropDownList ID="StateDropDownList" runat="server" AppendDataBoundItems="true"
                        AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Name">
                        <asp:ListItem Value="-1">all states</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                        ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|KMS_DB.mdf;Integrated Security=True"
                        SelectCommand="SELECT [Name] FROM [State]"></asp:SqlDataSource>
                    &nbsp;that serves:
                    <asp:DropDownList ID="FoodDropDownList" runat="server" AppendDataBoundItems="True"
                        AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="Name">
                        <asp:ListItem Value="-1">all food</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|KMS_DB.mdf;Integrated Security=True" SelectCommand="SELECT [Name] FROM [Food] ORDER BY [Name]"></asp:SqlDataSource>
                </b>
                <br />
                <br />
            </div>
            </div>  
            
            <div runat="server" id="Kopitiams"
                style="background-color: white;  width:75%; margin-left: auto; margin-right: auto; padding-left:5%; text-align:left;">
                <br />
                <asp:Label ID="statusLabel" runat="server" Font-Names="Calibri">Sorry, no kopitam found. Perhaps,
                    your filter is too specific! <a href="suggestion.aspx">Suggest one
                        today!</a></asp:Label>
                <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
                <asp:GridView ID="mainGridView" runat="server" AutoGenerateColumns="false"
                    OnRowCommand="mainGridView_RowCommand" Width="90%" AllowPaging="true"
                    OnPageIndexChanging="OnPageIndexChanging" PageSize="25">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                         <asp:BoundField DataField="StateName" HeaderText="State" />
                        <asp:BoundField DataField="Address" HeaderText="Address" />
                        <asp:BoundField DataField="OpHourSt" HeaderText="Opening Hour" />
                        <asp:BoundField DataField="OpHourEn" HeaderText="Closing Hour" />
                        <asp:BoundField DataField="OpDayOfWeek" HeaderText="Opening Days" />
                        <asp:BoundField DataField="Halal" HeaderText="Halal" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <asp:Button Height="50px" Text="View Stalls" runat="server"
                                    CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:Button Height="50px" Text="View in Google Maps" CommandName="Maps" CommandArgument="<%# Container.DataItemIndex %>" runat="server"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
            </div>
         
        
         
        <div style=" text-align: center;">
            <div style="background-color: white;  width:75%; margin-left: auto; margin-right: auto; padding-left:5%; text-align:center;">
                <asp:Button ID="AboutButton" runat="server" Text="Click here to learn more about Kopitiam Managment System"></asp:Button>
                <br />
                <br />
            </div>
            <br />
            <br />
        </div>
           
    </form>
</body>

</html>