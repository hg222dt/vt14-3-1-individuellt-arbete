<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateLecture.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.Create" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
                        <asp:TextBox ID="LectureNameTB" runat="server" Text='<%# BindItem.LectureName %>' />
                    </div>
                    <div>
                        <label>Kursnamn</label>
                    </div>
                    <div>
                        <asp:TextBox ID="CourseNameTB" runat="server" Text='<%# BindItem.CourseName %>' />
                    </div>
                    <div>
                        <label>Datum (Format: 2014-03-10 23:15:00)</label>
                    </div>
                    <div>
                        <asp:TextBox ID="DateTB" runat="server" Text='<%# BindItem.LectureDate %>' />
                    </div>
                    <div>
                        <label>Lärare</label>
                    </div>
                    <div>
                        <asp:TextBox ID="TeacherNameTB" runat="server" Text='<%# BindItem.TeacherName %>' />
                    </div>
                    <div>
                        <asp:LinkButton runat="server" Text="Lägg till föreläsning" CommandName="Insert" />
                        <asp:HyperLink runat="server" Text="Avbryt" NavigateUrl='<%# GetRouteUrl("LectureListing", null ) %>' />
                    </div>
                </InsertItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
