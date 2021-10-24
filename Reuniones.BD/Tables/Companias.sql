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

