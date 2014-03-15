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
            routes.MapPageRoute("LectureListing",   "forelasningar",                "~/Pages/RegLecturePages/Listing.aspx");
            routes.MapPageRoute("CreateLecture",    "forelasningar/ny",             "~/Pages/RegLecturePages/CreateLecture.aspx");
            routes.MapPageRoute("DetailsLecture",   "forelasningar/{id}",           "~/Pages/RegLecturePages/LectureDetails.aspx");
            routes.MapPageRoute("EditLecture",      "forelasning/{id}/redigera",    "~/Pages/RegLecturePages/EditLecture.aspx");
            routes.MapPageRoute("DeleteLecture",    "forelasning/{id}/radera",      "~/Pages/RegLecturePages/Delete.aspx");
            routes.MapPageRoute("AddToThread",      "forelasning/{id}/fraga",       "~/Pages/RegLecturePages/StartThread.aspx");
            routes.MapPageRoute("AddComment",       "forelasning/kommentera/{id}",  "~/Pages/RegLecturePages/AddComment.aspx");
            
            routes.MapPageRoute("Error",            "serverfel",                    "~/Pages/Shared/Error.aspx");
            
            routes.MapPageRoute("Default",          "",                             "~/Pages/RegLecturePages/Listing.aspx");
        }
    }
}