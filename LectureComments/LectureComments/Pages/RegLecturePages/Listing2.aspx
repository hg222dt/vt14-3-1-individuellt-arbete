<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="Listing2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.Listing2" %>

<%-- PlaceHolder till appens Mastepage --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    
    <%-- Sidans förmulär --%>
    <form id="form1" runat="server">

        <%-- Tagg för att kapsla in sidans btitel och beskrivning --%>
        <div class="title">
            <h3 class="titleText">Föreläsningsrespons.se</h3>
            <div class="subText">
                Välkommen till Föreläsningsrespons. Här kan du i föreläsningsvideor ställa frågor 
                till läraren på videoklippens tidslinje och få svar.
            </div>
        </div>

        <%-- Panel som visar ett meddelande efter lyckad uppdatering, radering eller tilläggning av föreläsning --%>
        <asp:Panel ID="SucceedPanel" runat="server" Visible="false" Class="AssignmentSuccess">
            <asp:Label ID="SucceedLabel" runat="server" Text="" />
            <a href="#" id="CloseLink">Stäng meddelande</a>
        </asp:Panel>

        <%-- Panel som visar en lista med alla registrerade föreläsningar --%>
        <div class="centerDiv" id="lectureList">
            <div id="showLecturesDiv">
                <h3><strong>Föreläsningar</strong></h3>
                <br />
                <%-- Länk: LÄgga till ny föreläsning --%>
                <asp:HyperLink ID="CreateLectureLink" runat="server"  Text="Lägg till föreläsning" NavigateUrl="<%$ RouteUrl:routename=CreateLecture %>"/>
                
                <%-- ListView för uppräkning av föreläsnignar --%>
                <asp:ListView ID="LectureListView" runat="server"
                    ItemType="LectureComments.Model.Lecture"
                    SelectMethod="LectureListView_GetData"
                    DataKeyNames="LectureID">
                    <LayoutTemplate>
                        <table>
                            <tr>
                                <th>
                                    Föreläsningsnamn
                                </th>
                                <th>
                                    Datum
                                </th>
                            </tr>

                            <%-- Platshållare för nya rader --%>
                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:HyperLink ID="LectureNameLink" runat="server" NavigateUrl='<%# GetRouteUrl("DetailsLecture", new{ id = Item.LectureId})  %>' Text='<%# Item.LectureName %>' />
                            </td>
                            <td>    
                                <asp:Label ID="LectureDateLabel" runat="server" Text='<%# Item.LectureDate.ToShortDateString() %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <table>
                            <tr>
                                <td>
                                    <%-- Visas om kontaktuppgifter inte existerar i databasen --%>
                                    Inga föreläsningar hittades i databasen.
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </div>
    </form>
</asp:Content>

<%-- Placeholer för script, till appens Masterpage --%>
<asp:Content ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">

    <%-- Script som raderar felmeddelande när stäng-knapp trycks ner.--%>
    <script type="text/javascript">
        setTimeout(function () {
            var closeMessageLink = document.getElementById("CloseLink");
            var statusMessageDiv = document.getElementById("MainContentPlaceHolder_SucceedPanel");
            closeMessageLink.onclick = function () {
                statusMessageDiv.parentElement.removeChild(statusMessageDiv);
            }
        }, 2000);
    </script>
</asp:Content>
