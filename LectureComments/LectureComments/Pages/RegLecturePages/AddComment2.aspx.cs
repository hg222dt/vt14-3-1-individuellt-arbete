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
    public partial class AddComment2 : System.Web.UI.Page
    {   
        //Service-referens
        private Service _service;

        //Returnerar service-referens med skapat service-objekt
        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Lägger till kommentar
        public void AddCommentForm_InsertItem(Comment Comment, [RouteData]int id)
        {
            //Om klientvalidering är ok
            if (ModelState.IsValid)
            {
                try
                {
                    //Undersöker id på tråvald tråd
                    Comment.ThreadID = id;

                    //Sparar kommentar
                    Service.SaveComment(Comment);

                    //Sätter rättmeddelande
                    Page.SetTempData("SuccessMessage", "Kommentaren har skickats!");
                    Context.ApplicationInstance.CompleteRequest();
                }
                catch (Exception)
                {
                    //Sätter felmeddelande
                    ModelState.AddModelError(String.Empty,
                        "Ett fel inträffade när kommentaren skulle läggas till.");
                }

                //Undersöker om meddelande-text finns tillgänglig
                if (Page.PeekTempData("SuccessMessage") as string != null)
                {
                    //Sätter felmeddelande label till text
                    SucceedLabel.Text = Page.GetTempData("SuccessMessage") as string;
                    
                    //synliggör panel som innehåller meddelande
                    SucceedPanel.Visible = true;

                    //Osynliggör formuläret på sidan
                    CreateLectureForm.Visible = false;
                }
            }
        }
    }
}