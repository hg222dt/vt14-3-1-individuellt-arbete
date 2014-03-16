<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="EditLecture2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.EditLecture2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
    <div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <asp:FormView ID="UpdateLectureForm" runat="server"
                ItemType="LectureComments.Model.Lecture"
                DataKeyNames="LectureID"
                UpdateMethod="UpdateLectureForm_UpdateItem"
                SelectMethod="LectureFormView_GetItem"
                DefaultMode="Edit"
                RenderOuterTable="false">
            <EditItemTemplate>
                <div>
                    <label>Föreläsningsnamn</label>
                </div>
                <div>
                    <asp:TextBox ID="LectureNameTB" runat="server" Text='<%# BindItem.LectureName %>' MaxLength="150" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Fyll i ett namn på föreläsningen" ControlToValidate="LectureNameTB" Display="None" />
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Fyll i ett datum." ControlToValidate="DateTB" Display="None"/>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Fyll i lärare" ControlToValidate="TeacherNameTB" Display="None"/>
                </div>
                <div>
                    <asp:Button ID="SaveButton" runat="server" Text="Uppdatera" CommandName="Update" />
                    <asp:HyperLink runat="server" Text="Avbryt" NavigateUrl='<%# GetRouteUrl("DetailsLecture", new { id = Item.LectureId }) %>' />
                </div>
            </EditItemTemplate>
        </asp:FormView>
    </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
</asp:Content>
