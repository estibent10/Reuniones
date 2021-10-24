
----Eliminar la base de datos, sino funciona entonces darle click derecho sobre la Base de datos y activar el check de "Close existing connections"
--use master
--GO
--drop database Reuniones
--go

CREATE DATABASE Reuniones
GO

USE Reuniones
GO

--DROP TABLE Companias
 --GO

 INSERT INTO Companias(CedulaJuridica, Nombre, RazonSocial, ResenaEmpresarial)
 VALUES
 ('3-0009-1128', 'BANCO CREDITO AGRICOLA DE CARTAGO', 'Ejemplo Razón Social', 'Préstamos, Ahorros, Transferencias'),
 ('3-1232-1422', 'BANCO NACIONAL', 'Ejemplo Razón Social 2', 'Préstamos, Ahorros, Transferencias, SINPE-MOVIL')
GO

SELECT * FROM Companias
GO

--DROP TABLE Despachos
 --GO

 INSERT INTO Despachos(Nombre, Ubicacion, Telefono, CedulaJuridicaCompania)
 VALUES
 ('SUCURSAL SAN JOSE', 'COSTADO ESTE DEL PARQUE CENTRAL', '2221-2123','3-0009-1128'),
 ('SUCURSAL ALAJUELA', 'COSTADO SUR DE CORREOS DE COSTA RICA', '4221-2123','3-1232-1422' )
GO

SELECT * FROM Despachos
GO

--DROP TABLE Citas
-- GO

 INSERT INTO Citas(Nombre, FechaInicio, FechaFin, NombreCompletoCliente, Razon, Resolucion, Observasiones, IdDespacho)
 VALUES
 ('CITA STEVEN', GETDATE()-1,  GETDATE()-1,'STEVEN DIAZ GOMEZ', 'VENTA DE CASA', 'CLIENTE COMPRA LA CASA #VADJ-2315', 'SE DEBE GENERAR POLIZA CONTRA INCENDIOS',2),
 ('CITA DANIEL', GETDATE()-2,  GETDATE()-2,'DANIEL SOSA LOPEZ', 'NUEVA CUENTA AHORROS', 'SE CREA LA CUENTA', 'LA CUENTA ES TE TIPO CES',2)
GO

SELECT * FROM Citas
GO
