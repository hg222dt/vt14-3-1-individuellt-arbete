﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="error2.aspx.cs" Inherits="LectureComments.Pages.Shared.error2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
        <form id="form1" runat="server">
    <div>
        <p>Ett oväntat fel uppstod.</p>
        <a href="~/Pages/RegLecturePages/Listing2.aspx">Tillbaka till startsida?</a>
    </div>
    </form>
</asp:Content>