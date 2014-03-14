<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddToThread.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.AddToThread" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>Ställ en fråga!</h3>
        <asp:FormView ID="CreateLectureForm" runat="server"
            ItemType="LectureComments.Model.Thread"
            InsertMethod="AddToThreadForm_InsertItem"
            DefaultMode="Insert"
            RenderOuterTable="false">
            <InsertItemTemplate>
                <div>
                    <label>Fråga</label>
                </div>
                <div>
                    <asp:TextBox ID="QuestionTextTB" runat="server" Text='<%# BindItem.QuestionText %>' />
                </div>
                <div>
                    <label>Tidpunkt i video</label>
                </div>
                <div>
                    <asp:TextBox ID="TimeCodeTB" runat="server" Text='<%# BindItem.Timecode %>' />
                </div>
                <div>
                    <label>Ditt namn</label>
                </div>
                <div>
                    <asp:TextBox ID="AuthorTB" runat="server" Text='<%# BindItem.Author %>' />
                </div>
                <div>
                    <asp:LinkButton runat="server" Text="Skicka fråga!" CommandName="Insert" />
                </div>
            </InsertItemTemplate>
        </asp:FormView>
    </div>
    </form>
</body>
</html>
