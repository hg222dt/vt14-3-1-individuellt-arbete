<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="DeleteComment2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.DeleteComment2" %>

<%-- Placeholder för masterpage--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <form id="form1" runat="server">

    <%-- Kapslar in titel --%>
    <div class="title">
        <h3 class="titleText">Radera kommentar</h3>
    </div>
    <div class="centerDiv">

        <%-- Meddelande för status om kommentar tagits bort--%>
        <asp:Panel ID="SucceedPanel" runat="server" Visible="false" CssClass="AssignmentSuccess">
            <asp:Label ID="SucceedLabel" runat="server" Text="" />
        </asp:Panel>

        <%-- Kapslar in länk för att bekräfta borttagning av kommentar --%>
        <asp:Panel ID="DeleteFormPanel" runat="server">
            <h3>Vill du verkligen ta bort komentaren?</h3>
            <asp:LinkButton runat="server" ID="DeleteLink" Text="Radera kommentaren" OnCommand="DeleteLink_Command" CommandArgument='<%$ RouteValue:id %>' />
            <%-- Går tillbaka till föreläsningssidan --%>
            <asp:HyperLink runat="server" ID="CancelLink" Text="Avbryt" />
        </asp:Panel>

        <%-- Länk för att stänga fönster --%>
        
    </div>
    </form>
</asp:Content>

<%-- placeholder med skript, för mastepage--%>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">

    <%-- Funktionalitet åt länkt för att stänga fönster. --%>
    <script type="text/javascript">
        setTimeout(function () {
            var statusMessageDiv = document.getElementById("MainContentPlaceHolder_SucceedPanel");
            var cancelQuestion = document.getElementById("CloseLink2");

            cancelQuestion.onclick = function () {
                close();
            }
        }, 1000);
    </script>
</asp:Content>
