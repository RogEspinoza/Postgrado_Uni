using CONEXION;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class PaisDAL
    {
        public DataTable ObtenerPais()
        {
            var dt = new DataTable();
            try
            {
                dt = ConexionBD.Leer("ObtenerTodosPais");
            }
            catch (Exception ex)
            {
                throw new System.ArgumentException(ex.Message);
            }
            return dt;
        }
    }
}
