<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LectureDetails.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.LectureDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    <asp:Panel ID="UpdateSucceedPanel" runat="server" Visible="false" CssClass="AssignmentSuccess">
        <asp:Label ID="UpdateSucceedLabel" runat="server" Text="" />
        <a href="#" id="CloseLink">Stäng meddelande</a>
    </asp:Panel>
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
                <div>
                    <asp:HyperLink runat="server" Text="Uppdatera" NavigateUrl='<%# GetRouteUrl("EditLecture", new { id = Item.LectureId }) %>' />
                    <asp:HyperLink runat="server" Text="Radera föreläsning" NavigateUrl='<%# GetRouteUrl("DeleteLecture", new { id = Item.LectureId }) %>' />
                    <asp:HyperLink runat="server" Text="Tillbaka till överblick" NavigateUrl='<%# GetRouteUrl("LectureListing", null)%>' />
                    
                    <asp:HyperLink ID="CommentLink" runat="server" NavigateUrl='<%# GetRouteUrl("AddToThread", new{ id = Item.LectureId})  %>' Text="Ställ en fråga" />
                </div>
                <div class="video-field">
                    <asp:Literal ID="Literal1" runat="server" Text="<%#: Item.VideoUrl %>" />
                </div>
            </ItemTemplate>
        </asp:FormView>

        <asp:FormView ID="FormView1" runat="server">



        </asp:FormView>


    </div>
    </form>
    <script type="text/javascript">
        setTimeout(function () {
            var closeMessageLink = document.getElementById("CloseLink");
            var statusMessageDiv = document.getElementById("UpdateSucceedPanel");
            closeMessageLink.onclick = function () {
                statusMessageDiv.parentElement.removeChild(statusMessageDiv);
            }
        }, 1000);
    </script>
</body>
</html>