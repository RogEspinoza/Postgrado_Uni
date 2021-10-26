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

namespace App_Vuelos_UI.Operaciones
{
    public partial class FrmIngresoVuelo : DevExpress.XtraEditors.XtraForm
    {
        //Instanciar una unica vez el formulario
        private static FrmIngresoVuelo Childinstance = null;
        //public static object Childinstance { get; private set; }

        public FrmIngresoVuelo()
        {
            InitializeComponent();
        }

        private void FrmIngresoVuelo_Load(object sender, EventArgs e)
        {

        }
        public static FrmIngresoVuelo instance()
        {
            if (Childinstance == null || Childinstance.IsDisposed == true)
            {
                Childinstance = new FrmIngresoVuelo();
            }
            Childinstance.BringToFront();
            return Childinstance;
        }
    }
}