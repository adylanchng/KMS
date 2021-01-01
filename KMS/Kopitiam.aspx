<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Kopitiam.aspx.vb" Inherits="KMS.Kopitiam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kopitiam</title>
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

            <div  runat="server" id="SecondGreyBar" style=" text-align: Left;">
            <div
                style="background-color: #3E4041; color:white; width:75%; margin-left: auto; margin-right: auto; padding-left:5%; ">
                <br />
                <asp:Label ID="KopitiamIdLabel" runat="server" Text="Label" Visible="False"></asp:Label>
                &nbsp;<asp:Button ID="BackButton" runat="server" Text="&lt;--- Go Back" />
                
                <br />
                <br />
            </div>
                </div>

             
         
         <div
                runat="server" id="Stalls" style="background-color: white;  width:75%; margin-left: auto; margin-right: auto; padding-left:5%; text-align:left;">
                <br />
                <b>
                Kopitiam Information:</b>
             <asp:GridView ID="GridViewWithTheKopitiam" runat="server" AutoGenerateColumns="false"
                    OnRowCommand="GridViewWithTheKopitiam_RowCommand" Width="90%" >
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
                        
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:Button Height="50px" Text="View in Google Maps" CommandName="Maps" CommandArgument="<%# Container.DataItemIndex %>" runat="server"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

             <br />
                <b>Stall(s):</b>
                <br />
                <asp:Label ID="Label1" runat="server" Font-Names="Calibri">Sorry, no stall found. <a href="suggestion.aspx">Suggest one
                        today!</a></asp:Label>
                <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
                <asp:GridView ID="StallGridView" runat="server" AutoGenerateColumns="false"
                     Width="90%" AllowPaging="true"
                    OnPageIndexChanging="OnPageIndexChanging" PageSize="25">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" />
                        <asp:BoundField DataField="StallName" HeaderText="Name" />
                         <asp:BoundField DataField="FoodName" HeaderText="Food" />
                        
                        <asp:BoundField DataField="OpHourSt" HeaderText="Opening Hour" />
                        <asp:BoundField DataField="OpHourEn" HeaderText="Closing Hour" />
                        <asp:BoundField DataField="OpDayOfWeek" HeaderText="Opening Days" />
                        <asp:BoundField DataField="Halal" HeaderText="Halal" />
                         <asp:BoundField DataField="Status" HeaderText="Status" />
                        
                    </Columns>
                </asp:GridView>
                <br />
            </div>
         
        <div style=" text-align: center;">
            <div style="background-color: white;  width:75%; margin-left: auto; margin-right: auto; padding-left:5%; text-align:center;">
                <asp:Button ID="SuggestButton" runat="server" Text="Click here to learn more about Kopitiam Managment System"></asp:Button>
                <br />
                <br />
            </div>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
