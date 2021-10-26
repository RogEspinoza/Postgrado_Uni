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

namespace App_Vuelos_UI.Seguridad
{
    public partial class frmIngresar : DevExpress.XtraEditors.XtraForm
    {
        public frmIngresar()
        {
            InitializeComponent();
        }

        private void cmdIngresar_Click(object sender, EventArgs e)
        {
            string usuario = this.txtUsuario.Text;
            string contrasenia = this.txtContrasenia.Text;
        }
    }
}