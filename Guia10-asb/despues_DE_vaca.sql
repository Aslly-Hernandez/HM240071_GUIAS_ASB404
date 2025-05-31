##Ejercicio 1

CREATE TABLE film_update_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    film_id INT,
    update_date DATETIME
    );
    

##Ejercicio 2

DELIMITER //

CREATE TRIGGER trg_before_insert_film_rental_rate
BEFORE INSERT ON film
FOR EACH ROW
BEGIN
    IF NEW.rental_rate <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El rental_rate debe ser mayor que 0';
    END IF;
END;
//

DELIMITER ;

#Ejercicio complementario

CREATE TABLE payment_audit (
audit_id INT AUTO_INCREMENT PRIMARY KEY,
payment_id INT,
customer_id INT,
amount DECIMAL(5,2),
audit_date DATETIME
);


#Analisis de resultado

CREATE DATABASE IF NOT EXISTS clinica;
USE clinica;


CREATE TABLE paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    fecha_nacimiento DATE
);

CREATE TABLE medico (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(100)
);


CREATE TABLE cita (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    id_medico INT,
    fecha_cita DATETIME,
    estado VARCHAR(50),
    usuario VARCHAR(50), -- Usuario que realiza la acción (simulado)
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
);

CREATE TABLE auditoria_cita (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_cita INT,
    tipo_operacion VARCHAR(20),
    fecha_operacion DATETIME,
    usuario VARCHAR(50)
);


DELIMITER //

CREATE TRIGGER trg_insert_cita
AFTER INSERT ON cita
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_cita (id_cita, tipo_operacion, fecha_operacion, usuario)
    VALUES (NEW.id_cita, 'INSERT', NOW(), NEW.usuario);
END;
//

DELIMITER ;


DELIMITER //

CREATE TRIGGER trg_update_cita
AFTER UPDATE ON cita
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_cita (id_cita, tipo_operacion, fecha_operacion, usuario)
    VALUES (NEW.id_cita, 'UPDATE', NOW(), NEW.usuario);
END;
//

DELIMITER ;


INSERT INTO paciente (nombre, correo, fecha_nacimiento)
VALUES
('Juan Pérez', 'juanperez@gmail.com', '1985-03-15'),
('María López', 'marialopez@gmail.com', '1992-08-22');


INSERT INTO medico (nombre, especialidad)
VALUES
('Dr. González', 'Cardiología'),
('Dra. Martínez', 'Pediatría');


INSERT INTO cita (id_paciente, id_medico, fecha_cita, estado, usuario)
VALUES
(1, 1, '2025-04-25 10:00:00', 'Pendiente', 'admin'),
(2, 2, '2025-04-26 14:30:00', 'Confirmada', 'admin');


UPDATE cita
SET estado = 'Realizada', usuario = 'admin'
WHERE id_cita = 1;

UPDATE cita
SET fecha_cita = '2025-04-27 15:00:00', usuario = 'admin'
WHERE id_cita = 2;


SELECT * FROM auditoria_cita;
