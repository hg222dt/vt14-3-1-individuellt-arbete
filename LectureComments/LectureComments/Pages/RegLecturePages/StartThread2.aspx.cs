using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using LectureComments.Model;

namespace LectureComments.Pages.RegLecturePages
{
    public partial class StartThread2 : System.Web.UI.Page
    {
        //Referens till service-objekt
        private Service _service;

        //skapar service-obbjekt. Och koppplar referns till detta.
        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        //Tillhandahåller id för föreläsningen
        protected int Id
        {
            get { return int.Parse(RouteData.Values["id"].ToString()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Sätter avbryt-länk till att dirigera tillbaka en sida
            CancelLink.NavigateUrl = GetRouteUrl("DetailsLecture", new { id = Id });
        }

        //Metod som lägger till tråd.
        public void AddToThreadForm_InsertItem(Thread Thread, [RouteData]int id)
        {
            if (ModelState.IsValid)
            {
                //Lägger till trådId samt sparar tråd. Samt sparar text till rätt-meddelande vid lyckad sparning.
                try
                {
                    Thread.LectureID = id;
                    Service.StartThread(Thread);
                    Page.SetTempData("SuccessMessage", "Frågan har skickats!");
                    Response.RedirectToRoute("DetailsLecture", new { id = Thread.LectureID });
                    Context.ApplicationInstance.CompleteRequest();
                }
                catch (Exception)
                {
                    //Felmeddelande sätts.
                    ModelState.AddModelError(String.Empty,
                        "Ett fel inträffade när föreläsningen skulle läggas till.");
                }
            }
        }
    }
}