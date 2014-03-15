using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LectureComments.Model
{
    public class Comment
    {
        public string DiscText { get; set;}

        public int ThreadID { get; set; }

        public string Author { get; set; }

        public int DiscRowID { get; set; }

        public string Date { get; set; }

        public int LectureID { get; set; }
    }
}