using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DAL;
using ENTIDAD;

namespace BLL
{
    public class PaisBLL
    {
        PaisDAL oPais = new PaisDAL();
        public DataTable ObtenerPais()
        {
            return oPais.ObtenerPais();
        }
    }
}
