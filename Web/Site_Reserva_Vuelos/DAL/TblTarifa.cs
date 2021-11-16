namespace DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Data.Entity;
    using System.Linq;

    [Table("TblTarifa")]
    public partial class TblTarifa
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TblTarifa()
        {
            TblVuelo = new HashSet<TblVuelo>();
        }

        [Key]
        public int IdTarifa { get; set; }

        [StringLength(20)]
        public string Clase { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? Precio { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? Impuesto { get; set; }

        [Required]
        [StringLength(50)]
        public string UsuarioCreacion { get; set; }

        public DateTime? FechaModificacion { get; set; }

        [StringLength(50)]
        public string UsuarioModificacion { get; set; }

        public bool? Estado { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TblVuelo> TblVuelo { get; set; }

        public List<TblTarifa>ObtenerListaTarifas()
        {
            try
            {
                using (var cn =new BDVuelos())
                {
                    //return cn.TblTarifa.ToList();
                    return cn.Database.SqlQuery<TblTarifa>("ObtenerListaTarifa").ToList();
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }
    }
}
