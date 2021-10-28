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
        PasajeroBLL pasajero = new PasajeroBLL();
        //Instanciar una unica vez el formulario
        private static FrmPasajero Childinstance = null;
        private DataTable dt;
        private Pasajero oPasajero;

        public FrmPasajero()
        {
            InitializeComponent();
        }

        private void FrmPasajero_Load(object sender, EventArgs e)
        {
            this.CargarCombo();
            this.CargarColumnasGrid();
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
            cmbPais.DataSource = oPais.ObtenerPais();
            cmbPais.DropDownStyle = ComboBoxStyle.DropDownList;
            cmbPais.ValueMember = "IdPais";
            cmbPais.DisplayMember = "NombrePais";
            cmbPais.Text = "--Seleccione--";
        }

        private void CmdGuardar_Click(object sender, EventArgs e)
        {
            oPasajero = new Pasajero();
            var fila = (DataRowView)cmbPais.SelectedItem;
            LimpiarValidadores();
            if (ValidarFormulario())
            {
                int exito = 0;
                Pasajero p = new Pasajero();
                p.PrimerNombre = this.txtPnombre.Text;
                p.PrimerApellido = this.txtPapellido.Text;
                p.SegundoNombre = this.txtSnombre.Text;
                p.SegundoApellido = this.txtSapellido.Text;
                p.FechaNacimiento = this.dtpFechaNacimiento.Value;
                p.NoIdentificacion = this.txtIdentificacion.Text;
                p.Email = this.txtEmail.Text;
                p.IdPais = Convert.ToInt32(fila.Row.ItemArray[0]);
                p.Telefono = this.txtTelefono.Text;
                p.UsuarioCreacion = "respinoza";
                p.FechaCreacion = DateTime.Now;

                exito = pasajero.GuardarPasajero(p);
                if (exito > 0)
                {
                    MessageBox.Show("Se realizo el guardado sastifactoriamente", "Exito", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    p = null;
                    this.LimpiarControles();
                    this.oPasajero = pasajero.ObtenerPasajeroId(exito);
                    this.CargarDataGrid(oPasajero);
                }
                else
                {
                    MessageBox.Show("Ah ocurrido un error inesperado...!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void LimpiarControles()
        {
            this.txtPnombre.Text = string.Empty;
            this.txtPapellido.Text = string.Empty;
            this.txtSnombre.Text = string.Empty;
            this.txtSapellido.Text = string.Empty;
            this.txtTelefono.Text = string.Empty;
            this.txtIdentificacion.Text = string.Empty;
            this.txtEmail.Text = string.Empty;
        }

        private bool ValidarFormulario()
        {
            bool exito = true;
            if (txtPnombre.Text == "")
            {
                exito = false;
                pError.SetError(txtPnombre, "Requerido");
            }
            if (txtPapellido.Text=="")
            {
                exito = false;
                pError.SetError(txtPapellido, "Requerido");
            }
            if (txtTelefono.Text=="")
            {
                exito = false;
                pError.SetError(txtTelefono, "Requerido");
            }
            if (txtEmail.Text == "")
            {
                exito = false;
                pError.SetError(txtEmail, "Requerido");
            }
            if (cmbPais.SelectedIndex < 0)
            {
                exito = false;
                pError.SetError(cmbPais, "Requerido");
            }
            return exito;
        }

        private void LimpiarValidadores()
        {
            pError.SetError(txtPnombre, "");
            pError.SetError(txtPapellido, "");
            pError.SetError(txtSnombre, "");
            pError.SetError(txtSapellido, "");
            pError.SetError(txtTelefono, "");
            pError.SetError(txtEmail, "");
        }

        private void CargarColumnasGrid()
        {
            dt = new DataTable();
            dt.Columns.Add("Identificacion");
            dt.Columns.Add("Nombre Completo");
            dt.Columns.Add("Fecha de Nacimiento");
            dt.Columns.Add("Email");
            GridPasajero.DataSource = dt;
        }
        private void CargarDataGrid(Pasajero p)
        {
            DataRow fila = dt.NewRow();
            fila["Identificacion"] = p.NoIdentificacion;
            fila["Nombre Completo"] = p.NombreCompleto;
            fila["Fecha de Nacimiento"] = p.FechaNacimiento;
            fila["Email"] = p.Email;

            dt.Rows.Add(fila);

        }
    }
}