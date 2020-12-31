Imports System.Data.SqlClient

Public Class Home
    Inherits System.Web.UI.Page

    'The connection to the database'
    Dim conn As SqlConnection

    'The command to populate the gridview with initially before any user specific filtering. 
    Dim findKopitiamDetails As SqlCommand



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

            Response.Redirect(String.Format("Kopitiam.aspx?KopitiamId={0}", KopitiamId))

        End If

        If e.CommandName = "Maps" Then
            Dim Name As String = mainGridView.Rows(Index).Cells(1).Text
            Dim Address As String = mainGridView.Rows(Index).Cells(3).Text
            Dim URL As String = "https://maps.google.com/maps?q="
            Response.Redirect(URL + Name + " " + Address)
        End If
    End Sub

    Protected Sub AboutButton_Click(sender As Object, e As EventArgs) Handles AboutButton.Click
        'user click on suggest button.
        'redirect user to suggestion page.
        Response.Redirect("About.aspx")
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
            statusLabel.Visible = False
        End If
        conn.Close()
    End Sub

    Protected Sub StateDropDownList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles StateDropDownList.SelectedIndexChanged
        ApplyFilter()

    End Sub

    Protected Sub FoodDropDownList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles FoodDropDownList.SelectedIndexChanged
        ApplyFilter()

    End Sub

    Public Sub ApplyFilter()
        Dim StateNumber As Integer = StateDropDownList.SelectedIndex
        Dim FoodNumber As Integer = FoodDropDownList.SelectedIndex

        Dim openConn As Boolean = (conn.State = ConnectionState.Open)
        If (openConn = False) Then
            conn.Open()
        End If

        If StateNumber = 0 And FoodNumber = 0 Then
            'filter by state - no 
            'filter by food - no

            Me.BindGrid()

        ElseIf Not StateNumber = 0 And FoodNumber = 0 Then
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
                statusLabel.Visible = False
            End If

        ElseIf StateNumber = 0 And Not FoodNumber = 0 Then
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
                statusLabel.Visible = False
            End If

        ElseIf Not StateNumber = 0 And Not FoodNumber = 0 Then
            'filter by state - yes 
            'filter by food - yes

            filterYesYes.Parameters.Clear()
            filterYesYes.Parameters.AddWithValue("a", StateNumber)
            filterYesYes.Parameters.AddWithValue("b", FoodNumber)

            ' Then run byCategoryCmd. The SqlDataAdapter will put the query results inside a DataSet with the label "byCat"
            Dim adapter6 As SqlDataAdapter = New SqlDataAdapter(filterYesYes)
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
                statusLabel.Visible = False
            End If

        End If



        conn.Close()
    End Sub

End Class