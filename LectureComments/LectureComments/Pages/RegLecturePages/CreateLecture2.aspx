<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="CreateLecture2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.CreateLecture2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
        <div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
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
                        <asp:TextBox ID="LectureNameTB" runat="server" Text='<%# BindItem.LectureName %>' MaxLength="150" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Fyll i ett namn på föreläsningen" ControlToValidate="LectureNameTB" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <label>Kursnamn</label>
                    </div>
                    <div>
                        <asp:TextBox ID="CourseNameTB" runat="server" Text='<%# BindItem.CourseName %>' MaxLength="100" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Fyll i ett kursnamn" ControlToValidate="CourseNameTB" Display="None" />
                    </div>
                    <div>
                        <label>Datum (Format: YYYY-MM-DD)</label>
                    </div>
                    <div>
                        <asp:TextBox ID="DateTB" runat="server" Text='<%# BindItem.LectureDate %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                                                    runat="server" 
                                                    ErrorMessage="Fyll i ett datum." 
                                                    ControlToValidate="DateTB" Display="None"/>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                                                        runat="server" 
                                                        ErrorMessage="Datumet måste ha formatet YYYY-MM-DD" 
                                                        ControlToValidate="DateTB" 
                                                        ValidationExpression="^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$" 
                                                        Display="None"/>
                    </div>
                    <div>
                        <label>Lärare</label>
                    </div>
                    <div>
                        <asp:TextBox ID="TeacherNameTB" runat="server" Text='<%# BindItem.TeacherName %>' MaxLength="50" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Fyll i lärare" ControlToValidate="TeacherNameTB" Display="None"/>
                    </div>
                    <div>
                        <label>Video-Url</label>
                    </div>
                    <div>
                        <asp:TextBox ID="VideoUrlTB" runat="server" Text='<%# BindItem.VideoUrl %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Fyll i Url till föreläsningsvideo" ControlToValidate="VideoUrlTB" Display="None"/>
                    </div>
                    <div>
                        <asp:LinkButton runat="server" Text="Lägg till föreläsning" CommandName="Insert" />
                        <asp:HyperLink runat="server" Text="Avbryt" NavigateUrl='<%# GetRouteUrl("LectureListing", null ) %>' />
                    </div>
                </InsertItemTemplate>
            </asp:FormView>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
</asp:Content>
