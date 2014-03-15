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

        private ThreadDAL _threadDAL;

        //Fält som skapar objekt i dataåtkomstklassen. Och koppplar referns till detta.
        private ThreadDAL ThreadDAL
        {
            get { return _threadDAL ?? (_threadDAL = new ThreadDAL()); }
        }

        //Fält som refererar till dataåtkomstlagret
        private DiscRowDAL _discRowDAL;

        //Fält som skapar objekt i dataåtkomstklassen. Och koppplar referns till detta.
        private DiscRowDAL DiscRowDAL
        {
            get { return _discRowDAL ?? (_discRowDAL = new DiscRowDAL()); }
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

        public Question GetQuestion(int QuestionID)
        {
            return ThreadDAL.GetQuestionById(QuestionID);
        }

        public Comment GetCommentById(int DiscRowID)
        {
            return DiscRowDAL.GetCommentById(DiscRowID);
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

        public void StartThread(Thread Thread)
        {
            ThreadDAL.StartThread(Thread);
        }

        public void UpdateComment(Question Question)
        {
            ThreadDAL.UpdateComment(Question);
        }

        public IEnumerable<Thread> getThreadByID(int LectureID)
        {
            return ThreadDAL.getThreadByID(LectureID);
        }

        public void SaveComment (Comment Comment)
        {
            ICollection<ValidationResult> validationResults;
            if (!Comment.Validate(out validationResults))
            {
                var ex = new ValidationException("Objektet klararde inte valideringen.");
                ex.Data.Add("ValidationResults", validationResults);
                throw ex;
            }

            if (Comment.DiscRowID == 0)
            {
                DiscRowDAL.InsertDiscRow(Comment);
            }
            else
            {
                DiscRowDAL.UpdateDiscRow(Comment);
            }
        }
    }
}