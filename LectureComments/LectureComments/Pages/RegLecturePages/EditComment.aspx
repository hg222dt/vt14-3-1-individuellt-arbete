<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditComment.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.EditComment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
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
    </div>
    </form>
</body>
</html>