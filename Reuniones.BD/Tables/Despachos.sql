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

