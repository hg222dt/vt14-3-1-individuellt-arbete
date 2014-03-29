using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace LectureComments.Model.DAL
{
    public class ThreadDAL : BaseDAL
    {
        //Lägger till ny tråd samt första kommentar i tråden, i datalagret.
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
                    cmd.Parameters.Add("@Timecode", SqlDbType.Time).Value = Thread.Timecode;
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

        //Hämtar all data till tråd-objekt beroende på specifik lektion
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
                                Timecode = reader.GetTimeSpan(timecodeIndex),
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

        //Hämtar alla trådar i specifik lektion från datalagret.
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
                                Timecode = reader.GetTimeSpan(timecodeIndex)
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
    }
}