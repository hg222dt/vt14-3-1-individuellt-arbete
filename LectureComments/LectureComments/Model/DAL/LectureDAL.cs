using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace LectureComments.Model.DAL
{
    public class LectureDAL
    {
        //Tillhandalhåller fält för connectionstring för att ansluta till servern.
        #region Fält
        /// <summary>
        /// Sträng med information som används för att ansluta till "SQL-server"-databasen.
        /// (Ett statiskt fält tillhör klassen och delas av alla instanser av klassen).
        /// </summary>
        private static readonly string _connectionString;

        #endregion

        #region Konstruktorer

        /// <summary>
        /// Initierar statisk data. (Konstruktorn anropas automatiskt innan första instansen skapas
        /// eller innan någon statisk medlem används.)
        /// </summary>
        static LectureDAL()
        {
            _connectionString = WebConfigurationManager.ConnectionStrings["lectureConnectionString"].ConnectionString;
        }
        #endregion

        #region Privata hjälpmetoder
        /// <summary>
        /// Skapar och initierar ett nytt anslutningsobjekt
        /// </summary>
        /// <returns>Referens till ett nytt SqlConnection-objekt</returns>

        private static SqlConnection CreateConnection()
        {
            return new SqlConnection(_connectionString);
        }
        #endregion

        //Hämtar alla föreläsningar från datalagret
        public IEnumerable<Lecture> GetLectures()
        {
            using (var conn = CreateConnection())
            {
                //try
                //{
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
                                LectureDate = reader.GetString(dateIndex),
                                TeacherName = reader.GetString(teacherNameIndex)
                            });
                        }
                    }

                    lectures.TrimExcess();

                    return lectures;
                //}
                //catch
                //{
                //    throw new ApplicationException("An error occured while getting lectures from database.");
                //}
            }
        }
    }
}