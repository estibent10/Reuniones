CREATE TABLE [dbo].[Citas] (
    [Id]                    INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]                VARCHAR (100) NOT NULL,
    [FechaInicio]           DATETIME      NOT NULL,
    [FechaFin]              DATETIME      NOT NULL,
    [NombreCompletoCliente] VARCHAR (150) NULL,
    [Razon]                 VARCHAR (100) NULL,
    [Resolucion]            VARCHAR (100) NULL,
    [Observasiones]         VARCHAR (200) NULL,
    [Activo]                BIT           DEFAULT ((1)) NOT NULL,
    [FechaCreacion]         DATETIME      DEFAULT (getdate()) NOT NULL,
    [FechaModificacion]     DATETIME      NULL,
    [CreadoPor]             VARCHAR (60)  NULL,
    [ModificadoPor]         VARCHAR (60)  NULL,
    [IdDespacho]            INT           NOT NULL,
    CONSTRAINT [PK_Citas] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Despachos] FOREIGN KEY ([IdDespacho]) REFERENCES [dbo].[Despachos] ([Id])
);

