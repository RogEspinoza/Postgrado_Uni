using DevExpress.XtraEditors;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL;
using CONEXION;
using ENTIDAD;

namespace App_Vuelos_UI.Seguridad
{
    public partial class frmIngresar : DevExpress.XtraEditors.XtraForm
    {
        LoginBLL login = new LoginBLL();
        public frmIngresar()
        {
            InitializeComponent();
        }

        private void cmdIngresar_Click(object sender, EventArgs e)
        {
            Usuario user = new Usuario();   
            var con = CONEXION.ConexionBD.ObtenerConexion();
            string usuario = this.txtUsuario.Text;
            string clave = this.txtContrasenia.Text;

            if (login.ExisteUsuario(usuario, clave))
            {
                user.NombreUsuario = usuario;
                FrmMenu fr = new FrmMenu();
                this.Hide();
                fr.Show();
            }
        }
    }
}