/*1-CREACION BD DE INVENTARIO*/
USE master
GO
--DROP DATABASE IF EXISTS BDInventario
IF DB_ID('BDVuelos') IS NOT NULL
BEGIN
     /*DESCONECTA TODOS LOS USUARIOS QUE ESTAN CONECTADOS EN LA BD*/
	 ALTER DATABASE BDVuelos SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	 /*BORRAR BD*/
	 DROP DATABASE BDVuelos
END
GO
/*CREACION DE LA BD*/
CREATE DATABASE BDVuelos
GO

USE BDVuelos
GO

---------CREACION DE TABLA PAIS
IF OBJECT_ID('TblPais') IS NULL
BEGIN
	CREATE TABLE TblPais(
		IdPais INT IDENTITY(1,1) PRIMARY KEY,
		NombrePais VARCHAR(100) NOT NULL,
		EsActivo BIT,
		UsuarioCreacion VARCHAR(50) NOT NULL,
		FechaCreacion DATETIME NOT NULL,
		UsuarioModificacion VARCHAR(50),
		FechaModificacion DATETIME
	)
END
GO
--------CREACION DE TABLA PASAJERO
IF OBJECT_ID('TblPasajero') IS NULL
BEGIN
	CREATE TABLE TblPasajero(
		IdPasajero INT IDENTITY(1,1) PRIMARY KEY,
		PrimerNombre VARCHAR(50),
		SegundoNombre VARCHAR(50),
		PrimerApellido VARCHAR(50),
		SegundoApellido VARCHAR(50),
		NoIdentificacion VARCHAR(50),
		FechaNacimiento DATE,
		Telefono VARCHAR(30),
		Email VARCHAR(50),
		IdPais INT NOT NULL,
		UsuarioCreacion VARCHAR(50)NOT NULL,
		FechaCreacion DATETIME,
		UsuarioModificacion VARCHAR(50),
		FechaModificacion DATETIME,
		CONSTRAINT FK_TblPasajero_TblPais FOREIGN KEY (IdPais) REFERENCES TblPais (IdPais)
	)
END	
GO

--------- CREACION DE TABLA AEROPUERTO
IF OBJECT_ID('TblAeropuerto') IS NULL
BEGIN
	CREATE TABLE TblAeropuerto(
	IdAeropuerto INT IDENTITY (1,1) PRIMARY KEY,
	Nombre VARCHAR(120),
	IdPais INT,
	Estado BIT NOT NULL,
	FechaRegistro DATETIME NOT NULL,
	UsuarioCreacion VARCHAR(50) NOT NULL,
	FechaModificacion DATETIME,
	UsuarioModificacion VARCHAR(50)
	)
END
GO

------- CREACION DE TABLA VUELO
IF OBJECT_ID('TblAerolinea') IS NULL
BEGIN
	CREATE TABLE TblAerolinea(
	IdAerolinea INT IDENTITY(1,1) PRIMARY KEY,
	Ruc VARCHAR(20),
	Nombre VARCHAR(120),
	FechaCreacion DATETIME NOT NULL,
	UsuarioCreacion VARCHAR(50) NOT NULL,
	FechaModificacion DATETIME,
	UsuarioModificacion VARCHAR(50),
	Estado BIT
	)
END
GO

------- CREACION DE TABLA AVION
IF OBJECT_ID('TblAvion') IS NULL
BEGIN
	CREATE TABLE TblAvion(
	IdAvion INT IDENTITY(1,1) PRIMARY KEY,
	IdAerolinea INT,
	Fabricante VARCHAR(120),
	Tipo VARCHAR(120),
	Capacidad INT,
	FechaCreacion DATETIME NOT NULL,
	UsuarioCreacion VARCHAR(50) NOT NULL,
	FechaModificacion DATETIME,
	UsuarioModificacion VARCHAR(50),
	Estado BIT,
	CONSTRAINT FK_TblAvion_TblAerolinea FOREIGN KEY (IdAerolinea) REFERENCES TblAerolinea(IdAerolinea)
	)
END
GO

------- CREACION DE TABLA ASIENTO
IF OBJECT_ID('TblAsiento') IS NULL
BEGIN
	CREATE TABLE TblAsiento(
	IdAsiento INT IDENTITY(1,1) PRIMARY KEY,
	Letra CHAR(2),
	Fila INT,
	FechaCreacion DATETIME NOT NULL,
	UsuarioCreacion VARCHAR(50) NOT NULL,
	FechaModificacion DATETIME,
	UsuarioModificacion VARCHAR(50),
	Estado BIT
	)
END
GO

------- CREACION DE TABLA VUELO
IF OBJECT_ID('TblTarifa') IS NULL
BEGIN
	CREATE TABLE TblTarifa(
	IdTarifa INT IDENTITY(1,1) PRIMARY KEY,
	Clase VARCHAR(20),
	Precio NUMERIC(19,2),
	Impuesto NUMERIC(19,2),
	UsuarioCreacion VARCHAR(50) NOT NULL,
	FechaModificacion DATETIME,
	UsuarioModificacion VARCHAR(50),
	Estado BIT
	)
END
GO

--------- CREACION DE TABLA PAGO
IF OBJECT_ID('TblReserva') IS NULL
BEGIN
	CREATE TABLE TblReserva(
		IdReserva INT IDENTITY (1,1) PRIMARY KEY,
		Costo DECIMAL(19,2),
		FechaReserva DATETIME,
		Estado BIT NOT NULL,
		FechaCreacion DATETIME NOT NULL,
		UsuarioCreacion VARCHAR(50) NOT NULL,
		FechaModificacion DATETIME,
		UsuarioModificacion VARCHAR(50),
	)
END
GO

------- CREACION DE TABLA VUELO
IF OBJECT_ID('TblVuelo') IS NULL
BEGIN
	CREATE TABLE TblVuelo(
	IdAvion INT,
	IdAeropuerto INT,
	IdReserva INT,
	IdAsiento INT,
	IdTarifa INT,
	FechaCreacion DATETIME NOT NULL,
	UsuarioCreacion VARCHAR(50) NOT NULL,
	FechaModificacion DATETIME,
	UsuarioModificacion VARCHAR(50),
	Estado BIT,
	CONSTRAINT PK_TblVuelo PRIMARY KEY (IdAvion, IdAeropuerto, IdReserva, IdAsiento),
	CONSTRAINT FK_TblVuelo_TblAsiento FOREIGN KEY (IdAsiento) REFERENCES TblAsiento(IdAsiento),
	CONSTRAINT FK_TblVuelo_TblReserva FOREIGN KEY (IdReserva) REFERENCES TblReserva(IdReserva),
	CONSTRAINT FK_TblVuelo_TblAvion FOREIGN KEY (IdAvion) REFERENCES TblAvion(IdAvion),
	CONSTRAINT FK_TblVuelo_TblTarifa FOREIGN KEY (IdTarifa) REFERENCES TblTarifa(IdTarifa),
	CONSTRAINT FK_TblVuelo_TblAeropuerto FOREIGN KEY (IdAeropuerto) REFERENCES TblAeropuerto(IdAeropuerto)
	)
END
GO

------- CREACION DE TABLA RESERVA
IF OBJECT_ID('TblPago') IS NULL
BEGIN
	CREATE TABLE TblPago(
		IdPago INT IDENTITY (1,1) PRIMARY KEY,
		IdReserva INT NOT NULL,
		FechaPago DATETIME,
		IdPasajero INT,
		Monto DECIMAL(19,2),
		TipoComprobante INT,
		NumeroComprobante VARCHAR(10),
		Impuesto INT,
		FechaCreacion DATETIME NOT NULL,
		UsuarioCreacion VARCHAR(50) NOT NULL,
		FechaModificacion DATETIME,
		UsuarioModificacion VARCHAR(50),
		Estado BIT,
		CONSTRAINT FK_TblPago_TblPasajero FOREIGN KEY (IdPasajero) REFERENCES TblPasajero (IdPasajero),
		CONSTRAINT FK_TblPago_TblReserva FOREIGN KEY (IdReserva) REFERENCES TblReserva(IdReserva)
	)
END
GO

--PROCEDIMIENTOS ALMACENADOS
--CRUD PAIS
CREATE PROCEDURE SP_GuardarPais
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
GO

CREATE OR ALTER PROCEDURE SP_SeleccionarPais
@FechaInicio VARCHAR(10),
@FechaFin VARCHAR(10),
@IdPais INT NULL
AS
BEGIN
	IF (SELECT @IdPais) IS NULL
	BEGIN
		SELECT * 
		FROM TblPais
		WHERE CONVERT(VARCHAR(10),FechaCreacion,112) 
			BETWEEN CONVERT(VARCHAR(10),@FechaInicio,112) 
			AND CONVERT(VARCHAR(10),@FechaFin,112)
	END
	ELSE
	BEGIN
		SELECT *
		FROM TblPais
		WHERE CONVERT(VARCHAR(10),FechaCreacion,112) 
			BETWEEN CONVERT(VARCHAR(10),@FechaInicio,112) 
			AND CONVERT(VARCHAR(10),@FechaFin,112)
			AND IdPais = @IdPais
	END
END
GO