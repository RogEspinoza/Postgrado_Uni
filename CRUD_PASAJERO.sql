--*****PASAJERO
CREATE OR ALTER PROCEDURE ObtenerPasajero
AS
BEGIN
	SELECT * FROM dbo.TblPasajero
END
GO

--*****GUARDAR PASAJERO
--select * from dbo.TblPasajero
CREATE OR ALTER PROCEDURE GuardarPasajero
@PrimerNombre VARCHAR(50),
@PrimerApellido VARCHAR(50),
@SegundoNombre VARCHAR(50) NULL,
@SegundoApellido VARCHAR(50) NULL,
@Identificacion VARCHAR(20),
@FechaNacimiento DATETIME,
@Telefono VARCHAR(20) NULL,
@Email VARCHAR(50) NULL,
@IdPais INT,
@UsuarioCreacion VARCHAR(50),
@Id_Pais INT OUTPUT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO DBO.TblPasajero(
			PrimerNombre,
			PrimerApellido,
			SegundoNombre,
			SegundoApellido,
			NoIdentificacion,
			FechaNacimiento,
			Telefono,
			Email,
			IdPais,
			UsuarioCreacion,
			FechaCreacion
			)
			VALUES(
			@PrimerApellido,
			@PrimerApellido,
			@SegundoNombre,
			@SegundoApellido,
			@Identificacion,
			@FechaNacimiento,
			@Telefono,
			@Email,
			@IdPais,
			@UsuarioCreacion,
			GETDATE()
			) 
			SELECT @Id_Pais = SCOPE_IDENTITY() 
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE()
		ROLLBACK TRANSACTION;

	END CATCH
END
GO