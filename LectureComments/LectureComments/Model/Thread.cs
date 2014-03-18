using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

//Affärslogiklager för data kring Tråd, tillsammans med DiscussionRow

namespace LectureComments.Model
{
    public class Thread
    {

        //Id på föreläsning
        public int LectureID { get; set; }

        //Id på tråd
        public int ThreadID { get; set; }

        //Text till kommentar. Validering, Required, och längd av sträng.
        [Required(ErrorMessage = "Ange en fråga")]
        [StringLength(300, ErrorMessage = "Frågan får inte vara mer än 300 tecken lång.")]
        public string QuestionText { get; set; }

        //Angiven tidkod i videoklippet. Validering, Required och Regex
        [Required(ErrorMessage = "Ange en tidpunkt i videon. [HH:mm:ss]")]
        [RegularExpression(@"^(?:(?:([01]?\d|2[0-3]):)?([0-5]?\d):)?([0-5]?\d)$", ErrorMessage = "Ange en tidkod i rätt format. [HH:mm:ss]")]
        public string Timecode { get; set; }

        //Avsändare av kommentar. Validering - Required och längd av sträng.
        [Required(ErrorMessage = "Ange ditt namn")]
        [StringLength(40, ErrorMessage = "Namnet får inte vara mer än 40 tecken långt")]
        public string Author { get; set; }

        //Datum för när kommentaren är skriven första gången.
        public string Date { get; set; }

        //Id för berörd rad i tabellen DicussionRow
        public int DiscRowID { get; set; }
    }
}