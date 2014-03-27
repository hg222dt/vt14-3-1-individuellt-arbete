<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="StartThread2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.StartThread2" %>

<%-- PlaceHolder till masterpage --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
    
        <%-- Titel och beskrivning av sidan --%>
        <div class="title">
            <h3 class="titleText">Ställ en fråga!</h3>
            <div class="subText">
                <p>
                    Skriv din fråga här, samt specificera i fältet Tidkod vid vilken tidpunkt i videoklippet du syftar på. 
                    Då blir det lättare för läraren att svara på din fråga! OBSERVEREA att när du skickat din fråga och kommit tillbaka till föreläsningen, måste du uppdatera sidan för att frågan ska dyka upp.
                </p>
            </div>
        </div>

        <%-- Kapsla in inmatningsfält, valideringar och validation summary--%>
        <div class="centerDiv">

            <%-- Panel som viar meddelanden --%>
            <asp:Panel ID="SucceedPanel" runat="server" Visible="false" CssClass="AssignmentSuccess">
                <asp:Label ID="SucceedLabel" runat="server" Text="" />
            </asp:Panel>
        
            <%-- Summeringa v valideringar --%>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Display="dynamic" />
        
            <%-- Inmatningsfält --%>
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
                        <%-- Fråga --%>
                        <asp:TextBox ID="QuestionTextTB" TextMode="MultiLine" runat="server" Text='<%# BindItem.QuestionText %>' MaxLength="300"/>
                        <%-- Validering --%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                                                    runat="server" 
                                                    ErrorMessage="Du måste skriva en fråga." 
                                                    ControlToValidate="QuestionTextTB" Display="None"/>
                    </div>
                    <div>
                        <label>Tidpunkt i video</label>
                    </div>
                    <div>
                        <%-- Tidskod --%>
                        <asp:TextBox ID="TimeCodeTB" runat="server" Text='<%# BindItem.Timecode %>' />

                        <%-- Valideringar--%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ErrorMessage="Ange en tidpunkt i videon [HH:mm:ss] " 
                                                    ControlToValidate="TimeCodeTB" Display="None" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                        ErrorMessage="Ange en tidkod i rätt format. [HH:mm:ss]" 
                                                        ControlToValidate="TimeCodeTB" Display="None" 
                                                        ValidationExpression="^(?:(?:([01]?\d|2[0-3]):)?([0-5]?\d):)?([0-5]?\d)$"/>
                    </div>
                    <div>
                        <label>Ditt namn</label>
                    </div>
                    <div>
                        <%-- Namn --%>
                        <asp:TextBox ID="AuthorTB" runat="server" Text='<%# BindItem.Author %>' MaxLength="40" />
                        <%-- Validering --%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                                                    runat="server" 
                                                    ErrorMessage="Ange ditt namn" 
                                                    ControlToValidate="AuthorTB" Display="None" />
                    </div>

                    <%-- Knapp för att skicka fråga--%>
                    <div>
                        <asp:LinkButton runat="server" Text="Skicka fråga!" CommandName="Insert" />                        
                    </div>
                </InsertItemTemplate>
            </asp:FormView>

            <%-- Går tillbaka till föreläsningssidan --%>
            <asp:HyperLink runat="server" ID="CancelLink" Text="Avbryt" />

        </div>
    </form>
</asp:Content>

<%-- placeholder till masterpage --%>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">

    <%-- Script för att stänga fönster --%>
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
