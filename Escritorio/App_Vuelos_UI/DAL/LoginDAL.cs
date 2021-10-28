using System;
using CONEXION;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace DAL
{
    public class LoginDAL
    {
        string cnn = ConfigurationManager.ConnectionStrings["ConexionBDVuelos"].ConnectionString;
        public bool ExisteUsuario(string usuario, string clave)
        {
            bool exito = false;

            SqlConnection conexion = ConexionBD.ObtenerConexion();
            using (SqlConnection sql=new SqlConnection(cnn))
            {
                using(SqlCommand command = new SqlCommand("ObtenerUsuario", sql))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Usuario", usuario);
                    command.Parameters.AddWithValue("@Clave", clave);
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    sql.Open();
                    command.ExecuteNonQuery();
                    exito= (bool)command.ExecuteScalar();
                    //command = null;
                    sql.Close();
                }
            }
            return exito;
        }
    }
}
