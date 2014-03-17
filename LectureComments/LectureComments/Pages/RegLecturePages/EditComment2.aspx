<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="EditComment2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.EditComment2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
    <div class="title">
        <h3 class="titleText">Uppdatera kommentar</h3>
    </div>
    <div class="centerDiv">
        <asp:Panel ID="SucceedPanel" runat="server" Visible="false" CssClass="AssignmentSuccess">
            <asp:Label ID="SucceedLabel" runat="server" Text="" />
        </asp:Panel>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        
        <asp:FormView ID="UpdateLectureForm" runat="server"
                ItemType="LectureComments.Model.Comment"
                DataKeyNames="DiscRowID"
                UpdateMethod="UpdateCommentForm_UpdateItem"
                SelectMethod="CommentFormView_GetItem"
                DefaultMode="Edit"
                RenderOuterTable="false">
            <EditItemTemplate>
                <div>
                    <label>Kommentarstext</label>
                </div>
                <div>
                    <asp:TextBox ID="DiscTextTB" runat="server" Text='<%# BindItem.DiscText %>' MaxLength="300" TextMode="MultiLine" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                                                runat="server" 
                                                ErrorMessage="Du måste skriva en kommentar." 
                                                ControlToValidate="DiscTextTB" Display="None"/>
                </div>
                <div>
                    <asp:Button ID="SaveButton" runat="server" Text="Uppdatera" CommandName="Update" />
                </div>
            </EditItemTemplate>
        </asp:FormView>
        <a href="#" id="CloseLink2">Tillbaka till föreläsning</a>
    </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
    <script type="text/javascript">
        setTimeout(function () {
            var statusMessageDiv = document.getElementById("MainContentPlaceHolder_SucceedPanel");
            var cancelQuestion = document.getElementById("CloseLink2");

            cancelQuestion.onclick = function () {
                close();
            }
        }, 1000);
    </script>
</asp:Content>
