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
    public partial class EditComment : System.Web.UI.Page
    {
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public Comment CommentFormView_GetItem([RouteData]int id)
        {
            try
            {
                return Service.GetCommentById(id);
            }
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Fel inträffade då föreläsningen hämtades vid redigering.");
                return null;
            }
        }


        public void UpdateCommentForm_UpdateItem(int discRowID)
        {
            try
            {
                var comment = Service.GetCommentById(discRowID);
                if (comment == null)
                {
                    // Kommentaren kunde inte hittas
                    ModelState.AddModelError(String.Empty,
                        String.Format("Kommentaren med id {0} hittades inte.", discRowID));
                    return;
                }

                if (TryUpdateModel(comment))
                {
                    Service.SaveComment(comment);
                    Page.SetTempData("SuccessMessage", "Kommentaren uppdaterades!");
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Fel inträffade då kunden skulle uppdateras.");
            }

            if (Page.PeekTempData("SuccessMessage") as string != null)
            {
                SucceedLabel.Text = Page.GetTempData("SuccessMessage") as string;
                SucceedPanel.Visible = true;
                UpdateLectureForm.Visible = false;
            }
        }
    }
}