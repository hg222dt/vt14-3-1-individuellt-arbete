<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%-- Ska hämta tråd. ThreadID. Timecode. LectureID. --%>
        <asp:ListView ID="ThreadsInLectureLV" runat="server"
            ItemType="LectureComments.Model.Thread"
            SelectMethod="ThreadsInLectureListView_GetData"
            DataKeyNames="ThreadID">
            <LayoutTemplate>

                <%-- Ska hämta alla DicsRow-rader i specifik ThreadID. DiscRowID, ThreadID. Date. DiscText. Author. --%>
                <asp:ListView   ID="CommentsInThreadLV" runat="server" 
                                ItemType="LectureComments.Model.Comment"
                                SelectMethod="CommentsInThreadListView_GetData"
                                DataKeyNames="DiscRowID">
                <LayoutTemplate>
                    <%#: Item.DiscText %>
                </LayoutTemplate>
                    
                </asp:ListView>
            </LayoutTemplate>
        </asp:ListView>

    </div>
    </form>
</body>
</html>
