USE jugos;
ALTER TABLE tbclientes ADD PRIMARY KEY (DNI);
ALTER TABLE tbclientes ADD  COLUMN(FECHA_NACIMIENTO DATE);
#===============================================================================================

UPDATE TABLA_DE_VENDEDORES SET PORCENTAJE_COMISION = 0.11
WHERE MATRICULA = '00236';

UPDATE tbclientes SET ESTADO = 'CDMX'
WHERE DNI = '4567895';


#===============================================================================================
INSERT INTO tbclientes(DNI, NOMBRE, DIRECCION1, DIRECCION2, BARRIO, CIUDAD, ESTADO, CP, EDAD, SEXO, LIMITE_CREDITO, VOLUMEN_COMPRA, PRIMERA_COMPRA, FECHA_NACIMIENTO)
VALUES('4567895', 'Pedro el escamoso', 'calle del sol', '', 'Los laureles', 'Ciudad de Mexico', 'CDMX', '34250000', 55, 'M', 1000000, 2000, 0, '1971-05-25');


SELECT  * FROM tbclientes;

#Modificando la tabla de vendedores
#Vamos a incluir nuevos campos en la tabla de vendedores. Ellos serán la fecha de admisión. (Nombre del campo FECHA_ADMISION), y si el vendedor está o no de vacaciones. (Nombre del campo DE_VACACIONES). No olvides recrear la clave primaria y después incluye la siguiente información:
#===============================================================================================
#Matrícula - 00235
#Nombre: Márcio Almeida Silva
#Comision: 8%
#Fecha de admisión: 15/08/2014
#¿Está de vacaciones? No
#===============================================================================================
#Matrícula - 00236
#Nombre: Cláudia Morais
#Comision: 8%
#Fecha de admisión: 17/09/2013
#¿Está de vacaciones? Si
#===============================================================================================
#Matrícula - 00237
#Nombre: Roberta Martins
#Comision: 11%
#Fecha de admisión: 18/03/2017
#¿Está de vacaciones? Si
#===============================================================================================
#Matrícula - 00238
#Nombre: Péricles Alves
#Comision: 11%
#Fecha de admisión: 21/08/2016
#¿Está de vacaciones? No
#===============================================================================================
#Tips:
#===============================================================================================
#Elimina la tabla.
#Crea la tabla nuevamente incluyendo los nuevos campos.
#Crea la clave primaria.
#Incluye los comandos de INSERT.
#===============================================================================================
DROP TABLE TABLA_DE_VENDEDORES;

CREATE TABLE TABLA_DE_VENDEDORES
( MATRICULA varchar(5),
NOMBRE varchar(100),
PORCENTAJE_COMISION float,
FECHA_ADMISION date,
DE_VACACIONES bit);

ALTER TABLE TABLA_DE_VENDEDORES ADD PRIMARY KEY (MATRICULA);

INSERT INTO TABLA_DE_VENDEDORES
(MATRICULA, NOMBRE, FECHA_ADMISION, PORCENTAJE_COMISION, DE_VACACIONES) VALUES ('00235','Márcio Almeida Silva','2014-08-15',0.08,0);

INSERT INTO TABLA_DE_VENDEDORES
(MATRICULA, NOMBRE, FECHA_ADMISION, PORCENTAJE_COMISION, DE_VACACIONES) VALUES ('00236','Cláudia Morais','2013-09-17',0.08,1);

INSERT INTO TABLA_DE_VENDEDORES
(MATRICULA, NOMBRE, FECHA_ADMISION, PORCENTAJE_COMISION, DE_VACACIONES) VALUES ('00238','Pericles Alves','2016-08-21',0.11,0);

SELECT * FROM TABLA_DE_VENDEDORES;