﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="error2.aspx.cs" Inherits="LectureComments.Pages.Shared.error2" %>

<%-- Placeholder för masterpage --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
        <div class="title">
            <h3 class="titleText">Oj, ett fel uppstod :)</h3>
        </div>
        <div class="centerDiv">
            <p>Ett oväntat fel uppstod.</p>
            <asp:HyperLink runat="server"  Text="Tillbaka till startsidan?" NavigateUrl="<%$ RouteUrl:routename=LectureListing %>"/>
        </div>
    </form>
</asp:Content>