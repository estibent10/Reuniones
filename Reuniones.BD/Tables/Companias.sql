CREATE TABLE [dbo].[Companias] (
    [Ced_Juridica]       VARCHAR (12)  NOT NULL,
    [Nombre]             VARCHAR (60)  NOT NULL,
    [Razon_Social]       VARCHAR (100) NULL,
    [Resena_Empresarial] VARCHAR (100) NULL,
    [Telefono]           VARCHAR (9)   NULL,
    [Activo]             BIT           DEFAULT ((1)) NOT NULL,
    [FechaCreacion]      DATETIME      DEFAULT (getdate()) NOT NULL,
    [FechaModificacion]  DATETIME      NULL,
    [CreadoPor]          VARCHAR (60)  NULL,
    [ModificadoPor]      VARCHAR (60)  NULL,
    CONSTRAINT [PK_Companias] PRIMARY KEY CLUSTERED ([Ced_Juridica] ASC)
);

