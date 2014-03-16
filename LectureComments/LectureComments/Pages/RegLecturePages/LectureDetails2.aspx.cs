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
    public partial class LectureDetails2 : System.Web.UI.Page
    {
        private int RouteID;

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
            RouteID = id;

            try
            {
                return Service.GetLecture(id);
            }
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Fel inträffade då föreläsningen hämtades.");
                return null;
            }
        }

        public IEnumerable<Thread> ThreadListView_GetData()
        {
            return Service.getThreadByID(RouteID);
        }

        //public void ThreadListView_UpdateItem(int QuestionID)
        //{
        //    try
        //    {
        //        var question = Service.GetThread(QuestionID);
        //        if (question == null)
        //        {
        //            ModelState.AddModelError(String.Empty,
        //                String.Format("Kommentar {0} hittades inte.", QuestionID));
        //            return;
        //        }

        //        if (TryUpdateModel(question))
        //        {
        //            Service.UpdateComment(question);
        //            Session["Status"] = true;
        //            var status = "Kommentaren har uppdaterats!";
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        ModelState.AddModelError(String.Empty, "Oväntat fel inträffade när föreläsningen skulle uppdateras");
        //    }
        //}

    }
}