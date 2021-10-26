use BDVuelos
go
--select * from dbo.TblPais
insert into dbo.TblPais(
NombrePais,
EsActivo,
UsuarioCreacion,
FechaCreacion
)
values(
'Nicaragua',
1,
'respinoza',
'2021-10-26'
)

insert into dbo.TblPais(
NombrePais,
EsActivo,
UsuarioCreacion,
FechaCreacion
)
values(
'Costa Rica',
1,
'respinoza',
'2021-10-26'
)

insert into dbo.TblPais(
NombrePais,
EsActivo,
UsuarioCreacion,
FechaCreacion
)
values(
'Panama',
1,
'respinoza',
'2021-10-26'
)

--select * from dbo.tblpasajero

insert into dbo.TblPasajero
(
	PrimerNombre,
	SegundoNombre,
	PrimerApellido,
	SegundoApellido,
	NoIdentificacion,
	FechaNacimiento,
	Telefono,
	Email,
	IdPais,
	UsuarioCreacion,
	FechaCreacion
)
values(
'Roger',
'Antonio',
'Espinoza',
'Esteban',
'0411707920009F',
'1992-07-17',
'88811809',
'rogespinoza1992@gmail.com',
1,
'respinoza',
'2021-10-26'
)

insert into dbo.TblPasajero
(
	PrimerNombre,
	SegundoNombre,
	PrimerApellido,
	SegundoApellido,
	NoIdentificacion,
	FechaNacimiento,
	Telefono,
	Email,
	IdPais,
	UsuarioCreacion,
	FechaCreacion
)
values(
'Ashley',
'Nicole',
'Espinoza',
'Calero',
'0412212140001A',
'2014-12-22',
'88811809',
'aespinozac@gmail.com',
1,
'respinoza',
'2021-10-26'
)

INSERT INTO DBO.TblAeropuerto(
Nombre,
IdPais,
Estado,
FechaRegistro,
UsuarioCreacion
)
VALUES(
'Aeropuerto Internacional Augusto Cesar Sandino',
1,
1,
'2021-10-26',
'respinoza'
)

INSERT INTO DBO.TblAeropuerto(
Nombre,
IdPais,
Estado,
FechaRegistro,
UsuarioCreacion
)
VALUES(
'Bluefields International Airport',
1,
1,
'2021-10-26',
'respinoza'
)

INSERT INTO DBO.TblAeropuerto(
Nombre,
IdPais,
Estado,
FechaRegistro,
UsuarioCreacion
)
VALUES(
'Aeropuerto Internacional Juan Santamaría',
2,
1,
'2021-10-26',
'respinoza'
)

INSERT INTO DBO.TblAeropuerto(
Nombre,
IdPais,
Estado,
FechaRegistro,
UsuarioCreacion
)
VALUES(
'Guanacaste Airport costa Rica',
2,
1,
'2021-10-26',
'respinoza'
)

INSERT INTO DBO.TblAeropuerto(
Nombre,
IdPais,
Estado,
FechaRegistro,
UsuarioCreacion
)
VALUES(
'Aeropuerto Internacional de Tocumen',
3,
1,
'2021-10-26',
'respinoza'
)

--SELECT * FROM TblAeropuerto