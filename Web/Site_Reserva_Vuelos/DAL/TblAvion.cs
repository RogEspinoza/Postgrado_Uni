namespace DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TblAvion")]
    public partial class TblAvion
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TblAvion()
        {
            TblVuelo = new HashSet<TblVuelo>();
        }

        [Key]
        public int IdAvion { get; set; }

        public int? IdAerolinea { get; set; }

        [StringLength(120)]
        public string Fabricante { get; set; }

        [StringLength(120)]
        public string Tipo { get; set; }

        public int? Capacidad { get; set; }

        public DateTime FechaCreacion { get; set; }

        [Required]
        [StringLength(50)]
        public string UsuarioCreacion { get; set; }

        public DateTime? FechaModificacion { get; set; }

        [StringLength(50)]
        public string UsuarioModificacion { get; set; }

        public bool? Estado { get; set; }

        public virtual TblAerolinea TblAerolinea { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TblVuelo> TblVuelo { get; set; }
    }
}
