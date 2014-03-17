<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
    <div>

        <%-- Ska hämta tråd. ThreadID. Timecode. LectureID. --%>
        <asp:ListView ID="ThreadsInLectureLV" runat="server"
            ItemType="LectureComments.Model.ThreadOnly"
            SelectMethod="ThreadsInLectureListView_GetData"
            DataKeyNames="ThreadID">
            <LayoutTemplate>

                
                  <%-- Platshållare för nya rader --%>
                <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>

            </LayoutTemplate>
            <ItemTemplate>
                <%-- Ska hämta alla DicsRow-rader i specifik ThreadID. DiscRowID, ThreadID. Date. DiscText. Author. --%>
                <asp:ListView   ID="CommentsInThreadLV" runat="server" 
                                ItemType="LectureComments.Model.Comment"
                                SelectMethod="CommentsInThreadListView_GetData"
                                DataKeyNames="DiscRowID">
                    <LayoutTemplate>
                        <p>Ny tråd</p>

                        <%-- Platshållare för nya rader --%>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>

                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="comment">
                            <p><%#: Item.Author %>: </p>
                            <p><%#: Item.DiscText %> </p>
                            <p><%#: Item.Date %> </p>
                        </div>
                    </ItemTemplate>
                    <EmptyDataTemplate>

                    </EmptyDataTemplate>
                    
                </asp:ListView>
                
              
                
            </ItemTemplate>
            <EmptyDataTemplate>

            </EmptyDataTemplate>
        </asp:ListView>
    </div>
    </form>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
</asp:Content>
