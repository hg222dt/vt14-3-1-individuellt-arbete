<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="AddComment2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.AddComment2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="SucceedPanel" runat="server" Visible="false" CssClass="AssignmentSuccess">
            <asp:Label ID="SucceedLabel" runat="server" Text="" />
        </asp:Panel>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />

        <asp:FormView ID="CreateLectureForm" runat="server"
            ItemType="LectureComments.Model.Comment"
            InsertMethod="AddCommentForm_InsertItem"
            DefaultMode="Insert"
            RenderOuterTable="false">
            <InsertItemTemplate>
                <div>
                    <label>Svara på tråd!</label>
                </div>
                <div>
                    <asp:TextBox ID="QuestionTextTB" runat="server" Text='<%# BindItem.DiscText %>' MaxLength="300" TextMode="MultiLine" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                                                runat="server" 
                                                ErrorMessage="Du måste skriva en kommentar." 
                                                ControlToValidate="QuestionTextTB" Display="None"/>
                </div>
                 <div>
                    <label>Ditt namn</label>
                </div>
                <div>
                    <asp:TextBox ID="AuthorNameTB" runat="server" Text='<%# BindItem.Author %>' MaxLength="40" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                                                runat="server" 
                                                ErrorMessage="Ange ditt namn" 
                                                ControlToValidate="AuthorNameTB" Display="None" />
                </div>
                <div>
                    <asp:LinkButton runat="server" Text="Skicka kommentar!" CommandName="Insert" />
                </div>
            </InsertItemTemplate>
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
