using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CONEXION
{
    public class ConexionBD
    {
        public static SqlConnection ObtenerConexion()
        {
            //SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["RocedesCS"].ConnectionString);
            string cn = ConfigurationManager.ConnectionStrings["ConexionBDVuelos"].ConnectionString;
            return new SqlConnection(cn);
        }

        public static DataTable Leer(string Procedimiento, params object[] Parametros)
        {
            SqlConnection cn = ConexionBD.ObtenerConexion();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = Procedimiento;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 0;
            cn.Open();
            cmd.Connection = cn;
            da.SelectCommand = cmd;
            SqlCommandBuilder.DeriveParameters(cmd);

            try
            {
                if ((Parametros != null))
                {
                    for (int i = 1; i <= Parametros.Length; i++)
                    {
                        cmd.Parameters[i].Value = Parametros[i - 1];
                    }
                }

                da.Fill(dt);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return dt;
        }


        public static int Guardar(string Procedimiento, params object[] Parametros)
        {

            SqlConnection cn = ConexionBD.ObtenerConexion();
            SqlCommand cmd = new SqlCommand();
            SqlTransaction tr = null;
            int r = 0;

            try
            {
                cmd.CommandText = Procedimiento;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cn.Open();
                tr = cn.BeginTransaction();
                cmd.Connection = cn;
                cmd.Transaction = tr;
                SqlCommandBuilder.DeriveParameters(cmd);
                if (Parametros != null)
                {
                    for (int i = 1; i <= Parametros.Length; i++)
                    {
                        cmd.Parameters[i].Value = Parametros[i - 1];
                    }
                }

                r = Convert.ToInt32(cmd.ExecuteScalar());

                tr.Commit();
                cmd = null;
                cn.Close();

                return r;
            }
            catch (Exception)
            {
                tr.Rollback();
                return r;
                //throw new Exception(ex.Message);

            }
        }
    }
}
