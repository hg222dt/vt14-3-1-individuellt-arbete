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
    public partial class EditComment2 : System.Web.UI.Page
    {
        //Tillhandahåller referens till Service-objekt
        private Service _service;

        //Skapar serviceobjekt och kopplar till service-referens
        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Returnerar kommentar med specifikt id
        public Comment CommentFormView_GetItem([RouteData]int id)
        {
            try
            {
                //Hämtar kommentars-objekt
                return Service.GetCommentById(id);
            }
            catch (Exception)
            {
                //Felmeddelande
                ModelState.AddModelError(String.Empty, "Fel inträffade då kommentaren hämtades för redigering.");
                return null;
            }
        }

        //Uppdaterar kommentar
        public void UpdateCommentForm_UpdateItem(int discRowID)
        {
            try
            {
                //Hämtar specifik kommentar
                var comment = Service.GetCommentById(discRowID);

                //Om kommetnar-objekt är tomt
                if (comment == null)
                {
                    // Felmeddelande
                    ModelState.AddModelError(String.Empty,
                        String.Format("Kommentaren med id {0} hittades inte.", discRowID));
                    return;
                }

                //Om försök att uppdatera kommentar lyckas
                if (TryUpdateModel(comment))
                {
                    //Sparar kommentar
                    Service.SaveComment(comment);

                    //Sätter text till reätt-meddelande
                    Page.SetTempData("SuccessMessage", "Kommentaren uppdaterades!");
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
            catch (Exception)
            {   
                //Sätter felmeddelande
                ModelState.AddModelError(String.Empty, "Fel inträffade då kommentaren skulle uppdateras.");
            }

            //Undersöker om Rättmeddelande finns tillgängligt
            if (Page.PeekTempData("SuccessMessage") as string != null)
            {
                //Sätter label till text med meddelande
                SucceedLabel.Text = Page.GetTempData("SuccessMessage") as string;

                //Synliggör panel som kapslar in meddelande
                SucceedPanel.Visible = true;

                //osynliggör formulär på sidan.
                UpdateLectureForm.Visible = false;
            }
        }
    }
}