<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="Delete2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.Delete2" %>

<%-- Sida för att ta bort en föreläsning--%>

<%-- PlaceHolder till masterpage--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
        <%-- Titel på sidan--%>
        <div class="title">
            <h3 class="titleText">Radera föreläsning</h3>
        </div>
    <div class="centerDiv">
        <h3>Vill du verkligen ta bort föreläsningen?</h3>
    
        <asp:LinkButton runat="server" ID="DeleteLink" Text="Radera föreläsningen" OnCommand="DeleteLink_Command" CommandArgument='<%$ RouteValue:id %>' />
        <asp:HyperLink runat="server" ID="CancelLink" Text="Avbryt" />
    </div>
    </form>
</asp:Content>

