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
    public partial class EditLecture : System.Web.UI.Page
    {
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public Lecture LectureFormView_GetItem([RouteData]int id)
        {
            try
            {
                return Service.GetLecture(id);
            }
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Fel inträffade då föreläsningen hämtades vid redigering.");
                return null;
            }
        }


        public void UpdateLectureForm_UpdateItem(int lectureID)
        {
            try
            {
                var lecture = Service.GetLecture(lectureID);
                if (lecture == null)
                {
                    // Hittade inte kunden.
                    ModelState.AddModelError(String.Empty,
                        String.Format("Kunden med kundnummer {0} hittades inte.", lectureID));
                    return;
                }

                if (TryUpdateModel(lecture))
                {
                    Service.SaveLecture(lecture);

                    Page.SetTempData("SuccessMessage", "Föreläsningen uppdaterades.");
                    Response.RedirectToRoute("DetailsLecture", new { id = lecture.LectureId });
                    //Context.ApplicationInstance.CompleteRequest();
                }
            }
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Fel inträffade då kunden skulle uppdateras.");
            }
        }
    }
}