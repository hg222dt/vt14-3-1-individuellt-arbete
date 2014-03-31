using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace LectureComments.App_Start
{

    //Route-konfigurering definierar de olika sidorna och dess url.

    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("LectureListing",   "forelasningar",                                    "~/Pages/RegLecturePages/Listing2.aspx");
            routes.MapPageRoute("CreateLecture",    "forelasning/ny",                                   "~/Pages/RegLecturePages/CreateLecture2.aspx");
            routes.MapPageRoute("DetailsLecture",   "forelasning/{id}",                                 "~/Pages/RegLecturePages/LectureDetails2.aspx");
            routes.MapPageRoute("EditLecture",      "forelasning/{id}/redigera",                        "~/Pages/RegLecturePages/EditLecture2.aspx");
            routes.MapPageRoute("DeleteLecture",    "forelasning/{id}/radera",                          "~/Pages/RegLecturePages/Delete2.aspx");
            routes.MapPageRoute("AddToThread",      "forelasning/{id}/fraga",                           "~/Pages/RegLecturePages/StartThread2.aspx");
            routes.MapPageRoute("AddComment",       "forelasning/{id2}/kommentar/{id}/ny",              "~/Pages/RegLecturePages/AddComment2.aspx");
            routes.MapPageRoute("EditComment",      "forelasning/{id2}/kommentar/{id}/uppdatera",       "~/Pages/RegLecturePages/EditComment2.aspx");
            routes.MapPageRoute("DeleteComment",    "forelasning/{id2}/kommentar/{id}/radera",          "~/Pages/RegLecturePages/DeleteComment2.aspx");

            routes.MapPageRoute("ListTest",         "forelasningar/test/{id}",                          "~/Pages/RegLecturePages/WebForm2.aspx");

            routes.MapPageRoute("Error",            "serverfel",                                        "~/Pages/Shared/Error2.aspx");
            
            routes.MapPageRoute("Default",          "",                                                 "~/Pages/RegLecturePages/Listing2.aspx");
        }
    }
}