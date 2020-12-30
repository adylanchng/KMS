Imports System.Data.SqlClient

Public Class Home
    Inherits System.Web.UI.Page

    'The connection to the database'
    Dim conn As SqlConnection

    'The command to populate the gridview with initially before any user specific filtering. 
    Dim findKopitiamDetails As SqlCommand

    'The command to find information of one kopitiam based on id
    Dim findTheKopitiam As SqlCommand

    'The command to find the stalls
    Dim findTheStalls As SqlCommand

    'The command to filter by state - yes, filter by food - no. 
    Dim filterYesNo As SqlCommand

    'The command to filter by state - no, filter by food - yes. 
    Dim filterNoYes As SqlCommand

    'The command to filter by state - yes, filter by food - yes. 
    Dim filterYesYes As SqlCommand

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'When the form loads, first open the connection to the database
        Dim connStr As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|KMS_DB.mdf;Integrated Security=True"
        conn = New SqlConnection(connStr)
        conn.Open()

        'Set up the SqlCommand to retrieve kopitiam information
        Dim byKopiSql As String = "SELECT Kopitiam.Id, Status, Kopitiam.Name, State.Name as StateName, Address, OpHourSt, OpHourEn, OpDayOfWeek,Halal FROM Kopitiam JOIN State ON Kopitiam.StateId = State.Id"
        findKopitiamDetails = New SqlCommand(byKopiSql, conn)

        'Set up the SqlCommand to retrieve information about a koptiiam 
        Dim byTheKopiSql As String = "SELECT Kopitiam.Id, Status, Kopitiam.Name, State.Name as StateName, Address, OpHourSt, OpHourEn, OpDayOfWeek,Halal FROM Kopitiam JOIN State ON Kopitiam.StateId = State.Id WHERE Kopitiam.Id = @a"
        findTheKopitiam = New SqlCommand(byTheKopiSql, conn)

        'Set up the SqlCommand to retrieve stalls 
        Dim byStallsSql As String = "SELECT Stall.Id, Stall.Name as StallName, OpHourSt, OpHourEn, OpDayOfWeek, Food.Name as FoodName, Halal, Status FROM Stall JOIN Food ON Stall.FoodId = Food.Id WHERE kId = 1001 "
        findTheStalls = New SqlCommand(byStallsSql, conn)

        'Set up the SqlCommand to retrive kopitiams with filter by state - yes, filter by food - no
        Dim filterYNSql As String = "SELECT Kopitiam.Id, Kopitiam.Status, Kopitiam.Name, State.Name as StateName, Kopitiam.Address, Kopitiam.OpHourSt, Kopitiam.OpHourEn, Kopitiam.OpDayOfWeek, Kopitiam.Halal FROM Kopitiam JOIN State ON Kopitiam.StateId = State.Id WHERE Kopitiam.StateId = @a"
        filterYesNo = New SqlCommand(filterYNSql, conn)

        'Set up the SqlCommand to retrive kopitiams with filter by state - no, filter by food - yes
        Dim filterNYSql As String = "SELECT Kopitiam.Id, Kopitiam.Status, Kopitiam.Name, State.Name as StateName, Kopitiam.Address, Kopitiam.OpHourSt, Kopitiam.OpHourEn, Kopitiam.OpDayOfWeek, Kopitiam.Halal FROM Kopitiam JOIN Stall ON Kopitiam.Id = Stall.kId JOIN Food ON Stall.FoodId=Food.Id WHERE Food.Id = @b"
        filterNoYes = New SqlCommand(filterNYSql, conn)

        'Set up the SqlCommand to retrive kopitiams with filter by state - yes, filter by food - yes
        Dim filterYYSql As String = "SELECT Kopitiam.Id, Kopitiam.Status, Kopitiam.Name, State.Name as StateName, Kopitiam.Address, Kopitiam.OpHourSt, Kopitiam.OpHourEn, Kopitiam.OpDayOfWeek, Kopitiam.Halal FROM Kopitiam JOIN State ON Kopitiam.StateId = State.Id JOIN Stall ON Kopitiam.Id = Stall.kId JOIN Food ON Stall.FoodId=Food.Id WHERE Kopitiam.StateId = @a AND Food.Id = @b"
        filterYesYes = New SqlCommand(filterYYSql, conn)

        statusLabel.Visible = False

        If Not IsPostBack Then
            Me.BindGrid()
            Stalls.Visible = False
            SecondGreyBar.Visible = False
        End If
    End Sub

    Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        mainGridView.PageIndex = e.NewPageIndex
        Me.BindGrid()
    End Sub

    Protected Sub mainGridView_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        Dim Index As Integer
        Try
            Index = Convert.ToInt32(e.CommandArgument)
        Catch exp As Exception
            System.Diagnostics.Debug.WriteLine(exp.StackTrace)
        End Try
        If mainGridView.PageIndex > 0 Then
            Index -= (mainGridView.PageIndex * 10)
        End If
        If e.CommandName = "Select" Then
            Dim KopitiamId As String = mainGridView.Rows(Index).Cells(0).Text

            PopulateStallSection(KopitiamId)


        End If

        If e.CommandName = "Maps" Then
            Dim Name As String = mainGridView.Rows(Index).Cells(1).Text
            Dim Address As String = mainGridView.Rows(Index).Cells(3).Text
            Dim URL As String = "https://maps.google.com/maps?q="
            Response.Redirect(URL + Name + " " + Address)
        End If
    End Sub

    Protected Sub SuggestButton_Click(sender As Object, e As EventArgs) Handles SuggestButton.Click
        'user click on suggest button.
        'redirect user to suggestion page.
        Response.Redirect("Suggestion.aspx")
    End Sub

    Private Sub BindGrid()
        Dim openConn As Boolean = (conn.State = ConnectionState.Open)
        If (openConn = False) Then
            conn.Open()
        End If

        ' Then run byCategoryCmd. The SqlDataAdapter will put the query results inside a DataSet with the label "byCat"
        Dim adapter1 As SqlDataAdapter = New SqlDataAdapter(findKopitiamDetails)
        Dim ds1 As DataSet = New DataSet()
        adapter1.Fill(ds1, "byCat")

        ' Now the query results are inside a DataTable called "byCat" inside ds
        Dim dt1 As DataTable = ds1.Tables("byCat")

        ' Check whether dt has any rows inside it? If dt.Rows.Count = 0 that means 0 rows, i.e. no data found!
        If (dt1.Rows.Count = 0) Then
            mainGridView.DataSource = Nothing
            mainGridView.DataBind()
            statusLabel.Visible = True
        Else ' otherwise = there are really some rows of data in the result!
            ' Assume that each user id is unique, so if results available,
            ' should be exactly ONE row. Take the first row in the table.

            mainGridView.DataSource = dt1
            mainGridView.DataBind()
        End If
        conn.Close()
    End Sub

    Public Sub PopulateStallSection(KopitiamId As String)
        Kopitiams.Visible = False
        FirstGreyBar.Visible = False


        Dim openConn As Boolean = (conn.State = ConnectionState.Open)
        If (openConn = False) Then
            conn.Open()
        End If

        findTheKopitiam.Parameters.Clear()
        findTheKopitiam.Parameters.AddWithValue("a", KopitiamId)

        ' Then run byCategoryCmd. The SqlDataAdapter will put the query results inside a DataSet with the label "byCat"
        Dim adapter2 As SqlDataAdapter = New SqlDataAdapter(findTheKopitiam)
        Dim ds2 As DataSet = New DataSet()
        adapter2.Fill(ds2, "byCat")

        ' Now the query results are inside a DataTable called "byCat" inside ds
        Dim dt2 As DataTable = ds2.Tables("byCat")

        ' Check whether dt has any rows inside it? If dt.Rows.Count = 0 that means 0 rows, i.e. no data found!
        If (dt2.Rows.Count = 0) Then
            GridViewWithTheKopitiam.DataSource = Nothing
            GridViewWithTheKopitiam.DataBind()
            statusLabel.Visible = True
        Else ' otherwise = there are really some rows of data in the result!
            ' Assume that each user id is unique, so if results available,
            ' should be exactly ONE row. Take the first row in the table.

            GridViewWithTheKopitiam.DataSource = dt2
            GridViewWithTheKopitiam.DataBind()
        End If

        findTheStalls.Parameters.Clear()
        findTheStalls.Parameters.AddWithValue("a", KopitiamId)

        ' Then run byCategoryCmd. The SqlDataAdapter will put the query results inside a DataSet with the label "byCat"
        Dim adapter3 As SqlDataAdapter = New SqlDataAdapter(findTheStalls)
        Dim ds3 As DataSet = New DataSet()
        adapter3.Fill(ds3, "byCat")

        ' Now the query results are inside a DataTable called "byCat" inside ds
        Dim dt3 As DataTable = ds3.Tables("byCat")

        ' Check whether dt has any rows inside it? If dt.Rows.Count = 0 that means 0 rows, i.e. no data found!
        If (dt3.Rows.Count = 0) Then
            StallGridView.DataSource = Nothing
            StallGridView.DataBind()
            statusLabel.Visible = True
        Else ' otherwise = there are really some rows of data in the result!
            ' Assume that each user id is unique, so if results available,
            ' should be exactly ONE row. Take the first row in the table.

            StallGridView.DataSource = dt3
            StallGridView.DataBind()
        End If

        conn.Close()

        Stalls.Visible = True
        SecondGreyBar.Visible = True
    End Sub

    Protected Sub BackButton_Click(sender As Object, e As EventArgs) Handles BackButton.Click
        Kopitiams.Visible = True
        FirstGreyBar.Visible = True

        Stalls.Visible = False
        SecondGreyBar.Visible = False
    End Sub

    Protected Sub StateDropDownList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles StateDropDownList.SelectedIndexChanged

        Dim StateNumber As Integer = StateDropDownList.SelectedIndex
        Dim FoodNumber As Integer = FoodDropDownList.SelectedIndex

        Dim openConn As Boolean = (conn.State = ConnectionState.Open)
        If (openConn = False) Then
            conn.Open()
        End If

        If StateNumber = 0 & FoodNumber = 0 Then
            'filter by state - no 
            'filter by food - no

            Me.BindGrid()

        ElseIf Not StateNumber = 0 & FoodNumber = 0 Then
            'filter by state - yes 
            'filter by food - no

            filterYesNo.Parameters.Clear()
            filterYesNo.Parameters.AddWithValue("a", StateNumber)

            ' Then run byCategoryCmd. The SqlDataAdapter will put the query results inside a DataSet with the label "byCat"
            Dim adapter4 As SqlDataAdapter = New SqlDataAdapter(filterYesNo)
            Dim ds4 As DataSet = New DataSet()
            adapter4.Fill(ds4, "byCat")

            ' Now the query results are inside a DataTable called "byCat" inside ds
            Dim dt4 As DataTable = ds4.Tables("byCat")

            ' Check whether dt has any rows inside it? If dt.Rows.Count = 0 that means 0 rows, i.e. no data found!
            If (dt4.Rows.Count = 0) Then
                mainGridView.DataSource = Nothing
                mainGridView.DataBind()
                statusLabel.Visible = True
            Else ' otherwise = there are really some rows of data in the result!
                ' Assume that each user id is unique, so if results available,
                ' should be exactly ONE row. Take the first row in the table.

                mainGridView.DataSource = dt4
                mainGridView.DataBind()
            End If

        ElseIf StateNumber = 0 & Not FoodNumber = 0 Then
            'filter by state - no 
            'filter by food - yes

            filterNoYes.Parameters.Clear()
            filterNoYes.Parameters.AddWithValue("b", FoodNumber)

            ' Then run byCategoryCmd. The SqlDataAdapter will put the query results inside a DataSet with the label "byCat"
            Dim adapter5 As SqlDataAdapter = New SqlDataAdapter(filterNoYes)
            Dim ds5 As DataSet = New DataSet()
            adapter5.Fill(ds5, "byCat")

            ' Now the query results are inside a DataTable called "byCat" inside ds
            Dim dt5 As DataTable = ds5.Tables("byCat")

            ' Check whether dt has any rows inside it? If dt.Rows.Count = 0 that means 0 rows, i.e. no data found!
            If (dt5.Rows.Count = 0) Then
                mainGridView.DataSource = Nothing
                mainGridView.DataBind()
                statusLabel.Visible = True
            Else ' otherwise = there are really some rows of data in the result!
                ' Assume that each user id is unique, so if results available,
                ' should be exactly ONE row. Take the first row in the table.

                mainGridView.DataSource = dt5
                mainGridView.DataBind()
            End If

        ElseIf Not StateNumber = 0 & Not FoodNumber = 0 Then
            'filter by state - yes 
            'filter by food - yes

            filterYesYes.Parameters.Clear()
            filterYesYes.Parameters.AddWithValue("a", StateNumber)
            filterYesYes.Parameters.AddWithValue("b", FoodNumber)

            ' Then run byCategoryCmd. The SqlDataAdapter will put the query results inside a DataSet with the label "byCat"
            Dim adapter6 As SqlDataAdapter = New SqlDataAdapter(filterNoYes)
            Dim ds6 As DataSet = New DataSet()
            adapter6.Fill(ds6, "byCat")

            ' Now the query results are inside a DataTable called "byCat" inside ds
            Dim dt6 As DataTable = ds6.Tables("byCat")

            ' Check whether dt has any rows inside it? If dt.Rows.Count = 0 that means 0 rows, i.e. no data found!
            If (dt6.Rows.Count = 0) Then
                mainGridView.DataSource = Nothing
                mainGridView.DataBind()
                statusLabel.Visible = True
            Else ' otherwise = there are really some rows of data in the result!
                ' Assume that each user id is unique, so if results available,
                ' should be exactly ONE row. Take the first row in the table.

                mainGridView.DataSource = dt6
                mainGridView.DataBind()
            End If

        End If



        conn.Close()

    End Sub

    Protected Sub FoodDropDownList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles FoodDropDownList.SelectedIndexChanged
        Dim StateNumber As Integer = StateDropDownList.SelectedIndex
        Dim FoodNumber As Integer = FoodDropDownList.SelectedIndex

        Dim openConn As Boolean = (conn.State = ConnectionState.Open)
        If (openConn = False) Then
            conn.Open()
        End If

        If StateNumber = 0 & FoodNumber = 0 Then
            'filter by state - no 
            'filter by food - no

            Me.BindGrid()

        ElseIf Not StateNumber = 0 & FoodNumber = 0 Then
            'filter by state - yes 
            'filter by food - no

            filterYesNo.Parameters.Clear()
            filterYesNo.Parameters.AddWithValue("a", StateNumber)

            ' Then run byCategoryCmd. The SqlDataAdapter will put the query results inside a DataSet with the label "byCat"
            Dim adapter4 As SqlDataAdapter = New SqlDataAdapter(filterYesNo)
            Dim ds4 As DataSet = New DataSet()
            adapter4.Fill(ds4, "byCat")

            ' Now the query results are inside a DataTable called "byCat" inside ds
            Dim dt4 As DataTable = ds4.Tables("byCat")

            ' Check whether dt has any rows inside it? If dt.Rows.Count = 0 that means 0 rows, i.e. no data found!
            If (dt4.Rows.Count = 0) Then
                mainGridView.DataSource = Nothing
                mainGridView.DataBind()
                statusLabel.Visible = True
            Else ' otherwise = there are really some rows of data in the result!
                ' Assume that each user id is unique, so if results available,
                ' should be exactly ONE row. Take the first row in the table.

                mainGridView.DataSource = dt4
                mainGridView.DataBind()
            End If

        ElseIf StateNumber = 0 & Not FoodNumber = 0 Then
            'filter by state - no 
            'filter by food - yes

            filterNoYes.Parameters.Clear()
            filterNoYes.Parameters.AddWithValue("b", FoodNumber)

            ' Then run byCategoryCmd. The SqlDataAdapter will put the query results inside a DataSet with the label "byCat"
            Dim adapter5 As SqlDataAdapter = New SqlDataAdapter(filterNoYes)
            Dim ds5 As DataSet = New DataSet()
            adapter5.Fill(ds5, "byCat")

            ' Now the query results are inside a DataTable called "byCat" inside ds
            Dim dt5 As DataTable = ds5.Tables("byCat")

            ' Check whether dt has any rows inside it? If dt.Rows.Count = 0 that means 0 rows, i.e. no data found!
            If (dt5.Rows.Count = 0) Then
                mainGridView.DataSource = Nothing
                mainGridView.DataBind()
                statusLabel.Visible = True
            Else ' otherwise = there are really some rows of data in the result!
                ' Assume that each user id is unique, so if results available,
                ' should be exactly ONE row. Take the first row in the table.

                mainGridView.DataSource = dt5
                mainGridView.DataBind()
            End If

        ElseIf Not StateNumber = 0 & Not FoodNumber = 0 Then
            'filter by state - yes 
            'filter by food - yes

            filterYesYes.Parameters.Clear()
            filterYesYes.Parameters.AddWithValue("a", StateNumber)
            filterYesYes.Parameters.AddWithValue("b", FoodNumber)

            ' Then run byCategoryCmd. The SqlDataAdapter will put the query results inside a DataSet with the label "byCat"
            Dim adapter6 As SqlDataAdapter = New SqlDataAdapter(filterNoYes)
            Dim ds6 As DataSet = New DataSet()
            adapter6.Fill(ds6, "byCat")

            ' Now the query results are inside a DataTable called "byCat" inside ds
            Dim dt6 As DataTable = ds6.Tables("byCat")

            ' Check whether dt has any rows inside it? If dt.Rows.Count = 0 that means 0 rows, i.e. no data found!
            If (dt6.Rows.Count = 0) Then
                mainGridView.DataSource = Nothing
                mainGridView.DataBind()
                statusLabel.Visible = True
            Else ' otherwise = there are really some rows of data in the result!
                ' Assume that each user id is unique, so if results available,
                ' should be exactly ONE row. Take the first row in the table.

                mainGridView.DataSource = dt6
                mainGridView.DataBind()
            End If

        End If



        conn.Close()
    End Sub
End Class