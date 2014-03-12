<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LectureDetails.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.LectureDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>Föreläsningsinfo</h3>
    
        <asp:FormView ID="LectureFormView" runat="server"
            ItemType="LectureComments.Model.Lecture"
            SelectMethod="LectureFormView_GetItem"
            RenderOuterTable="false">
            <ItemTemplate>
                <div class="edit-label">
                    <label for="Name">Namn på föreläsning</label>
                </div>
                <div class="edit-field">
                    <%#: Item.LectureName %>
                </div>
                <div class="edit-label">
                    <label for="Name">Namn på kurs</label>
                </div>
                <div class="edit-field">
                    <%#: Item.CourseName %>
                </div>
                <div class="edit-label">
                    <label for="Date">Datum</label>
                </div>
                <div class="edit-field">
                    <%#: Item.LectureDate %>
                </div>
                <div class="edit-label">
                    <label for="Name">Lärare</label>
                </div>
                <div class="edit-field">
                    <%#: Item.TeacherName %>
                </div>
            </ItemTemplate>
        </asp:FormView>
    </div>
    </form>
</body>
</html>
