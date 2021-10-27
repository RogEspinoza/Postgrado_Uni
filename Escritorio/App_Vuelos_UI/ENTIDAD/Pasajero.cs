using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDAD
{
    public class Pasajero
    {
        public int IdPasajero { get; set; }
        public string PrimerNombre { get; set; }
        public string SegundoNombre { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public string NoIdentificacion { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
        public int IdPais { get; set; }
        public string UsuarioCreacion { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string UsuarioModificacion { get; set; }
        public DateTime FechaModificacion { get; set; }
	}
}
