using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using LectureComments.Model.DAL;

namespace LectureComments.Model
{
    public class Service
    {
        //Fält som refererar till dataåtkomstlagret
        private LectureDAL _lectureDAL;

        //Fält som skapar objekt i dataåtkomstklassen. Och koppplar referns till detta.
        private LectureDAL LectureDAL
        {
            get { return _lectureDAL ?? (_lectureDAL = new LectureDAL()); }
        }

        //Hätar alla Föreläsningar från DAL.
        public IEnumerable<Lecture> getLectures()
        {
            return LectureDAL.GetLectures();
        }

        public Lecture GetLecture(int LectureID)
        {
            return LectureDAL.GetLectureById(LectureID);
        }

        public void SaveLecture(Lecture lecture)
        {
            ICollection<ValidationResult> validationResults;
            if (!lecture.Validate(out validationResults))
            {
                var ex = new ValidationException("Objektet klararde inte valideringen.");
                ex.Data.Add("ValidationResults", validationResults);
                throw ex;
            }

            if (lecture.LectureId == 0)
            {
                LectureDAL.InsertLecture(lecture);
            }
            else
            {
                LectureDAL.UpdateLecture(lecture);
            }
        }

        public void DeleteLecture(int id)
        {
            LectureDAL.DeleteLecture(id);
        }

    }
}