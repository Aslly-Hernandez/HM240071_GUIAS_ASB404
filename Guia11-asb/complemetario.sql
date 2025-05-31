##inicio de sesion y creacion del usuario 
CREATE USER 'sakila_aslly'@'localhost' IDENTIFIED BY '2910!';

##Asignacion de permisos
GRANT SELECT ON sakila.* TO 'sakila_aslly'@'localhost';

##Asignar a este usuario que puede crear tablas y vistas en la base de datos
GRANT CREATE, CREATE VIEW ON sakila.* TO 'sakila_aslly'@'localhost';

##Eliminar el inicio de sesión y el usuario de la base de datos creado en el ejercicio
DROP USER 'sakila_aslly'@'localhost';


