namespace DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Usuario")]
    public partial class Usuario
    {
        [Key]
        public int IdUsuario { get; set; }

        [Required]
        [StringLength(100)]
        public string NombreUsuario { get; set; }

        [Required]
        [StringLength(20)]
        public string Clave { get; set; }

        [Required]
        [StringLength(50)]
        public string PrimerNombre { get; set; }

        [Required]
        [StringLength(50)]
        public string PrimerApellido { get; set; }

        [StringLength(50)]
        public string SegundoNombre { get; set; }

        [StringLength(50)]
        public string SegundoApellido { get; set; }

        [StringLength(20)]
        public string Identificacion { get; set; }

        [StringLength(50)]
        public string Telefono { get; set; }

        [StringLength(50)]
        public string email { get; set; }

        public bool EsActivo { get; set; }

        [StringLength(100)]
        public string Pregunta { get; set; }

        [StringLength(100)]
        public string Respuesta { get; set; }

        [Required]
        [StringLength(50)]
        public string UsuarioCreacion { get; set; }

        public DateTime FechaCreacion { get; set; }

        [StringLength(50)]
        public string UsuarioModificacion { get; set; }

        public DateTime? FechaModificacion { get; set; }
    }
}
