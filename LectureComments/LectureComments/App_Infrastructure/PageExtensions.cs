using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace LectureComments
{
    public static class PageExtensions
    {
        //Används för att hämta temporär meddelande-data från session, och ta bort sessionen.
        public static object GetTempData(this Page page, string key)
        {
            var value = page.Session[key];
            page.Session.Remove(key);
            return value;
        }

        //Hämtar endast temporär meddelande-data
        public static object PeekTempData(this Page page, string key)
        {
            return page.Session[key];
        }

        //Sätter meddleande-data
        public static void SetTempData(this Page page, string key, object value)
        {
            page.Session[key] = value;
        }
    }
}
