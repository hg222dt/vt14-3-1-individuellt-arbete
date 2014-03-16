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
        [StringLength(150, ErrorMessage = "Föreläsningsnamn får inte vara mer än 150 tecken långt.")]
        public string LectureName { get; set; }

        [Required(ErrorMessage = "Ange ett kursnamn")]
        [StringLength(100, ErrorMessage = "Kursnamn får inte vara mer än 100 tecken långt.")]
        public string CourseName { get; set; }

        [Required(ErrorMessage = "Ange ett datum")]
        [RegularExpression(@"^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$", ErrorMessage = "Ange en datum i rätt format. [YYYY-MM-DD]")]
        public string LectureDate { get; set; }

        [Required(ErrorMessage = "Ange namn på lärare")]
        [StringLength(50, ErrorMessage = "Namn på lärare får inte vara mer än 50 tecken långt.")]
        public string TeacherName { get; set; }

        public string VideoUrl { get; set; }
    }
}