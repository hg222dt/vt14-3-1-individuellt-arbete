using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LectureComments.Model
{
    public class Thread
    {

        public int LectureID { get; set; }

        public int ThreadID { get; set; }

        public string QuestionText { get; set; }

        public string Timecode { get; set; }

        public string Author { get; set; }

        public string Date { get; set; }

    }
}