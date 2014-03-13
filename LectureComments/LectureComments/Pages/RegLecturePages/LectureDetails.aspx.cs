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

    public partial class LectureDetails : System.Web.UI.Page
    {
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.PeekTempData("SuccessMessage") as string == "Föreläsningen uppdaterades.")
            {
                UpdateSucceedLabel.Text = Page.GetTempData("SuccessMessage") as string;
                UpdateSucceedPanel.Visible = true;
            }
        }

        public Lecture LectureFormView_GetItem([RouteData] int id)
        {
            try
            {
                Service service = new Service();
                return service.GetLecture(id);
            }
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Fel inträffade då föreläsningen hämtades.");
                return null;
            }
        }
    }
}