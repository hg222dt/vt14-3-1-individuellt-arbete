﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateLecture.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.Create" %>

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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="LectureNameTB"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <label>Kursnamn</label>
                    </div>
                    <div>
                        <asp:TextBox ID="CourseNameTB" runat="server" Text='<%# BindItem.CourseName %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="CourseNameTB"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <label>Datum (Format: 2014-03-10 23:15:00)</label>
                    </div>
                    <div>
                        <asp:TextBox ID="DateTB" runat="server" Text='<%# BindItem.LectureDate %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DateTB"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <label>Lärare</label>
                    </div>
                    <div>
                        <asp:TextBox ID="TeacherNameTB" runat="server" Text='<%# BindItem.TeacherName %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TeacherNameTB"></asp:RequiredFieldValidator>
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