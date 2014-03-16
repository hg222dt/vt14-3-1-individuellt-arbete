<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="LectureDetails2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.LectureDetails2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
    <asp:Panel ID="UpdateSucceedPanel" runat="server" Visible="false" CssClass="AssignmentSuccess">
        <asp:Label ID="UpdateSucceedLabel" runat="server" Text="" />
        <a href="#" id="CloseLink">Stäng meddelande</a>
    </asp:Panel>
    <div>
        <h3>Föreläsningsinfo</h3>
    
        <asp:FormView ID="LectureFormView" runat="server"
            ItemType="LectureComments.Model.Lecture"
            SelectMethod="LectureFormView_GetItem"
            RenderOuterTable="false">
            <ItemTemplate>
                <div>
                    <label for="Name">Namn på föreläsning</label>
                </div>
                <div>
                    <%#: Item.LectureName %>
                </div>
                <div>
                    <label for="Name">Namn på kurs</label>
                </div>
                <div>
                    <%#: Item.CourseName %>
                </div>
                <div>
                    <label for="Date">Datum</label>
                </div>
                <div>
                    <%#: Item.LectureDate %>
                </div>
                <div>
                    <label for="Name">Lärare</label>
                </div>
                <div>
                    <%#: Item.TeacherName %>
                </div>
                <div>
                    <label for="Name">Video-Url</label>
                </div>
                <div>
                    <%#: Item.VideoUrl %>
                </div>
                <div>
                    <asp:HyperLink runat="server" Text="Uppdatera" NavigateUrl='<%# GetRouteUrl("EditLecture", new { id = Item.LectureId }) %>' />
                    <asp:HyperLink runat="server" Text="Radera föreläsning" NavigateUrl='<%# GetRouteUrl("DeleteLecture", new { id = Item.LectureId }) %>' />
                    <asp:HyperLink runat="server" Text="Tillbaka till överblick" NavigateUrl='<%# GetRouteUrl("LectureListing", null)%>' />
                    
                    <asp:HyperLink ID="CommentLink" runat="server" NavigateUrl='<%# GetRouteUrl("AddToThread", new{ id = Item.LectureId})  %>' Text="Ställ en fråga" Target="_blank"/>
                </div>
                <div class="video-field">
                    <iframe width="560" height="315" src='<%#: Item.VideoUrl %>' frameborder="0" allowfullscreen></iframe>
                </div>
            </ItemTemplate>
        </asp:FormView>

        <asp:ListView ID="ThreadListView" runat="server"
            ItemType="LectureComments.Model.Thread"
            SelectMethod="ThreadListView_GetData"
            DataKeyNames="ThreadID">
            <LayoutTemplate>
                <table>
                    <tr>
                        <th>
                            Fråga
                        </th>
                        <th>
                            Tid i video
                        </th>
                        <th>
                            Författare
                        </th>
                    </tr>

                    <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%#: Item.QuestionText %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%#: Item.Timecode %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%#: Item.Author %>' />
                    </td>
                    <td>
                        <asp:HyperLink runat="server" Text="Svara" NavigateUrl='<%# GetRouteUrl("AddComment", new { id = Item.ThreadID })%>' Target="_blank" />
                        <asp:HyperLink runat="server" Text="Uppdatera" NavigateUrl='<%# GetRouteUrl("EditComment", new { id = Item.DiscRowID })%>' Target="_blank" />
                        <asp:HyperLink runat="server" Text="Radera" NavigateUrl='<%# GetRouteUrl("DeleteComment", new { id = Item.DiscRowID }) %>' Target="_blank" />
                    </td>
                </tr>
            </ItemTemplate>
            <EmptyDataTemplate>
            </EmptyDataTemplate>
        </asp:ListView>
    </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
</asp:Content>
