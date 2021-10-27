--*****CRUD DE PAIS
CREATE OR ALTER PROCEDURE ObtenerTodosPais
AS
BEGIN
	SELECT * FROM dbo.TblPais
END
GO

--*****GUARDAR
--PROCEDIMIENTOS ALMACENADOS
--CRUD PAIS
CREATE OR ALTER PROCEDURE GuardarPais
	@NombrePais VARCHAR(100),
	@EsActivo BIT,
	@UsuarioCreacion VARCHAR(50) ,
	@FechaCreacion DATETIME,
	@UsuarioModificacion VARCHAR(50),
	@FechaModificacion DATETIME
AS
BEGIN
	INSERT INTO TblPais(
		NombrePais,
		EsActivo,
		UsuarioCreacion,
		FechaCreacion
	)
	VALUES(
		@NombrePais,
		@EsActivo,
		@UsuarioCreacion,
		@FechaCreacion
	)
END
