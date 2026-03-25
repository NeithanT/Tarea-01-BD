CREATE DATABASE Tarea01;
GO

USE Tarea01;
GO

CREATE TABLE dbo.Empleado (
    id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(128) NOT NULL,
    Salario MONEY NOT NULL
);
GO

-- 40 empleados de ejemplo
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Ana Rojas', 250000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Carlos Mora', 180000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Diana Soto', 220000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Eduardo Vega', 195000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Fernanda Cruz', 240000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Gabriel Ruiz', 210000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Helena Castro', 230000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Ignacio Flores', 175000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Julia Mendez', 265000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Kevin Lopez', 190000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Laura Gonzalez', 215000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Mario Ramirez', 185000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Natalia Ortiz', 255000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Oscar Jimenez', 200000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Patricia Vargas', 245000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Quintin Silva', 170000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Rosa Herrera', 225000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Santiago Chavez', 195000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Teresa Nunez', 235000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Ulises Paredes', 180000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Valeria Campos', 260000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Walter Fuentes', 190000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Ximena Guzman', 220000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Yamil Torres', 205000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Zulema Rios', 240000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Alberto Sanchez', 175000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Beatriz Romero', 250000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Cesar Aguilar', 185000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Daniela Gutierrez', 230000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Emilio Castillo', 195000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Fabiola Morales', 245000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Gustavo Reyes', 210000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Ingrid Navarro', 225000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Jorge Medina', 180000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Karla Delgado', 255000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Luis Pena', 190000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Monica Guerrero', 235000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Nicolas Diaz', 200000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Olivia Marquez', 260000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Pablo Estrada', 215000.00);
GO


CREATE TABLE dbo.DBErrors (
    id            INT IDENTITY(1,1) PRIMARY KEY
    ,ErrorNumber   INT
    ,ErrorMessage  VARCHAR(4000)
    ,ErrorSeverity INT
    ,ErrorState    INT
    ,ProcedureName VARCHAR(128)
    ,ErrorLine     INT
    ,CreatedAt     DATETIME DEFAULT GETDATE()
);
GO


CREATE PROCEDURE dbo.ListarEmpleados
    @outResultCode INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
            e.id
            ,e.Nombre
            ,e.Salario
        FROM dbo.Empleado AS e
        ORDER BY e.Nombre ASC;

        SET @outResultCode = 0;

    END TRY
    BEGIN CATCH

        SET @outResultCode = 50001;

        INSERT INTO dbo.DBErrors (
            ErrorNumber
            ,ErrorMessage
            ,ErrorSeverity
            ,ErrorState
            ,ProcedureName
            ,ErrorLine
        )
        VALUES (
            ERROR_NUMBER()
            ,ERROR_MESSAGE()
            ,ERROR_SEVERITY()
            ,ERROR_STATE()
            ,'ListarEmpleados'
            ,ERROR_LINE()
        );

    END CATCH
END;
GO


CREATE PROCEDURE dbo.InsertarEmpleado
    @inNombre VARCHAR(128)
    ,@inSalario MONEY
    ,@outResultCode INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM dbo.Empleado AS e WHERE (e.Nombre = @inNombre))
    BEGIN
        SET @outResultCode = 50001; -- error: ya existe
        RETURN;
    END

    BEGIN TRY

        INSERT INTO dbo.Empleado (
            Nombre
            ,Salario
        )
        VALUES (
            @inNombre
            ,@inSalario
        );

        SET @outResultCode = 0;

    END TRY
    BEGIN CATCH

        SET @outResultCode = 50002;

        INSERT INTO dbo.DBErrors (
            ErrorNumber
            ,ErrorMessage
            ,ErrorSeverity
            ,ErrorState
            ,ProcedureName
            ,ErrorLine
        )
        VALUES (
            ERROR_NUMBER()
            ,ERROR_MESSAGE()
            ,ERROR_SEVERITY()
            ,ERROR_STATE()
            ,'InsertarEmpleado'
            ,ERROR_LINE()
        );

    END CATCH
END;
GO