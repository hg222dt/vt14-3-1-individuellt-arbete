using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LectureComments.Model;
using System.Web.ModelBinding;

namespace LectureComments.Pages.RegLecturePages
{
    public partial class AddComment2 : System.Web.UI.Page
    {
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void AddCommentForm_InsertItem(Comment Comment, [RouteData]int id)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    Comment.ThreadID = id;
                    Service.SaveComment(Comment);
                    Page.SetTempData("SuccessMessage", "Kommentaren har skickats!");
                    Context.ApplicationInstance.CompleteRequest();
                }
                catch (Exception)
                {
                    ModelState.AddModelError(String.Empty,
                        "Ett fel inträffade när kommentaren skulle läggas till.");
                }

                if (Page.PeekTempData("SuccessMessage") as string != null)
                {
                    SucceedLabel.Text = Page.GetTempData("SuccessMessage") as string;
                    SucceedPanel.Visible = true;
                    CreateLectureForm.Visible = false;
                }
            }
        }
    }
}