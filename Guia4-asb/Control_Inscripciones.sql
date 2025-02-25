CREATE DATABASE Control_Inscripciones
USE Control_Inscripciones;

CREATE TABLE alumno (
    Carnet INT PRIMARY KEY AUTO_INCREMENT,
    Nombres VARCHAR(50),
    Apellidos VARCHAR(50),
    Direccion VARCHAR(50),
    Correo VARCHAR(100) UNIQUE,
    Telefono INT AUTO_INCREMENT,
    Fecha_de_Nacimiento VARCHAR(50)
    );
    
CREATE TABLE materia (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    UV CHAR(3),
    Prerrequisitos VARCHAR(200),
    Ciclo CHAR(2)
    );
    
CREATE TABLE inscripcion (
    Codigo_materia INT PRIMARY KEY AUTO_INCREMENT,
    Carnet INT, 
    Matricula CHAR(1)
    );
    