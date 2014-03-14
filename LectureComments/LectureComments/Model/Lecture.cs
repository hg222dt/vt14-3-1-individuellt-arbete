using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace LectureComments.Model
{
    public class Lecture
    {
        public int LectureId { get; set; }

        [Required(ErrorMessage = "Ange ett föreläsningsnamn")]
        public string LectureName { get; set; }

        [Required(ErrorMessage = "Ange ett kursnamn")]
        public string CourseName { get; set; }

        [Required(ErrorMessage = "Ange ett datum")]
        public string LectureDate { get; set; }

        [Required(ErrorMessage = "Ange namn på lärare")]
        public string TeacherName { get; set; }

        public string VideoUrl { get; set; }
    }
}