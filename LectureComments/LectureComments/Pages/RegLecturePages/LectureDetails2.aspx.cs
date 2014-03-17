﻿using System;
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
        private int RouteID;

        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.PeekTempData("SuccessMessage") as string == "Föreläsningen uppdaterades.")
            {
                UpdateSucceedLabel.Text = Page.GetTempData("SuccessMessage") as string;
                UpdateSucceedPanel.Visible = true;
            }
        }

        public Lecture LectureFormView_GetItem([RouteData] int id)
        {
            RouteID = id;

            try
            {
                return Service.GetLecture(id);
            }
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Fel inträffade då föreläsningen hämtades.");
                return null;
            }
        }

        public IEnumerable<Thread> ThreadListView_GetData()
        {
            return Service.getThreadByID(RouteID);
        }


        private int innerListViewRow = 0;

        //returnerar en lista med alla trådar. Vaiabel symboliserar LectureID
        public IEnumerable<ThreadOnly> ThreadsInLectureListView_GetData([RouteData] int id)
        {
            return Service.getThreadByID2(id);
        }

        //Returnerar en lista med alla kommentarer i en viss Thread ID
        public IEnumerable<Comment> CommentsInThreadListView_GetData()
        {
            //var x = (anropar och får tillbaka lista med alla discRow med specifikt ThreadID)

            var comments = Service.getCommentsInThread((int)ThreadsInLectureLV.DataKeys[innerListViewRow].Value);

            innerListViewRow++;

            return comments;
        }
    }
}