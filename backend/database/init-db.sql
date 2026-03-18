CREATE DATABASE Tarea01;
GO

USE Tarea01;
GO

CREATE TABLE Empleado (
    id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(128) NOT NULL,
    Salario MONEY NOT NULL
);
GO

-- Insertar informacion de 40 empleados 
INSERT INTO Empleado (Nombre, Salario) VALUES ('Ana Rojas', 250000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Carlos Mora', 180000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Diana Soto', 220000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Eduardo Vega', 195000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Fernanda Cruz', 240000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Gabriel Ruiz', 210000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Helena Castro', 230000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Ignacio Flores', 175000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Julia Mendez', 265000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Kevin Lopez', 190000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Laura Gonzalez', 215000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Mario Ramirez', 185000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Natalia Ortiz', 255000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Oscar Jimenez', 200000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Patricia Vargas', 245000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Quintin Silva', 170000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Rosa Herrera', 225000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Santiago Chavez', 195000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Teresa Nunez', 235000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Ulises Paredes', 180000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Valeria Campos', 260000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Walter Fuentes', 190000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Ximena Guzman', 220000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Yamil Torres', 205000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Zulema Rios', 240000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Alberto Sanchez', 175000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Beatriz Romero', 250000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Cesar Aguilar', 185000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Daniela Gutierrez', 230000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Emilio Castillo', 195000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Fabiola Morales', 245000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Gustavo Reyes', 210000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Ingrid Navarro', 225000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Jorge Medina', 180000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Karla Delgado', 255000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Luis Pena', 190000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Monica Guerrero', 235000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Nicolas Diaz', 200000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Olivia Marquez', 260000.00);
INSERT INTO Empleado (Nombre, Salario) VALUES ('Pablo Estrada', 215000.00);
GO

-- Listar a los empleados en orden alfabético por nombre
CREATE PROCEDURE SP_ListarEmpleados
AS
BEGIN
    SELECT id, Nombre, Salario
    FROM Empleado
    ORDER BY Nombre ASC;
END;
GO

-- Insertar empleado y validar que el empleado a ingresar no tenga
-- un nombre repedito con otra persona ya registrada
CREATE PROCEDURE SP_InsertarEmpleado
    @Nombre VARCHAR(128),
    @Salario MONEY,
    @Resultado INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    -- Verificar si el nombre ya existe
    IF EXISTS (SELECT 1 FROM Empleado WHERE Nombre = @Nombre)
    BEGIN
        SET @Resultado = 1; -- Codigo de error de nombre repetido
        RETURN;
    END

    -- Inserta el nuevo empleado
    BEGIN TRY
        INSERT INTO Empleado (Nombre, Salario)
        VALUES (@Nombre, @Salario);
        SET @Resultado = 0; -- Se logro insertar
    END TRY
    BEGIN CATCH
        SET @Resultado = 2; -- Codigo de error
    END CATCH
END;
GO