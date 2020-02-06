CREATE TABLE RESIDENTES(
    DNI_RESIDENTE               VARCHAR2(9),
    NOMBRE                      VARCHAR2(100),
    APELLIDOS                   VARCHAR2(100),
    TELEFONO_CONTACTO           VARCHAR2(13),
    FECHA_NACIMIENTO            DATE,
    ACTIVO                      NUMBER(1)DEFAULT 1,
    CONSTRAINT PK_RESIDENTES PRIMARY KEY (DNI_RESIDENTE),
    CONSTRAINT NN_RESIDENTES_NOMBRE CHECK (NOMBRE IS NOT NULL),
    CONSTRAINT NN_RESIDENTES_APELLIDOS CHECK (APELLIDOS IS NOT NULL),
    CONSTRAINT NN_RESIDENTES_TELEFONO_CONTA CHECK (TELEFONO_CONTACTO IS NOT NULL),
    CONSTRAINT NN_RESIDENTES_ACTIVO CHECK (ACTIVO IS NOT NULL)
);
CREATE TABLE ESTANCIA(
    HABITACION                  NUMBER(2),
    FECHA_ENTRADA               DATE,
    FECHA_SALIDA                DATE,
    DNI_RESIDENTE               VARCHAR2(9),               
    COSTE_MENSUAL               NUMBER(8,2),
    CONSTRAINT PK_ESTANCIA PRIMARY KEY (HABITACION),
    CONSTRAINT NN_ESTANCIA_COSTE_MENSUAL CHECK (COSTE_MENSUAL IS NOT NULL),
    CONSTRAINT CK_ESTANCIA_COSTE_MENSUAL_POS CHECK (COSTE_MENSUAL >0)
);
CREATE TABLE MEDICAMENTO (
    ID_MEDICAMENTO                  NUMBER(3),
    NOMBRE                          VARCHAR(100),    
    CONSTRAINT PK_ID_MEDICAMENTO PRIMARY KEY (ID_MEDICAMENTO),
    CONSTRAINT NN_NOMBRE CHECK (NOMBRE IS NOT NULL)
    );
CREATE TABLE TRATAMIENTO(
    ID_TRATAMIENTO                  NUMBER(3),
    ID_MEDICAMENTO                  NUMBER(3),
    FECHA_FIN                       DATE,
    FECHA_INICIO                    DATE,
    CANT_DESAYUNO                   NUMBER,
    CANT_COMIDA                     NUMBER,
    CANT_CENA                       NUMBER,    
    CONSTRAINT PK_ID_TRATAMIENTO PRIMARY KEY (ID_TRATAMIENTO)
);

CREATE TABLE TOMAS(
    ID_TRATAMIENTO                  NUMBER(3),
    DNI_RESIDENTE                   VARCHAR2(9),    
    CONSTRAINT PK_ID_TRATAMIENTO_DNI_RESIDENTE PRIMARY KEY (ID_TRATAMIENTO, DNI_RESIDENTE)
);

CREATE TABLE COMIDAS_SEMANA (
    DNI_RESIDENTE           VARCHAR2(9),
    ID_MENU_LUNES           NUMBER(3),
    ID_MENU_MARTES          NUMBER(3),
    ID_MENU_MIERCOLES       NUMBER(3),
    ID_MENU_JUEVES          NUMBER(3),
    ID_MENU_VIERNES         NUMBER(3),
    ID_MENU_SABADO          NUMBER(3),
    ID_MENU_DOMINGO         NUMBER(3),    
    CONSTRAINT PK_COMIDAS_SEMANA PRIMARY KEY (ID_MENU_LUNES, ID_MENU_MARTES, ID_MENU_MIERCOLES, ID_MENU_JUEVES, ID_MENU_VIERNES, ID_MENU_SABADO, ID_MENU_DOMINGO)
);

CREATE TABLE COMIDAS (
    ID_COMIDA               NUMBER(3),
    NOMBRE                  VARCHAR2(100),    
    CONSTRAINT PK_ID_COMIDA PRIMARY KEY (ID_COMIDA) 
);

CREATE TABLE MENU (
    ID_MENU                 NUMBER(3),
    NOMBRE                  VARCHAR2(100),
    ID_DESAYUNO             NUMBER(3),
    ID_ALMUERZO             NUMBER(3),
    ID_CENA                 NUMBER(3),   
    CONSTRAINT PK_ID_MENU PRIMARY KEY (ID_MENU)
);

--restricciones

ALTER TABLE COMIDAS_SEMANA
ADD CONSTRAINT FK_COMIDAS_SEMANA_RESIDENTES FOREIGN KEY (DNI_RESIDENTE) REFERENCES RESIDENTES(DNI_RESIDENTE)ON DELETE CASCADE;

ALTER TABLE ESTANCIA
ADD CONSTRAINT FK_CESTANCIA_RESIDENTES FOREIGN KEY (DNI_RESIDENTE) REFERENCES RESIDENTES(DNI_RESIDENTE) ON DELETE SET NULL;

ALTER TABLE TRATAMIENTO
ADD CONSTRAINT FK_TRATAMIENTO_MEDICAMENTO_ FOREIGN KEY (ID_MEDICAMENTO) REFERENCES MEDICAMENTO(ID_MEDICAMENTO)
ON DELETE SET NULL;

ALTER TABLE TOMAS
ADD CONSTRAINT FK_TOMAS_TRATAMIENTO FOREIGN KEY (ID_TRATAMIENTO) REFERENCES TRATAMIENTO(ID_TRATAMIENTO)
ON DELETE SET NULL;

ALTER TABLE TOMAS
ADD CONSTRAINT FK_TOMAS_RESIDENTES FOREIGN KEY (DNI_RESIDENTE) REFERENCES RESIDENTES(DNI_RESIDENTE);

ALTER TABLE MENU
ADD CONSTRAINT FK_DESAYUNO FOREIGN KEY (ID_DESAYUNO) REFERENCES COMIDAS (ID_COMIDA)
ON DELETE SET NULL;

ALTER TABLE MENU
ADD CONSTRAINT FK_ALMUERZO FOREIGN KEY (ID_ALMUERZO) REFERENCES COMIDAS (ID_COMIDA)
ON DELETE SET NULL;

ALTER TABLE MENU
ADD CONSTRAINT FK_CENA FOREIGN KEY (ID_CENA) REFERENCES COMIDAS (ID_COMIDA)
ON DELETE SET NULL;

ALTER TABLE COMIDAS_SEMANA
ADD CONSTRAINT FK_LUNES FOREIGN KEY (ID_MENU_LUNES) REFERENCES MENU (ID_MENU)
ON DELETE SET NULL;

ALTER TABLE COMIDAS_SEMANA
ADD CONSTRAINT FK_MARTES FOREIGN KEY (ID_MENU_MARTES) REFERENCES MENU (ID_MENU)
ON DELETE SET NULL;

ALTER TABLE COMIDAS_SEMANA
ADD CONSTRAINT FK_MIERCOLES FOREIGN KEY (ID_MENU_MIERCOLES) REFERENCES MENU (ID_MENU)
ON DELETE SET NULL;

ALTER TABLE COMIDAS_SEMANA
ADD CONSTRAINT FK_JUEVES FOREIGN KEY (ID_MENU_JUEVES) REFERENCES MENU (ID_MENU)
ON DELETE SET NULL;

ALTER TABLE COMIDAS_SEMANA
ADD CONSTRAINT FK_VIERNES FOREIGN KEY (ID_MENU_VIERNES) REFERENCES MENU (ID_MENU)
ON DELETE SET NULL;

ALTER TABLE COMIDAS_SEMANA
ADD CONSTRAINT FK_SABADO FOREIGN KEY (ID_MENU_SABADO) REFERENCES MENU (ID_MENU)
ON DELETE SET NULL;

ALTER TABLE COMIDAS_SEMANA
ADD CONSTRAINT FK_DOMINGO FOREIGN KEY (ID_MENU_DOMINGO) REFERENCES MENU (ID_MENU)
ON DELETE SET NULL;

--secuencias

CREATE SEQUENCE ID_MEDICAMENTO
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE ID_TRATAMIENTO
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SECUENCIA_HABITACION
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE SEQ_COMIDAS --Antonio
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_MENU
START WITH 1
INCREMENT BY 1;


--datos fernando




--DATOS santi

--MEDICAMENTO
/*
INSERT INTO MEDICAMENTO(ID_MEDICAMENTO,NOMBRE)
VALUES (ID_MEDICAMENTO.NEXTVAL, 'SIMVASTATINA');

INSERT INTO MEDICAMENTO(ID_MEDICAMENTO,NOMBRE)
VALUES (ID_MEDICAMENTO.NEXTVAL, 'ASPIRINA');

INSERT INTO MEDICAMENTO(ID_MEDICAMENTO,NOMBRE)
VALUES (ID_MEDICAMENTO.NEXTVAL,'OMEOPRAZOL');

INSERT INTO MEDICAMENTO(ID_MEDICAMENTO,NOMBRE)
VALUES (ID_MEDICAMENTO.NEXTVAL,'LEXOTIROXINA');

INSERT INTO MEDICAMENTO(ID_MEDICAMENTO,NOMBRE)
VALUES (ID_MEDICAMENTO.NEXTVAL,'RAMIPRIL');

INSERT INTO MEDICAMENTO(ID_MEDICAMENTO,NOMBRE)
VALUES (ID_MEDICAMENTO.NEXTVAL,'PARACETAMOL');

INSERT INTO MEDICAMENTO(ID_MEDICAMENTO,NOMBRE)
VALUES (ID_MEDICAMENTO.NEXTVAL,'VENTOLIN');

INSERT INTO MEDICAMENTO(ID_MEDICAMENTO,NOMBRE)
VALUES (ID_MEDICAMENTO.NEXTVAL,'FLIXOTIDE');

INSERT INTO MEDICAMENTO(ID_MEDICAMENTO,NOMBRE)
VALUES (ID_MEDICAMENTO.NEXTVAL,'FORTASEC');

INSERT INTO MEDICAMENTO(ID_MEDICAMENTO,NOMBRE)
VALUES (ID_MEDICAMENTO.NEXTVAL,'SILDENAFILO');

INSERT INTO MEDICAMENTO(ID_MEDICAMENTO,NOMBRE)
VALUES (ID_MEDICAMENTO.NEXTVAL,'ALMAX');

INSERT INTO MEDICAMENTO(ID_MEDICAMENTO,NOMBRE)
VALUES (ID_MEDICAMENTO.NEXTVAL,'ATORVASTATINA');

INSERT INTO MEDICAMENTO(ID_MEDICAMENTO,NOMBRE)
VALUES (ID_MEDICAMENTO.NEXTVAL,'LANSOPRAZOL');

INSERT INTO MEDICAMENTO(ID_MEDICAMENTO,NOMBRE)
VALUES (ID_MEDICAMENTO.NEXTVAL,'PULMICOR');

INSERT INTO MEDICAMENTO(ID_MEDICAMENTO,NOMBRE)
VALUES (ID_MEDICAMENTO.NEXTVAL,'PRIMPERAN');

--TRATAMIENTO

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 15, '23/09/2020', '04/10/2020', 1, 1, 1);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 6, '19/02/2020', '24/09/2020', 1, 1.5, 1.5);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 9, '27/07/2020', '04/04/2020', 1, 1.5, 1.5);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 13, '30/05/2020', '20/04/2020', 2, 1.5, 1);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 4, '24/07/2020', '22/02/2020', 1, 1.5, 2);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 2, '08/11/2020', '06/10/2020', 1, 2.0, 1.5);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 1, '11/04/2020', '30/06/2020', 2, 1, 2);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 8, '22/10/2020', '12/09/2020', 1, 2, 1);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 14, '16/04/2020', '15/05/2020', 2, 1, 1);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 13, '04/11/2020', '30/11/2020', 1.0, 1, 1);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 9, '08/12/2020', '21/10/2020', 1, 1.5, 1);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 1, '11/11/2020', '18/09/2020', 2.0, 1, 2.0);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 15, '19/10/2020', '27/09/2020', 2, 1, 1);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA) 
values (ID_TRATAMIENTO.NEXTVAL, 12, '25/11/2020', '23/05/2020', 1.0, 1, 1.5);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 4, '11/07/2020', '06/11/2020', 1.5, 1.5, 1.5);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 4, '31/03/2020', '17/10/2020', 2, 1.5, 1.5);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 7, '11/04/2020', '13/03/2020', 2, 2, 1.5);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 3, '23/04/2020', '18/09/2020', 1, 1.5, 1);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 11, '01/05/2020', '04/06/2020', 1, 1.5, 1.5);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 11, '08/11/2020', '03/07/2020', 2.0, 1, 1);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 8, '04/04/2020', '08/02/2020', 1, 2, 1.5);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 6, '30/12/2020', '16/11/2020', 1, 1, 1);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 13, '13/08/2020', '23/11/2020', 2, 1.5, 2);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 6, '07/04/2020', '24/07/2020', 1.5, 1, 2);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 6, '31/08/2020', '14/12/2020', 1, 2, 1);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 2, '25/03/2020', '03/03/2020', 1, 1, 1);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 15, '23/07/2020', '03/05/2020', 1, 1, 1);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA) 
values (ID_TRATAMIENTO.NEXTVAL, 8, '07/08/2020', '06/05/2020', 1, 1.5, 1);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 9, '05/08/2020', '13/06/2020', 1, 2, 1);

insert into TRATAMIENTO (ID_TRATAMIENTO, ID_MEDICAMENTO, FECHA_INICIO, FECHA_FIN, CANT_DESAYUNO, CANT_COMIDA, CANT_CENA)
values (ID_TRATAMIENTO.NEXTVAL, 15, '07/08/2020', '10/03/2020', 1.5, 1, 1.5);
*/
--Tomas
/*
DNI:
96213923R
44230713B
37254274R
79138265A
14750544T
06321722B
28483499T
28024993E
83938014C
92573364C
14614884V
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (21,'96213923R');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (9,'44230713B');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (4,'37254274R');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (19,'79138265A');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (8,'14750544T');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (23,'06321722B');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (18,'28483499T');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (28,'83938014C');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (11,'92573364C');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (30,'14614884V');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (25,'44260529L');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (25,'04520380Y');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (24,'36525356E');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (10,'82892604Y');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (7),'90582763T';
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (15,'72159016N');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (22,'70262260C');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (18,'03824738E');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (18,'63977915B');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (5,'77846787K');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (9,'88540285Z');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (11,'44711723E');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (8,'61154110P');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (16,'');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (7,'');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (27,'');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (5,'');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (1,'');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (20,'');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (15,'');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (19,'');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (24,'');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (19,'');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (2,'');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (5,'');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (28,'');
insert into TOMAS (ID_TRATAMIENTO,DNI_RESIDENTE) values (28,'');

*/
--aCABA sANTI

--Mar�a

/*INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Macarrones');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Ceviche de pescado');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Paella');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Huevos fritos');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Pizza');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Tallarines');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Sopa de verduras');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Empanada');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Pulpo a la gallega');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Calamares');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Salmorejo');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Lomo saltado');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Lentejas');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Garbanzos');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Croquetas');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Tortilla de patatas');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Risotto de calabaza');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Crepes de nutella');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Hot dogs');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Cordero Liban?s');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Chuletas de cerdo');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Tostadas mexicanas');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Bacalao');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Sopa mongolesa');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Hamburguesas');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Arroz de mariscos');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Fajitas de pollo');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Patatas fritas');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Chilli con carne');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Costillas de cerdo');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Chipiron plancha');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Cochinillo segoviano');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Lasa�a');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Milanesa de pollo a la parmesana');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Patatas bravas');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Pollo asado');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Albondigas');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Cus-cus marroqui');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Nachos');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Ensalada');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Espinacas');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Mango');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Fresas');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Platano');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Kiwi');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Manzana');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Naranjas');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Uvas');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Macarrones con nata');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Macarrones con nata y queso');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Ardoria');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Macarrones con nata y queso');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Bocata del Manolo');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Bocata del polvillo');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Bocata filete con mojo pic�n de Salesianos Triana cobrado por Marta');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'ColaCado');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Tostada');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Leche');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Galletas Mar�a');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Bizcocho');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Zumo de Naranja');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Zumo de Pi�a');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Nesquik');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Cereales');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Magdalenas');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Choco Flakes');

INSERT INTO COMIDAS
VALUES (SEQ_COMIDAS.NEXTVAL, 'Palmeras de chocolate');*/


/*Antonio

insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 55, 29, 40);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 67, 1, 23);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 66, 30, 1);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 64, 34, 46);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 65, 55, 51);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 61, 21, 41);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 65, 5, 44);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 55, 11, 53);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 65, 24, 50);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 63, 41, 8);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 60, 4, 9);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 65, 3, 32);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 61, 46, 24);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 63, 55, 10);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 65, 17, 27);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 67, 10, 33);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 58, 15, 31);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 62, 43, 4);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 56, 41, 1);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 59, 6, 45);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 59, 35, 46);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 58, 3, 26);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 58, 55, 54);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 61, 15, 36);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 64, 13, 43);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 61, 48, 45);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 61, 25, 6);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 59, 42, 32);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 55, 5, 41);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 64, 32, 6);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 56, 35, 41);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 57, 50, 21);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 62, 38, 53);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 67, 55, 45);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 61, 49, 6);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 62, 43, 34);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 61, 24, 26);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 66, 27, 29);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 57, 14, 15);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 58, 28, 39);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 58, 52, 17);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 67, 38, 11);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 63, 8, 13);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 64, 6, 54);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 66, 23, 29);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 67, 35, 12);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 67, 34, 5);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 61, 31, 21);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 66, 36, 19);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 63, 51, 28);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 59, 28, 29);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 66, 11, 42);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 64, 48, 25);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 55, 35, 45);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 66, 25, 53);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 65, 51, 55);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 63, 23, 45);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 58, 42, 2);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 55, 45, 55);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 61, 55, 6);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 56, 25, 30);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 57, 12, 27);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 66, 20, 27);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 67, 24, 40);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 65, 31, 19);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 59, 35, 12);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 63, 17, 55);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 59, 8, 13);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 61, 24, 4);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 57, 15, 29);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 57, 47, 19);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 60, 19, 30);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 59, 53, 52);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 59, 9, 36);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 64, 28, 35);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 60, 29, 19);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 63, 4, 40);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 65, 48, 50);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 58, 30, 8);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 63, 12, 6);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 60, 34, 53);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 63, 2, 29);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 60, 26, 18);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 60, 8, 24);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 62, 19, 14);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 56, 4, 51);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 61, 55, 10);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 61, 6, 17);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 58, 38, 39);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 67, 50, 32);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 57, 22, 28);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 60, 53, 24);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 62, 55, 25);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 65, 45, 49);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 57, 37, 42);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 61, 6, 39);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 55, 7, 35);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 56, 1, 30);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 55, 29, 25);
insert into MOCK_DATA (ID_MENU, NOMBRE, ID_DESAYUNO, ID_ALMUERZO, ID_CENA) values ('SEQ_MENU.NEXTVAL', '''NORMAL''', 63, 37, 14);
*/






/*
DROP TABLE RESIDENTES;
DROP TABLE ESTANCIA;
DROP TABLE MEDICAMENTO;
DROP TABLE TOMAS;
DROP TABLE TRATAMIENTO;
DROP TABLE COMIDAS_SEMANA;
DROP TABLE MENU;
DROP TABLE COMIDAS;

DROP SEQUENCE ID_MEDICAMENTO;
DROP SEQUENCE ID_TRATAMIENTO;
DROP SEQUENCE SECUENCIA_HABITACION;
DROP SEQUENCE SEQ_COMIDAS;
*/























