using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace LectureComments.Model.DAL
{
    public abstract class BaseDAL
    {
        // Sträng med information som används för att ansluta till "SQL-server"-databasen.
        // (Ett statiskt fält tillhör klassen och delas av alla instanser av klassen).
        
        private static readonly string _connectionString;

        // Skapar och initierar ett nytt anslutningsobjekt
        //Returnerar referens till ett nytt SqlConnection-objekt
        protected static SqlConnection CreateConnection()
        {
            return new SqlConnection(_connectionString);
        }

        //Konstruktor
        static BaseDAL()
        {
            _connectionString = WebConfigurationManager.ConnectionStrings["lectureConnectionString"].ConnectionString;
        }

    }
}