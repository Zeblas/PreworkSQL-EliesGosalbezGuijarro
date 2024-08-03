/*Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").*/
CREATE TABLE Pedidos (
	id INT PRIMARY KEY,
	id_usuario INT,
	id_producto INT,
	FOREIGN KEY (id_usuario) REFERENCES Usuarios(id),
	FOREIGN KEY (id_producto) REFERENCES Productos(id)
);
/*Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.*/
INSERT INTO Pedidos (id, id_usuario, id_producto)
VALUES (1, 1, 1),
		(2, 2, 2),
		(3, 3, 3);
/*Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).*/
SELECT 
	usuarios.nombre,
	COALESCE(productos.nombre, 'Ningún Producto')
FROM usuarios
LEFT JOIN
	Pedidos ON usuarios.id = Pedidos.id_usuario
LEFT JOIN
	Productos ON pedidos.id_producto = productos.id;
  /*Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).*/
SELECT usuarios.nombre,
	CASE
		WHEN Pedidos.id IS NULL THEN 'No ha realizado ningún pedido'
		ELSE 'Ha realizado al menos un pedido'
	END AS estado_pedido
FROM Usuarios
LEFT JOIN
	Pedidos ON usuarios.id = Pedidos.id_usuario;
  /*Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/ 
ALTER TABLE Pedidos
ADD COLUMN cantidad INT;
UPDATE Pedidos
SET cantidad = 1;