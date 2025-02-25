CREATE DATABASE Hotel_HM240071; 
USE Hotel_HM240071;

    -- Tabla HOTEL
CREATE TABLE HOTEL(
    CodigoHotel INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255) NOT NULL,
    SitioWeb VARCHAR(255)
);	
-- Tabla RESERVACION
CREATE TABLE RESERVACION (
    CodigoReserva INT PRIMARY KEY IDENTITY(1,1),
    CodigoHotel INT NOT NULL,
    CodigoHuesped INT NOT NULL,
    CodigoHabitacion INT NOT NULL,
    FechaInicio DATE NOT NULL DEFAULT GETDATE(),
    FechaFin DATE NOT NULL,
    FOREIGN KEY (CodigoHotel) REFERENCES HOTEL(CodigoHotel) ON DELETE CASCADE,
    FOREIGN KEY (CodigoHuesped) REFERENCES HUESPED(CodigoHuesped) ON DELETE CASCADE,
    FOREIGN KEY (CodigoHabitacion) REFERENCES HABITACION(CodigoHabitacion) ON DELETE CASCADE,
    CONSTRAINT chk_fecha CHECK (FechaFin > FechaInicio)
);

-- Tabla HABITACION
CREATE TABLE HABITACION (
    CodigoHabitacion INT PRIMARY KEY IDENTITY(1,1),
    CodigoHotel INT NOT NULL,
    Tipo VARCHAR(50) NOT NULL CHECK (Tipo IN ('Doble', 'Individual')),
    Precio DECIMAL(10,2) NOT NULL CHECK (Precio > 25),
    FOREIGN KEY (CodigoHotel) REFERENCES HOTEL(CodigoHotel) ON DELETE CASCADE
);

-- Tabla HUESPED
CREATE TABLE HUESPED(
    CodigoHuesped INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Direccion VARCHAR(255),
    Telefono VARCHAR(20)
);
