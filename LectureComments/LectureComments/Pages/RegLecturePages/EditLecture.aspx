<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditLecture.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.EditLecture" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
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
                    <asp:Button ID="SaveButton" runat="server" Text="Uppdatera" CommandName="Update" />
                    <asp:HyperLink runat="server" Text="Avbryt" NavigateUrl='<%# GetRouteUrl("CustomerDetails", new { id = Item.CustomerId }) %>' />
                </div>
            </EditItemTemplate>
        </asp:FormView>
    </div>
    </form>
</body>
</html>
