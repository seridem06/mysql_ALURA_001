SELECT * FROM TBPRODUCTOS;
# SE usa para borrar un registro
DELETE FROM tbproductos where PRODUCTO = '773912';
USE JUGOS;
INSERT INTO TBPRODUCTOS (PRODUCTO, NOMBRE, ENVASE, VOLUMEN, SABOR, PRECIO) VALUES ('773912', 'Clean', 'Botella PET', '1 Litro', 'Naranja', 8.01);

ALTER TABLE tbproductos add primary key(PRODUCTO);