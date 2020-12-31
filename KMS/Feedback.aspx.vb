Imports System.Data.SqlClient
Imports System.Drawing

Public Class Feedback
    Inherits System.Web.UI.Page

    'The connection to the database
    Dim conn As SqlConnection

    'Command to insert new general suggestion 
    Dim InsertFeedback As SqlCommand
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'When the form loads, first open the connection to the database
        Dim connStr As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|KMS_DB.mdf;Integrated Security=True"
        conn = New SqlConnection(connStr)


        'Set up the SqlCommand to add general suggestion table
        Dim addGenSql As String = "INSERT INTO GeneralSuggestion(Comment, Date, Status) VALUES (@c, @t, @s)"
        InsertFeedback = New SqlCommand(addGenSql, conn)
    End Sub

    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs) Handles SubmitButton.Click
        conn.Open()

        'set the parameter values in addBookCmd
        InsertFeedback.Parameters.Clear()
        InsertFeedback.Parameters.AddWithValue("c", MainTextBox.Text)
        InsertFeedback.Parameters.AddWithValue("t", Format(Now, "dd-MM-yyyy"))
        InsertFeedback.Parameters.AddWithValue("s", "Unread")

        'Execute the command
        Dim rowsAffected As Integer = InsertFeedback.ExecuteNonQuery()

        Try
            'If more than zero rows affeced , insertion was succesful !
            If rowsAffected > 0 Then
                ErrorMessageLabel.ForeColor = Color.Green
                ErrorMessageLabel.Text = "Sucess! Feedback has been suggested."
                MainTextBox.Text = ""
            End If
        Catch exError As Exception
            ErrorMessageLabel.ForeColor = Color.Red
            ErrorMessageLabel.Text = "There was a problem with submitting your feedback. Please try again later."
        End Try

        conn.Close()
    End Sub

    Protected Sub BackButton_Click(sender As Object, e As EventArgs) Handles BackButton.Click
        Response.Redirect("Home.aspx")
    End Sub
End Class