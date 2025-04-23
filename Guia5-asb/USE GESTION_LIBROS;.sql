USE GESTION_LIBROS;

CREATE TABLE EDITORIAL(
    codigo_editorial char(5) PRIMARY KEY,
    nombre varchar(50),
    pais varchar(50)
    );
    
CREATE TABLE AUTOR(
    codigo_editorial char(5) PRIMARY KEY,
    primer_nombre varchar(50),
    primer_apellido varchar(50),
    fecha_nacimiento DATE,
    nacionalidad varchar(50)
    );
    
CREATE TABLE LIBROS(
    codigo_libro char(10) PRIMARY KEY,
    titulo varchar(50),
    isbn varchar(20),
    edicion char(4),
    codigo_editorial char(5),
    
    FOREIGN KEY (codigo_editorial) REFERENCES EDITORIAL(codigo_editorial)
);
    
CREATE TABLE DETALLE_AUTOR_LIBRO(
    codigo_autor char(5),
    codigo_libro char(10),
    PRIMARY KEY(codigo_autor, codigo_libro),
    FOREIGN KEY (codigo_autor) REFERENCES AUTOR(codigo_autor),
    FOREIGN KEY (codigo_libro) REFERENCES LIBROS(codigo_libro)
);