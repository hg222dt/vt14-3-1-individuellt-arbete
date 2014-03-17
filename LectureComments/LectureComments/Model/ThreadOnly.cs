using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace LectureComments.Model
{
    public class ThreadOnly
    {
        public int LectureID { get; set; }

        public int ThreadID { get; set; }

        [Required(ErrorMessage = "Ange en tidpunkt i videon. [HH:mm:ss]")]
        [RegularExpression(@"^(?:(?:([01]?\d|2[0-3]):)?([0-5]?\d):)?([0-5]?\d)$", ErrorMessage = "Ange en tidkod i rätt format. [HH:mm:ss]")]
        public string Timecode { get; set; }
    }
}