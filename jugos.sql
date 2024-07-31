USE jugos;
CREATE TABLE TBCLIENTES3(
DNI VARCHAR(20),
NOMBRE VARCHAR(150),
DIRECCION1 VARCHAR(150),
DIRECCION2 VARCHAR(150),
BARRIO VARCHAR(50),
CIUDAD VARCHAR(50),
ESTADO VARCHAR(50),
CP VARCHAR(10),
EDAD SMALLINT,
SEXO VARCHAR(1),
LIMITE_CREDITO FLOAT,
VOLUMEN_COMPRA FLOAT,
PRIMERA_COMPRA BIT(1));

CREATE TABLE TABLA_DE_VENDEDORES (
    MATRICULA varchar(5), 
    NOMBRE varchar(100), 
    PORCENTAJE_COMISION float);
    
INSERT INTO TABLA_DE_VENDEDORES
(MATRICULA, NOMBRE, PORCENTAJE_COMISION)
VALUES
 ('00235','Márcio Almeida Silva',0.08);

INSERT INTO TABLA_DE_VENDEDORES
(MATRICULA, NOMBRE, PORCENTAJE_COMISION)
VALUES
('00236','Cláudia Morais',0.08);

select * from tabla_de_vendedores;
#===============================================================================================
#Recibimos la siguiente información:
#Claudia Moral(00236) recibió un aumento y su comisión pasó a ser 11%. Joan Geraldo de la Fonseca(00233) reclamó que su nombre real es Joan Geraldo de la Fonseca Junior.
#Efectúe estas correcciones en la base de datos.
#===============================================================================================
UPDATE TABLA_DE_VENDEDORES SET PORCENTAJE_COMISION = 0.11
WHERE MATRICULA = '00236';

UPDATE TABLA_DE_VENDEDORES SET NOMBRE = 'Joan Geraldo de la Fonseca Junior'
WHERE MATRICULA = '00235';

#===============================================================================================
#El vendedor Joan Geraldo de la Fonseca Junior matrícula(00233) fue despedido. Hay que retirarlo de la tabla de vendedores.

DELETE FROM TABLA_DE_VENDEDORES WHERE MATRICULA = '00235';
#===============================================================================================
