<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="StartThread2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.StartThread2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="SucceedPanel" runat="server" Visible="false" CssClass="AssignmentSuccess">
            <asp:Label ID="SucceedLabel" runat="server" Text="" />
        </asp:Panel>
        <asp:FormView ID="CreateLectureForm" runat="server"
            ItemType="LectureComments.Model.Thread"
            InsertMethod="AddToThreadForm_InsertItem"
            DefaultMode="Insert"
            RenderOuterTable="false">
            <InsertItemTemplate>
                <h3>Ställ en fråga!</h3>
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
        <a href="#" id="CloseLink2">Tillbaka till föreläsning</a>
    </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
    <script type="text/javascript">
        setTimeout(function () {
            var statusMessageDiv = document.getElementById("SucceedPanel");
            var cancelQuestion = document.getElementById("CloseLink2");
            cancelQuestion.onclick = function () {
                close();
            }
        }, 1000);
    </script>
</asp:Content>
