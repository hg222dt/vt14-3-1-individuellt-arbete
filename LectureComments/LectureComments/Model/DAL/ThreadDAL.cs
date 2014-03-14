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
                    throw new ApplicationException("An error occured while adding contacts from database.");
                }
            }
        }
    }
}