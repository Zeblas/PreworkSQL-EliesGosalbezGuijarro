/*Nivel de Dificultad Fácil*/
/*1.Crea una base de datos llamada "MiBaseDeDatos".*/
CREATE DATABASE MiBaseDeDatos;
/*2.Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).*/
CREATE TABLE Usuarios (
	id INT Primary KEY,
	nombre VARCHAR(255),
	edad INT
);
/*3.Inserta dos registros en la tabla "Usuarios".*/
INSERT INTO public.usuarios (id, nombre, edad)
VALUES (1,'Elies Gosalbez', 41),
	   (2, 'Pepe Perez', 45);
/*4.Actualiza la edad de un usuario en la tabla "Usuarios".*/
UPDATE Usuarios
SET edad = 35
WHERE id = 1;
/*5.Elimina un usuario de la tabla "Usuarios".*/
DELETE FROM Usuarios
WHERE id = 2;
/*Nivel de Dificultad Moderado*/
/*1.Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).*/
CREATE TABLE Ciudades (
  id INT PRIMARY KEY,
  nombre VARCHAR(255),
  pais VARCHAR(255)
);
/*Inserta al menos tres registros en la tabla 'Ciudades'*/
INSERT INTO Ciudades (id, nombre, pais)
VALUES (1, 'Alicante', 'España'),
       (2, 'Buenos Aires', 'Argentina'),
       (3, 'Roma', 'Italia');
/*Crea una foreign key en la tabla 'usuarios' que se relacione con la columna id de la tabla ciudades*/.
ALTER TABLE Usuarios
ADD COLUMN ciudad_id INT,
ADD CONSTRAINT fk_ciudad
FOREIGN KEY (ciudad_id) REFERENCES Ciudades(id);
/*Realiza una consulta que muestre los nombres de los usuarios junto con el
nombre de su ciudad y país (utiliza un LEFT JOIN).*/
SELECT Usuarios.nombre, Ciudades.nombre, Ciudades.pais 
FROM Usuarios
LEFT JOIN Ciudades 
	ON Usuarios.id = Ciudades.id;
/*Realiza una consulta que muestre solo los usuarios que tienen una ciudad
asociada (utiliza un INNER JOIN).*/
SELECT Usuarios.nombre, Ciudades.nombre, Ciudades.pais 
FROM Usuarios
INNER JOIN Ciudades ON Usuarios.id = Ciudades.id;
