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
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void CreateLectureForm_InsertItem(Lecture Lecture)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    Service.SaveLecture(Lecture);
                    Page.SetTempData("SuccessMessage", "Föreläsningen lades till!");
                    Response.RedirectToRoute("LectureListing", new { id = Lecture.LectureId });
                    Context.ApplicationInstance.CompleteRequest();
                }
                catch (Exception)
                {
                    ModelState.AddModelError(String.Empty,
                        "Ett fel inträffade när föreläsning skulle läggas till.");
                }
            }
        }
    }
}