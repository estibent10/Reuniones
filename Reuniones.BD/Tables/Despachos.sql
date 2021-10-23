CREATE TABLE [dbo].[Despachos] (
    [Id]                   INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]               VARCHAR (100) NOT NULL,
    [Ubicacion]            VARCHAR (100) NULL,
    [Telefono]             VARCHAR (9)   NULL,
    [Activo]               BIT           DEFAULT ((1)) NOT NULL,
    [FechaCreacion]        DATETIME      DEFAULT (getdate()) NOT NULL,
    [FechaModificacion]    DATETIME      NULL,
    [CreadoPor]            VARCHAR (60)  NULL,
    [ModificadoPor]        VARCHAR (60)  NULL,
    [Ced_JuridicaCompania] VARCHAR (12)  NOT NULL,
    CONSTRAINT [PK_Despachos] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Companias] FOREIGN KEY ([Ced_JuridicaCompania]) REFERENCES [dbo].[Companias] ([Ced_Juridica])
);

