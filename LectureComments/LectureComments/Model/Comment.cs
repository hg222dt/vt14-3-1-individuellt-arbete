using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

//Affärslogiklager för kommentar.

namespace LectureComments.Model
{
    public class Comment
    {
        //Kommentarstext
        //Validering - Required. Längd på sträng.
        [Required(ErrorMessage = "Ange en kommentar.")]
        [StringLength(300, ErrorMessage = "Kommentaren får inte vara mer än 300 tecken lång.")]
        public string DiscText { get; set;}

        //Id på tråd
        public int ThreadID { get; set; }

        //Avsändare
        //Validering - Required. Längd på sträng.
        [Required(ErrorMessage = "Ange ditt namn")]
        [StringLength(40, ErrorMessage = "Namnet får inte vara mer än 40 tecken långt")]
        public string Author { get; set; }

        //Id för kommentar
        public int DiscRowID { get; set; }

        //Datum-sträng
        public string Date { get; set; }

        //Id för lektion
        public int LectureID { get; set; }
    }
}