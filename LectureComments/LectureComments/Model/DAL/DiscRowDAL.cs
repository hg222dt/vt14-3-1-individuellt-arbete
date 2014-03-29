using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace LectureComments.Model.DAL
{
    public class DiscRowDAL : BaseDAL
    {
        //Lägger till kommentar i datalagret.
        public void InsertDiscRow(Comment Comment)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var cmd = new SqlCommand("appSchema.usp_CreateDiscRow", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@DiscText", SqlDbType.NVarChar, 300).Value = Comment.DiscText;
                    cmd.Parameters.Add("@Author", SqlDbType.NVarChar, 40).Value = Comment.Author;
                    cmd.Parameters.Add("@ThreadID", SqlDbType.Int, 4).Value = Comment.ThreadID;

                    conn.Open();

                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("An error occured while adding comment to database.");
                }
            }
        }

        //Uppdaterar kommentar i datalagret.
        public void UpdateDiscRow(Comment Comment)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var cmd = new SqlCommand("appSchema.usp_UpdateComment", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@DiscText", SqlDbType.NVarChar, 300).Value = Comment.DiscText;
                    cmd.Parameters.Add("@Author", SqlDbType.NVarChar, 40).Value = Comment.Author;
                    cmd.Parameters.Add("@DiscRowID", SqlDbType.Int, 4).Value = Comment.DiscRowID;
                    cmd.Parameters.Add("@ThreadID", SqlDbType.Int, 4).Value = Comment.ThreadID;
                    cmd.Parameters.Add("@Date", SqlDbType.SmallDateTime).Value = Comment.Date;

                    conn.Open();

                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("An error occured while updating comment in database.");
                }
            }
        }

        //Tar bort kommentar i datalagret.
        public void DeleteDiscRow(int discRowID)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var cmd = new SqlCommand("appSchema.usp_EraseComment", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@DiscRowID", SqlDbType.Int, 4).Value = discRowID;

                    conn.Open();

                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("An error occured while deleting comment in database.");
                }
            }
        }

        //Hämtar specifik kommentar i datalagret.
        public Comment GetCommentById(int DiscRowID)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var cmd = new SqlCommand("appSchema.usp_GetDiscRow", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@DiscRowID", SqlDbType.Int, 4).Value = DiscRowID;

                    conn.Open();

                    using (var reader = cmd.ExecuteReader())
                    {          
                        var discRowIdIndex = reader.GetOrdinal("DiscRowID");
                        var discTextIndex = reader.GetOrdinal("DiscText");
                        var dateIndex = reader.GetOrdinal("Date");
                        var lectureIdIndex = reader.GetOrdinal("LectureID");
                        var authorIndex = reader.GetOrdinal("Author");
                        var threadIdIndex = reader.GetOrdinal("ThreadID");

                        if (reader.Read())
                        {
                            return new Comment
                            {
                                LectureID = reader.GetInt32(lectureIdIndex),
                                ThreadID = reader.GetInt32(threadIdIndex),
                                DiscRowID = reader.GetInt32(discRowIdIndex),
                                DiscText = reader.GetString(discTextIndex),
                                Author = reader.GetString(authorIndex),
                                Date = reader.GetDateTime(dateIndex)
                            };
                        }
                    }

                    return null;
                }
                catch
                {
                    throw new ApplicationException("An error occured while retriving comment from database.");
                }
            }

        }

        //Hämtar kommentarer från datalagret i specifik tråd.
        public IEnumerable<Comment> getCommentsInThread(int ThreadID)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var comments = new List<Comment>(100);

                    var cmd = new SqlCommand("appSchema.usp_GetCommentsInThread", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@ThreadID", SqlDbType.Int, 4).Value = ThreadID;

                    conn.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        var discRowIdIndex = reader.GetOrdinal("DiscRowID");
                        var discTextIndex = reader.GetOrdinal("DiscText");
                        var dateIndex = reader.GetOrdinal("Date");
                        var lectureIdIndex = reader.GetOrdinal("LectureID");
                        var authorIndex = reader.GetOrdinal("Author");
                        var threadIdIndex = reader.GetOrdinal("ThreadID");

                        while (reader.Read())
                        {
                            comments.Add(new Comment
                            {
                                LectureID = reader.GetInt32(lectureIdIndex),
                                ThreadID = reader.GetInt32(threadIdIndex),
                                DiscRowID = reader.GetInt32(discRowIdIndex),
                                DiscText = reader.GetString(discTextIndex),
                                Author = reader.GetString(authorIndex),
                                Date = reader.GetDateTime(dateIndex)
                            });
                        }
                    }

                    comments.TrimExcess();
                    return comments;
                }
                catch
                {
                    throw new ApplicationException("An error occured while getting lectures from database.");
                }
            }
        }
    }
}