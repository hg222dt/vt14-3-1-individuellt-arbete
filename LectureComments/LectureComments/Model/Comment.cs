using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace LectureComments.Model
{
    public class Comment
    {
        [Required(ErrorMessage = "Ange en kommentar.")]
        [StringLength(300, ErrorMessage = "Kommentaren får inte vara mer än 300 tecken lång.")]
        public string DiscText { get; set;}

        public int ThreadID { get; set; }

        [Required(ErrorMessage = "Ange ditt namn")]
        [StringLength(40, ErrorMessage = "Namnet får inte vara mer än 40 tecken långt")]
        public string Author { get; set; }

        public int DiscRowID { get; set; }

        public string Date { get; set; }

        public int LectureID { get; set; }
    }
}