using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;


//Affärslogiklager med specifik inriktning på data innehållandes i en diskussionstråd.

namespace LectureComments.Model
{
    public class ThreadOnly
    {
        //Id för föreläsnignen
        public int LectureID { get; set; }

        //Id för tråden
        public int ThreadID { get; set; }

        //Tidkoden i videoklippet som koden är registrerad på, m validering för Required, coh regex.
        [Required(ErrorMessage = "Ange en tidpunkt i videon. [HH:mm:ss]")]
        //[RegularExpression(@"^(?:(?:([01]?\d|2[0-3]):)?([0-5]?\d):)?([0-5]?\d)$", ErrorMessage = "Ange en tidkod i rätt format. [HH:mm:ss]")]
        public TimeSpan Timecode { get; set; }
    }
}