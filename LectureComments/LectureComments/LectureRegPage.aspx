<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LectureRegPage.aspx.cs" Inherits="LectureComments.CourseRegistration" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <body>
        <form id="form1" runat="server">
            <div id="newLectureDiv">
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
            </div>
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
                                <asp:TextBox ID="InserLectureNameTB" runat="server" MaxLength="50" Visible="true" Text='<%#:BindItem.LectureName %>' ></asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator1" 
                                    runat="server" 
                                    ControlToValidate="InsertLectureNameTB" 
                                    ErrorMessage="Ange kursnamn" 
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
                                <%--Email-input --%>
                                <asp:TextBox ID="InsertDateTB" runat="server" Visible="true" Text='<%#:BindItem.LectureDate %>' MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator3" 
                                    runat="server" 
                                    ControlToValidate="InsertDateTB" 
                                    ErrorMessage="Ange e-postadress" 
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
                                <asp:TextBox ID="UpdateFirstNameTB" runat="server" Visible="true" Text='<%#: BindItem.FirstName %>' MaxLength="50" />
                                <asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator1" 
                                    runat="server" 
                                    ControlToValidate="UpdateFirstNameTB" 
                                    ErrorMessage="Ange förnamn" 
                                    ValidationGroup="EditGroup" 
                                    Display="None" ></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="UpdateLastNameTB" runat="server" Visible="true" Text='<%#: BindItem.LastName %>' MaxLength="50" />
                                <asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator2" 
                                    runat="server" 
                                    ControlToValidate="UpdateLastNameTB" 
                                    ErrorMessage="Ange efternamn" 
                                    ValidationGroup="EditGroup" 
                                    Display="None" ></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="UpdateEmailTB" runat="server" Visible="true" Text='<%#: BindItem.Email%>' MaxLength="50" />
                                <asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator3" 
                                    runat="server" 
                                    ControlToValidate="UpdateEmailTB" 
                                    ErrorMessage="Ange e-postadress" 
                                    ValidationGroup="EditGroup" 
                                    Display="None" ></asp:RequiredFieldValidator>

                                <asp:RegularExpressionValidator 
                                    ID="RegularExpressionValidator1" 
                                    runat="server" 
                                    ControlToValidate="UpdateEmailTB" 
                                    ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" 
                                    ErrorMessage="Ange korrekt e-postadress" 
                                    ValidationGroup="EditGroup" 
                                    Display="None" ></asp:RegularExpressionValidator>
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
