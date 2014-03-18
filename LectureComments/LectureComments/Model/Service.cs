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

        //Hämtar föreläsningsobjekt från DAL beroende på Id på föreläsning.
        public Lecture GetLecture(int LectureID)
        {
            return LectureDAL.GetLectureById(LectureID);
        }

        //Hämtar kommentarsobjekt beroende på id av kommentar som skickas som argument.
        public Comment GetCommentById(int DiscRowID)
        {
            return DiscRowDAL.GetCommentById(DiscRowID);
        }

        //Sparar eller uppdaterar en föreläsning, med föreläsningsobjekt som parameter.
        public void SaveLecture(Lecture lecture)
        {
            //Validering av föreläsning som ska sparas eller uppdateras
            ICollection<ValidationResult> validationResults;
            if (!lecture.Validate(out validationResults))
            {
                var ex = new ValidationException("Objektet klararde inte valideringen.");
                ex.Data.Add("ValidationResults", validationResults);
                throw ex;
            }

            //Om föreläsningens id  är 0, ska föreläsningen sparas. I annat fall uppdateras.
            if (lecture.LectureId == 0)
            {
                LectureDAL.InsertLecture(lecture);
            }
            else
            {
                LectureDAL.UpdateLecture(lecture);
            }
        }

        //Ta bort föreläsning. Parameter - föreläsnings-id
        public void DeleteLecture(int id)
        {
            LectureDAL.DeleteLecture(id);
        }

        //Startar ny diskussionstråd i förelsäning. Argument - Tråd-objket.
        public void StartThread(Thread Thread)
        {
            ThreadDAL.StartThread(Thread);
        }

        //Returnerar alla trådobjekt (Thread) till specifik föreläsning.
        public IEnumerable<Thread> getThreadByID(int LectureID)
        {
            return ThreadDAL.getThreadByID(LectureID);
        }

        //Returnerar alla trådobjekt (ThreadOnly) till specifik föreläsning.
        public IEnumerable<ThreadOnly> getThreadByID2(int LectureID)
        {
            return ThreadDAL.getThreadByID2(LectureID);
        }

        //Sparar eller uppdaterar kommentar i tråd, med Comment-objekt som argument.
        public void SaveComment (Comment Comment)
        {
            //Validering av kommentar.
            ICollection<ValidationResult> validationResults;
            if (!Comment.Validate(out validationResults))
            {
                var ex = new ValidationException("Objektet klararde inte valideringen.");
                ex.Data.Add("ValidationResults", validationResults);
                throw ex;
            }

            //Om kommentarens id är 0 ska en den sparas som en ny kommentar. I annat fall uppdateras.
            if (Comment.DiscRowID == 0)
            {
                DiscRowDAL.InsertDiscRow(Comment);
            }
            else
            {
                DiscRowDAL.UpdateDiscRow(Comment);
            }
        }

        //Tar bort kommentar utifrån id.
        public void DeleteComment(int id)
        {
            DiscRowDAL.DeleteDiscRow(id);
        }

        //Returnerar alla kommentarer i specifik tråd.
        public IEnumerable<Comment> getCommentsInThread(int ThreadID)
        {
            return DiscRowDAL.getCommentsInThread(ThreadID);
        }
    }
}