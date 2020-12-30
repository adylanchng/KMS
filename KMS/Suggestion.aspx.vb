Imports System.Data.SqlClient
Imports System.Drawing

Public Class Suggestion
    Inherits System.Web.UI.Page

    'The connection to the database
    Dim conn As SqlConnection

    'Command to insert new general suggestion 
    Dim addGeneralSuggestion As SqlCommand

    'Command to insert new kopitiam suggestion
    Dim addKopitiamSuggestion As SqlCommand

    'Command to insert new stall suggestion
    Dim addStallSuggestion As SqlCommand

    'Command to retrieve kopitiam information based on ID
    Dim findKopitiamInformation As SqlCommand

    Dim listKopitiamSQL As SqlCommand

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'When the form loads, first open the connection to the database
        Dim connStr As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|KMS_DB.mdf;Integrated Security=True"
        conn = New SqlConnection(connStr)


        'Set up the SqlCommand to add general suggestion table
        Dim addGenSql As String = "INSERT INTO GeneralSuggestion(Comment, Date, Status) VALUES (@c, @t, @s)"
        addGeneralSuggestion = New SqlCommand(addGenSql, conn)

        'Set up the SqlCommand to add kopitiam suggestion table
        Dim addKopSql As String = "INSERT INTO KopitiamSuggestion(StateId, Name, OpHourSt, OpHourEn, OpDayOfWeek, Date, Status, Address, Halal, imagePath) VALUES (@b, @c, @d, @e, @f, @g, @h, @i, @j, @k)"
        addKopitiamSuggestion = New SqlCommand(addKopSql, conn)

        'Set up the SqlCommand to add stall suggestion table
        Dim addStaSql As String = "INSERT INTO StallSuggestion( KId, Name, OpHourSt, OpHourEn, OpDayOfWeek, FoodId, Date, imagePath, Status, Halal) VALUES (@b, @c, @d, @e, @f, @g, @h, @i, @j, @k)"
        addStallSuggestion = New SqlCommand(addStaSql, conn)

        'Set up the SqlCommand to retrieve kopitiam information based on ID
        Dim findInfoSql As String = "SELECT Name, Address FROM Kopitiam WHERE Id = @i "
        findKopitiamInformation = New SqlCommand(findInfoSql, conn)

        Dim getKopitiamSql As String = "SELECT Kopitiam.Id, CONCAT(Kopitiam.id,' | ', Kopitiam.Name) AS 'Name' FROM Kopitiam"
        listKopitiamSQL = New SqlCommand(getKopitiamSql, conn)

        If Not IsPostBack Then
            general.Visible = False
            kopitiam.Visible = False
            stall.Visible = False

            ListKopitiam()

            ListFilterState()

        End If

    End Sub
    Public Sub ClearTextBoxes()
        'clear general text box
        suggestionPageGeneralTextBox.Text = ""

        'clear kopitam text boxes, check box, radio button
        suggestionPageKopitiamNameTextBox.Text = ""
        suggestionPageKopitiamAddressTextBox.Text = ""
        For Each Day As ListItem In suggestionPageKopitiamDaysCheckBox.Items
            If Day.Selected Then
                Day.Selected = False
            End If
        Next
        suggestionPageKopitiamHalalRadioButton.SelectedIndex = -1

        'clear stall text box and check box
        suggestionPageStallNameTextBox.Text = ""
        For Each Day As ListItem In suggestionPageStallDaysCheckBox.Items
            If Day.Selected Then
                Day.Selected = False
            End If
        Next




        mainRadioButtonList.SelectedIndex = -1
        general.Visible = False
        kopitiam.Visible = False
        stall.Visible = False

    End Sub

    Public Sub GeneralSuggestion()

        conn.Open()

        Dim status As String = "Unread"


        Dim comment As String = suggestionPageGeneralTextBox.Text
        Dim todayDate As String = Format(Now, "dd-MM-yyyy")

        'set the parameter values in addBookCmd
        addGeneralSuggestion.Parameters.Clear()

        addGeneralSuggestion.Parameters.AddWithValue("c", comment)
        addGeneralSuggestion.Parameters.AddWithValue("t", todayDate)
        addGeneralSuggestion.Parameters.AddWithValue("s", status)

        'Execute the command
        Dim rowsAffected As Integer = addGeneralSuggestion.ExecuteNonQuery()

        Try
            'If more than zero rows affeced , insertion was succesful !
            If rowsAffected > 0 Then
                suggestionPageErrorLabel.ForeColor = Color.Green
                suggestionPageErrorLabel.Text = "Sucess! Suggestion has been suggested."

                ClearTextBoxes()

            End If
        Catch exError As Exception
            suggestionPageErrorLabel.ForeColor = Color.Red
            suggestionPageErrorLabel.Text = "There was a problem with submitting your suggestion."
        End Try

        conn.Close()

    End Sub

    Public Sub KopitiamSuggestion()

        conn.Open()


        Dim StateId As Integer = suggestionPageKopitiamStateDropDownList.SelectedIndex + 1
        Dim Name As String = suggestionPageKopitiamNameTextBox.Text
        Dim OpHourSt As String = suggestionPageKopitiamStartHoursDropDownList.Text + ":" + suggestionPageKopitiamStartMinutesDropDownList.Text
        Dim OpHourEn As String = suggestionPageKopitiamEndHoursDropDownList.Text + ":" + suggestionPageKopitiamEndMinutesDropDownList.Text
        Dim OpDayOfWeek As String = ""
        Dim todayDate As String = Format(Now, "dd-MM-yyyy")
        Dim Status As String = "Pending"
        Dim Address As String = suggestionPageKopitiamAddressTextBox.Text
        Dim Halal As Integer = suggestionPageKopitiamHalalRadioButton.SelectedIndex


        'for loop to convert list of selected items in a check box list to a string. 
        For Each Day As ListItem In suggestionPageKopitiamDaysCheckBox.Items
            If Day.Selected Then
                If OpDayOfWeek = "" Then
                    OpDayOfWeek = Day.Value
                Else
                    OpDayOfWeek = OpDayOfWeek + ", " + Day.Value
                End If
            End If
        Next




        'set the parameter values in addKopitiamSuggestion
        addKopitiamSuggestion.Parameters.Clear()

        addKopitiamSuggestion.Parameters.AddWithValue("b", StateId)
        addKopitiamSuggestion.Parameters.AddWithValue("c", Name)
        addKopitiamSuggestion.Parameters.AddWithValue("d", OpHourSt)
        addKopitiamSuggestion.Parameters.AddWithValue("e", OpHourEn)
        addKopitiamSuggestion.Parameters.AddWithValue("f", OpDayOfWeek)
        addKopitiamSuggestion.Parameters.AddWithValue("g", todayDate)
        addKopitiamSuggestion.Parameters.AddWithValue("h", Status)
        addKopitiamSuggestion.Parameters.AddWithValue("i", Address)
        addKopitiamSuggestion.Parameters.AddWithValue("j", Halal)


        'Execute the command
        Dim rowsAffected As Integer = addKopitiamSuggestion.ExecuteNonQuery()

        Try
            'If more than zero rows affeced , insertion was succesful !
            If rowsAffected > 0 Then
                suggestionPageErrorLabel.ForeColor = Color.Green
                suggestionPageErrorLabel.Text = "Sucess! Suggestion has been suggested."
                ClearTextBoxes()
            End If
        Catch exError As Exception
            suggestionPageErrorLabel.ForeColor = Color.Red
            suggestionPageErrorLabel.Text = "There was a problem with submitting your suggestion."
        End Try

        conn.Close()

    End Sub

    Public Sub StallSuggestion()

        conn.Open()

        Dim OpHourSt As String = suggestionPageStallStartHoursDropDownList.Text + ":" + suggestionPageStallStartMinutesDropDownList.Text
        Dim OpHourEn As String = suggestionPageStallEndHoursDropDownList.Text + ":" + suggestionPageStallEndMinutesDropDownList.Text
        Dim OpDayOfWeek As String = ""


        'for loop to convert list of selected items in a check box list to a string. 
        For Each Day As ListItem In suggestionPageKopitiamDaysCheckBox.Items
            If Day.Selected Then
                If OpDayOfWeek = "" Then
                    OpDayOfWeek = Day.Value
                Else
                    OpDayOfWeek = OpDayOfWeek + ", " + Day.Value
                End If
            End If
        Next



        'set the parameter values in addBookCmd

        addStallSuggestion.Parameters.Clear()

        addStallSuggestion.Parameters.AddWithValue("b", ListKopitiamDropDownList.SelectedValue)
        addStallSuggestion.Parameters.AddWithValue("c", suggestionPageStallNameTextBox.Text)
        addStallSuggestion.Parameters.AddWithValue("d", OpHourSt)
        addStallSuggestion.Parameters.AddWithValue("e", OpHourEn)
        addStallSuggestion.Parameters.AddWithValue("f", OpDayOfWeek)
        addStallSuggestion.Parameters.AddWithValue("g", suggestionPageStallFoodDropDown.SelectedValue)
        addStallSuggestion.Parameters.AddWithValue("h", Format(Now, "dd-MM-yyyy"))

        addStallSuggestion.Parameters.AddWithValue("j", "Pending")
        addStallSuggestion.Parameters.AddWithValue("k", suggestionPageStallHalalRadioButton.SelectedIndex)

        'Execute the command
        Dim rowsAffected As Integer = addStallSuggestion.ExecuteNonQuery()

        Try
            'If more than zero rows affeced , insertion was succesful !
            If rowsAffected > 0 Then
                suggestionPageErrorLabel.ForeColor = Color.Green
                suggestionPageErrorLabel.Text = "Sucess! Suggestion has been suggested."
                ClearTextBoxes()
            End If
        Catch exError As Exception
            suggestionPageErrorLabel.ForeColor = Color.Red
            suggestionPageErrorLabel.Text = "There was a problem with submitting your suggestion."
        End Try

        conn.Close()

    End Sub

    Protected Sub MainRadioButtonList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles mainRadioButtonList.SelectedIndexChanged
        suggestionPageErrorLabel.Text = ""

        'controlling GUI elements based on user selection
        Dim userSelection As String = mainRadioButtonList.SelectedValue

        Select Case userSelection
            Case "General"
                general.Visible = True
                kopitiam.Visible = False
                stall.Visible = False
            Case "Add Kopitiam"
                general.Visible = False
                kopitiam.Visible = True
                stall.Visible = False
            Case "Add Stall to Kopitiam"
                general.Visible = False
                kopitiam.Visible = False
                stall.Visible = True
        End Select
    End Sub

    Protected Sub GeneralSubmitButton_Click(sender As Object, e As EventArgs) Handles GeneralSubmitButton.Click
        Dim comment As String = suggestionPageGeneralTextBox.Text

        If comment.Count > 5000 Then

            suggestionPageErrorLabel.Text = "Sorry, your suggestion is too long"
        Else
            GeneralSuggestion()
        End If
    End Sub

    Protected Sub KopitiamSubmitButton_Click(sender As Object, e As EventArgs) Handles KopitiamSubmitButton.Click

        Dim validImage As String = ""


        If suggestionPageKopitiamNameTextBox.Text = "" Then


            suggestionPageErrorLabel.Text = "Please enter kopitiam name"

        ElseIf suggestionPageKopitiamAddressTextBox.Text = "" Then

            suggestionPageErrorLabel.Text = "Please enter kopitiam address"


        ElseIf suggestionPageKopitiamHalalRadioButton.SelectedIndex = -1 Then

            suggestionPageErrorLabel.Text = "Please select yes or no for halal"
        ElseIf validImage = "INVALID" Then

            suggestionPageErrorLabel.Text = "Image does not meet criteria"
        Else
            KopitiamSuggestion()
        End If
    End Sub

    Protected Sub StallSubmitButton_Click(sender As Object, e As EventArgs) Handles StallSubmitButton.Click

        Dim validImage As String = ""


        If ListKopitiamDropDownList.SelectedValue = -1 Then

            suggestionPageErrorLabel.Text = "Please insert kopitiam ID"
        ElseIf suggestionPageStallNameTextBox.Text = "" Then

            suggestionPageErrorLabel.Text = "Please enter stall address"

        ElseIf suggestionPageStallHalalRadioButton.SelectedIndex = -1 Then

            suggestionPageErrorLabel.Text = "Please select yes or no for halal"
        ElseIf validImage = "INVALID" Then

            suggestionPageErrorLabel.Text = "Image does not meet criteria"
        Else
            StallSuggestion()
        End If
    End Sub

    Protected Sub ListFilterState()
        Dim listStateSQL As SqlCommand = New SqlCommand("SELECT * FROM State", conn)
        Dim adp As SqlDataAdapter = New SqlDataAdapter(listStateSQL)
        Dim ds As DataSet = New DataSet()
        Dim stateTable As DataTable
        adp.Fill(ds, "states")
        stateTable = ds.Tables("states")
        KopitiamStateDropDownList.DataSource = stateTable
        KopitiamStateDropDownList.DataTextField = "Name"
        KopitiamStateDropDownList.DataValueField = "Id"
        KopitiamStateDropDownList.DataBind()
        KopitiamStateDropDownList.Items.Insert(0, New ListItem("-Please Select-", -1))
    End Sub



    Protected Sub ListKopitiam()
        Dim adp As SqlDataAdapter = New SqlDataAdapter(listKopitiamSQL)
        Dim ds As DataSet = New DataSet()
        Dim kopitiamTable As DataTable
        adp.Fill(ds, "kopitiams")
        kopitiamTable = ds.Tables("kopitiams")
        ListKopitiamDropDownList.DataSource = kopitiamTable
        ListKopitiamDropDownList.DataTextField = "Name"
        ListKopitiamDropDownList.DataValueField = "Id"
        ListKopitiamDropDownList.DataBind()
        ListKopitiamDropDownList.Items.Insert(0, New ListItem("-Please Select-", -1))
    End Sub

    Protected Sub MoreFilterCheckBox_CheckedChanged(sender As Object, e As EventArgs) Handles MoreFilterCheckBox.CheckedChanged
        If MoreFilterCheckBox.Checked Then
            MoreFilterPanel.Visible = True
        Else
            Dim getKopitiamSql As String = "SELECT Kopitiam.Id, CONCAT(Kopitiam.id,' | ', Kopitiam.Name) AS 'Name' FROM Kopitiam"
            listKopitiamSQL = New SqlCommand(getKopitiamSql, conn)
            ListKopitiam()
            KopitiamNameTextBox.Text = ""
            KopitiamAddressTextBox.Text = ""
            MoreFilterPanel.Visible = False
        End If
    End Sub

    Protected Sub SearchButton_Click(sender As Object, e As EventArgs) Handles SearchButton.Click
        Dim getFilteredKopitiamSql As String = "SELECT Kopitiam.Id, CONCAT(Kopitiam.id,' | ', Kopitiam.Name) AS 'Name' FROM Kopitiam WHERE Kopitiam.Name LIKE '%' + @name + '%' AND Kopitiam.Address LIKE '%' + @addr + '%' AND StateId LIKE @st;"
        listKopitiamSQL = New SqlCommand(getFilteredKopitiamSql, conn)
        listKopitiamSQL.Parameters.Clear()
        listKopitiamSQL.Parameters.AddWithValue("@name", KopitiamNameTextBox.Text.Trim)
        listKopitiamSQL.Parameters.AddWithValue("@addr", KopitiamAddressTextBox.Text.Trim)
        If KopitiamStateDropDownList.SelectedValue > -1 Then
            listKopitiamSQL.Parameters.AddWithValue("@st", KopitiamStateDropDownList.SelectedValue)
        Else
            listKopitiamSQL.Parameters.AddWithValue("@st", "%%")
        End If
        ListKopitiam()
    End Sub

    Protected Sub BackButton_Click(sender As Object, e As EventArgs) Handles BackButton.Click
        Response.Redirect("Home.aspx")
    End Sub
End Class