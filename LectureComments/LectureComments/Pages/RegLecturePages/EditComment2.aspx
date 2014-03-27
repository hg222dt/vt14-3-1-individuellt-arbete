<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="EditComment2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.EditComment2" %>

<%-- Placeholder till masterpage--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
    
    <%-- Kapslar in  titel och beskrivning av sidan--%>    
    <div class="title">
        <h3 class="titleText">Uppdatera kommentar</h3>
        <div class="subText">
            <p>
                Uppdatera din fråga här. OBSERVEREA att när du skickat din fråga och kommit tillbaka till föreläsningen, måste du uppdatera sidan för att frågan ska dyka upp.
            </p>
        </div>
    </div>

    <%-- In oh ut-matning av data till berörd kommentar.--%>
    <div class="centerDiv">

        <%-- Skriver ut status-meddelande--%>
        <asp:Panel ID="SucceedPanel" runat="server" Visible="false" CssClass="AssignmentSuccess">
            <asp:Label ID="SucceedLabel" runat="server" Text="" />
        </asp:Panel>

        <%-- Summerar resultatet av valideringarna --%>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        
        <%-- Skriver ut data för angiven kommentar, samt gör input möjlighet för uppdatering av data--%>
        <asp:FormView ID="UpdateLectureForm" runat="server"
                ItemType="LectureComments.Model.Comment"
                DataKeyNames="DiscRowID"
                UpdateMethod="UpdateCommentForm_UpdateItem"
                SelectMethod="CommentFormView_GetItem"
                DefaultMode="Edit"
                RenderOuterTable="false">
            <EditItemTemplate>
                <div>
                    <label>Kommentarstext</label>
                </div>
                <div>
                    <%-- KOmmentarstext --%>
                    <asp:TextBox ID="DiscTextTB" runat="server" Text='<%# BindItem.DiscText %>' MaxLength="300" TextMode="MultiLine" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                                                runat="server" 
                                                ErrorMessage="Du måste skriva en kommentar." 
                                                ControlToValidate="DiscTextTB" Display="None"/>
                </div>
                <div>
                    <%-- Knapp för att skicka data man vill uppdatera med--%>
                    <asp:Button ID="SaveButton" runat="server" Text="Uppdatera" CommandName="Update" />
                    
                    <%--<asp:HyperLink ID="BackLink" runat="server" class="sendQuestLink" NavigateUrl='<%# GetRouteUrl("DetailsLecture", new{ id = Item.LectureID})  %>' Text="Tillbaka till föreläsningen" />--%>
                </div>
            </EditItemTemplate>
        </asp:FormView>

        <asp:HyperLink runat="server" ID="CancelLink" Text="Avbryt" />
    </div>
    </form>
</asp:Content>

<%-- Script-placeholer för masterpage--%>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
    <%-- Script som gör att meddelande tas bort när stäng-knapp trycks.--%>
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
