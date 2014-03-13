<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.Delete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>Vill du verkligen ta bort föreläsningen?</h3>
    
        <asp:LinkButton runat="server" ID="DeleteLink" Text="Radera föreläsningen" OnCommand="DeleteLink_Command" CommandArgument='<%$ RouteValue:id %>' />
        <asp:HyperLink runat="server" ID="CancelLink" Text="Avbryt" />
    </div>
    </form>
</body>
</html>
