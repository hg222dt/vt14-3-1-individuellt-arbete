using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace LectureComments.Model
{
    public class Thread
    {

        public int LectureID { get; set; }

        public int ThreadID { get; set; }

        [Required(ErrorMessage = "Ange en fråga")]
        [StringLength(300, ErrorMessage = "Frågan får inte vara mer än 300 tecken lång.")]
        public string QuestionText { get; set; }

        [Required(ErrorMessage = "Ange en tidpunkt i videon. [HH:mm:ss]")]
        [RegularExpression(@"^(?:(?:([01]?\d|2[0-3]):)?([0-5]?\d):)?([0-5]?\d)$", ErrorMessage = "Ange en tidkod i rätt format. [HH:mm:ss]")]
        public string Timecode { get; set; }

        [Required(ErrorMessage = "Ange ditt namn")]
        [StringLength(40, ErrorMessage = "Namnet får inte vara mer än 40 tecken långt")]
        public string Author { get; set; }

        public string Date { get; set; }

        public int DiscRowID { get; set; }
    }
}