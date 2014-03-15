using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace LectureComments.Model.DAL
{
    public class DiscRowDAL
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
        static DiscRowDAL()
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

        //Lägger till föreläsning i databasen
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


    }
}