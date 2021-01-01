Imports System.Data.SqlClient

Public Class Kopitiam
    Inherits System.Web.UI.Page

    'The connection to the database'
    Dim conn As SqlConnection

    'The command to find information of one kopitiam based on id
    Dim findTheKopitiam As SqlCommand

    'The command to find the stalls
    Dim findTheStalls As SqlCommand

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim KopitiamId As String = Request.QueryString("KopitiamId")
        KopitiamIdLabel.Text = KopitiamId

        'When the form loads, first open the connection to the database
        Dim connStr As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|KMS_DB.mdf;Integrated Security=True"
        conn = New SqlConnection(connStr)
        conn.Open()

        'Set up the SqlCommand to retrieve information about a koptiiam 
        Dim byTheKopiSql As String = "SELECT Kopitiam.Id, Status, Kopitiam.Name, State.Name as StateName, Address, OpHourSt, OpHourEn, OpDayOfWeek,Halal FROM Kopitiam JOIN State ON Kopitiam.StateId = State.Id WHERE Kopitiam.Id = @a"
        findTheKopitiam = New SqlCommand(byTheKopiSql, conn)

        'Set up the SqlCommand to retrieve stalls 
        Dim byStallsSql As String = "SELECT Stall.Id, Stall.Name as StallName, OpHourSt, OpHourEn, OpDayOfWeek, Food.Name as FoodName, Halal, Status FROM Stall JOIN Food ON Stall.FoodId = Food.Id WHERE kId = @a "
        findTheStalls = New SqlCommand(byStallsSql, conn)

        If Not IsPostBack Then
            Me.BindGrid()
        End If
    End Sub

    Public Sub BindGrid()

        Dim openConn As Boolean = (conn.State = ConnectionState.Open)
        If (openConn = False) Then
            conn.Open()
        End If

        findTheKopitiam.Parameters.Clear()
        findTheKopitiam.Parameters.AddWithValue("a", KopitiamIdLabel.Text)

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


        Else ' otherwise = there are really some rows of data in the result!
            ' Assume that each user id is unique, so if results available,
            ' should be exactly ONE row. Take the first row in the table.

            GridViewWithTheKopitiam.DataSource = dt2
            GridViewWithTheKopitiam.DataBind()
        End If

        findTheStalls.Parameters.Clear()
        findTheStalls.Parameters.AddWithValue("a", KopitiamIdLabel.Text)

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
            Label1.Visible = True
        Else ' otherwise = there are really some rows of data in the result!
            ' Assume that each user id is unique, so if results available,
            ' should be exactly ONE row. Take the first row in the table.

            StallGridView.DataSource = dt3
            StallGridView.DataBind()
            Label1.Visible = False
        End If

        conn.Close()

    End Sub

    Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        StallGridView.PageIndex = e.NewPageIndex
        Me.BindGrid()
    End Sub

    Protected Sub GridViewWithTheKopitiam_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        Dim Index As Integer
        Try
            Index = Convert.ToInt32(e.CommandArgument)
        Catch exp As Exception
            System.Diagnostics.Debug.WriteLine(exp.StackTrace)
        End Try
        If e.CommandName = "Maps" Then
            Dim Name As String = GridViewWithTheKopitiam.Rows(Index).Cells(1).Text
            Dim Address As String = GridViewWithTheKopitiam.Rows(Index).Cells(3).Text
            Dim URL As String = "https://maps.google.com/maps?q="
            Response.Redirect(URL + Name + " " + Address)
        End If
    End Sub

    Protected Sub BackButton_Click(sender As Object, e As EventArgs) Handles BackButton.Click
        Response.Redirect("Home.aspx")
    End Sub

    Protected Sub SuggestButton_Click(sender As Object, e As EventArgs) Handles SuggestButton.Click
        Response.Redirect("About.aspx")
    End Sub
End Class