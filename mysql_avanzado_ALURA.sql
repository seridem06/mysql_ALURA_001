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
#                                   COMANDO DISTINCT
#=====================================================================================
SELECT ENVASE, TAMANO FROM tabla_de_productos;
SELECT DISTINCT ENVASE, TAMANO FROM tabla_de_productos;
SELECT DISTINCT ENVASE, TAMANO, SABOR FROM tabla_de_productos WHERE  SABOR = 'naranja';
#=====================================================================================
#               ¿Cuáles son los barrios en Ciudad de México que tienen clientes?
#=====================================================================================
SELECT DISTINCT BARRIO FROM tabla_de_clientes WHERE CIUDAD = 'Ciudad de México';
#=====================================================================================
#                                    COMANDO LIMIT
#=====================================================================================
SELECT * FROM tabla_de_productos;
SELECT * FROM tabla_de_productos LIMIT 5;
# 4 registros despues del 5 registro
SELECT * FROM tabla_de_productos LIMIT 5,4;
#=====================================================================================
#                Queremos obtener las 10 primeras ventas del día 01/01/2017. 
#                ¿Cuál sería el comando SQL para obtener este resultado?          
#=====================================================================================
SELECT * FROM facturas  WHERE FECHA_VENTA = '2017-01-01' LIMIT 10;
#=====================================================================================
#                                    usando ORDER BY
#=====================================================================================
SELECT * FROM tabla_de_productos;
SELECT * FROM tabla_de_productos ORDER BY PRECIO_DE_LISTA;
SELECT * FROM tabla_de_productos ORDER BY PRECIO_DE_LISTA DESC;
SELECT * FROM tabla_de_productos ORDER BY NOMBRE_DEL_PRODUCTO;
SELECT * FROM tabla_de_productos ORDER BY NOMBRE_DEL_PRODUCTO DESC;
SELECT * FROM tabla_de_productos ORDER BY ENVASE ASC,NOMBRE_DEL_PRODUCTO DESC;
SELECT * FROM tabla_de_productos ORDER BY ENVASE DESC,NOMBRE_DEL_PRODUCTO ASC;
#=====================================================================================
#  ¿Cuál (o cuáles) fue (fueron) la(s) mayor(es) venta(s) del producto “Refrescante, 1 Litro, Frutilla/Limón”, en cantidad? 
# (Obtenga este resultado utilizando 2 comandos SQL).                                
#=====================================================================================
SELECT CODIGO_DEL_PRODUCTO FROM tabla_de_productos 
WHERE NOMBRE_DEL_PRODUCTO = "Refrescante" AND TAMANO = "1 Litro" 
AND SABOR = "Frutilla/Limón"; 
SELECT * FROM items_facturas WHERE CODIGO_DEL_PRODUCTO = "1101035" ORDER BY CANTIDAD DESC;
#=====================================================================================
#                          USAREMOS LOS COMANDOS SUM, MAX, COUNT
#=====================================================================================
SELECT ESTADO, LIMITE_DE_CREDITO FROM tabla_de_clientes;
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL 
FROM tabla_de_clientes GROUP BY ESTADO;

SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS MAYOR_PRECIO 
FROM tabla_de_productos GROUP BY ENVASE;

SELECT ENVASE, COUNT(*)FROM tabla_de_productos 
GROUP BY ENVASE;

SELECT BARRIO, SUM(LIMITE_DE_CREDITO) AS LIMITE 
FROM tabla_de_clientes GROUP BY BARRIO;

SELECT BARRIO, SUM(LIMITE_DE_CREDITO) AS LIMITE 
FROM tabla_de_clientes WHERE CIUDAD = 'CIUDAD DE MEXICO'
GROUP BY BARRIO;

SELECT CIUDAD, BARRIO, SUM(LIMITE_DE_CREDITO) AS LIMITE 
FROM tabla_de_clientes WHERE CIUDAD = 'CIUDAD DE MEXICO'
GROUP BY BARRIO;

SELECT CIUDAD, BARRIO, MAX(LIMITE_DE_CREDITO) AS LIMITE 
FROM tabla_de_clientes WHERE CIUDAD = 'GUADALAJARA'
GROUP BY BARRIO;

SELECT CIUDAD, BARRIO, MAX(LIMITE_DE_CREDITO) AS LIMITE 
FROM tabla_de_clientes WHERE CIUDAD = 'CIUDAD DE MEXICO'
GROUP BY BARRIO;

SELECT ESTADO, BARRIO, MAX(LIMITE_DE_CREDITO) AS LIMITE
FROM tabla_de_clientes 
GROUP BY ESTADO, BARRIO;

SELECT ESTADO, BARRIO, MAX(LIMITE_DE_CREDITO) AS LIMITE, 
EDAD FROM tabla_de_clientes 
WHERE EDAD >=20
GROUP BY ESTADO, BARRIO, EDAD;
#=====================================================================================
#  Aprovechando el ejercicio del video anterior ¿Cuántos ítems vendidos cuentan con la mayor cantidad del producto '1101035'?
#=====================================================================================
#Las consultas que debemos realizar son las siguientes:
SELECT MAX(CANTIDAD) AS CANTIDAD_MAXIMA FROM items_facturas WHERE CODIGO_DEL_PRODUCTO = "1101035";
# Notaremos que la cantidad máxima vendida es de 99. Así, podemos entonces ejecutar el siguiente comando:
SELECT COUNT(*) FROM items_facturas WHERE CODIGO_DEL_PRODUCTO = "1101035" AND CANTIDAD = 99;
# Notaremos que la cantidad de ítems vendida es de 79.

#=====================================================================================
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL 
FROM tabla_de_clientes GROUP BY ESTADO;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL 
FROM tabla_de_clientes WHERE LIMITE_TOTAL > 300000
GROUP BY ESTADO;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL 
FROM tabla_de_clientes 
GROUP BY ESTADO
HAVING LIMITE_TOTAL > 300000;

SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO,
MIN(PRECIO_DE_LISTA) AS PRECIO_MINIMO  
FROM tabla_de_productos GROUP BY ENVASE;

SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO,
MIN(PRECIO_DE_LISTA) AS PRECIO_MINIMO  
FROM tabla_de_productos GROUP BY ENVASE
HAVING SUM(PRECIO_DE_LISTA) >80;

SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO,
MIN(PRECIO_DE_LISTA) AS PRECIO_MINIMO,
SUM(PRECIO_DE_LISTA) AS SUMA_PRECIO  
FROM tabla_de_productos GROUP BY ENVASE
HAVING SUM(PRECIO_DE_LISTA) >80;

SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO,
MIN(PRECIO_DE_LISTA) AS PRECIO_MINIMO,
SUM(PRECIO_DE_LISTA) AS SUMA_PRECIO  
FROM tabla_de_productos GROUP BY ENVASE
HAVING SUM(PRECIO_DE_LISTA) <=80 
AND MAX(PRECIO_DE_LISTA) >= 5;

#=====================================================================================
#   ¿Quiénes fueron los clientes que realizaron más de 2000 compras en 2016?
#=====================================================================================
SELECT DNI, COUNT(*) FROM facturas
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY DNI
HAVING COUNT(*) > 2000;

#=====================================================================================
#   usando CASE
#=====================================================================================

SELECT * FROM tabla_de_productos;

#=====================================================================================
# OR 1=1-              mypass1
#=====================================================================================
SELECT * FROM tabla_de_productos;
SELECT NOMBRE_DEL_PRODUCTO, PRECIO_DE_LISTA,
CASE
	WHEN PRECIO_DE_LISTA >= 12 THEN 'Costoso'
    WHEN PRECIO_DE_LISTA >= 5 AND PRECIO_DE_LISTA < 12 THEN 'Acequible'
    ELSE 'Barato'
END AS PRECIO
FROM tabla_de_productos;

#=====================================================================================
SELECT ENVASE, SABOR,
CASE
   WHEN PRECIO_DE_LISTA >= 12 THEN 'Costoso'
   WHEN PRECIO_DE_LISTA >= 5 AND PRECIO_DE_LISTA < 12 THEN 'Asequible'
   ELSE 'Barato'
END AS PRECIO, MIN(PRECIO_DE_LISTA) AS PRECIO_MINIMO
FROM tabla_de_productos
WHERE TAMANO = '700 ml'
GROUP BY ENVASE,
CASE
   WHEN PRECIO_DE_LISTA >= 12 THEN 'Costoso'
   WHEN PRECIO_DE_LISTA >= 5 AND PRECIO_DE_LISTA < 12 THEN 'Asequible'
   ELSE 'Barato'
END
ORDER BY ENVASE;
#=====================================================================================
SELECT 
    ENVASE, 
    MIN(SABOR) AS SABOR, 
    CASE  
        WHEN PRECIO_DE_LISTA >= 12 THEN 'Costoso'     
        WHEN PRECIO_DE_LISTA >= 5 AND PRECIO_DE_LISTA < 12 THEN 'Accesible'     
        ELSE 'Barato' 
    END AS PRECIO, 
    MIN(PRECIO_DE_LISTA) AS PRECIO_MINIMO 
FROM 
    tabla_de_productos 
WHERE 
    TAMANO = '700 ml' 
GROUP BY 
    ENVASE, 
    CASE  
        WHEN PRECIO_DE_LISTA >= 12 THEN 'Costoso'     
        WHEN PRECIO_DE_LISTA >= 5 AND PRECIO_DE_LISTA < 12 THEN 'Accesible'     
        ELSE 'Barato' 
    END 
ORDER BY 
    ENVASE, 
    SABOR 
LIMIT 0, 1000;

#=====================================================================================
#     Clasificando el número de ventas
#=====================================================================================
# Registre el año de nacimiento de los clientes y clasifíquelos de la siguiente manera:
# Nacidos antes de 1990= Viejos, nacidos entre 1990 y 1995= Jóvenes y nacidos después de 
# 1995= Niños. Liste el nombre del cliente y esta clasificación.
#=====================================================================================
SELECT NOMBRE,
CASE 
    WHEN YEAR(fecha_de_nacimiento) < 1990 THEN 'Viejos'
    WHEN YEAR(fecha_de_nacimiento) >= 1990 
    AND YEAR(fecha_de_nacimiento) <= 1995 THEN 'Jóvenes' 
    ELSE 'Niños' 
END AS CLASIFICACION_EDAD
FROM tabla_de_clientes;
#=====================================================================================


