
----Eliminar la base de datos, sino funciona entonces darle click derecho sobre la Base de datos y activar el check de "Close existing connections"
--use master
--GO
--drop database Reuniones
--go

CREATE DATABASE Reuniones
GO

USE Reuniones
GO

--Tabla Compañias----------------------------
CREATE TABLE Companias(
	CedulaJuridica VARCHAR(12),
	Nombre VARCHAR(60) NOT NULL,	
	
	RazonSocial VARCHAR(100) NULL,
	ResenaEmpresarial VARCHAR(100) NULL,
	Telefono VARCHAR(9) NULL,
	Activo BIT NOT NULL DEFAULT (1),
	
	FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
	FechaModificacion DATETIME NULL,
	CreadoPor VARCHAR(60) NULL,
	ModificadoPor VARCHAR(60) NULL,
	
 CONSTRAINT PK_Companias 
 PRIMARY KEY (CedulaJuridica)
 )
 GO

 --DROP TABLE Companias
 --GO

 INSERT INTO Companias(CedulaJuridica, Nombre, RazonSocial, ResenaEmpresarial)
 VALUES
 ('3-0009-1128', 'BANCO CREDITO AGRICOLA DE CARTAGO', 'Ejemplo Razón Social', 'Préstamos, Ahorros, Transferencias'),
 ('3-1232-1422', 'BANCO NACIONAL', 'Ejemplo Razón Social 2', 'Préstamos, Ahorros, Transferencias, SINPE-MOVIL')

 SELECT * FROM Companias
 GO

--Documentación de tablas y campos

--sp_updateextendedproperty actualiza descripción existente
--sp_addextendedproperty Crea nueva descripción
----Documentación a tabla  
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Compañias o sucursales que el sistema gestiona',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Companias'
GO
----Documentación a campos
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Cédula jurídica de la empresa',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Companias', 
    @level2type = N'Column',	@level2name = 'CedulaJuridica'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Nombre de la empresa',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Companias', 
    @level2type = N'Column',	@level2name = 'Nombre'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Razón social de la empresa',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Companias', 
    @level2type = N'Column',	@level2name = 'RazonSocial'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Reseña empresarial de la empresa, cual es el objetivo de la misma',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Companias', 
    @level2type = N'Column',	@level2name = 'ResenaEmpresarial'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Teléfono principal de la empresa',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Companias', 
    @level2type = N'Column',	@level2name = 'Telefono'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Indica si el registro esta activo: 1=Activo 0=Inactivo o Borrado',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Companias', 
    @level2type = N'Column',	@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Fecha de creación del registro',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Companias', 
    @level2type = N'Column',	@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Fecha de última modificación del registro',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Companias', 
    @level2type = N'Column',	@level2name = 'FechaModificacion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Usuario que creó el registro',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Companias', 
    @level2type = N'Column',	@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Último usuario en modificar el registro',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Companias', 
    @level2type = N'Column',	@level2name = 'ModificadoPor' 
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
	
	CedulaJuridicaCompania VARCHAR(12) NOT NULL,

 CONSTRAINT PK_Despachos PRIMARY KEY (Id),
 CONSTRAINT FK_Companias FOREIGN KEY (CedulaJuridicaCompania) REFERENCES Companias (CedulaJuridica)
 )
 GO

 --DROP TABLE Despachos
 --GO

 INSERT INTO Despachos(Nombre, Ubicacion, Telefono, CedulaJuridicaCompania)
 VALUES
 ('SUCURSAL SAN JOSE', 'COSTADO ESTE DEL PARQUE CENTRAL', '2221-2123','3-0009-1128'),
 ('SUCURSAL ALAJUELA', 'COSTADO SUR DE CORREOS DE COSTA RICA', '4221-2123','3-1232-1422' )

 SELECT * FROM Despachos
 GO


--Documentación de tablas y campos

----Documentación a tabla  
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Oficinas donde se pueden atender personas',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Despachos'
GO
----Documentación a campos
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Identificador único de un despacho',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Despachos', 
    @level2type = N'Column',	@level2name = 'Id'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Nombre del despacho de una empresa',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Despachos', 
    @level2type = N'Column',	@level2name = 'Nombre'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Ubicación del despacho de la empresa',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Despachos', 
    @level2type = N'Column',	@level2name = 'Ubicacion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Teléfono principal del despacho',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Despachos', 
    @level2type = N'Column',	@level2name = 'Telefono'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Indica si el registro esta activo: 1=Activo 0=Inactivo o Borrado',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Despachos', 
    @level2type = N'Column',	@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Fecha de creación del registro',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Despachos', 
    @level2type = N'Column',	@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Fecha de última modificación del registro',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Despachos', 
    @level2type = N'Column',	@level2name = 'FechaModificacion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Usuario que creó el registro',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Despachos', 
    @level2type = N'Column',	@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Último usuario en modificar el registro',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Despachos', 
    @level2type = N'Column',	@level2name = 'ModificadoPor'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Referencia a una compañia existente por medio de una cédula jurídica',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Despachos', 
    @level2type = N'Column',	@level2name = 'CedulaJuridicaCompania' 
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


--Documentación de tablas y campos

----Documentación a tabla  
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Citas donde se atienden personas en algún despacho',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Citas'
GO
----Documentación a campos
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Identificador único de una cita',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Citas', 
    @level2type = N'Column',	@level2name = 'Id'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Nombre representativo de una cita',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Citas', 
    @level2type = N'Column',	@level2name = 'Nombre'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Fecha y hora de fin de una cita',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Citas', 
    @level2type = N'Column',	@level2name = 'FechaInicio'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Fecha y hora de inicio de una cita',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Citas', 
    @level2type = N'Column',	@level2name = 'FechaFin'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Nombre completo del cliente que tiene una cita',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Citas', 
    @level2type = N'Column',	@level2name = 'NombreCompletoCliente'	
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Razón de la visita del cliente a una cita',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Citas', 
    @level2type = N'Column',	@level2name = 'Razon'		
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Resolución final de la visita del cliente a una cita, puede ser nulo',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Citas', 
    @level2type = N'Column',	@level2name = 'Resolucion'		
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Observasiones de la visita del cliente a una cita, puede ser nulo',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Citas', 
    @level2type = N'Column',	@level2name = 'Observasiones'	
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Indica si el registro esta activo: 1=Activo 0=Inactivo o Borrado',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Citas', 
    @level2type = N'Column',	@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Fecha de creación del registro',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Citas', 
    @level2type = N'Column',	@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Fecha de última modificación del registro',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Citas', 
    @level2type = N'Column',	@level2name = 'FechaModificacion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Usuario que creó el registro',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Citas', 
    @level2type = N'Column',	@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Último usuario en modificar el registro',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Citas', 
    @level2type = N'Column',	@level2name = 'ModificadoPor'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Referencia a un despacho existente por medio de un Identificador de despacho',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Citas', 
    @level2type = N'Column',	@level2name = 'IdDespacho'
GO 

