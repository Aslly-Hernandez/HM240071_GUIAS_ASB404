-- CREACION DE BASE DE DATOS 

CREATE DATABASE CafeDonBosco;
USE CafeDonBosco;

-- CREACION DE TABLAS

CREATE TABLE Clientes (
	ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15),
    Correo VARCHAR(100) UNIQUE,
    Direccion VARCHAR(255)
);
GO

CREATE TABLE Productos (
	ProductoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255),
    Precio DECIMAL(10,2),
);
GO

CREATE TABLE Empleados (
	EmpleadoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50),
    Telefono VARCHAR(15),
    Correo VARCHAR(100) UNIQUE
);
GO

CREATE TABLE Ventas (
	VentaID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT NULL,
    EmpleadoID INT NOT NULL,
    FechaVenta DATETIME DEFAULT GETDATE(),
    Total DECIMAL(10,2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID) ON DELETE SET NULL,
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID) ON DELETE CASCADE
);
GO

CREATE TABLE DetallesVentas (
	DetalleID INT IDENTITY(1,1) PRIMARY KEY,
    VentaID INT NOT NULL,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL CHECK (Cantidad > 0),
    PrecioUnitario DECIMAL(10,2) NOT NULL CHECK (PrecioUnitario > 0), --Evita poner datos negativos o 0
    Subtotal AS (Cantidad * PrecioUnitario) PERSISTED, 
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID) ON DELETE CASCADE,
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID) ON DELETE CASCADE
);
GO

CREATE TABLE Pagos (
	PagoID INT IDENTITY(1,1) PRIMARY KEY,
    VentaID INT NOT NULL,
    MetodoPago VARCHAR(50) CHECK (MetodoPago IN ('Efectivo', 'Tarjeta', 'Transferencia')),
    Monto DECIMAL(10,2) NOT NULL CHECK (Monto >= 0),
    FechaPago DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID) ON DELETE CASCADE
);
GO

--INSERTAR DATOS

INSERT INTO Clientes (Nombre, Correo, Telefono) VALUES
('Juan Pérez', 'juan@email.com', '555-1234'),
('María López', 'maria@email.com', '555-5678'),
('Carlos Gómez', 'carlos@email.com', '555-8765'),
('Ana Torres', 'ana@email.com', '555-4321'),
('Pedro Sánchez', 'pedro@email.com', '555-6789');

INSERT INTO Productos (Nombre, Precio) VALUES
('Cheesecake', 4.99),
('Gelatina', 4.99),
('Latte', 4.99),
('Frozen', 4.99),
('Choco Pastel', 4.99);

INSERT INTO Empleados (Nombre, Cargo, Correo) VALUES
('Laura Mendoza', 'Cajera', 'laura@email.com'),
('Tomas Campos', 'Administrador', 'Tomas@email.com'),
('Fernando Gomez', 'Gerente', 'Fernando@email.com'),
('Alejandro Cruz', 'Barista', 'Alejandro@email.com'),
('Paola Rivas', 'Encargada', 'Paola@email.com');


SET IDENTITY_INSERT Ventas ON;

INSERT INTO Ventas (VentaID, ClienteID, EmpleadoID, FechaVenta, Total) VALUES
(1, 2, 11, '2024-02-01 08:30:00', 150.50),
(2, 1, 13, '2024-02-02 09:15:00', 200.75),
(3, 3, 10, '2024-02-02 14:45:00', 180.00),
(4, 4, 9, '2024-02-03 12:00:00', 90.25),
(5, 5, 6, '2024-02-04 10:10:00', 210.60);

SET IDENTITY_INSERT Ventas OFF;


SET IDENTITY_INSERT DetallesVentas ON;

INSERT INTO DetallesVentas (DetalleID, VentaID, ProductoID, Cantidad, PrecioUnitario) VALUES
(1, 1, 3, 2, 50.00),
(2, 2, 1, 1, 150.75),
(3, 3, 2, 3, 80.00),
(4, 4, 5, 1, 90.25),
(5, 5, 4, 4, 45.60);

SET IDENTITY_INSERT DetallesVentas OFF;


INSERT INTO Pagos (VentaID, Monto, MetodoPago, FechaPago) VALUES
(1, 100.00, 'Tarjeta', '2024-02-05 10:00:00'),
(2, 200.50, 'Efectivo', '2024-02-06 12:30:00'),
(3, 75.00, 'Transferencia', '2024-02-07 15:45:00'),
(4, 300.00, 'Tarjeta', '2024-02-08 08:20:00'),
(5, 150.75, 'Efectivo', '2024-02-09 11:10:00');


