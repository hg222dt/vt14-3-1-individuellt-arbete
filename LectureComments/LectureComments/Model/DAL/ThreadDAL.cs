using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace LectureComments.Model.DAL
{
    public class ThreadDAL
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
        static ThreadDAL()
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

        public void StartThread(Thread Thread)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var cmd = new SqlCommand("appSchema.usp_CreateThread", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@QuestionText", SqlDbType.NVarChar, 300).Value = Thread.QuestionText;
                    cmd.Parameters.Add("@LectureID", SqlDbType.NVarChar, 50).Value = Thread.LectureID;
                    cmd.Parameters.Add("@Timecode", SqlDbType.Time, 0).Value = Thread.Timecode;
                    cmd.Parameters.Add("@Author", SqlDbType.NVarChar, 50).Value = Thread.Author;

                    conn.Open();

                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("An error occured while adding thread to database.");
                }
            }
        }

        public IEnumerable<Thread> getThreadByID(int LectureID)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var thread = new List<Thread>(100);

                    var cmd = new SqlCommand("appSchema.usp_GetThreadsInLecture", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@LectureID", SqlDbType.Int, 4).Value = LectureID;

                    conn.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        var threadIdIndex = reader.GetOrdinal("ThreadID");
                        var lectureIdIndex = reader.GetOrdinal("LectureID");
                        var discTextIndex = reader.GetOrdinal("DiscText");
                        var dateIndex = reader.GetOrdinal("Date");
                        var authorNameIndex = reader.GetOrdinal("Author");
                        var timecodeIndex = reader.GetOrdinal("Timecode");
                        var discRowIdIndex = reader.GetOrdinal("DiscRowID");

                        while (reader.Read())
                        {
                            thread.Add(new Thread
                            {
                                ThreadID = reader.GetInt32(threadIdIndex),
                                LectureID = reader.GetInt32(lectureIdIndex),
                                QuestionText = reader.GetString(discTextIndex),
                                Date = reader.GetString(dateIndex),
                                Author = reader.GetString(authorNameIndex),
                                Timecode = reader.GetString(timecodeIndex),
                                DiscRowID = reader.GetInt32(discRowIdIndex)
                            });
                        }
                    }

                    thread.TrimExcess();

                    return thread;
                }
                catch
                {
                    throw new ApplicationException("An error occured while retrieving thread from database.");
                }
            }
        }

        public IEnumerable<ThreadOnly> getThreadByID2(int LectureID)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var thread = new List<ThreadOnly>(100);

                    var cmd = new SqlCommand("appSchema.usp_GetThreadsInLecture2", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@LectureID", SqlDbType.Int, 4).Value = LectureID;

                    conn.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        var threadIdIndex = reader.GetOrdinal("ThreadID");
                        var lectureIdIndex = reader.GetOrdinal("LectureID");             
                        var timecodeIndex = reader.GetOrdinal("Timecode");
   
                        while (reader.Read())
                        {
                            thread.Add(new ThreadOnly
                            {
                                ThreadID = reader.GetInt32(threadIdIndex),
                                LectureID = reader.GetInt32(lectureIdIndex),
                                Timecode = reader.GetString(timecodeIndex)
                            });
                        }
                    }

                    thread.TrimExcess();

                    return thread;
                }
                catch
                {
                    throw new ApplicationException("An error occured while retrieving thread from database.");
                }
            }
        }

        public Question GetQuestionById(int QuestionID)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var cmd = new SqlCommand("appSchema.usp_GetDiscRow", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@DiscRowID", SqlDbType.Int, 4).Value = QuestionID;

                    conn.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        var discRowIdIndex = reader.GetOrdinal("DiscRowID");
                        var discTextIndex = reader.GetOrdinal("DiscText");
                        var dateTimeIndex = reader.GetOrdinal("DateTime");

                        if (reader.Read())
                        {
                            return new Question
                            {
                                QuestionID = reader.GetInt32(discRowIdIndex),
                                DiscText = reader.GetString(discTextIndex),
                                DateTime = reader.GetString(dateTimeIndex)
                            };
                        }
                    }

                    return null;
                }
                catch
                {
                    throw new ApplicationException("An error occured while retrieving comment from database.");
                }
            }
        }

        public void UpdateComment(Question Question)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var cmd = new SqlCommand("appSchema.usp_SaveDiscRow", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@DiscRowID", SqlDbType.Int, 4).Value = Question.DiscText;
                    cmd.Parameters.Add("@DiscText", SqlDbType.NVarChar, 300).Value = Question.DiscText;

                    conn.Open();

                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("An error occured while adding comment to database.");
                }
            }
        }
    }
}