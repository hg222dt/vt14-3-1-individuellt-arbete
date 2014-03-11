<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LectureRegPage.aspx.cs" Inherits="LectureComments.CourseRegistration" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="newLectureDiv">
            <span>Namn på föreläsning </span>
            <asp:TextBox ID="LectureNameTB" runat="server"></asp:TextBox>
            <br />
            <span>Namn på kurs </span>
            <asp:TextBox ID="CourseNameTB" runat="server"></asp:TextBox>
            <br />
            <span>Namn på lärare </span>
            <asp:TextBox ID="TeacherNameTB" runat="server"></asp:TextBox>
            <br />
            <span>Datum och tid för föreläsning</span>
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            <br />
            <asp:TextBox ID="timeHourTB" runat="server"></asp:TextBox>
            <asp:TextBox ID="timeMinuteTB" runat="server"></asp:TextBox>
        </div>
        <div id="showLecturesDiv">
            <asp:ListView ID="LectureListView" runat="server"
                ItemType="LectureComments.Model.Lecture"
                SelectMethod="LectureListView_GetData">
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
                    </table>

                    <%-- Platshållare för nya rader --%>
                    <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>

                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="FirstNameLabel" runat="server" Text='<%#: Item.LectureName %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%#: Item.CourseName %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text='<%#: Item.LectureDate %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text='<%#: Item.TeacherName %>' />
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
