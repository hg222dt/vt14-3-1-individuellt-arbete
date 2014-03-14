﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using LectureComments.Model;

namespace LectureComments.Pages.RegLecturePages
{
    public partial class AddToThread : System.Web.UI.Page
    {
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void AddToThreadForm_InsertItem(Thread Thread, [RouteData]int id)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    Thread.LectureID = id;
                    Service.StartThread(Thread);
                    Page.SetTempData("SuccessMessage", "Frågan har skickats!");
                    //Response.RedirectToRoute("LectureListing", new { id = Lecture.LectureId });
                    //Bara ha en frågningen i en popup istället, som kan stängas sen.
                    Context.ApplicationInstance.CompleteRequest();
                }
                catch (Exception)
                {
                    ModelState.AddModelError(String.Empty,
                        "Ett fel inträffade när föreläsning skulle läggas till.");
                }
            }
        }
    }
}