<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="LectureDetails2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.LectureDetails2" %>


<%-- PlaceHolder till masterpage--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    
    <form id="form1" runat="server">

    <div>
        <%-- Kapslar in titel och beskrivning av sidan --%>
        <div class="title">
            <h3 class="titleText">Föreläsningsrum</h3>
            <div class="subText">
                <p>
                    Här inne finner du information om din föreläsning, och du kan även kolla på föreläsningen i videon nedan.
                    Under video-klippet hittar du alla frågor som ställts, och ja: Du kan själv ställa, uppdatera och radera frågor till föresläningen.
                </p>
            </div>
        </div>

        <%-- Meddelanden skrivs ut efter uppgifter som användaren gör --%>
        <asp:Panel ID="UpdateSucceedPanel" runat="server" Visible="false" CssClass="AssignmentSuccess">
            <asp:Label ID="UpdateSucceedLabel" runat="server" Text="" />
            <a href="#" id="CloseLink">Stäng meddelande</a>
        </asp:Panel>

        <%-- Skriver ut data till angiven föreläsning --%>
        <asp:FormView ID="LectureFormView" runat="server"
            ItemType="LectureComments.Model.Lecture"
            SelectMethod="LectureFormView_GetItem"
            RenderOuterTable="false">
            <ItemTemplate>
                <div class="centerDiv" id="detailsSection">
                    <h3>Föreläsningsinfo</h3>
                    <div>
                        <label for="Name">Namn på föreläsning</label>
                    </div>
                    <div>
                        <%-- Namn på föreläsning--%>
                        <strong>
                            <%#: Item.LectureName %>
                        </strong>
                    </div>
                    <div>
                        <label for="Name">Namn på kurs</label>
                    </div>
                    <div>
                        <%-- Kursnamn --%>
                        <strong>
                            <%#: Item.CourseName %>
                        </strong>
                    </div>
                    <div>
                        <label for="Date">Datum</label>
                    </div>
                    <div>
                        <%-- Datum --%>
                        <strong>
                            <%# Item.LectureDate.ToShortDateString() %>
                        </strong>
                    </div>
                    <div>
                        <label for="Name">Lärare</label>
                    </div>
                    <div>
                        <%-- Lärare --%>
                        <strong>
                            <%#: Item.TeacherName %>
                        </strong>
                    </div>
                    <div>
                        <label for="Name">Video-Url</label>
                    </div>
                    <div>
                        <%-- Video-Url--%>
                        <strong>
                            <%#: Item.VideoUrl %>
                        </strong>
                    </div>

                    <%-- länkar för att uppdater eller radera föreläsningar, samt för att återgå till tildigiare sida --%>
                    <div>
                        <div>
                            <asp:HyperLink runat="server" Text="Uppdatera info" NavigateUrl='<%# GetRouteUrl("EditLecture", new { id = Item.LectureId }) %>' />
                        </div>
                        <div>
                            <asp:HyperLink runat="server" Text="Radera föreläsning" NavigateUrl='<%# GetRouteUrl("DeleteLecture", new { id = Item.LectureId }) %>' />
                        </div>
                        <div>
                            <asp:HyperLink runat="server" Text="Tillbaka till överblick" NavigateUrl='<%# GetRouteUrl("LectureListing", null)%>' />    
                        </div>
                    </div>
                </div>

                <%-- Här visas inbäddad video av föreläsningen --%>
                <div class="centerDiv" id="videoSection">
                    <div class="video-field">
                        <iframe width="460" height="330" src='<%#: Item.VideoUrl %>' frameborder="0" allowfullscreen></iframe>
                    </div>
                    
                    <%-- Länk för att ställa en fråga till videon --%>
                    <strong>
                        <asp:HyperLink ID="CommentLink" runat="server" class="sendQuestLink" NavigateUrl='<%# GetRouteUrl("AddToThread", new{ id = Item.LectureId})  %>' Text="Ställ en fråga" />
                    </strong>
                </div>
            </ItemTemplate>
        </asp:FormView>
        
        <%-- kommentars-sektion --%>
        <div class="centerDiv" id="commentsSection">

            <p id="questionLabel"><strong>Frågor på föreläsningens tidslinje</strong></p>


        <%-- Hämtar och listar alla trådar i angiven lektion--%>
        <asp:ListView ID="ThreadsInLectureLV" runat="server"
            ItemType="LectureComments.Model.ThreadOnly"
            SelectMethod="ThreadsInLectureListView_GetData"
            DataKeyNames="ThreadID">
            <LayoutTemplate>
                
                  <%-- Platshållare för nya rader --%>
                <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>

            </LayoutTemplate>
            <ItemTemplate>

                <div class="threadDiv">
                    <span class="timecodeSpan">Tid i video: <strong><%#: Item.Timecode %></strong></span>

                <%-- Hämtar och visar alla kommentarer i en angiven tråd --%>
                <asp:ListView   ID="CommentsInThreadLV" runat="server" 
                                ItemType="LectureComments.Model.Comment"
                                SelectMethod="CommentsInThreadListView_GetData"
                                DataKeyNames="DiscRowID">
                    <LayoutTemplate>
                        <%-- Platshållare för nya rader --%>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                        
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="commentDiv">
                            
                            <%-- Utskrift av avsändare av kommentar. --%>
                            <span><%#: Item.Author %>: </span>

                            <%-- Utskrift av kommentarens text--%>
                            <span><%#: Item.DiscText %> </span>
                            <div class="commentButtons">
                                <asp:HyperLink runat="server" class="commentLinks" Text="Uppdatera" NavigateUrl='<%# GetRouteUrl("EditComment", new { id = Item.DiscRowID, id2 = Item.LectureID })%>' />
                                <asp:HyperLink runat="server" class="commentLinks" Text="Radera" NavigateUrl='<%# GetRouteUrl("DeleteComment", new { id = Item.DiscRowID, id2 = Item.LectureID }) %>' />
                            </div>
                        </div>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                    </EmptyDataTemplate>
                </asp:ListView>
                    <%-- Länk till sida för att svara på specifik tråd.--%>
                    <asp:HyperLink runat="server" class="answerThreadLink" Text="Svara" NavigateUrl='<%# GetRouteUrl("AddComment", new { id = Item.ThreadID, id2 = Item.LectureID })%>' />
                </div>
            </ItemTemplate>
            <EmptyDataTemplate>
                <%-- Skrivs ut om ingen data har funnits i databasen på angiven plats.--%>
                <p>Ingen har frågat något än.</p>
            </EmptyDataTemplate>
        </asp:ListView>
    </div>
    </div>
    </form>
</asp:Content>

<%-- PlaceHolder för till masterpage--%>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">

    <%-- Script föra tt kunna stänga av meddelanen till användaren--%>
    <script type="text/javascript">
        setTimeout(function () {
            var closeMessageLink = document.getElementById("CloseLink");
            var statusMessageDiv = document.getElementById("MainContentPlaceHolder_UpdateSucceedPanel");

            closeMessageLink.onclick = function () {
                statusMessageDiv.parentElement.removeChild(statusMessageDiv);
            }
        }, 1000);
    </script>
</asp:Content>
