using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using ENTIDAD;
using CONEXION;

namespace DAL
{
    public class PasajeroDAL
    {
        //public DataTable ObtenerPasajero()
        //{
        //    var dt = new DataTable();
        //    try
        //    {
        //        dt = ConexionBD.Leer();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new System.ArgumentException(ex.Message);
        //    }
        //}

        public int GuardarPasajero(Pasajero p)
        {
            int exito = 0;
            try
            {
                exito=ConexionBD.Guardar()
            }
            catch (Exception)
            {

                throw;
            }

        }
    }
}
