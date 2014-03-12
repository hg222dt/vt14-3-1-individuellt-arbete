<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listing.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.Listing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="showLecturesDiv">
            <h3>Planerade föreläsningar</h3>
            <asp:HyperLink ID="CreateLectureLink" runat="server"  Text="Lägg till föreläsning" NavigateUrl="<%$ RouteUrl:routename=CreateLecture %>"/>
            <asp:ListView ID="LectureListView" runat="server"
                ItemType="LectureComments.Model.Lecture"
                SelectMethod="LectureListView_GetData"
                DataKeyNames="LectureID"
                DeleteMethod="LectureListView_DeleteItem"
                InsertItemPosition="FirstItem">
                <LayoutTemplate>
                    <table>
                        <tr>
                            <th>
                                Föreläsningsnamn
                            </th>
                            <th>
                                Kurs
                            </th>
                            <th>
                                Datum
                            </th>
                            <th>
                                Lärare
                            </th>
                        </tr>

                        <%-- Platshållare för nya rader --%>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>

                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="LectureNameLabel" runat="server" Text='<%#: Item.LectureName %>' />
                        </td>
                        <td>
                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%#: Item.CourseName %>' />
                        </td>
                        <td>
                            <asp:Label ID="LectureDateLabel" runat="server" Text='<%#: Item.LectureDate %>' />
                        </td>
                        <td>
                            <asp:Label ID="TeacherNameLabel" runat="server" Text='<%#: Item.TeacherName %>' />
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
</body>
</html>
