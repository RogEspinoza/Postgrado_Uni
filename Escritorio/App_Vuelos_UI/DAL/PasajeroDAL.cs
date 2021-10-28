using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using ENTIDAD;
using CONEXION;
using System.Configuration;

namespace DAL
{
    public class PasajeroDAL
    {
        string cnn = ConfigurationManager.ConnectionStrings["ConexionBDVuelos"].ConnectionString;
        public bool GuardarPasajero(Pasajero p)
        {
            bool exito = false;
            Usuario user = new Usuario();
            SqlConnection conexion = ConexionBD.ObtenerConexion();
            using (SqlConnection sql = new SqlConnection(cnn))
            {
                using (SqlCommand command = new SqlCommand("GuardarPasajero", sql))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@PrimerNombre", p.PrimerNombre);
                    command.Parameters.AddWithValue("@PrimerApellido", p.PrimerApellido);
                    command.Parameters.AddWithValue("@SegundoNombre", p.SegundoNombre);
                    command.Parameters.AddWithValue("@SegundoApellido", p.SegundoApellido);
                    command.Parameters.AddWithValue("@Identificacion", p.NoIdentificacion);
                    command.Parameters.AddWithValue("@FechaNacimiento", p.FechaNacimiento);
                    command.Parameters.AddWithValue("@Telefono", p.Telefono);
                    command.Parameters.AddWithValue("@Email", p.Email);
                    command.Parameters.AddWithValue("@IdPais", p.IdPais);
                    command.Parameters.AddWithValue("@UsuarioCreacion", p.UsuarioCreacion);
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    sql.Open();
                    command.ExecuteNonQuery();
                    exito = (bool)command.ExecuteScalar();
                    //command = null;
                    sql.Close();
                }
            }
            return exito;
        }
    }
}
