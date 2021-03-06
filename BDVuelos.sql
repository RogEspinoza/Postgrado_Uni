USE [BDVuelos]
GO
/****** Object:  Table [dbo].[TblAerolinea]    Script Date: 28/10/2021 2:02:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblAerolinea](
	[IdAerolinea] [int] IDENTITY(1,1) NOT NULL,
	[Ruc] [varchar](20) NULL,
	[Nombre] [varchar](120) NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](50) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAerolinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblAeropuerto]    Script Date: 28/10/2021 2:02:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblAeropuerto](
	[IdAeropuerto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](120) NULL,
	[IdPais] [int] NULL,
	[Estado] [bit] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAeropuerto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblAsiento]    Script Date: 28/10/2021 2:02:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblAsiento](
	[IdAsiento] [int] IDENTITY(1,1) NOT NULL,
	[Letra] [char](2) NULL,
	[Fila] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](50) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAsiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblAvion]    Script Date: 28/10/2021 2:02:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblAvion](
	[IdAvion] [int] IDENTITY(1,1) NOT NULL,
	[IdAerolinea] [int] NULL,
	[Fabricante] [varchar](120) NULL,
	[Tipo] [varchar](120) NULL,
	[Capacidad] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](50) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAvion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblPago]    Script Date: 28/10/2021 2:02:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblPago](
	[IdPago] [int] IDENTITY(1,1) NOT NULL,
	[IdReserva] [int] NOT NULL,
	[FechaPago] [datetime] NULL,
	[IdPasajero] [int] NULL,
	[Monto] [decimal](19, 2) NULL,
	[TipoComprobante] [int] NULL,
	[NumeroComprobante] [varchar](10) NULL,
	[Impuesto] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](50) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblPais]    Script Date: 28/10/2021 2:02:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblPais](
	[IdPais] [int] IDENTITY(1,1) NOT NULL,
	[NombrePais] [varchar](100) NOT NULL,
	[EsActivo] [bit] NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioModificacion] [varchar](50) NULL,
	[FechaModificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblPasajero]    Script Date: 28/10/2021 2:02:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblPasajero](
	[IdPasajero] [int] IDENTITY(1,1) NOT NULL,
	[PrimerNombre] [varchar](50) NULL,
	[SegundoNombre] [varchar](50) NULL,
	[PrimerApellido] [varchar](50) NULL,
	[SegundoApellido] [varchar](50) NULL,
	[NoIdentificacion] [varchar](50) NULL,
	[FechaNacimiento] [date] NULL,
	[Telefono] [varchar](30) NULL,
	[Email] [varchar](50) NULL,
	[IdPais] [int] NOT NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](50) NULL,
	[FechaModificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPasajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblReserva]    Script Date: 28/10/2021 2:02:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblReserva](
	[IdReserva] [int] IDENTITY(1,1) NOT NULL,
	[Costo] [decimal](19, 2) NULL,
	[FechaReserva] [datetime] NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblTarifa]    Script Date: 28/10/2021 2:02:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblTarifa](
	[IdTarifa] [int] IDENTITY(1,1) NOT NULL,
	[Clase] [varchar](20) NULL,
	[Precio] [numeric](19, 2) NULL,
	[Impuesto] [numeric](19, 2) NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](50) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTarifa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblVuelo]    Script Date: 28/10/2021 2:02:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblVuelo](
	[IdAvion] [int] NOT NULL,
	[IdAeropuerto] [int] NOT NULL,
	[IdReserva] [int] NOT NULL,
	[IdAsiento] [int] NOT NULL,
	[IdTarifa] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](50) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_TblVuelo] PRIMARY KEY CLUSTERED 
(
	[IdAvion] ASC,
	[IdAeropuerto] ASC,
	[IdReserva] ASC,
	[IdAsiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 28/10/2021 2:02:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[Clave] [varchar](20) NOT NULL,
	[PrimerNombre] [varchar](50) NOT NULL,
	[PrimerApellido] [varchar](50) NOT NULL,
	[SegundoNombre] [varchar](50) NULL,
	[SegundoApellido] [varchar](50) NULL,
	[Identificacion] [varchar](20) NULL,
	[Telefono] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[EsActivo] [bit] NOT NULL,
	[Pregunta] [nvarchar](100) NULL,
	[Respuesta] [nvarchar](100) NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioModificacion] [varchar](50) NULL,
	[FechaModificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TblAeropuerto] ON 

INSERT [dbo].[TblAeropuerto] ([IdAeropuerto], [Nombre], [IdPais], [Estado], [FechaRegistro], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (1, N'Aeropuerto Internacional Augusto Cesar Sandino', 1, 1, CAST(N'2021-10-26T22:09:35.080' AS DateTime), N'respinoza', NULL, NULL)
INSERT [dbo].[TblAeropuerto] ([IdAeropuerto], [Nombre], [IdPais], [Estado], [FechaRegistro], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (2, N'Bluefields International Airport', 1, 1, CAST(N'2021-10-26T22:09:35.080' AS DateTime), N'respinoza', NULL, NULL)
INSERT [dbo].[TblAeropuerto] ([IdAeropuerto], [Nombre], [IdPais], [Estado], [FechaRegistro], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (3, N'Aeropuerto Internacional Juan Santamaría', 2, 1, CAST(N'2021-10-26T22:09:35.080' AS DateTime), N'respinoza', NULL, NULL)
INSERT [dbo].[TblAeropuerto] ([IdAeropuerto], [Nombre], [IdPais], [Estado], [FechaRegistro], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (4, N'Guanacaste Airport costa Rica', 2, 1, CAST(N'2021-10-26T22:09:35.080' AS DateTime), N'respinoza', NULL, NULL)
INSERT [dbo].[TblAeropuerto] ([IdAeropuerto], [Nombre], [IdPais], [Estado], [FechaRegistro], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (5, N'Aeropuerto Internacional de Tocumen', 3, 1, CAST(N'2021-10-26T22:09:35.080' AS DateTime), N'respinoza', NULL, NULL)
INSERT [dbo].[TblAeropuerto] ([IdAeropuerto], [Nombre], [IdPais], [Estado], [FechaRegistro], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (6, N'Aeropuerto Internacional Augusto Cesar Sandino', 1, 1, CAST(N'2021-10-26T22:10:20.747' AS DateTime), N'respinoza', NULL, NULL)
INSERT [dbo].[TblAeropuerto] ([IdAeropuerto], [Nombre], [IdPais], [Estado], [FechaRegistro], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (7, N'Bluefields International Airport', 1, 1, CAST(N'2021-10-26T22:10:20.747' AS DateTime), N'respinoza', NULL, NULL)
INSERT [dbo].[TblAeropuerto] ([IdAeropuerto], [Nombre], [IdPais], [Estado], [FechaRegistro], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (8, N'Aeropuerto Internacional Juan Santamaría', 2, 1, CAST(N'2021-10-26T22:10:20.747' AS DateTime), N'respinoza', NULL, NULL)
INSERT [dbo].[TblAeropuerto] ([IdAeropuerto], [Nombre], [IdPais], [Estado], [FechaRegistro], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (9, N'Guanacaste Airport costa Rica', 2, 1, CAST(N'2021-10-26T22:10:20.747' AS DateTime), N'respinoza', NULL, NULL)
INSERT [dbo].[TblAeropuerto] ([IdAeropuerto], [Nombre], [IdPais], [Estado], [FechaRegistro], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (10, N'Aeropuerto Internacional de Tocumen', 3, 1, CAST(N'2021-10-26T22:10:20.747' AS DateTime), N'respinoza', NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblAeropuerto] OFF
GO
SET IDENTITY_INSERT [dbo].[TblPais] ON 

INSERT [dbo].[TblPais] ([IdPais], [NombrePais], [EsActivo], [UsuarioCreacion], [FechaCreacion], [UsuarioModificacion], [FechaModificacion]) VALUES (1, N'Nicaragua', 1, N'respinoza', CAST(N'2021-10-26T22:09:34.810' AS DateTime), NULL, NULL)
INSERT [dbo].[TblPais] ([IdPais], [NombrePais], [EsActivo], [UsuarioCreacion], [FechaCreacion], [UsuarioModificacion], [FechaModificacion]) VALUES (2, N'Costa Rica', 1, N'respinoza', CAST(N'2021-10-26T22:09:34.837' AS DateTime), NULL, NULL)
INSERT [dbo].[TblPais] ([IdPais], [NombrePais], [EsActivo], [UsuarioCreacion], [FechaCreacion], [UsuarioModificacion], [FechaModificacion]) VALUES (3, N'Panama', 1, N'respinoza', CAST(N'2021-10-26T22:09:34.837' AS DateTime), NULL, NULL)
INSERT [dbo].[TblPais] ([IdPais], [NombrePais], [EsActivo], [UsuarioCreacion], [FechaCreacion], [UsuarioModificacion], [FechaModificacion]) VALUES (4, N'Guatemala', 1, N'respinoza', CAST(N'2021-10-26T22:10:20.700' AS DateTime), NULL, NULL)
INSERT [dbo].[TblPais] ([IdPais], [NombrePais], [EsActivo], [UsuarioCreacion], [FechaCreacion], [UsuarioModificacion], [FechaModificacion]) VALUES (5, N'Honduras', 1, N'respinoza', CAST(N'2021-10-26T22:10:20.743' AS DateTime), NULL, NULL)
INSERT [dbo].[TblPais] ([IdPais], [NombrePais], [EsActivo], [UsuarioCreacion], [FechaCreacion], [UsuarioModificacion], [FechaModificacion]) VALUES (6, N'Belice', 1, N'respinoza', CAST(N'2021-10-26T22:10:20.743' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblPais] OFF
GO
SET IDENTITY_INSERT [dbo].[TblPasajero] ON 

INSERT [dbo].[TblPasajero] ([IdPasajero], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [NoIdentificacion], [FechaNacimiento], [Telefono], [Email], [IdPais], [UsuarioCreacion], [FechaCreacion], [UsuarioModificacion], [FechaModificacion]) VALUES (3, N'Roger', N'Antonio', N'Espinoza', N'Esteban', N'0411707920009F', CAST(N'1992-07-17' AS Date), N'88811809', N'rogespinoza1992@gmail.com', 1, N'respinoza', CAST(N'2021-10-26T22:10:20.743' AS DateTime), NULL, NULL)
INSERT [dbo].[TblPasajero] ([IdPasajero], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [NoIdentificacion], [FechaNacimiento], [Telefono], [Email], [IdPais], [UsuarioCreacion], [FechaCreacion], [UsuarioModificacion], [FechaModificacion]) VALUES (4, N'Ashley', N'Nicole', N'Espinoza', N'Calero', N'0412212140001A', CAST(N'2014-12-22' AS Date), N'88811809', N'aespinozac@gmail.com', 1, N'respinoza', CAST(N'2021-10-26T22:10:20.743' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblPasajero] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Clave], [PrimerNombre], [PrimerApellido], [SegundoNombre], [SegundoApellido], [Identificacion], [Telefono], [email], [EsActivo], [Pregunta], [Respuesta], [UsuarioCreacion], [FechaCreacion], [UsuarioModificacion], [FechaModificacion]) VALUES (1, N'respinoza', N'develop', N'roger', N'espinoza', N'antonio', N'esteban', NULL, N'88811809', N'rogespinoza@gmail.com', 1, N'Libro Favorito', N'la biblia', N'admin', CAST(N'2021-10-27T20:59:56.560' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[TblAvion]  WITH CHECK ADD  CONSTRAINT [FK_TblAvion_TblAerolinea] FOREIGN KEY([IdAerolinea])
REFERENCES [dbo].[TblAerolinea] ([IdAerolinea])
GO
ALTER TABLE [dbo].[TblAvion] CHECK CONSTRAINT [FK_TblAvion_TblAerolinea]
GO
ALTER TABLE [dbo].[TblPago]  WITH CHECK ADD  CONSTRAINT [FK_TblPago_TblPasajero] FOREIGN KEY([IdPasajero])
REFERENCES [dbo].[TblPasajero] ([IdPasajero])
GO
ALTER TABLE [dbo].[TblPago] CHECK CONSTRAINT [FK_TblPago_TblPasajero]
GO
ALTER TABLE [dbo].[TblPago]  WITH CHECK ADD  CONSTRAINT [FK_TblPago_TblReserva] FOREIGN KEY([IdReserva])
REFERENCES [dbo].[TblReserva] ([IdReserva])
GO
ALTER TABLE [dbo].[TblPago] CHECK CONSTRAINT [FK_TblPago_TblReserva]
GO
ALTER TABLE [dbo].[TblPasajero]  WITH CHECK ADD  CONSTRAINT [FK_TblPasajero_TblPais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[TblPais] ([IdPais])
GO
ALTER TABLE [dbo].[TblPasajero] CHECK CONSTRAINT [FK_TblPasajero_TblPais]
GO
ALTER TABLE [dbo].[TblVuelo]  WITH CHECK ADD  CONSTRAINT [FK_TblVuelo_TblAeropuerto] FOREIGN KEY([IdAeropuerto])
REFERENCES [dbo].[TblAeropuerto] ([IdAeropuerto])
GO
ALTER TABLE [dbo].[TblVuelo] CHECK CONSTRAINT [FK_TblVuelo_TblAeropuerto]
GO
ALTER TABLE [dbo].[TblVuelo]  WITH CHECK ADD  CONSTRAINT [FK_TblVuelo_TblAsiento] FOREIGN KEY([IdAsiento])
REFERENCES [dbo].[TblAsiento] ([IdAsiento])
GO
ALTER TABLE [dbo].[TblVuelo] CHECK CONSTRAINT [FK_TblVuelo_TblAsiento]
GO
ALTER TABLE [dbo].[TblVuelo]  WITH CHECK ADD  CONSTRAINT [FK_TblVuelo_TblAvion] FOREIGN KEY([IdAvion])
REFERENCES [dbo].[TblAvion] ([IdAvion])
GO
ALTER TABLE [dbo].[TblVuelo] CHECK CONSTRAINT [FK_TblVuelo_TblAvion]
GO
ALTER TABLE [dbo].[TblVuelo]  WITH CHECK ADD  CONSTRAINT [FK_TblVuelo_TblReserva] FOREIGN KEY([IdReserva])
REFERENCES [dbo].[TblReserva] ([IdReserva])
GO
ALTER TABLE [dbo].[TblVuelo] CHECK CONSTRAINT [FK_TblVuelo_TblReserva]
GO
ALTER TABLE [dbo].[TblVuelo]  WITH CHECK ADD  CONSTRAINT [FK_TblVuelo_TblTarifa] FOREIGN KEY([IdTarifa])
REFERENCES [dbo].[TblTarifa] ([IdTarifa])
GO
ALTER TABLE [dbo].[TblVuelo] CHECK CONSTRAINT [FK_TblVuelo_TblTarifa]
GO
/****** Object:  StoredProcedure [dbo].[GuardarPasajero]    Script Date: 28/10/2021 2:03:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*****GUARDAR PASAJERO
--select * from dbo.TblPasajero
CREATE   PROCEDURE [dbo].[GuardarPasajero]
@PrimerNombre VARCHAR(50),
@PrimerApellido VARCHAR(50),
@SegundoNombre VARCHAR(50) NULL,
@SegundoApellido VARCHAR(50) NULL,
@Identificacion VARCHAR(20),
@FechaNacimiento DATETIME,
@Telefono VARCHAR(20) NULL,
@Email VARCHAR(50),
@IdPais INT,
@UsuarioCreacion VARCHAR(50)
AS
BEGIN
	DECLARE @Exito BIT = 0;
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
			@PrimerNombre,
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
		COMMIT TRANSACTION;
		SELECT @Exito = 1;
		SELECT @Exito
	END TRY
	BEGIN CATCH
		SELECT ERROR_PROCEDURE()
		ROLLBACK TRANSACTION;
		SELECT @Exito = 0;		
		SELECT @Exito
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPasajero]    Script Date: 28/10/2021 2:03:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*****PASAJERO
CREATE   PROCEDURE [dbo].[ObtenerPasajero]
AS
BEGIN
	SELECT * FROM dbo.TblPasajero
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerTodosPais]    Script Date: 28/10/2021 2:03:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ObtenerTodosPais]
AS
BEGIN
	SELECT * FROM dbo.TblPais
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerUsuario]    Script Date: 28/10/2021 2:03:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ObtenerUsuario]
@Usuario NVARCHAR(50),
@Clave NVARCHAR(50)
AS
BEGIN
	DECLARE @Encontrado BIT = 0
	IF EXISTS(SELECT IdUsuario FROM Usuario WHERE NombreUsuario=@Usuario AND Clave=@Clave)
	BEGIN
		SELECT @Encontrado=1
	END
	ELSE
	BEGIN
		SELECT @Encontrado=0;
	END
	SELECT @Encontrado
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GuardarPais]    Script Date: 28/10/2021 2:03:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTOS ALMACENADOS
--CRUD PAIS
CREATE PROCEDURE [dbo].[SP_GuardarPais]
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
/****** Object:  StoredProcedure [dbo].[SP_SeleccionarPais]    Script Date: 28/10/2021 2:03:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_SeleccionarPais]
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
