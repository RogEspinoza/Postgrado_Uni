using System;
using System.Configuration;

namespace DAL
{
    public class DataAccess
    {
        public static string ObtenerConexion()
        {
            //SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["RocedesCS"].ConnectionString);
            string cn = ConfigurationManager.ConnectionStrings["Test"].ConnectionString;
            return cn;
        }
    }
}
