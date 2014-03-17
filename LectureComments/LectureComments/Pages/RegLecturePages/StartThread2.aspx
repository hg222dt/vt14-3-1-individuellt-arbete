<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site1.Master" AutoEventWireup="true" CodeBehind="StartThread2.aspx.cs" Inherits="LectureComments.Pages.RegLecturePages.StartThread2" %>
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
            ItemType="LectureComments.Model.Thread"
            InsertMethod="AddToThreadForm_InsertItem"
            DefaultMode="Insert"
            RenderOuterTable="false">
            <InsertItemTemplate>
                <h3>Ställ en fråga!</h3>
                <div>
                    <label>Fråga</label>
                </div>
                <div>
                    <asp:TextBox ID="QuestionTextTB" TextMode="MultiLine" runat="server" Text='<%# BindItem.QuestionText %>' MaxLength="300"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                                                runat="server" 
                                                ErrorMessage="Du måste skriva en fråga." 
                                                ControlToValidate="QuestionTextTB" Display="None"/>
                </div>
                <div>
                    <label>Tidpunkt i video</label>
                </div>
                <div>
                    <asp:TextBox ID="TimeCodeTB" runat="server" Text='<%# BindItem.Timecode %>' />

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ErrorMessage="Ange en tidpunkt i videon [HH:mm:ss] " 
                                                ControlToValidate="TimeCodeTB" Display="None" />

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                    ErrorMessage="Ange en tidkod i rätt format. [HH:mm:ss]" 
                                                    ControlToValidate="TimeCodeTB" Display="None" 
                                                    ValidationExpression="^(?:(?:([01]?\d|2[0-3]):)?([0-5]?\d):)?([0-5]?\d)$"/>
                </div>
                <div>
                    <label>Ditt namn</label>
                </div>
                <div>
                    <asp:TextBox ID="AuthorTB" runat="server" Text='<%# BindItem.Author %>' MaxLength="40" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                                                runat="server" 
                                                ErrorMessage="Ange ditt namn" 
                                                ControlToValidate="AuthorTB" Display="None" />
                </div>
                <div>
                    <asp:LinkButton runat="server" Text="Skicka fråga!" CommandName="Insert" />
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
