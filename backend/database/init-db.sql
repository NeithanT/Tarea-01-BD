CREATE DATABASE DevDatabase;
GO

USE DevDatabase;
GO

CREATE TABLE Empleado (
    id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre varchar(64) NOT NULL,
    Salario money NOT NULL
);

INSERT dbo.Empleado (Nombre, Salario)
VALUES ('Juan Perez', 200000.00)

GO