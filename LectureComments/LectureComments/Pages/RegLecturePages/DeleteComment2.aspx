<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="DeleteComment2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.DeleteComment2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
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
