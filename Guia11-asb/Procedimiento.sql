USE HM240071;

CREATE TABLE alumnos (
 id_alumno INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 apellido VARCHAR(100) NOT NULL,
 fecha_nacimiento DATE NOT NULL
);

CREATE TABLE notas (
 id_nota INT AUTO_INCREMENT PRIMARY KEY,
 id_alumno INT,
 materia VARCHAR(100) NOT NULL,
 nota DECIMAL(5,2) NOT NULL,
 FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno)
);

INSERT INTO alumnos (nombre, apellido,  fecha_nacimiento) VALUES
('Juan', 'Pérez', '2000-05-14'),
('Ana', 'Gómez', '1999-11-23'),
('Luis', 'Ramírez', '2001-03-10');

INSERT INTO notas (id_alumno, materia, nota) VALUES
(1, 'Matemáticas', 85.50),
(1, 'Historia', 90.00),
(2, 'Matemáticas', 78.25),
(3, 'Historia', 88.75),
(3, 'Matemáticas', 92.00);

SELECT * FROM alumnos;

SELECT * FROM notas;

-- Crear el nuevo usuario 
CREATE USER 'h240071'@'%' IDENTIFIED BY '1234';


GRANT SELECT, INSERT, UPDATE, DELETE ON alumno_mm180363.* TO
'hm240071'@'%';

-- Otorgar permisos para crear procedimientos almacenados
GRANT CREATE ROUTINE, EXECUTE ON alumno_mm180363.* TO 'hm240071'@'%';
-- Aplicar los cambios de permisos
FLUSH PRIVILEGES;

-- Crear el procedimiento almacenado
DELIMITER $$
CREATE PROCEDURE insertar_nota(
 IN p_id_alumno INT,
 IN p_materia VARCHAR(100),
 IN p_nota DECIMAL(5,2)
)
BEGIN
 -- Insertar la nueva nota
 INSERT INTO notas (id_alumno, materia, nota)
 VALUES (p_id_alumno, p_materia, p_nota);
 -- Mostrar los datos insertados
 SELECT * FROM notas WHERE id_nota = LAST_INSERT_ID();
END $$
DELIMITER ;

-- Crear el nuevo usuario (ej: notas_user) con su contraseña
CREATE USER 'notas_user'@'%' IDENTIFIED BY '1234';
-- Otorgar permisos solo para ejecutar el procedimiento almacenado
GRANT EXECUTE ON PROCEDURE alumno_mm180363.insertar_nota TO
'notas_user'@'%';
-- Dar permisos SELECT solo sobre la tabla notas
GRANT SELECT ON hm240071.notas TO 'notas_user'@'%';
-- Aplicar los cambios de permisos
FLUSH PRIVILEGES;

CALL insertar_nota(1, 'Matemáticas', 9.5);

-- Eliminar el usuario
DROP USER 'hm240071'@'%';
-- Eliminar el usuario notas_user (si lo has creado)
DROP USER 'notas_user'@'%';
-- Eliminar la base de datos 
DROP DATABASE HM240071;
FLUSH PRIVILEGES;
