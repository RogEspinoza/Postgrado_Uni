namespace DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TblPasajero")]
    public partial class TblPasajero
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TblPasajero()
        {
            TblPago = new HashSet<TblPago>();
        }

        [Key]
        public int IdPasajero { get; set; }

        [StringLength(50)]
        public string PrimerNombre { get; set; }

        [StringLength(50)]
        public string SegundoNombre { get; set; }

        [StringLength(50)]
        public string PrimerApellido { get; set; }

        [StringLength(50)]
        public string SegundoApellido { get; set; }

        [StringLength(50)]
        public string NoIdentificacion { get; set; }

        public DateTime? FechaNacimiento { get; set; }

        [StringLength(30)]
        public string Telefono { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        public int IdPais { get; set; }

        [Required]
        [StringLength(50)]
        public string UsuarioCreacion { get; set; }

        public DateTime? FechaCreacion { get; set; }

        [StringLength(50)]
        public string UsuarioModificacion { get; set; }

        public DateTime? FechaModificacion { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TblPago> TblPago { get; set; }

        public virtual TblPais TblPais { get; set; }
    }
}
