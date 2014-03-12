<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LectureRegPage.aspx.cs" Inherits="LectureComments.CourseRegistration" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <body>
        <form id="form1" runat="server">
            <%--<div id="newLectureDiv">
                <h3>Lägg till föreläsning</h3>
                <span>Namn på föreläsning </span>
                <asp:TextBox ID="LectureNameTB" runat="server"></asp:TextBox>
                <br />
                <span>Namn på kurs </span>
                <asp:TextBox ID="CourseNameTB" runat="server"></asp:TextBox>
                <br />
                <span>Namn på lärare </span>
                <asp:TextBox ID="TeacherNameTB" runat="server"></asp:TextBox>
                <br />
                <span>Datum föreläsning</span>
                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                <br />
                <span>Tidpunkt föreläsning</span>
                <asp:TextBox ID="timeHourTB" runat="server"></asp:TextBox>
                <asp:TextBox ID="timeMinuteTB" runat="server"></asp:TextBox>
            </div>--%>
            <div id="showLecturesDiv">
                <h3>Planerade föreläsningar</h3>
                <asp:ListView ID="LectureListView" runat="server"
                    ItemType="LectureComments.Model.Lecture"
                    SelectMethod="LectureListView_GetData"
                    DataKeyNames="LectureID"
                    InsertMethod="LectureListView_InsertItem"
                    UpdateMethod="LectureListView_UpdateItem"
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
                     <InsertItemTemplate>
                        <tr>
                            <td>
                                <%-- Föreläsningsnamnsinput --%>
                                <asp:TextBox ID="InsertLectureNameTB" runat="server" MaxLength="50" Visible="true" Text='<%#:BindItem.LectureName %>' ></asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator1" 
                                    runat="server" 
                                    ControlToValidate="InsertLectureNameTB" 
                                    ErrorMessage="Ange föreläsningsnamn" 
                                    ValidationGroup="InsertGroup" 
                                    Display="None" ></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <%-- Kursnamnsinput --%>
                                <asp:TextBox ID="InsertCourseNameTB" runat="server" MaxLength="50" Visible="true" Text='<%#:BindItem.CourseName %>' ></asp:TextBox>
                                 <asp:RequiredFieldValidator 
                                     ID="RequiredFieldValidator2" 
                                     runat="server" 
                                     ControlToValidate="InsertCourseNameTB" 
                                     ErrorMessage="Ange kursnamn" 
                                     ValidationGroup="InsertGroup" 
                                     Display="None" ></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <%--Datuminput --%>
                                <asp:TextBox ID="InsertDateTB" runat="server" Visible="true" Text='<%#:BindItem.LectureDate %>' MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator3" 
                                    runat="server" 
                                    ControlToValidate="InsertDateTB" 
                                    ErrorMessage="Ange datum" 
                                    ValidationGroup="InsertGroup" 
                                    Display="None" ></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <%--Lärare-input --%>
                                <asp:TextBox ID="InsertTeacherTB" runat="server" Visible="true" Text='<%#:BindItem.TeacherName %>' MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator4" 
                                    runat="server" 
                                    ControlToValidate="InsertTeacherTB" 
                                    ErrorMessage="Ange namn på lärare" 
                                    ValidationGroup="InsertGroup" 
                                    Display="None" ></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:LinkButton CommandName="Insert" runat="server" Text="Lägg till">Lägg till ny</asp:LinkButton>
                            </td>
                            <td>
                                <asp:LinkButton CommandName="Cancel" runat="server" Text="Rensa" CausesValidation="false">Rensa</asp:LinkButton>
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <EditItemTemplate>
                        <tr>
                            <td>
                                <%-- Kontroller för att editera och validera kontakter. --%>
                                <asp:TextBox ID="UpdateLectureNameTB" runat="server" Visible="true" Text='<%#: BindItem.LectureName %>' MaxLength="50" />
                                <asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator1" 
                                    runat="server" 
                                    ControlToValidate="UpdateLectureNameTB" 
                                    ErrorMessage="Ange föreläsningsnamn" 
                                    ValidationGroup="EditGroup" 
                                    Display="None" ></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="UpdateCourseNameTB" runat="server" Visible="true" Text='<%#: BindItem.CourseName %>' MaxLength="50" />
                                <asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator2" 
                                    runat="server" 
                                    ControlToValidate="UpdateCourseNameTB" 
                                    ErrorMessage="Ange kursnamn" 
                                    ValidationGroup="EditGroup" 
                                    Display="None" ></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="UpdateDateTB" runat="server" Visible="true" Text='<%#: BindItem.LectureDate%>' MaxLength="50" />
                                <asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator3" 
                                    runat="server" 
                                    ControlToValidate="UpdateDateTB" 
                                    ErrorMessage="Ange datum" 
                                    ValidationGroup="EditGroup" 
                                    Display="None" ></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="UpdateTeacherTB" runat="server" Visible="true" Text='<%#: BindItem.TeacherName%>' MaxLength="50" />
                                <asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator5" 
                                    runat="server" 
                                    ControlToValidate="UpdateTeacherTB" 
                                    ErrorMessage="Ange namn på lärare" 
                                    ValidationGroup="EditGroup" 
                                    Display="None" ></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:LinkButton CommandName="Update" runat="server" Text="Uppdatera" />
                            </td>
                            <td>
                                <asp:LinkButton CommandName="Cancel" runat="server" Text="Avbryt" CausesValidation="false" />
                            </td>
                        </tr>
                    </EditItemTemplate>
                </asp:ListView>
            </div>
        </form>
    </body>
</html>
