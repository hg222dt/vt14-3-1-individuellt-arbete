<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="CreateLecture2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.CreateLecture2" %>

<%-- Placeholder till appens mastepage --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    
    <%-- Sidans formulär --%>
    <form id="form1" runat="server">

        <%-- Titel och beskrivning på sidan. --%>
        <div class="title">
            <h3 class="titleText">Lägg till föreläsning</h3>
            <div class="subText">
                Skriv in uppgifter till den föreläsninge du vill lägga till i registret.
            </div>
        </div>

        <%-- Div-tagg som kapslar in inmatningen av föreläsningsuppg, samt validerings-summeringskontroll --%>
        <div class="centerDiv">

            <%-- Kontroll valideringsummering --%>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />

            <%-- Inmatnings fält i ett FormView --%>
            <h3>Ny föreläsning!</h3>
            <asp:FormView ID="CreateLectureForm" runat="server"
                ItemType="LectureComments.Model.Lecture"
                InsertMethod="CreateLectureForm_InsertItem"
                DefaultMode="Insert"
                RenderOuterTable="false">
                <InsertItemTemplate>
                    <div>
                        <label>Föreläsningsnamn</label>
                    </div>
                    <div>
                        <%-- Föreläsnignsnamn--%>
                        <asp:TextBox ID="LectureNameTB" runat="server" Text='<%# BindItem.LectureName %>' MaxLength="150" />
                        <%-- required field-validering --%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Fyll i ett namn på föreläsningen" ControlToValidate="LectureNameTB" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <label>Kursnamn</label>
                    </div>
                    <div>
                        <%-- Kursnamn --%>
                        <asp:TextBox ID="CourseNameTB" runat="server" Text='<%# BindItem.CourseName %>' MaxLength="100" />
                        <%-- Required field-validering --%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Fyll i ett kursnamn" ControlToValidate="CourseNameTB" Display="None" />
                    </div>
                    <div>
                        <label>Datum [YYYY-mm-dd]</label>
                    </div>
                    <div>
                        <%-- Datum --%>
                        <asp:TextBox ID="DateTB" runat="server" Text='<%# BindItem.LectureDate %>' />
                        <%-- Required field-valdiering--%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                                                    runat="server" 
                                                    ErrorMessage="Fyll i ett datum." 
                                                    ControlToValidate="DateTB" 
                                                    Display="None" />
                        <%-- Datum-validering --%>
                        <asp:CompareValidator
                                                        id="dateValidator" runat="server" 
                                                        Type="Date"
                                                        Operator="DataTypeCheck"
                                                        ControlToValidate="DateTB" 
                                                        Display="None"
                                                        ErrorMessage="Mata in ett korrekt datum.">
                        </asp:CompareValidator>

                    </div>
                    <div>
                        <label>Lärare</label>
                    </div>
                    <div>
                        <%-- Namn på lärare--%>
                        <asp:TextBox ID="TeacherNameTB" runat="server" Text='<%# BindItem.TeacherName %>' MaxLength="50" />
                        <%-- Reuired field-validering --%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Fyll i lärare" ControlToValidate="TeacherNameTB" Display="None"/>
                    </div>
                    <div>
                        <label>Video-Url</label>
                    </div>
                    <div>
                         <%-- Video-url--%>
                        <asp:TextBox ID="VideoUrlTB" runat="server" Text='<%# BindItem.VideoUrl %>' />
                        <%-- Requiredfield validering--%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Fyll i Url till föreläsningsvideo" ControlToValidate="VideoUrlTB" Display="None"/>
                    </div>
                    <div>
                        <%-- Knappar för att lägga till föreläsning samt för att avbryta --%>
                        <asp:LinkButton runat="server" Text="Lägg till föreläsning" CommandName="Insert" />
                        <asp:HyperLink runat="server" Text="Avbryt" NavigateUrl='<%# GetRouteUrl("LectureListing", null ) %>' />
                    </div>
                </InsertItemTemplate>
            </asp:FormView>
        </div>
    </form>
</asp:Content>
