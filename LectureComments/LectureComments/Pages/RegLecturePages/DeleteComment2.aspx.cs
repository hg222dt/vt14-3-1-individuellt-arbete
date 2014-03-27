using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LectureComments.Model;

namespace LectureComments.Pages.RegLecturePages
{
    public partial class DeleteComment2 : System.Web.UI.Page
    {
        //Tillhandahåller Service-referens
        private Service _service;

        //returnerar fält med service-referens, samt kopplar Service-objekt dit.
        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Sätter avbryt-länk till att dirigera tillbaka en sida
            CancelLink.NavigateUrl = GetRouteUrl("DetailsLecture", new { id = Id2 });
        }

        protected int Id
        {
            get { return int.Parse(RouteData.Values["id"].ToString()); }
        }

        protected int Id2
        {
            get { return int.Parse(RouteData.Values["id2"].ToString()); }
        }

        //Tar bort kommentar
        protected void DeleteLink_Command(object sender, CommandEventArgs e)
        {
            try
            {
                //Kommentarens id
                var id = int.Parse(e.CommandArgument.ToString());

                //Tar bort specifik kommentar
                Service.DeleteComment(id);

                //Sätter meddelande-text
                Page.SetTempData("SuccessMessage", "Kommentaren togs bort.");
                Response.RedirectToRoute("DetailsLecture", new { id = Id2 });
                Context.ApplicationInstance.CompleteRequest();

            }
            catch (Exception)
            {
                //Sätter felmeddelande
                ModelState.AddModelError(String.Empty, "Fel inträffade då kommentaren skulle tas bort");
            }
        }
    }
}