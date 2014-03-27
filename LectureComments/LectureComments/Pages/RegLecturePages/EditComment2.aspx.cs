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

        protected int Id
        {
            get { return int.Parse(RouteData.Values["id"].ToString()); }
        }

        protected int Id2
        {
            get { return int.Parse(RouteData.Values["id2"].ToString()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Sätter avbryt-länk till att dirigera tillbaka en sida
            CancelLink.NavigateUrl = GetRouteUrl("DetailsLecture", new { id = Id2 });
        }

        //Returnerar kommentar med specifikt id
        public Comment CommentFormView_GetItem()
        {
            try
            {
                //Hämtar kommentars-objekt
                return Service.GetCommentById(Id);
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
                    Response.RedirectToRoute("DetailsLecture", new { id = Id2 });
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
            catch (Exception)
            {   
                //Sätter felmeddelande
                ModelState.AddModelError(String.Empty, "Fel inträffade då kommentaren skulle uppdateras.");
            }
        }
    }
}