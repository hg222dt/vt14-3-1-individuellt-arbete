<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listing.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.Listing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <asp:Panel ID="SucceedPanel" runat="server" Visible="false" CssClass="AssignmentSuccess">
            <asp:Label ID="SucceedLabel" runat="server" Text="" />
            <a href="#" id="CloseLink">Stäng meddelande</a>
        </asp:Panel>

        <div id="showLecturesDiv">
            <h3>Planerade föreläsningar</h3>
            <asp:HyperLink ID="CreateLectureLink" runat="server"  Text="Lägg till föreläsning" NavigateUrl="<%$ RouteUrl:routename=CreateLecture %>"/>
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
                            <asp:Label ID="LectureDateLabel" runat="server" Text='<%#: Item.LectureDate %>' />
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
    </form>
    <script type="text/javascript">
        setTimeout(function () {
            var closeMessageLink = document.getElementById("CloseLink");
            var statusMessageDiv = document.getElementById("SucceedPanel");
            closeMessageLink.onclick = function () {
                statusMessageDiv.parentElement.removeChild(statusMessageDiv);
            }
        }, 1000);
    </script>
</body>
</html>
