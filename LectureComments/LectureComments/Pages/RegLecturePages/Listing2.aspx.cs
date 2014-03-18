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

        //Referens till service-objekt
        private Service _service;

        //skapar service-objekt. Och koppplar referns till detta.
        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        
        protected void Page_Load(object sender, EventArgs e)
        {
            //Undersöker om rättmeddelande finns tillgängligt.
            if (Page.PeekTempData("SuccessMessage") as string != null)
            {
                //Sätter label till text-data och synliggör dess inkapslade panel.
                SucceedLabel.Text = Page.GetTempData("SuccessMessage") as string;
                SucceedPanel.Visible = true;
            }
        }

        //Returnerar lista med alla tillgängliga föreläsningar.
        public IEnumerable<Lecture> LectureListView_GetData()
        {
            return Service.getLectures();
        }
    }
}