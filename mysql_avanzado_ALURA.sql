USE jugos_ventas;
SELECT NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA FROM tabla_de_clientes;
SELECT * FROM tabla_de_clientes;

SELECT DNI AS IDENTIFICAXCION FROM tabla_de_clientes;
SELECT * FROM tabla_de_productos;
SELECT * FROM tabla_de_productos WHERE SABOR = 'Uva';
SELECT * FROM tabla_de_productos WHERE SABOR = 'Mango';
SELECT * FROM tabla_de_productos WHERE ENVASE = 'BotellA PET';
SELECT * FROM tabla_de_productos WHERE TAMANO = '1 litro';
SELECT * FROM tabla_de_productos WHERE SABOR = 'Uva';
SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA <= 16 ;
SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA > 16 ;
SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA <= 16 ;
SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA BETWEEN 16 AND 16.02;

SELECT * FROM tabla_de_productos WHERE SABOR IN ('MANGO', 'UVA');
SELECT * FROM tabla_de_productos WHERE SABOR = 'MANGO' OR SABOR =  'UVA';

#=====================================================================================
#                                   OPERACION = OR, ANDM NOR, NAND
#=====================================================================================
SELECT * FROM tabla_de_productos;
SELECT * FROM tabla_de_productos WHERE SABOR ='mango' and tamano ='470 ml';
SELECT * FROM tabla_de_productos WHERE SABOR ='mango' or tamano ='470 ml';
SELECT * FROM tabla_de_productos WHERE NOT (SABOR ='mango') OR tamano ='470 ml';
#=====================================================================================
#                                  EL MISMO RESULTADO
#=====================================================================================
SELECT * FROM tabla_de_productos WHERE NOT (SABOR ='mango' AND tamano ='470 ml');
SELECT * FROM tabla_de_productos WHERE SABOR ='mango' AND NOT(tamano ='470 ml');

SELECT * FROM tabla_de_clientes WHERE CIUDAD IN ('ciudad de méxico', 'guadalajara') AND EDAD >21;
SELECT * FROM tabla_de_clientes WHERE CIUDAD IN ('ciudad de méxico', 'guadalajara') AND (EDAD between 20  AND 25);

SELECT * FROM tabla_de_productos WHERE SABOR LIKE '%MANZANA';
SELECT * FROM tabla_de_productos WHERE SABOR LIKE '%MANZANA' AND ENVASE = 'botella PET';
#=====================================================================================
#                ¿Cuántos clientes tienen apellidos que acaban con “ez”?
#=====================================================================================
SELECT * FROM tabla_de_clientes WHERE NOMBRE LIKE '%ez';

#=====================================================================================
#                OTROS COMANDOS
#=====================================================================================
ANALYZE TABLE tabla_de_clientes;
SHOW DATABASES;
SELECT * FROM tabla_de_clientes ORDER BY DNI ASC;
SELECT * FROM tabla_de_clientes ORDER BY EDAD ASC;
SELECT * FROM tabla_de_clientes ORDER BY VOLUMEN_DE_COMPRA ASC;
SELECT * FROM tabla_de_clientes ORDER BY FECHA_DE_NACIMIENTO ASC;
#=====================================================================================


