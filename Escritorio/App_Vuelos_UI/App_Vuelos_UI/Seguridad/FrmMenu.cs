using App_Vuelos_UI.Operaciones;
using DevExpress.XtraBars;
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
    public partial class FrmMenu : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public FrmMenu()
        {
            InitializeComponent();
        }

        private void barButtonPais_ItemClick(object sender, ItemClickEventArgs e)
        {

        }

        private void barButtonVuelo_ItemClick(object sender, ItemClickEventArgs e)
        {
            //Invocar Formulario
            FrmIngresoVuelo frm = FrmIngresoVuelo.instance();
            frm.MdiParent = this;
            frm.WindowState = FormWindowState.Maximized;
            frm.Show();
        }
    }
}