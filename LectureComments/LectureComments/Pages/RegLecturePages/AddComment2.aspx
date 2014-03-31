<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="AddComment2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.AddComment2" %>

<%-- Placeholder för masterpage --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <form id="form1" runat="server">

        <%-- Kapslar in titel och beskrivning av sida--%>
        <div class="title">
            <h3 class="titleText">Svara på fråga</h3>
            <div class="subText">
                <p>
                    Här kan du svara på en tråd.
                </p>
            </div>
        </div>
        
        <%-- Statusmeddelande --%>
        <div class="centerDiv">
            <asp:Panel ID="SucceedPanel" runat="server" Visible="false" CssClass="AssignmentSuccess">
                <asp:Label ID="SucceedLabel" runat="server" Text="" />
            </asp:Panel>

            <%-- Valideringssummering --%>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        
            <%-- Inmatningsfält för all behövlig data till kommentar. --%>
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
                        <%-- Inmatning kommentarstext --%>
                        <asp:TextBox ID="QuestionTextTB" runat="server" Text='<%# BindItem.DiscText %>' MaxLength="300" TextMode="MultiLine" />
                    
                        <%-- Validering--%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                                                    runat="server" 
                                                    ErrorMessage="Du måste skriva en kommentar." 
                                                    ControlToValidate="QuestionTextTB" Display="None"/>
                    </div>
                     <div>
                        <label>Ditt namn</label>
                    </div>
                    <div>
                        <%-- Inmatning namn avsändare --%>
                        <asp:TextBox ID="AuthorNameTB" runat="server" Text='<%# BindItem.Author %>' MaxLength="40" />
                    
                        <%-- Validering --%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                                                    runat="server" 
                                                    ErrorMessage="Ange ditt namn" 
                                                    ControlToValidate="AuthorNameTB" Display="None" />
                    </div>
                    <div>
                        <%-- Länk - skicka kommentar--%>
                        <asp:LinkButton runat="server" Text="Skicka kommentar!" CommandName="Insert" />
                    </div>
                </InsertItemTemplate>
            </asp:FormView>
        
            <%-- Länk, tillbaka till föreläsning--%>
            <asp:HyperLink runat="server" ID="CancelLink" Text="Avbryt" />
        </div>
    </form>
</asp:Content>

<%-- Placeholder med skript för masterpage --%>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">

    <%-- Funktionalitet åt knapp att stänga fönster--%>
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
