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

        protected void Page_Load(object sender, EventArgs e)
        {

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
                    Context.ApplicationInstance.CompleteRequest();
                }
                catch (Exception)
                {
                    //Felmeddelande sätts.
                    ModelState.AddModelError(String.Empty,
                        "Ett fel inträffade när föreläsningen skulle läggas till.");
                }

                //Sidans panel för meddelande sätts till synlig.
                if (Page.PeekTempData("SuccessMessage") as string != null)
                {
                    SucceedLabel.Text = Page.GetTempData("SuccessMessage") as string;
                    SucceedPanel.Visible = true;
                    CreateLectureForm.Visible = false;
                }
            }
        }
    }
}