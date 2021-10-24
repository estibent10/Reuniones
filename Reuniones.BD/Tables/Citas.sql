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
--Documentación de tablas y campos

----Documentación a tabla  
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Citas donde se atienden personas en algún despacho',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Citas'


GO
----Documentación a campos
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = N'Identificador único de una cita existente',
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

