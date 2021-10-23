--CREATE DATABASE Reuniones
--GO

USE Reuniones
GO

--Tabla Compañias----------------------------
CREATE TABLE Companias(
	Ced_Juridica VARCHAR(12),
	Nombre VARCHAR(60) NOT NULL,	
	
	Razon_Social VARCHAR(100) NULL,
	Resena_Empresarial VARCHAR(100) NULL,
	Telefono VARCHAR(9) NULL,
	Activo BIT NOT NULL DEFAULT (1),
	
	FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
	FechaModificacion DATETIME NULL,
	CreadoPor VARCHAR(60) NULL,
	ModificadoPor VARCHAR(60) NULL,
	
 CONSTRAINT PK_Companias 
 PRIMARY KEY (Ced_Juridica)
 )
 GO

 --DROP TABLE Companias
 --GO

 INSERT INTO Companias(Ced_Juridica, Nombre, Razon_Social, Resena_Empresarial)
 VALUES
 ('3-0009-1128', 'BANCO CREDITO AGRICOLA DE CARTAGO', 'Ejemplo Razón Social', 'Préstamos, Ahorros, Transferencias'),
 ('3-1232-1422', 'BANCO NACIONAL', 'Ejemplo Razón Social 2', 'Préstamos, Ahorros, Transferencias, SINPE-MOVIL')

 SELECT * FROM Companias
 GO

--Tabla Despachos---------------------------
CREATE TABLE Despachos(
	Id INT IDENTITY(1,1),
	Nombre VARCHAR(100) NOT NULL,	
	
	Ubicacion VARCHAR(100) NULL,
	Telefono VARCHAR(9) NULL,
	Activo BIT NOT NULL DEFAULT 1,
	
	FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
	FechaModificacion DATETIME NULL,
	CreadoPor VARCHAR(60) NULL,	
	ModificadoPor VARCHAR(60) NULL,	
	
	Ced_JuridicaCompania VARCHAR(12) NOT NULL,

 CONSTRAINT PK_Despachos PRIMARY KEY (Id),
 CONSTRAINT FK_Companias FOREIGN KEY (Ced_JuridicaCompania) REFERENCES Companias (Ced_Juridica)
 )
 GO

 --DROP TABLE Despachos
 --GO

 INSERT INTO Despachos(Nombre, Ubicacion, Telefono, Ced_JuridicaCompania)
 VALUES
 ('SUCURSAL SAN JOSE', 'COSTADO ESTE DEL PARQUE CENTRAL', '2221-2123','3-0009-1128'),
 ('SUCURSAL ALAJUELA', 'COSTADO SUR DE CORREOS DE COSTA RICA', '4221-2123','3-1232-1422' )

 SELECT * FROM Despachos
 GO

 --Tabla Citas-----------------------------
CREATE TABLE Citas(
	Id INT IDENTITY(1,1),	
	Nombre VARCHAR(100) NOT NULL,

	FechaInicio DATETIME NOT NULL,
	FechaFin DATETIME NOT NULL,
	NombreCompletoCliente VARCHAR(200),
	Razon VARCHAR(100) NULL,
	Resolucion VARCHAR(100) NULL,
	Observasiones VARCHAR(200) NULL,	
	Activo BIT NOT NULL DEFAULT 1,

	FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
	FechaModificacion DATETIME NULL,
	CreadoPor VARCHAR(60) NULL,	
	ModificadoPor VARCHAR(60) NULL,	
	
	IdDespacho INT NOT NULL,

 CONSTRAINT PK_Citas PRIMARY KEY (Id),
 CONSTRAINT FK_Despachos FOREIGN KEY (IdDespacho) REFERENCES Despachos (Id)

)
GO

--DROP TABLE Citas
-- GO

 INSERT INTO Citas(Nombre, FechaInicio, FechaFin, NombreCompletoCliente, Razon, Resolucion, Observasiones, IdDespacho)
 VALUES
 ('CITA STEVEN', GETDATE()-1,  GETDATE()-1,'STEVEN DIAZ GOMEZ', 'VENTA DE CASA', 'CLIENTE COMPRA LA CASA #VADJ-2315', 'SE DEBE GENERAR POLIZA CONTRA INCENDIOS',2),
 ('CITA DANIEL', GETDATE()-2,  GETDATE()-2,'DANIEL SOSA LOPEZ', 'NUEVA CUENTA AHORROS', 'SE CREA LA CUENTA', 'LA CUENTA ES TE TIPO CES',2)


 SELECT * FROM Citas
 GO

