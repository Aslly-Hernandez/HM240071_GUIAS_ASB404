-- Crear la base de datos
CREATE DATABASE gestion_pedidos;
USE gestion_pedidos;

CREATE TABLE ciudad (
    nomb_ciudad VARCHAR(100) PRIMARY KEY,
    departamento VARCHAR(100)
);

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nomb_cliente VARCHAR(100),
    direccion VARCHAR(150),
    telefono VARCHAR(20),
    tipo_cliente VARCHAR(50)
);

CREATE TABLE transporte (
    num_transporte INT PRIMARY KEY,
    nomb_conductor VARCHAR(100)
);

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    num_transporte INT,
    peso DECIMAL(10, 2),
    destino VARCHAR(100),
    fecha_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (num_transporte) REFERENCES transporte(num_transporte),
    FOREIGN KEY (destino) REFERENCES ciudad(nomb_ciudad)
);


--  usuario para gestión de clientes y ciudades
CREATE USER 'usuario_clientes'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT, INSERT, UPDATE, DELETE ON gestion_pedidos.cliente TO 'usuario_clientes'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON gestion_pedidos.ciudad TO 'usuario_clientes'@'localhost';

--  usuario para consultar pedidos (solo lectura)
CREATE USER 'usuario_pedidos'@'localhost' IDENTIFIED BY '5678';
GRANT SELECT ON gestion_pedidos.pedido TO 'usuario_pedidos'@'localhost';

--  usuario administrativo para pedidos y transporte
CREATE USER 'usuario_admin'@'localhost' IDENTIFIED BY '9101';
GRANT SELECT, INSERT, UPDATE, DELETE ON gestion_pedidos.pedido TO 'usuario_admin'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON gestion_pedidos.transporte TO 'usuario_admin'@'localhost';

--cambios
FLUSH PRIVILEGES;

