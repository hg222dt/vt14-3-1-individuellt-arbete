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
    public partial class EditLecture2 : System.Web.UI.Page
    {
        //Fält som tillhandahåller service-objekt
        private Service _service;

        //Kopplar Service-referens till Service-objekt som skapas.
        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        //Hämtar specifik föreläsnings detaljer.
        public Lecture LectureFormView_GetItem([RouteData]int id)
        {
            try
            {
                //Hämtar föreläsning
                return Service.GetLecture(id);
            }
            catch (Exception)
            {
                //Felmeddelande
                ModelState.AddModelError(String.Empty, "Fel inträffade då föreläsningen hämtades vid redigering.");
                return null;
            }
        }

        //Uppdaterar detaljer i specifik föreläsning.
        public void UpdateLectureForm_UpdateItem(int lectureID)
        {
            try
            {
                //Hämtar specifik föreläsning
                var lecture = Service.GetLecture(lectureID);

                //Om objektet är tomt
                if (lecture == null)
                {
                    // Hittade inte kunden.
                    ModelState.AddModelError(String.Empty,
                        String.Format("Föreläsningen med id {0} hittades inte.", lectureID));
                    return;
                }

                //Om det går att updatera föreläsningen.
                if (TryUpdateModel(lecture))
                {
                    //Föreläsnings sparas
                    Service.SaveLecture(lecture);

                    //Meddelande-text sätts
                    Page.SetTempData("SuccessMessage", "Föreläsningen uppdaterades.");

                    //Användaren dirigeras om till förra sidan Föreläsningsdetaljer
                    Response.RedirectToRoute("DetailsLecture", new { id = lecture.LectureId });
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
            catch (Exception)
            {
                //Felmeddelande
                ModelState.AddModelError(String.Empty, "Fel inträffade då föreläsningen skulle uppdateras.");
            }
        }
    }
}