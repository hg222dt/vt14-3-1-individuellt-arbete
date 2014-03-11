using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LectureComments.Model;

namespace LectureComments
{
    public partial class CourseRegistration : System.Web.UI.Page
    {
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IEnumerable<Lecture> LectureListView_GetData()
        {
            return Service.getLectures();
        }

        public void LectureListView_InsertItem(Lecture Lecture)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    Service.SaveLecture(Lecture);
                    Session["Status"] = true;
                    var status = "Föreläsning har lagts till!";
                    Response.Redirect("~/Default.aspx?status=" + status);
                }
                catch (Exception ex)
                {
                    var validationResults = ex.Data["ValidationResults"] as IEnumerable<ValidationResult>;

                    if(validationResults != null)
                    {
                        foreach(var validationResult in validationResults)
                        {
                            foreach(var memberName in validationResult.MemberNames)
                            {
                                ModelState.AddModelError(memberName, validationResult.ErrorMessage);
                            }
                        }
                    }

                    ModelState.AddModelError(String.Empty, "Fel inträffade när kontakt skulle läggas till.");
                }
            }
        }

        public void LectureListView_UpdateItem(int LectureID)
        {

        }

        public void LectureListView_DeleteItem(int LectureID)
        {

        }
    }
}