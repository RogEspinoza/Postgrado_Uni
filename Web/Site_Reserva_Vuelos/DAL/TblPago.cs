namespace DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TblPago")]
    public partial class TblPago
    {
        [Key]
        public int IdPago { get; set; }

        public int IdReserva { get; set; }

        public DateTime? FechaPago { get; set; }

        public int? IdPasajero { get; set; }

        public decimal? Monto { get; set; }

        public int? TipoComprobante { get; set; }

        [StringLength(10)]
        public string NumeroComprobante { get; set; }

        public int? Impuesto { get; set; }

        public DateTime FechaCreacion { get; set; }

        [Required]
        [StringLength(50)]
        public string UsuarioCreacion { get; set; }

        public DateTime? FechaModificacion { get; set; }

        [StringLength(50)]
        public string UsuarioModificacion { get; set; }

        public bool? Estado { get; set; }

        public virtual TblPasajero TblPasajero { get; set; }

        public virtual TblReserva TblReserva { get; set; }
    }
}
