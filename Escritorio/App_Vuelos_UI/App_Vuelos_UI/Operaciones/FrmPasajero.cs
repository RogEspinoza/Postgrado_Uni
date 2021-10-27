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

namespace App_Vuelos_UI.Operaciones
{
    public partial class FrmPasajero : DevExpress.XtraEditors.XtraForm
    {
        PaisBLL oPais = new PaisBLL();
        //Instanciar una unica vez el formulario
        private static FrmPasajero Childinstance = null;
        public FrmPasajero()
        {
            InitializeComponent();
        }

        private void FrmPasajero_Load(object sender, EventArgs e)
        {
            this.CargarCombo();
        }
        public static FrmPasajero instance()
        {
            if (Childinstance == null || Childinstance.IsDisposed == true)
            {
                Childinstance = new FrmPasajero();
            }
            Childinstance.BringToFront();
            return Childinstance;
        }

        private void CargarCombo()
        {
            //cmbPais.Items.Insert(0, "Seleccionar");
            cmbPais.DataSource = oPais.ObtenerPais();
            cmbPais.DisplayMember = "IdPais";
            cmbPais.DisplayMember = "NombrePais";
            cmbPais.Text = "--Seleccione--";
            cmbPais.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private void CmdGuardar_Click(object sender, EventArgs e)
        {
            Pasajero p = new Pasajero();
            p.PrimerNombre = this.txtPnombre.Text;
            p.PrimerApellido = this.txtPapellido.Text;
            p.SegundoNombre = this.txtSnombre.Text;
            p.SegundoApellido = this.txtSapellido.Text;
            p.FechaNacimiento = this.dtpFechaNacimiento.Value;
            p.NoIdentificacion = this.txtIdentificacion.Text;
            p.Email = this.txtEmail.Text;
            p.Telefono = this.txtTelefono.Text;
            p.UsuarioCreacion = "respinoza";
            p.FechaCreacion = DateTime.Now;



        }
    }
}