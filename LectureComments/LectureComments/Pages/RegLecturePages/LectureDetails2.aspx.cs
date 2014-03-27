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
    public partial class LectureDetails2 : System.Web.UI.Page
    {
        //Fält som är en räknar-variabel till listView som skriver ut kommentarer i trådar.
        private int innerListViewRow = 0;

        //Fält som lagrar sidans (vald föreläsnings) ID.
        private int RouteID;

        //Referns till serviceobjekt
        private Service _service;

        //Skapar service-objekt och kopplar referens.
        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //UNdersöker om rättmeddelande finns tillgängligt.
            if (Page.PeekTempData("SuccessMessage") as string != null)
            {
                //Sätter label till rättmeddlande-text
                UpdateSucceedLabel.Text = Page.GetTempData("SuccessMessage") as string;

                //Synliggör inkapslande pansel till meddelande.
                UpdateSucceedPanel.Visible = true;
            }
        }

        //Returnerar lista med specifik föreläsnings alla detaljer.
        public Lecture LectureFormView_GetItem([RouteData] int id)
        {
            RouteID = id;

            try
            {
                //returnerar föreläsning
                return Service.GetLecture(id);
            }
            catch (Exception)
            {
                //Felmeddelande
                ModelState.AddModelError(String.Empty, "Fel inträffade då föreläsningen hämtades.");
                return null;
            }
        }

        //Returnerar lista med alla trådar i vald föreläsning.
        public IEnumerable<Thread> ThreadListView_GetData()
        {
            return Service.getThreadByID(RouteID);
        }

        //returnerar en lista med alla trådar. Vaiabel symboliserar LectureID
        public IEnumerable<ThreadOnly> ThreadsInLectureListView_GetData([RouteData] int id)
        {
            return Service.getThreadByID2(id);
        }

        //Returnerar en lista med alla kommentarer i en viss Thread ID
        public IEnumerable<Comment> CommentsInThreadListView_GetData()
        {
            var comments = Service.getCommentsInThread((int)ThreadsInLectureLV.DataKeys[innerListViewRow].Value);

            innerListViewRow++;

            return comments;
        }
    }
}