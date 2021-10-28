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
        public int GuardarPasajero(Pasajero p)
        {
            int exito = 0;
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
                    //command.ExecuteNonQuery();
                    exito = (int)command.ExecuteScalar();
                    //command = null;
                    sql.Close();
                }
            }
            return exito;
        }

        //SE OBTIENE PASAJERO POR EL ID
        public Pasajero ObtenerPasajeroId(int id)
        {
            //List<Pasajero> lista = new List<Pasajero>();
            Pasajero pasajero = new Pasajero();
            DataTable dt = new DataTable();
            SqlConnection conexion = ConexionBD.ObtenerConexion();
            using (SqlConnection sql = new SqlConnection(cnn))
            {
                using (SqlCommand command = new SqlCommand("ObtenerPasajeroID", sql))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@IdPasajero", id);
                    command.CommandTimeout = 0;
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    sql.Open();
                    command.ExecuteNonQuery();
                    adapter.SelectCommand = command;
                    adapter.Fill(dt);
                    sql.Close();
                    Pasajero p = new Pasajero();
                    if (dt.Rows.Count > 0)
                    {
                        p.IdPasajero = Convert.ToInt32(dt.Rows[0][0]);
                        p.PrimerNombre = Convert.ToString( dt.Rows[0][1]);
                        p.SegundoNombre = Convert.ToString( dt.Rows[0][2]);
                        p.PrimerApellido = Convert.ToString( dt.Rows[0][3]);
                        p.SegundoApellido = Convert.ToString( dt.Rows[0][4]);
                        p.NombreCompleto = Convert.ToString( dt.Rows[0][5]);
                        p.NoIdentificacion = Convert.ToString( dt.Rows[0][6]);
                        p.FechaNacimiento = Convert.ToDateTime( dt.Rows[0][7]);
                        p.Telefono = Convert.ToString( dt.Rows[0][8]);
                        p.Email = Convert.ToString( dt.Rows[0][9]);
                        p.IdPais = Convert.ToInt32( dt.Rows[0][10]);
                        p.NombrePais = Convert.ToString( dt.Rows[0][11]);
                    }
                    pasajero = p;
                }
            }
            return pasajero;
        }
    }
}
