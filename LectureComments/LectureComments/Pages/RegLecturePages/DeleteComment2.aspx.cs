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

        }

        protected void DeleteLink_Command(object sender, CommandEventArgs e)
        {
            try
            {
                var id = int.Parse(e.CommandArgument.ToString());

                Service.DeleteComment(id);

                Page.SetTempData("SuccessMessage", "Kommentaren togs bort.");
                Context.ApplicationInstance.CompleteRequest();

            }
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Fel inträffade då föreläsningen skulle tas bort");
            }

            if (Page.PeekTempData("SuccessMessage") as string != null)
            {
                SucceedLabel.Text = Page.GetTempData("SuccessMessage") as string;
                SucceedPanel.Visible = true;
                DeleteFormPanel.Visible = false;
            }
        }
    }
}