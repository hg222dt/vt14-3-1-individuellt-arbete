﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel.DataAnnotations;
using LectureComments.Model;

namespace LectureComments.Pages.RegLecturePages
{
    public partial class Listing : System.Web.UI.Page
    {
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Iteration som infaller om sessionen status returnerar "true"
            if (Session["Status"] as bool? == true)
            {
                //Meddelande visas och skrivs ut.
                //LabelStatusMessage.Text = Request.QueryString["status"];
                //statusMessage.Visible = true;
                //LabelStatusMessage.Visible = true;
                //Session.Remove("Status");

                StatusMessageLabel.Text = Page.GetTempData("SuccessMessage") as string;
                StatusMessagePanel.Visible = true;
            }
            else
            {
                //Meddelande visas inte.
                //statusMessage.Visible = false;
                //LabelStatusMessage.Visible = false;
            }
        }

        public IEnumerable<Lecture> LectureListView_GetData()
        {
            return Service.getLectures();
        }

        //public void LectureListView_InsertItem(Lecture Lecture)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        try
        //        {
        //            Service.SaveLecture(Lecture);
        //            Session["Status"] = true;
        //            var status = "Föreläsning har lagts till!";
        //            Response.Redirect("~/LectureRegPage.aspx?status=" + status);
        //        }
        //        catch (Exception ex)
        //        {
        //            var validationResults = ex.Data["ValidationResults"] as IEnumerable<ValidationResult>;

        //            if (validationResults != null)
        //            {
        //                foreach (var validationResult in validationResults)
        //                {
        //                    foreach (var memberName in validationResult.MemberNames)
        //                    {
        //                        ModelState.AddModelError(memberName, validationResult.ErrorMessage);
        //                    }
        //                }
        //            }

        //            ModelState.AddModelError(String.Empty, "Fel inträffade när kontakt skulle läggas till.");
        //        }
        //    }
        //}

        //public void LectureListView_UpdateItem(int LectureID)
        //{
        //    try
        //    {
        //        var lecture = Service.GetLecture(LectureID);
        //        if (lecture == null)
        //        {
        //            ModelState.AddModelError(String.Empty,
        //                String.Format("Kunden med kundnummer {0} hittades inte.", LectureID));
        //            return;
        //        }

        //        if (TryUpdateModel(lecture))
        //        {
        //            Service.SaveLecture(lecture);
        //            Session["Status"] = true;
        //            var status = "Föreläsningen har uppdaterats!";
        //            Response.Redirect("~/LectureRegPage.aspx?status=" + status);
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        ModelState.AddModelError(String.Empty, "Oväntat fel inträffade när föreläsningen skulle uppdateras");
        //    }
        //}

        //public void LectureListView_DeleteItem(int LectureID)
        //{

        //}
    }
}