using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using ENTIDAD;

namespace BLL
{
    public class PasajeroBLL
    {
        PasajeroDAL pasajero = new PasajeroDAL();
        public int GuardarPasajero(Pasajero p ) {
            return pasajero.GuardarPasajero(p);
        }

        public Pasajero ObtenerPasajeroId(int Id)
        {
            return pasajero.ObtenerPasajeroId(Id);
        }
    }
}
