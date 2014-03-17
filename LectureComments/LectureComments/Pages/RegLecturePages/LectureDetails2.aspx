<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="LectureDetails2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.LectureDetails2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    
    <form id="form1" runat="server">

    <div>
        <div class="title">
            <h3 class="titleText">Föreläsningsrum</h3>
            <div class="subText">
                <p>
                    Här inne finner du information om din föreläsning, och du kan även kolla på föreläsningen i videon nedan.
                    Under video-klippet hittar du alla frågor som ställts, och ja: Du kan själv ställa, uppdatera och radera frågor till föresläningen.
                </p>
            </div>
        </div>

        <asp:Panel ID="UpdateSucceedPanel" runat="server" Visible="false" CssClass="AssignmentSuccess">
            <asp:Label ID="UpdateSucceedLabel" runat="server" Text="" />
            <a href="#" id="CloseLink">Stäng meddelande</a>
        </asp:Panel>

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
                        <strong>
                            <%#: Item.LectureName %>
                        </strong>
                    </div>
                    <div>
                        <label for="Name">Namn på kurs</label>
                    </div>
                    <div>
                        <strong>
                            <%#: Item.CourseName %>
                        </strong>
                    </div>
                    <div>
                        <label for="Date">Datum</label>
                    </div>
                    <div>
                        <strong>
                            <%#: Item.LectureDate %>
                        </strong>
                    </div>
                    <div>
                        <label for="Name">Lärare</label>
                    </div>
                    <div>
                        <strong>
                            <%#: Item.TeacherName %>
                        </strong>
                    </div>
                    <div>
                        <label for="Name">Video-Url</label>
                    </div>
                    <div>
                        <strong>
                            <%#: Item.VideoUrl %>
                        </strong>
                    </div>
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

                <div class="centerDiv" id="videoSection">
                    <div class="video-field">
                        <iframe width="460" height="330" src='<%#: Item.VideoUrl %>' frameborder="0" allowfullscreen></iframe>
                    </div>
                    
                    <strong>
                        <asp:HyperLink ID="CommentLink" runat="server" class="sendQuestLink" NavigateUrl='<%# GetRouteUrl("AddToThread", new{ id = Item.LectureId})  %>' Text="Ställ en fråga" Target="_blank"/>
                    </strong>
                </div>
            </ItemTemplate>
        </asp:FormView>
        
        <div class="centerDiv" id="commentsSection">

            <p id="questionLabel"><strong>Frågor på föreläsningens tidslinje</strong></p>


        <%-- Ska hämta tråd. ThreadID. Timecode. LectureID. --%>
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

                <%-- Ska hämta alla DicsRow-rader i specifik ThreadID. DiscRowID, ThreadID. Date. DiscText. Author. --%>
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
                            <span><%#: Item.Author %>: </span>
                            <span><%#: Item.DiscText %> </span>
                            <div class="commentButtons">
                                <asp:HyperLink runat="server" class="commentLinks" Text="Uppdatera" NavigateUrl='<%# GetRouteUrl("EditComment", new { id = Item.DiscRowID })%>' Target="_blank" />
                                <asp:HyperLink runat="server" class="commentLinks" Text="Radera" NavigateUrl='<%# GetRouteUrl("DeleteComment", new { id = Item.DiscRowID }) %>' Target="_blank" />
                            </div>
                        </div>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                    </EmptyDataTemplate>
                </asp:ListView>
                     <asp:HyperLink runat="server" class="answerThreadLink" Text="Svara" NavigateUrl='<%# GetRouteUrl("AddComment", new { id = Item.ThreadID })%>' Target="_blank" />
                </div>
            </ItemTemplate>
            <EmptyDataTemplate>
            </EmptyDataTemplate>
        </asp:ListView>

    </div>
    </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
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
