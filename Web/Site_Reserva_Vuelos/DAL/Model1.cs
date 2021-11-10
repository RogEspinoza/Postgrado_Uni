using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace DAL
{
    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=BDVuelos")
        {
        }

        public virtual DbSet<TblAerolinea> TblAerolinea { get; set; }
        public virtual DbSet<TblAeropuerto> TblAeropuerto { get; set; }
        public virtual DbSet<TblAsiento> TblAsiento { get; set; }
        public virtual DbSet<TblAvion> TblAvion { get; set; }
        public virtual DbSet<TblPago> TblPago { get; set; }
        public virtual DbSet<TblPais> TblPais { get; set; }
        public virtual DbSet<TblPasajero> TblPasajero { get; set; }
        public virtual DbSet<TblReserva> TblReserva { get; set; }
        public virtual DbSet<TblTarifa> TblTarifa { get; set; }
        public virtual DbSet<TblVuelo> TblVuelo { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TblAerolinea>()
                .Property(e => e.Ruc)
                .IsUnicode(false);

            modelBuilder.Entity<TblAerolinea>()
                .Property(e => e.Nombre)
                .IsUnicode(false);

            modelBuilder.Entity<TblAerolinea>()
                .Property(e => e.UsuarioCreacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblAerolinea>()
                .Property(e => e.UsuarioModificacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblAeropuerto>()
                .Property(e => e.Nombre)
                .IsUnicode(false);

            modelBuilder.Entity<TblAeropuerto>()
                .Property(e => e.UsuarioCreacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblAeropuerto>()
                .Property(e => e.UsuarioModificacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblAeropuerto>()
                .HasMany(e => e.TblVuelo)
                .WithRequired(e => e.TblAeropuerto)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TblAsiento>()
                .Property(e => e.Letra)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TblAsiento>()
                .Property(e => e.UsuarioCreacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblAsiento>()
                .Property(e => e.UsuarioModificacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblAsiento>()
                .HasMany(e => e.TblVuelo)
                .WithRequired(e => e.TblAsiento)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TblAvion>()
                .Property(e => e.Fabricante)
                .IsUnicode(false);

            modelBuilder.Entity<TblAvion>()
                .Property(e => e.Tipo)
                .IsUnicode(false);

            modelBuilder.Entity<TblAvion>()
                .Property(e => e.UsuarioCreacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblAvion>()
                .Property(e => e.UsuarioModificacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblAvion>()
                .HasMany(e => e.TblVuelo)
                .WithRequired(e => e.TblAvion)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TblPago>()
                .Property(e => e.Monto)
                .HasPrecision(19, 2);

            modelBuilder.Entity<TblPago>()
                .Property(e => e.NumeroComprobante)
                .IsUnicode(false);

            modelBuilder.Entity<TblPago>()
                .Property(e => e.UsuarioCreacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblPago>()
                .Property(e => e.UsuarioModificacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblPais>()
                .Property(e => e.NombrePais)
                .IsUnicode(false);

            modelBuilder.Entity<TblPais>()
                .Property(e => e.UsuarioCreacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblPais>()
                .Property(e => e.UsuarioModificacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblPais>()
                .Property(e => e.Codigo)
                .IsUnicode(false);

            modelBuilder.Entity<TblPais>()
                .HasMany(e => e.TblPasajero)
                .WithRequired(e => e.TblPais)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TblPasajero>()
                .Property(e => e.PrimerNombre)
                .IsUnicode(false);

            modelBuilder.Entity<TblPasajero>()
                .Property(e => e.SegundoNombre)
                .IsUnicode(false);

            modelBuilder.Entity<TblPasajero>()
                .Property(e => e.PrimerApellido)
                .IsUnicode(false);

            modelBuilder.Entity<TblPasajero>()
                .Property(e => e.SegundoApellido)
                .IsUnicode(false);

            modelBuilder.Entity<TblPasajero>()
                .Property(e => e.NoIdentificacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblPasajero>()
                .Property(e => e.Telefono)
                .IsUnicode(false);

            modelBuilder.Entity<TblPasajero>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<TblPasajero>()
                .Property(e => e.UsuarioCreacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblPasajero>()
                .Property(e => e.UsuarioModificacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblReserva>()
                .Property(e => e.Costo)
                .HasPrecision(19, 2);

            modelBuilder.Entity<TblReserva>()
                .Property(e => e.UsuarioCreacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblReserva>()
                .Property(e => e.UsuarioModificacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblReserva>()
                .HasMany(e => e.TblPago)
                .WithRequired(e => e.TblReserva)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TblReserva>()
                .HasMany(e => e.TblVuelo)
                .WithRequired(e => e.TblReserva)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TblTarifa>()
                .Property(e => e.Clase)
                .IsUnicode(false);

            modelBuilder.Entity<TblTarifa>()
                .Property(e => e.Precio)
                .HasPrecision(19, 2);

            modelBuilder.Entity<TblTarifa>()
                .Property(e => e.Impuesto)
                .HasPrecision(19, 2);

            modelBuilder.Entity<TblTarifa>()
                .Property(e => e.UsuarioCreacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblTarifa>()
                .Property(e => e.UsuarioModificacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblVuelo>()
                .Property(e => e.UsuarioCreacion)
                .IsUnicode(false);

            modelBuilder.Entity<TblVuelo>()
                .Property(e => e.UsuarioModificacion)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.NombreUsuario)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Clave)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.PrimerNombre)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.PrimerApellido)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.SegundoNombre)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.SegundoApellido)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Identificacion)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Telefono)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.UsuarioCreacion)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.UsuarioModificacion)
                .IsUnicode(false);
        }
    }
}
