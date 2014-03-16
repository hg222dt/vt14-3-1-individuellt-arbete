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
        private Service _service;

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
            CancelLink.NavigateUrl = GetRouteUrl("DetailsLecture", new { id = Id });

        }

        protected void DeleteLink_Command(object sender, CommandEventArgs e)
        {
            try
            {
                var id = int.Parse(e.CommandArgument.ToString());

                Service.DeleteLecture(id);

                Page.SetTempData("SuccessMessage", "Föreläsning togs bort.");

                Response.RedirectToRoute("LectureListing", null);

                Context.ApplicationInstance.CompleteRequest();

            }
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Fel inträffade då föreläsningen skulle tas bort");
            }
        }
    }
}