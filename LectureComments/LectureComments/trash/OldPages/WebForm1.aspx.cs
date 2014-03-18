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
    public partial class WebForm1 : System.Web.UI.Page
    {
        private int innerListViewRow = 0;

        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //returnerar en lista med alla trådar. Vaiabel symboliserar LectureID
        public IEnumerable<Thread> ThreadsInLectureListView_GetData([RouteData] int id)
        {
            return Service.getThreadByID(id);
        }

        //Returnerar en lista med alla kommentarer i en viss Thread ID
        public IEnumerable<Comment> CommentsInThreadListView_GetData(int DiscRowID)/*Variabel som symboliserar TrådID*/
        {
          //var x = (anropar och får tillbaka lista med alla discRow med specifikt ThreadID)

            var comments = Service.getCommentsInThread((int)ThreadsInLectureLV.DataKeys[innerListViewRow].Value);

            innerListViewRow++;

            return comments;
        }
    }
}