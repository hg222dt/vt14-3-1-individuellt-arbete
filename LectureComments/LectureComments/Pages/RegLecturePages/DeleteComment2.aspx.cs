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

        //Tillhandahåller sidans och kommentarens id.
        //protected int Id
        //{
        //    get { return int.Parse(RouteData.Values["id"].ToString()); }
        //}

        protected void Page_Load(object sender, EventArgs e)
        {

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
                Context.ApplicationInstance.CompleteRequest();

            }
            catch (Exception)
            {
                //Sätter felmeddelande
                ModelState.AddModelError(String.Empty, "Fel inträffade då kommentaren skulle tas bort");
            }

            //Undersöker om rättmeddlenade finns tillgängligt
            if (Page.PeekTempData("SuccessMessage") as string != null)
            {
                //Sätter meddelande-text
                SucceedLabel.Text = Page.GetTempData("SuccessMessage") as string;

                //Synliggör meddelande
                SucceedPanel.Visible = true;

                //Osynliggör formulär
                DeleteFormPanel.Visible = false;
            }
        }
    }
}