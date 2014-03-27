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

        protected int Id
        {
            get { return int.Parse(RouteData.Values["id"].ToString()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Sätter avbryt-länk till att dirigera tillbaka en sida
            CancelLink.NavigateUrl = GetRouteUrl("DetailsLecture", new { id = Id2 });
        }

        protected int Id2
        {
            get { return int.Parse(RouteData.Values["id2"].ToString()); }
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
                    Page.SetTempData("SuccessMessage", "Kommentaren har lagts till!");
                    Response.RedirectToRoute("DetailsLecture", new { id = Id2 });
                    Context.ApplicationInstance.CompleteRequest();
                }
                catch (Exception)
                {
                    //Sätter felmeddelande
                    ModelState.AddModelError(String.Empty,
                        "Ett fel inträffade när kommentaren skulle läggas till.");
                }
            }
        }
    }
}