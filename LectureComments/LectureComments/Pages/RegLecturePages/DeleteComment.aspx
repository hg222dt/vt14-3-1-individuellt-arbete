<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteComment.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.DeleteComment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="SucceedPanel" runat="server" Visible="false" CssClass="AssignmentSuccess">
            <asp:Label ID="SucceedLabel" runat="server" Text="" />
        </asp:Panel>
        <asp:Panel ID="DeleteFormPanel" runat="server">
            <h3>Vill du verkligen ta bort komentaren?</h3>
            <asp:LinkButton runat="server" ID="DeleteLink" Text="Radera kommentaren" OnCommand="DeleteLink_Command" CommandArgument='<%$ RouteValue:id %>' />
        </asp:Panel>
        
    </div>
        <a href="#" id="CloseLink2">Tillbaka till föreläsning</a>
    </form>
    <script type="text/javascript">
        setTimeout(function () {
            var statusMessageDiv = document.getElementById("SucceedPanel");
            var cancelQuestion = document.getElementById("CloseLink2");

            cancelQuestion.onclick = function () {
                close();
            }
        }, 1000);
    </script>
</body>
</html>
