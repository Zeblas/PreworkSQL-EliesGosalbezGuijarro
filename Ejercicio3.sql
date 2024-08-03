/*Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "precio" (numérico).*/
CREATE TABLE Productos (
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	precio NUMERIC(10, 2)
);
/*Inserta al menos cinco registros en la tabla "Productos".*/
INSERT INTO Productos (id, nombre, precio)
VALUES (1,'Libretas', 5.95),
	 (2, 'Bolígrafos', 1.58),
	 (3, 'Mochila', 35.45),
	 (4,'Estuche', 15.25),
	 (5,'Reglas', 8.95);
/*Actualiza el precio de un producto en la tabla "Productos".*/
UPDATE Productos
SET precio = 10.95
WHERE id = 1;
/*Elimina un producto de la tabla "Productos".*/
DELETE FROM Productos
WHERE id = 5;
/*Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").*/
SELECT Usuarios.nombre, Productos.nombre 
FROM Usuarios
INNER JOIN Productos ON Usuarios.id = Productos.id;
