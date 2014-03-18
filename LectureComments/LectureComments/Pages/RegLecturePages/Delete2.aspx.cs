using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LectureComments.Model;

namespace LectureComments.Pages.RegLecturePages
{
    public partial class Delete2 : System.Web.UI.Page
    {
        //Tillhandahåller Service-referens
        private Service _service;

        //Returnerar Service-referens med skapat service-objekt
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

        //Tar bort föreläsning
        protected void DeleteLink_Command(object sender, CommandEventArgs e)
        {
            try
            {
                //Hämtar föreläsning id
                var id = int.Parse(e.CommandArgument.ToString());

                //Tar bort föresläsning
                Service.DeleteLecture(id);

                //Sätter meddelande
                Page.SetTempData("SuccessMessage", "Föreläsning togs bort.");

                //Omdirigerar användaren tillbaka startsidan
                Response.RedirectToRoute("LectureListing", null);

                Context.ApplicationInstance.CompleteRequest();

            }
            catch (Exception)
            {
                //Felmeddelande sätts
                ModelState.AddModelError(String.Empty, "Fel inträffade då föreläsningen skulle tas bort");
            }
        }
    }
}