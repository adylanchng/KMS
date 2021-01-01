<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="About.aspx.vb" Inherits="KMS.About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About</title>
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
                style="background-color: #3E4041; color:white; width:75%; margin-left: auto; margin-right: auto; padding-left:5%; ;">
                <br />
               
                <asp:Button ID="BackButton" runat="server" Text="&lt;--- Go Back" />
                
                <br />
                <br />
            </div>
            </div>  
            
            <div runat="server" id="Kopitiams"
                style="background-color: white;  width:75%; margin-left: auto; margin-right: auto; padding-left:5%; text-align:left;">
                <br />
                
              
                
                Techincally speaking, 
                Kopitiam Management System is an ASPX web application called Kopitiam Managment System. This system is a cut down version of Kopitiam Management System Pro, a product of a group diploma final year project. Coded with Visual Basic in Visual Studio 2019.
                <br />
                <br />
                Non techincally speaking, Kopitiam Management System allows for us all to find our desired food quickly.
                <br />
                <br />
                Narrow down the list by first selecting the state you are in followed by the food you are looking for.<br />
                <br />
                You can help make Kopitiam Management System better by telling us kopitiams and their stalls that we are missing.
                <br />
                <br />
                You may let us know by emailing us at <a href="mailto:yalahmedia@gmail.com">yalahmedia@gmail.com</a>.<br />
                <br />
                We welcome all feedback too.<br />
                <br />
                If you are suggesting we should add a particular kopitiam, kindly please include the following details in your email:<br />
                - Kopitiam name
                <br />
                - State
                kopitiam located in<br />
                - Kopitiam address
                <br />
                - Opening hours
                <br />
                - Opening days
                <br />
                - Is it halal?
                <br />
                <br />
                If you are suggesting we should add a particular stall to a kopitiam, kindly please include the following details in your email:<br />
                - Name of kopitiam<br />
                - Address of Kopitiam
                <br />
                - Name
                of stall<br />
                - Opening hours
                <br />
                - Opening days
                <br />
                - Is it halal?
                <br />
                <br />
                
              
                
                <br />
            </div>
         
        
         
        
            <br />
            <br />
        </div>
    </form>
</body>
</html>
