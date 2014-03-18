using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LectureComments.Model;

namespace LectureComments.Pages.RegLecturePages
{
    public partial class CreateLecture2 : System.Web.UI.Page
    {
        //tillahandahåller service-referens
        private Service _service;

        //Returnerar Service-referens med skapat service-objekt
        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Skapar föreläsning
        public void CreateLectureForm_InsertItem(Lecture Lecture)
        {
            //Om klient-validering är ok
            if (ModelState.IsValid)
            {
                try
                {
                    //Föreläsning sparas
                    Service.SaveLecture(Lecture);
                    
                    //Meddelande sätts
                    Page.SetTempData("SuccessMessage", "Föreläsningen lades till!");
                    
                    //Användare omdirigeras
                    Response.RedirectToRoute("LectureListing", new { id = Lecture.LectureId });
                    Context.ApplicationInstance.CompleteRequest();
                }
                catch (Exception)
                {
                    //Felmeddelande sätts
                    ModelState.AddModelError(String.Empty,
                        "Ett fel inträffade när föreläsning skulle läggas till.");
                }
            }
        }
    }
}