
SELECT * FROM tbclientes;

SELECT DNI, SEXO, NOMBRE FROM tbclientes;
SELECT NOMBRE AS NOMBRE_COMPLETO, SEXO AS GENERO, DNI, SEXO, NOMBRE FROM tbclientes;
SELECT NOMBRE AS NOMBRE_COMPLETO, SEXO AS GENERO, DNI, SEXO, NOMBRE FROM tbclientes LIMIT 6;

#==================================================================================================
select * FROM tbproductos;
select * FROM tbproductos where SABOR = 'Maracuyá';
select * FROM tbproductos where ENVASE = 'Botella de Vidrio';

update tbproductos SET SABOR = 'Citrico' WHERE SABOR = 'Limón';
select * FROM tbproductos where SABOR = 'Limón';
select * FROM tbproductos where SABOR = 'Citrico';

#==================================================================================================
#Seleccionando a un vendedor
#==================================================================================================
#Verifica los datos registrados de la vendedora Claudia Morais.
#==================================================================================================
SELECT * FROM TABLA_DE_VENDEDORES;
SELECT * FROM TABLA_DE_VENDEDORES WHERE NOMBRE = 'Claudia Morais';
#Revisa cuáles son los vendedores que están de vacaciones y que fueron admitidos antes del 2016.
SELECT * FROM TABLA_DE_VENDEDORES WHERE YEAR(FECHA_ADMISION) < 2016 AND DE_VACACIONES = 1;
#Selecciona el nombre y matrícula de los vendedores.
SELECT NOMBRE, MATRICULA FROM TABLA_DE_VENDEDORES;
#**************************************************************************************************
select * from tbclientes;
select * from tbclientes where EDAD > 27;
select * from tbclientes where EDAD <= 27;
select * from tbclientes where EDAD <> 26;
select * from tbclientes where NOMBRE > 'Erica Carvajo';
select * from tbclientes where NOMBRE <= 'Erica Carvajo';

SELECT * FROM tbproductos;
SELECT * FROM tbproductos WHERE PRECIO = 28.51;
SELECT * FROM tbproductos WHERE PRECIO  > 28.51;
SELECT * FROM tbproductos WHERE PRECIO  BETWEEN 28.49 AND 28.52;

#==================================================================================================
SELECT * FROM TABLA_DE_VENDEDORES;
SELECT * FROM TABLA_DE_VENDEDORES WHERE PORCENTAJE_COMISION > 0.10;
#==================================================================================================
SELECT * FROM tbcliente;
SELECT * FROM tbcliente WHERE FECHA_NACIMIENTO = '1995-01-13';
SELECT * FROM tbcliente WHERE FECHA_NACIMIENTO < '1995-01-13';
SELECT * FROM tbcliente WHERE FECHA_NACIMIENTO >= '1995-01-13';
SELECT * FROM tbcliente WHERE YEAR (FECHA_NACIMIENTO) = 1995;
#==================================================================================================

SELECT * FROM tbproductos;
SELECT * FROM tbproductos WHERE PRECIO = 28.51;
SELECT * FROM tbproductos WHERE PRECIO  > 28.51;
SELECT * FROM tbproductos WHERE PRECIO  BETWEEN 28.49 AND 28.52;
SELECT * FROM tbproductos WHERE PRECIO >= 28.49 AND PRECIO <=28.52;
SELECT * FROM tbproductos WHERE ENVASE = 'Lata' OR ENVASE = 'Botella PET';

SELECT * FROM tbproductos WHERE PRECIO >= 15 AND PRECIO <=25;
SELECT * FROM tbproductos WHERE (PRECIO >= 15 AND PRECIO <=25) OR (ENVASE = 'Lata' OR ENVASE = 'Botella PET');
SELECT * FROM tbproductos WHERE (PRECIO >= 15 AND VOLUMEN = '1 Litro') OR (ENVASE = 'Lata' OR ENVASE = 'Botella PET');








