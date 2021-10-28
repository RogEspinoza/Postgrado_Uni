using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using ENTIDAD;

namespace BLL
{
    public class LoginBLL
    {
        LoginDAL login = new LoginDAL();

        public bool ExisteUsuario(string usuario, string clave)
        {
            return login.ExisteUsuario(usuario, clave);
        }
    }
}
