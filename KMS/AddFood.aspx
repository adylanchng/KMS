<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AddFood.aspx.vb" Inherits="UDW.AddFood" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin: Add Food</title>
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

           <div style=" text-align: center;">
               <div style="background-color: white;  width:75%; margin-left: auto; margin-right: auto; padding-left:5%; text-align:left;">   
        <div id="FoodPanel" runat="server">&nbsp;
            <br />
            <asp:Label runat="server">Registered food</asp:Label>
            <br />
            <asp:GridView ID="FoodGridView" runat="server" AllowSorting="true" AutoGenerateColumns="false" OnRowEditing="FoodGridView_RowEditing" OnRowCancelingEdit="FoodGridView_RowCancelingEdit" OnRowUpdating="FoodGridView_RowUpdating" OnRowDataBound="FoodGridView_RowDataBound" AllowPaging="true"
    OnPageIndexChanging="OnPageIndexChanging" PageSize="10">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" ReadOnly="false" HeaderText="Name" SortExpression="Name" />
                    
                    <asp:TemplateField HeaderText="Category" SortExpression="Category">
		                <EditItemTemplate>
			                    <asp:DropDownList ID="CategoryEditDDList" runat="server" />
		                </EditItemTemplate>
		                <ItemTemplate>
			                    <asp:Label ID="CatLabel" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
		                </ItemTemplate>
	                </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button runat="server" CausesValidation="False" CommandName="Edit" ID="FoodEditButton" Text="Edit" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button runat="server" CommandName="Update" ID="FoodDoneButton" Text="Done" />
                        <asp:Button runat="server" CommandName="Cancel" ID="FoodCancelButton" Text="Cancel" />
                    </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate><p style="font-size:large;font-style:oblique">No food available.</p></EmptyDataTemplate>
            </asp:GridView>
           <br />
            <asp:Label runat="server">Add Food:</asp:Label>
            <br />
           <br />
            <asp:label runat="server">Name:</asp:label>
            <asp:TextBox runat="server" ID="FoodNameInsertTextBox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FoodNameInsertTextBox" ErrorMessage="*Please Insert Name" ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator>
            <br />
           <br />
            <asp:Label runat="server">Category: </asp:Label>
            <asp:DropDownList runat="server" ID="CatDDList" ></asp:DropDownList>
            <asp:Label ID="CatErrorLabel" runat="server" ForeColor="Red" Text="*Please Select" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Button ID="AddButton" runat="server" Text="Add" ValidationGroup="Add"/>
            <asp:Button ID="ClearButton" runat="server" Text="Clear"/>

            <asp:Label ID="FoodExistPromptLabel" runat="server" ForeColor="Red" Text="NOTE: Current food is already exist. Please check table above" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Button ID="AddCategoryButton" runat="server" Text="Add Category" />
                <br />
                <br />
                </div>

        <div  id="CategoryPanel" runat="server" visible="false">
            <asp:Label runat="server">Current Category</asp:Label>
            <br />
            <asp:GridView ID="CategoryGridView" runat="server" >
                <EmptyDataTemplate><p style="font-size:large;font-style:oblique">No category available.</p></EmptyDataTemplate>
            </asp:GridView>
           <br />
            <asp:Label runat="server">Add Category:</asp:Label>
            <br />
           <br />
            <asp:label runat="server">Name:</asp:label>
            <asp:TextBox runat="server" ID="CatInsertTextBox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CatInsertTextBox" ErrorMessage="*Please Insert Name" ForeColor="Red" ValidationGroup="Cat"></asp:RequiredFieldValidator>
            <br />
           <br />
            <asp:Button ID="CatAddButton" runat="server" Text="Done" ValidationGroup="Cat"/>
            <asp:Button ID="CatBackButton" runat="server" Text="Back" OnClientClick="confirmSav();" />

            <asp:Label ID="CatExistPromptLabel" runat="server" ForeColor="Red" Text="NOTE: Current item is already exist. Please check table above" Visible="False"></asp:Label>
            <br />
            <br />
        </div>
    </div>
                 <br />
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
    <script type="text/javascript">
        function confirmSav() {
            var val = new String(document.getElementById('<%= CatInsertTextBox.ClientID %>').value);
            var valLength = val.length;

            var retVal = document.createElement("INPUT");
            retVal.type = "hidden";
            retVal.name = "retVal";

            if (valLength > 0) {
                if (confirm("Sure apply changes?")) retVal.value = "1";
                else retVal.value = "0";
            }
            document.forms[0].appendChild(retVal);
        }


    </script>
</html>
