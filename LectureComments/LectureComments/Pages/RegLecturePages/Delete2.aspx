<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="Delete2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.Delete2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
    <div>
        <h3>Vill du verkligen ta bort föreläsningen?</h3>
    
        <asp:LinkButton runat="server" ID="DeleteLink" Text="Radera föreläsningen" OnCommand="DeleteLink_Command" CommandArgument='<%$ RouteValue:id %>' />
        <asp:HyperLink runat="server" ID="CancelLink" Text="Avbryt" />
    </div>
    </form>
</asp:Content>

