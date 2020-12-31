<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Feedback.aspx.vb" Inherits="KMS.Feedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Feedback</title>
    <link href="GeneralStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            font-weight: bold;
            text-decoration: underline;
        }
    </style>
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
                <u><b>Feedback</b></u>
                <br />
                <br />
                All feedback is welcomed. Kindly please type your feedback in the box below and click submit.</strong><br />

                <br />
                <asp:TextBox ID="MainTextBox" runat="server" Height="250px" Width="50%"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="SubmitButton" runat="server" Text="Submit" />
&nbsp;&nbsp;&nbsp;
                
                <strong>
                <asp:Label ID="ErrorMessageLabel" runat="server" EnableTheming="True" Font-Bold="True"></asp:Label>
                </strong>
                <br />

                <br />
            </div>
        </div>
    </form>
</body>
</html>
