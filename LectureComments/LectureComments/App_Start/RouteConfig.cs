using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace LectureComments.App_Start
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("CreateLecture",
                "forelasning/ny",
                "~/Pages/RegLecturePages/CreateLecture.aspx");

            routes.MapPageRoute("EditLecture",
                "forelasning/redigera",
                "~/Pages/EditLecture.aspx");

            routes.MapPageRoute("CustomerListing",
                "",
                "~/Pages/RegLecturePages/Listing");

            routes.MapPageRoute("Default",
                "",
                "~/Pages/RegLecturePages/Listing");
        }
    }
}