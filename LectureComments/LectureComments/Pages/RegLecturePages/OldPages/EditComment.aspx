﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditComment.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.EditComment" %>

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
        <asp:FormView ID="UpdateLectureForm" runat="server"
                ItemType="LectureComments.Model.Comment"
                DataKeyNames="DiscRowID"
                UpdateMethod="UpdateCommentForm_UpdateItem"
                SelectMethod="CommentFormView_GetItem"
                DefaultMode="Edit"
                RenderOuterTable="false">
            <EditItemTemplate>
                <div>
                    <label>Uppdatera kommentar</label>
                </div>
                <div>
                    <asp:TextBox ID="DiscTextTB" runat="server" Text='<%# BindItem.DiscText %>' />
                </div>
                <div>
                    <asp:Button ID="SaveButton" runat="server" Text="Uppdatera" CommandName="Update" />
                </div>
            </EditItemTemplate>
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
        }, 1000);
    </script>
</body>
</html>