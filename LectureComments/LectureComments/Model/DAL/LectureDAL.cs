using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace LectureComments.Model.DAL
{
    public class LectureDAL : BaseDAL
    {
        //Hämtar alla föreläsningar från datalagret
        public IEnumerable<Lecture> GetLectures()
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var lectures = new List<Lecture>(100);

                    var cmd = new SqlCommand("appSchema.usp_GetAllLectures", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    conn.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        var lectureIdIndex = reader.GetOrdinal("LectureID");
                        var lectureNameIndex = reader.GetOrdinal("LectureName/description");
                        var courseNameIndex = reader.GetOrdinal("CourseName");
                        var dateIndex = reader.GetOrdinal("Date");
                        var teacherNameIndex = reader.GetOrdinal("TeacherName");

                        while (reader.Read())
                        {
                            lectures.Add(new Lecture
                            {
                                LectureId = reader.GetInt32(lectureIdIndex),
                                LectureName = reader.GetString(lectureNameIndex),
                                CourseName = reader.GetString(courseNameIndex),
                                LectureDate = reader.GetDateTime(dateIndex),
                                TeacherName = reader.GetString(teacherNameIndex)
                            });
                        }
                    }

                    lectures.TrimExcess();

                    return lectures;
                }
                catch
                {
                    throw new ApplicationException("An error occured while getting lectures from database.");
                }
            }
        }

        //Lägger till föreläsning i datalagret.
        public void InsertLecture(Lecture Lecture)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var cmd = new SqlCommand("appSchema.usp_CreateLecture", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Date", SqlDbType.Date).Value = Lecture.LectureDate;
                    cmd.Parameters.Add("@Teacher", SqlDbType.NVarChar, 50).Value = Lecture.TeacherName;
                    cmd.Parameters.Add("@LectureName", SqlDbType.NVarChar, 50).Value = Lecture.LectureName;
                    cmd.Parameters.Add("@CourseName", SqlDbType.NVarChar, 50).Value = Lecture.CourseName;
                    cmd.Parameters.Add("@VideoUrl", SqlDbType.NVarChar, 200).Value = Lecture.VideoUrl;

                    conn.Open();

                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("An error occured while adding lectures to database.");
                }
            }
        }

        //Hämtar specifik föreläsning i datalagret.
        public Lecture GetLectureById(int LectureID)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var cmd = new SqlCommand("appSchema.usp_GetLectureByThreadId", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@LectureID", SqlDbType.Int, 4).Value = LectureID;
                    
                    conn.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        var lectureIdIndex = reader.GetOrdinal("LectureID");
                        var lectureNameIndex = reader.GetOrdinal("LectureName/description");
                        var courseNameIndex = reader.GetOrdinal("CourseName");
                        var dateIndex = reader.GetOrdinal("Date");
                        var teacherNameIndex = reader.GetOrdinal("TeacherName");
                        var videoUrlIndex = reader.GetOrdinal("VideoUrl");

                        if (reader.Read())
                        {
                            return new Lecture
                            {
                                LectureId = reader.GetInt32(lectureIdIndex),
                                LectureName = reader.GetString(lectureNameIndex),
                                CourseName = reader.GetString(courseNameIndex),
                                LectureDate = reader.GetDateTime(dateIndex),
                                TeacherName = reader.GetString(teacherNameIndex),
                                VideoUrl = reader.GetString(videoUrlIndex)
                            };
                        }
                    }

                    return null;
                }
                catch
                {
                    throw new ApplicationException("An error occured while getting lectures from database.");
                }
            }
        }

        //Uppdaterar föreläsning i datalagret.
        public void UpdateLecture(Lecture Lecture)
        {
            //Skapar och initierar anslutningobjekt
            using (SqlConnection conn = CreateConnection())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("appSchema.usp_UpdateLecture", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Date", SqlDbType.Date).Value = Lecture.LectureDate;
                    cmd.Parameters.Add("@TeacherName", SqlDbType.NVarChar, 50).Value = Lecture.TeacherName;
                    cmd.Parameters.Add("@LectureName", SqlDbType.NVarChar, 50).Value = Lecture.LectureName;
                    cmd.Parameters.Add("@CourseName", SqlDbType.NVarChar, 50).Value = Lecture.CourseName;
                    cmd.Parameters.Add("@LectureID", SqlDbType.NVarChar, 50).Value = Lecture.LectureId;
                    cmd.Parameters.Add("@VideoUrl", SqlDbType.NVarChar, 200).Value = Lecture.VideoUrl;

                    conn.Open();

                    cmd.ExecuteNonQuery();

                }
                catch
                {
                    throw new ApplicationException("Problem occured while updating lecture.");
                }
            }
        }

        //Tar bort specifik föreläsning i föreläsning.
        public void DeleteLecture (int LectureID)
        {
            using (SqlConnection conn = CreateConnection())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("appSchema.usp_EraseLecture", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@LectureID", SqlDbType.Int, 4).Value = LectureID;

                    conn.Open();

                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("Problem occured while deleting Lecture in database.");
                }
            }
        }
    }
}