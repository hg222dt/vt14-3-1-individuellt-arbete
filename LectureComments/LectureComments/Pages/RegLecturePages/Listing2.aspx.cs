using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel.DataAnnotations;
using LectureComments.Model;

namespace LectureComments.Pages.RegLecturePages
{
    public partial class Listing2 : System.Web.UI.Page
    {
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.PeekTempData("SuccessMessage") as string != null)
            {
                SucceedLabel.Text = Page.GetTempData("SuccessMessage") as string;
                SucceedPanel.Visible = true;
            }
        }

        public IEnumerable<Lecture> LectureListView_GetData()
        {
            return Service.getLectures();
        }
    }
}