<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddComment.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.AddComment" %>

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
        <asp:FormView ID="CreateLectureForm" runat="server"
            ItemType="LectureComments.Model.Comment"
            InsertMethod="AddCommentForm_InsertItem"
            DefaultMode="Insert"
            RenderOuterTable="false">
            <InsertItemTemplate>
                <div>
                    <label>Svara på tråd!</label>
                </div>
                <div>
                    <asp:TextBox ID="QuestionTextTB" runat="server" Text='<%# BindItem.DiscText %>' />
                </div>
                 <div>
                    <label>Ditt namn</label>
                </div>
                <div>
                    <asp:TextBox ID="AuthorNameTB" runat="server" Text='<%# BindItem.Author %>' />
                </div>
                <div>
                    <asp:LinkButton runat="server" Text="Skicka kommentar!" CommandName="Insert" />
                </div>
            </InsertItemTemplate>
        </asp:FormView>
        <a href="#" id="CloseLink2">Tillbaka till föreläsning</a>
    </div>
    </form>
    <script type="text/javascript">
        setTimeout(function () {
            var statusMessageDiv = document.getElementById("SucceedPanel");
            var cancelQuestion = document.getElementById("CloseLink2");

            cancelQuestion.onclick = function () {
                close();
            }

            closeMessageLink.onclick = function () {
                close();
            }
        }, 1000);
    </script>
</body>
</html>

