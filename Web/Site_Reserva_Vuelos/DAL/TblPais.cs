namespace DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class TblPais
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TblPais()
        {
            TblPasajero = new HashSet<TblPasajero>();
        }

        [Key]
        public int IdPais { get; set; }

        [Required]
        [StringLength(100)]
        public string NombrePais { get; set; }

        public bool? EsActivo { get; set; }

        [Required]
        [StringLength(50)]
        public string UsuarioCreacion { get; set; }

        public DateTime FechaCreacion { get; set; }

        [StringLength(50)]
        public string UsuarioModificacion { get; set; }

        public DateTime? FechaModificacion { get; set; }

        [StringLength(50)]
        public string Codigo { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TblPasajero> TblPasajero { get; set; }
    }
}
