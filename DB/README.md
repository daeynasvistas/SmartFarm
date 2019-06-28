### V0.0.8

![Relational_1](https://user-images.githubusercontent.com/2634610/59598965-50e3bb80-90f5-11e9-82e7-a2b2e942db59.png)


```SQL

---->> VERSÃO 0.8 IMPORT do SQL develop <<------

--------------------------------------------------------
--  File created - Sexta-feira-Junho-28-2019   
--------------------------------------------------------
DROP SEQUENCE "IOT_ALERT_SEQ";
DROP SEQUENCE "IOT_DATA_SEQ";
DROP SEQUENCE "IOT_LOG_SEQ";
DROP SEQUENCE "IOT_NODE_SEQ";
DROP SEQUENCE "IOT_PERSON_SEQ";
DROP SEQUENCE "IOT_SENSOR_SEQ";
DROP SEQUENCE "IOT_TYPE_SEQ";
DROP SEQUENCE "SEQ_VENDAS";
DROP SEQUENCE "SEQ1";
DROP SEQUENCE "USERS_SEQ";
DROP TABLE "ARTIGOS" cascade constraints;
DROP TABLE "EMP" cascade constraints;
DROP TABLE "IOT_LOG_TABLE" cascade constraints;
DROP TABLE "IOT_NODE" cascade constraints;
DROP TABLE "IOT_PERSON" cascade constraints;
DROP TABLE "IOT_SENSOR" cascade constraints;
DROP TABLE "IOT_SENSOR_ALERT" cascade constraints;
DROP TABLE "IOT_SENSOR_DATA" cascade constraints;
DROP TABLE "IOT_SENSOR_TYPE" cascade constraints;
DROP TABLE "USERS" cascade constraints;
DROP TABLE "VENDAS" cascade constraints;
DROP VIEW "IOT_USERS";
DROP PROCEDURE "GET_API_SENSOR_VALUES";
DROP PROCEDURE "HMAC_REQUEST_CHECK";
DROP PROCEDURE "SET_SINK_ALERT";
DROP PROCEDURE "TEST_GET_API_SENSOR_VALUES";
DROP PROCEDURE "TEST_2_GET_API_SENSOR_VALUES";
DROP PACKAGE "REST_DEMO_IN_OUT";
DROP PACKAGE "TEST_WS_AUTHENTICATION";
DROP PACKAGE BODY "REST_DEMO_IN_OUT";
DROP PACKAGE BODY "TEST_WS_AUTHENTICATION";
DROP FUNCTION "CREATE_NONCE";
DROP FUNCTION "CREATE_USER";
DROP FUNCTION "DATE_TO_UNIX_TS";
DROP FUNCTION "IOT_HMAC";
DROP FUNCTION "REQUEST_CHECK";
DROP FUNCTION "TEST_HMAC";
DROP FUNCTION "UPDATE_NONCE";
DROP FUNCTION "VENDA_ARTIGO";
DROP SYNONYM "EMPREGADO";
--------------------------------------------------------
--  DDL for Sequence IOT_ALERT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "IOT_ALERT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence IOT_DATA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "IOT_DATA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 75520 NOCACHE  NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence IOT_LOG_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "IOT_LOG_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 23554 NOCACHE  NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence IOT_NODE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "IOT_NODE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1083 NOCACHE  NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence IOT_PERSON_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "IOT_PERSON_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 14 NOCACHE  NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence IOT_SENSOR_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "IOT_SENSOR_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10 NOCACHE  NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence IOT_TYPE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "IOT_TYPE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1009 NOCACHE  NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence SEQ_VENDAS
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_VENDAS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1000 CACHE 20 NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1000 CACHE 20 NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence USERS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USERS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Table ARTIGOS
--------------------------------------------------------

  CREATE TABLE "ARTIGOS" 
   (	"ID" NUMBER(9,0), 
	"NOME" VARCHAR2(30 BYTE), 
	"PRECO" NUMBER(6,2), 
	"STOCK" NUMBER(6,0) DEFAULT 1, 
	"DATA" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EMP
--------------------------------------------------------

  CREATE TABLE "EMP" 
   (	"EMPNO" NUMBER(4,0), 
	"ENAME" VARCHAR2(10 BYTE), 
	"JOB" VARCHAR2(9 BYTE), 
	"MGR" NUMBER(4,0), 
	"HIREDATE" DATE, 
	"SAL" NUMBER(7,2), 
	"COMM" NUMBER(7,2), 
	"DEPTNO" NUMBER(2,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table IOT_LOG_TABLE
--------------------------------------------------------

  CREATE TABLE "IOT_LOG_TABLE" 
   (	"ID" NUMBER(10,0), 
	"DATE_FETCH" NUMBER(16,0), 
	"ERROR" VARCHAR2(80 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table IOT_NODE
--------------------------------------------------------

  CREATE TABLE "IOT_NODE" 
   (	"ID" NUMBER(8,0), 
	"IOT_PERSON_ID" NUMBER(10,0), 
	"MODEL" VARCHAR2(25 BYTE), 
	"FIRM_VERS" VARCHAR2(8 BYTE), 
	"MAC" VARCHAR2(20 BYTE), 
	"LONGITUDE" NUMBER(8,6), 
	"LATITUDE" NUMBER(8,6), 
	"ALTITUDE" NUMBER(5,0), 
	"HAS_API" CHAR(1 BYTE), 
	"IP" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table IOT_PERSON
--------------------------------------------------------

  CREATE TABLE "IOT_PERSON" 
   (	"ID" NUMBER(10,0), 
	"EMAIL" VARCHAR2(50 BYTE), 
	"PASSWORD" VARCHAR2(100 BYTE), 
	"KEY" VARCHAR2(60 BYTE), 
	"SECRET" VARCHAR2(100 BYTE), 
	"CREATION_DATE" NUMBER(16,0), 
	"ATIVO" CHAR(1 BYTE), 
	"NONCE" NUMBER(16,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table IOT_SENSOR
--------------------------------------------------------

  CREATE TABLE "IOT_SENSOR" 
   (	"ID" NUMBER(10,0), 
	"IOT_SENSOR_TYPE_ID" NUMBER(5,0), 
	"IOT_NODE_ID" NUMBER(8,0), 
	"CODE" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"DESCRIPTION" VARCHAR2(80 BYTE), 
	"DATE_INSTALLED" NUMBER(16,0), 
	"DATE_TERMINATE" NUMBER(16,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table IOT_SENSOR_ALERT
--------------------------------------------------------

  CREATE TABLE "IOT_SENSOR_ALERT" 
   (	"ID" NUMBER(10,0), 
	"IOT_SENSOR_ID" NUMBER(10,0), 
	"DATE_ALERT" NUMBER(16,0), 
	"DESCRIPTION" VARCHAR2(80 BYTE), 
	"ALERT_SEND" CHAR(1 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table IOT_SENSOR_DATA
--------------------------------------------------------

  CREATE TABLE "IOT_SENSOR_DATA" 
   (	"ID" NUMBER(8,0), 
	"IOT_SENSOR_ID" NUMBER(10,0), 
	"DATE_OF_VALUE" NUMBER(16,0), 
	"VALUE" NUMBER(6,2), 
	"LONGITUDE" NUMBER(8,6), 
	"LATITUDE" NUMBER(8,6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table IOT_SENSOR_TYPE
--------------------------------------------------------

  CREATE TABLE "IOT_SENSOR_TYPE" 
   (	"ID" NUMBER(5,0), 
	"NAME" VARCHAR2(20 BYTE), 
	"UNIT" VARCHAR2(5 BYTE), 
	"DESCRIPTION" VARCHAR2(80 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "USERS" 
   (	"ID" NUMBER(9,0) GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE , 
	"USERNAME" VARCHAR2(20 BYTE), 
	"KEY" VARCHAR2(56 BYTE), 
	"SECRET" VARCHAR2(88 BYTE), 
	"CREATION_DATE" NUMBER(16,0), 
	"NONCE" NUMBER(16,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table VENDAS
--------------------------------------------------------

  CREATE TABLE "VENDAS" 
   (	"ID" NUMBER(9,0), 
	"ARTIGO" NUMBER(2,0), 
	"QT" NUMBER(2,0), 
	"DATA" DATE DEFAULT sysdate, 
	"TOTAL" NUMBER(7,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View IOT_USERS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "IOT_USERS" ("EMAIL") AS 
  SELECT email
    
FROM iot_person
;


Insert into IOT_NODE (ID,IOT_PERSON_ID,MODEL,FIRM_VERS,MAC,LONGITUDE,LATITUDE,ALTITUDE,HAS_API,IP) values ('1040','9','ESP32-LORA (Android)','0.1','1AA11110123','-7,125455','40,451244','1000','1','192.168.1.180');
Insert into IOT_NODE (ID,IOT_PERSON_ID,MODEL,FIRM_VERS,MAC,LONGITUDE,LATITUDE,ALTITUDE,HAS_API,IP) values ('1068','9','mais lora cenas','0.1','mais lora cenas','0','0','0','0','000.000.000.000');
Insert into IOT_NODE (ID,IOT_PERSON_ID,MODEL,FIRM_VERS,MAC,LONGITUDE,LATITUDE,ALTITUDE,HAS_API,IP) values ('1044','9','ESP32-LORA (Android)','0.1','1ZZ11110123','-7,125455','40,451244','1000','0','192.168.000.000');
Insert into IOT_NODE (ID,IOT_PERSON_ID,MODEL,FIRM_VERS,MAC,LONGITUDE,LATITUDE,ALTITUDE,HAS_API,IP) values ('1056','9','cenas lora','0.1','cenas lora','0','0','0','0','000.000.000.000');
Insert into IOT_NODE (ID,IOT_PERSON_ID,MODEL,FIRM_VERS,MAC,LONGITUDE,LATITUDE,ALTITUDE,HAS_API,IP) values ('1069','1','cenas','0.1','cenas','0','0','0','0','000.000.000.000');
Insert into IOT_NODE (ID,IOT_PERSON_ID,MODEL,FIRM_VERS,MAC,LONGITUDE,LATITUDE,ALTITUDE,HAS_API,IP) values ('1082','1','ARDUINO UNO','0.1','ARDUINO UNO','0','0','0','0','000.000.000.000');
Insert into IOT_NODE (ID,IOT_PERSON_ID,MODEL,FIRM_VERS,MAC,LONGITUDE,LATITUDE,ALTITUDE,HAS_API,IP) values ('1000','1','ESP32 Lora','0.1','1A0000000','-7,354986','40,777083','1090','0','192.000.000.000');
Insert into IOT_NODE (ID,IOT_PERSON_ID,MODEL,FIRM_VERS,MAC,LONGITUDE,LATITUDE,ALTITUDE,HAS_API,IP) values ('1006','1','New ESP32 (change)','0.2','1B11111111','-7,215487','40,125413','355','0','192.168.1.2');
Insert into IOT_NODE (ID,IOT_PERSON_ID,MODEL,FIRM_VERS,MAC,LONGITUDE,LATITUDE,ALTITUDE,HAS_API,IP) values ('1007','1','ESP32-LORA (Android)','0.1','1AA00000123','-7,125455','40,451244','1000','0','192.168.000.000');
Insert into IOT_NODE (ID,IOT_PERSON_ID,MODEL,FIRM_VERS,MAC,LONGITUDE,LATITUDE,ALTITUDE,HAS_API,IP) values ('1008','1','ESP32-LORA (Android)','0.1','1AA00000123','-7,125455','40,451244','1000','0','192.168.000.000');
Insert into IOT_NODE (ID,IOT_PERSON_ID,MODEL,FIRM_VERS,MAC,LONGITUDE,LATITUDE,ALTITUDE,HAS_API,IP) values ('1009','1','ESP32-LORA (Android)','0.1','1AA00000123','-7,125455','40,451244','1000','0','192.168.000.000');
Insert into IOT_NODE (ID,IOT_PERSON_ID,MODEL,FIRM_VERS,MAC,LONGITUDE,LATITUDE,ALTITUDE,HAS_API,IP) values ('1010','1','ESP32-LORA (Android)','0.1','1AA11110123','-7,125455','40,451244','1000','0','192.168.000.000');
Insert into IOT_NODE (ID,IOT_PERSON_ID,MODEL,FIRM_VERS,MAC,LONGITUDE,LATITUDE,ALTITUDE,HAS_API,IP) values ('1011','1','ESP32-LORA (Android)','0.1','1AA11110123','-7,125455','40,451244','1000','0','192.168.000.000');
Insert into IOT_NODE (ID,IOT_PERSON_ID,MODEL,FIRM_VERS,MAC,LONGITUDE,LATITUDE,ALTITUDE,HAS_API,IP) values ('1015','1','ESP32-LORA (Android)','0.1','1AA11110123','-7,125455','40,451244','1000','0','192.168.000.000');
REM INSERTING into IOT_PERSON
SET DEFINE OFF;
Insert into IOT_PERSON (ID,EMAIL,PASSWORD,KEY,SECRET,CREATION_DATE,ATIVO,NONCE) values ('10','Daniel@maiscenas.com',null,'Njg4OTVBMEY2NEVCMDBBNUY0MTFCNjQxM0VGOTNBRkFEQjJBQTEwNA==','Qzc0Q0FCQTJERTM0NTgwNEE2QkE3OUIzQzUyQTVGRUFCQTI0ODkwRDc3MTRDQUYwMDkwODNERTMwREJEQUFCOQ==','1560774664','1','0');
Insert into IOT_PERSON (ID,EMAIL,PASSWORD,KEY,SECRET,CREATION_DATE,ATIVO,NONCE) values ('12','Daniel@maiscenasHMAC.com',null,'RTQ4QzlBNjJFNjBDMUU4MTY3MUVFQ0YzMDVDQjMyMEZDQkI3Q0JFNg==','QzEyNTE0MDA5MDk0RjY0RTIzNDczN0VCNUREMjdCOUZFMkVBMEU3OTREMEE2RkM1OEU5MzMyOTI2Mjc1RTU3MA==','1560774832','1','0');
Insert into IOT_PERSON (ID,EMAIL,PASSWORD,KEY,SECRET,CREATION_DATE,ATIVO,NONCE) values ('8','daniel@gmail.com',null,'RThCQjNDOEJEMjlBNzNCMEE0REQ3MUY3OUJGRDY5NjNBMEZFMjYxMQ==','NUQ3MzFBOTRDQTg3RkREQ0E5Qjk0NTc3ODYwODIyMDJCMTQ2RURFNTI1MjdBOEI2MTkxQjM1RjczQTIzQjhERA==','1560771162','1','0');
Insert into IOT_PERSON (ID,EMAIL,PASSWORD,KEY,SECRET,CREATION_DATE,ATIVO,NONCE) values ('9','daniel@cenas.com',null,null,'==',null,'1','0');
Insert into IOT_PERSON (ID,EMAIL,PASSWORD,KEY,SECRET,CREATION_DATE,ATIVO,NONCE) values ('13','Daniel@muitomaisHMAC.com',null,'OUU0MkZCMDU1OUQ1RTAyOTIyQzc3NzFCMkQ4RkY0NTgwNTZDNDVEMQ==','RTY1QUE0NTQ0QTk0M0M0M0E5OUY0MzUwREM5M0MyMDk1OTg3NjhDMzhDM0I2OUM4MUNGMDQzRDc2NDIwMTZGNQ==','1561377202','1','0');
Insert into IOT_PERSON (ID,EMAIL,PASSWORD,KEY,SECRET,CREATION_DATE,ATIVO,NONCE) values ('1','daniel@ept.pt',null,'RTlCRjMzMjBDQjNFNDc0QjNBNTEzNkVCODIyMTQwM0RBMjVFNzAyNQ==','Mjg2OTY3QTI4ODE1QjgzRTYyMDZGNzcwNjlGMzMzRkU4NDBFQUVCRDU0ODlCODBFNzQ5ODQ5NkYxODk2RTk0RA==','1560774541','1','1561722057735000');
REM INSERTING into IOT_SENSOR
SET DEFINE OFF;
Insert into IOT_SENSOR (ID,IOT_SENSOR_TYPE_ID,IOT_NODE_ID,CODE,NAME,DESCRIPTION,DATE_INSTALLED,DATE_TERMINATE) values ('1','1000','1000','BME280','Digital Sensor','Temperature, Humidity, Atmospheric Pressure','1557162015',null);
Insert into IOT_SENSOR (ID,IOT_SENSOR_TYPE_ID,IOT_NODE_ID,CODE,NAME,DESCRIPTION,DATE_INSTALLED,DATE_TERMINATE) values ('2','1001','1000','BME280','Digital Sensor','Temperature, Humidity, Atmospheric Pressure','1557162015',null);
Insert into IOT_SENSOR (ID,IOT_SENSOR_TYPE_ID,IOT_NODE_ID,CODE,NAME,DESCRIPTION,DATE_INSTALLED,DATE_TERMINATE) values ('3','1002','1000','BME280','Digital Sensor','Temperature, Humidity, Atmospheric Pressure','1557162016',null);
Insert into IOT_SENSOR (ID,IOT_SENSOR_TYPE_ID,IOT_NODE_ID,CODE,NAME,DESCRIPTION,DATE_INSTALLED,DATE_TERMINATE) values ('4','1003','1000','CCS811','Air Mass Sensor','NTC CO2 eCO2 TVOC Air Mass Sensor','1557162016',null);
Insert into IOT_SENSOR (ID,IOT_SENSOR_TYPE_ID,IOT_NODE_ID,CODE,NAME,DESCRIPTION,DATE_INSTALLED,DATE_TERMINATE) values ('5','1004','1000','CCS811','Air Mass Sensor','NTC CO2 eCO2 TVOC Air Mass Sensor','1557162017',null);
Insert into IOT_SENSOR (ID,IOT_SENSOR_TYPE_ID,IOT_NODE_ID,CODE,NAME,DESCRIPTION,DATE_INSTALLED,DATE_TERMINATE) values ('6','1005','1000','YL-38','Soil Hygrometer','Detection Module Moisture Sensor','1557162017',null);
Insert into IOT_SENSOR (ID,IOT_SENSOR_TYPE_ID,IOT_NODE_ID,CODE,NAME,DESCRIPTION,DATE_INSTALLED,DATE_TERMINATE) values ('7','1006','1000','GL5528','Photosensitive','detect the light intensity','1557162017',null);
Insert into IOT_SENSOR (ID,IOT_SENSOR_TYPE_ID,IOT_NODE_ID,CODE,NAME,DESCRIPTION,DATE_INSTALLED,DATE_TERMINATE) values ('8','1007','1000','LM393','UV Detector','detect flame','1557162018',null);
Insert into IOT_SENSOR (ID,IOT_SENSOR_TYPE_ID,IOT_NODE_ID,CODE,NAME,DESCRIPTION,DATE_INSTALLED,DATE_TERMINATE) values ('9','1008','1000','OKY3131','Sound Detection','High Sensitive Microphone','1557162018',null);
REM INSERTING into IOT_SENSOR_ALERT
SET DEFINE OFF;
REM INSERTING into IOT_SENSOR_DATA
SET DEFINE OFF;

Insert into IOT_SENSOR_TYPE (ID,NAME,UNIT,DESCRIPTION) values ('1000','air_temperature','C','Temperatura ambiente');
Insert into IOT_SENSOR_TYPE (ID,NAME,UNIT,DESCRIPTION) values ('1001','air_humidity','%','Humidade ambiente');
Insert into IOT_SENSOR_TYPE (ID,NAME,UNIT,DESCRIPTION) values ('1002','air_pressure','atm','Press�o atmosf�rica');
Insert into IOT_SENSOR_TYPE (ID,NAME,UNIT,DESCRIPTION) values ('1003','air_CO2','ppm','Concentra��o Di�xido de Carbono');
Insert into IOT_SENSOR_TYPE (ID,NAME,UNIT,DESCRIPTION) values ('1004','air_TVOC','mg/m3','Compostos Org�nicos Vol�teis');
Insert into IOT_SENSOR_TYPE (ID,NAME,UNIT,DESCRIPTION) values ('1005','soil_humidity','%','Humidade do solo');
Insert into IOT_SENSOR_TYPE (ID,NAME,UNIT,DESCRIPTION) values ('1006','lux','Lux','Luminosidade');
Insert into IOT_SENSOR_TYPE (ID,NAME,UNIT,DESCRIPTION) values ('1007','flame','UV','Dete��o de chama');
Insert into IOT_SENSOR_TYPE (ID,NAME,UNIT,DESCRIPTION) values ('1008','sound','dB','Som Ambiente');

--------------------------------------------------------
--  DDL for Index IOT_SENSOR_TYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "IOT_SENSOR_TYPE_PK" ON "IOT_SENSOR_TYPE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IOT_PERSON_KEY
--------------------------------------------------------

  CREATE UNIQUE INDEX "IOT_PERSON_KEY" ON "IOT_PERSON" ("KEY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IOT_SENSOR_DATA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "IOT_SENSOR_DATA_PK" ON "IOT_SENSOR_DATA" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

--------------------------------------------------------
--  DDL for Index IOT_SENSOR_ALERT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "IOT_SENSOR_ALERT_PK" ON "IOT_SENSOR_ALERT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IOT_NODE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "IOT_NODE_PK" ON "IOT_NODE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

--------------------------------------------------------
--  DDL for Index IOT_PERSON_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "IOT_PERSON_PK" ON "IOT_PERSON" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IOT_PERSON_EMAIL
--------------------------------------------------------

  CREATE UNIQUE INDEX "IOT_PERSON_EMAIL" ON "IOT_PERSON" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

--------------------------------------------------------
--  DDL for Index IOT_LOG_TABLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "IOT_LOG_TABLE_PK" ON "IOT_LOG_TABLE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IOT_SENSOR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "IOT_SENSOR_PK" ON "IOT_SENSOR" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger ALERT_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ALERT_ON_INSERT" 
  BEFORE INSERT ON iot_sensor_alert
  FOR EACH ROW
BEGIN
  SELECT IOT_alert_seq.nextval
  INTO :new.id
  FROM dual;
END;

/
ALTER TRIGGER "ALERT_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DATA_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "DATA_ON_INSERT" 
  BEFORE INSERT ON iot_sensor_data
  FOR EACH ROW
BEGIN
  SELECT IOT_data_seq.nextval
  INTO :new.id
  FROM dual;
END;

/
ALTER TRIGGER "DATA_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger LOG_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "LOG_ON_INSERT" 
  BEFORE INSERT ON iot_log_table
  FOR EACH ROW
BEGIN
  SELECT IOT_log_seq.nextval
  INTO :new.id
  FROM dual;
END;

/
ALTER TRIGGER "LOG_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger NODE_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "NODE_ON_INSERT" 
  BEFORE INSERT ON iot_node
  FOR EACH ROW
BEGIN
  SELECT IOT_node_seq.nextval
  INTO :new.id
  FROM dual;
END;

/
ALTER TRIGGER "NODE_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PERSON_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PERSON_ON_INSERT" 
  BEFORE INSERT ON iot_person
  FOR EACH ROW
BEGIN
  SELECT IOT_person_seq.nextval
  INTO :new.id
  FROM dual;
END;

/
ALTER TRIGGER "PERSON_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SENSOR_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "SENSOR_ON_INSERT" 
  BEFORE INSERT ON iot_sensor
  FOR EACH ROW
BEGIN
  SELECT IOT_sensor_seq.nextval
  INTO :new.id
  FROM dual;
END;

/
ALTER TRIGGER "SENSOR_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TYPE_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "TYPE_ON_INSERT" 
  BEFORE INSERT ON iot_sensor_type
  FOR EACH ROW
BEGIN
  SELECT IOT_type_seq.nextval
  INTO :new.id
  FROM dual;
END;

/
ALTER TRIGGER "TYPE_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USER_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "USER_ON_INSERT" 
  BEFORE INSERT ON users
  FOR EACH ROW
BEGIN
  SELECT USERS_SEQ.nextval
  INTO :new.id
  FROM dual;
END;
/
ALTER TRIGGER "USER_ON_INSERT" ENABLE;

--------------------------------------------------------
--  DDL for Procedure GET_API_SENSOR_VALUES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "GET_API_SENSOR_VALUES" IS

    /*Vers�o 2 com ARRAY JSON*/
    totalArray INTEGER;


    /*Vers�o 1 com JSON*/
    /*JSON stuff*/   
    v_json       CLOB;
    v_json_query CLOB;
    v_json_value CLOB;
    /*Multiplos valores de sensores no mesmonode*/   
    type sensorsArray IS VARRAY(9) OF NUMBER(6,2); 
    type sensorNameArray IS VARRAY(9) OF VARCHAR2(20);
    sensorValue sensorsArray;     
    sensorName sensorNameArray; 
    total INTEGER; 


    /*MODEL: iot_sensor_data*/
    f_IOT_NODE_MAC        VARCHAR2(20);  
    f_IOT_SENSOR_ID       NUMBER(8);
    f_DATE_OF_VALUE       NUMBER(16,0);

    f_VALUE_air_temp      NUMBER(6,2);
    f_VALUE_air_humidity  NUMBER(6,2);    
    f_VALUE_air_pressure  NUMBER(6,2);
    f_VALUE_air_CO2       NUMBER(6,2);    
    f_VALUE_air_TVOC      NUMBER(6,2);
    f_VALUE_lux           NUMBER(6,2);    
    f_VALUE_flame         NUMBER(6,2);   
    f_VALUE_soil_humidity NUMBER(6,2);    
    f_VALUE_sound         NUMBER(6,2);

    f_LONGITUDE     CLOB;    
    f_LATITUDE      CLOB;



BEGIN
    v_json := bda.bda.return_web_page('http://my-json-server.typicode.com/daeynasvistas/Smart-IOT/nodes');
   -- dbms_output.put_line(v_json);


-- START PRIMEIRO LOOP dividir ARRAY de JSON  
-- Problemas com loop -- fixar 0--3
--FOR j IN 0..3 LOOP

     SELECT JSON_QUERY(v_json, '$['j']' 
            WITH CONDITIONAL WRAPPER EMPTY ON ERROR ) AS value
      INTO v_json_query  FROM DUAL;

 /*  ------------  TEST VERS�O 2 --ARRAY JSON ---------- */      
  --  SELECT JSON_VALUE(v_json_query, '$.id')
  --    INTO v_json_value
  --    FROM DUAL;
  --    dbms_output.put_line(v_json_value);
           SELECT 
                date_to_unix_ts(SYSDATE), --JSON_VALUE(v_json, '$.date_of_value'),
                JSON_VALUE(v_json_query, '$.id'),
                TO_NUMBER(JSON_VALUE(v_json_query, '$.air_temp'), '999.99'),
                TO_NUMBER(JSON_VALUE(v_json_query, '$.air_humidity'), '999.99'),
                TO_NUMBER(JSON_VALUE(v_json_query, '$.air_pressure'), '9999'),
                TO_NUMBER(JSON_VALUE(v_json_query, '$.air_CO2'), '9999'),
                TO_NUMBER(JSON_VALUE(v_json_query, '$.air_TVOC'), '9999'),
                TO_NUMBER(JSON_VALUE(v_json_query, '$.lux'), '9999'),
                TO_NUMBER(JSON_VALUE(v_json_query, '$.flame'), '9999'),
                TO_NUMBER(JSON_VALUE(v_json_query, '$.soil_humidity'), '9999'),
                TO_NUMBER(JSON_VALUE(v_json_query, '$.sound'), '9999')
            INTO 
                f_DATE_OF_VALUE,
                f_IOT_NODE_MAC,
                f_VALUE_air_temp,f_VALUE_air_humidity,f_VALUE_air_pressure,f_VALUE_air_CO2,f_VALUE_air_TVOC,f_VALUE_lux,f_VALUE_flame,f_VALUE_soil_humidity,f_VALUE_sound

            FROM dual;
              -- dbms_output.put_line(f_IOT_SENSOR_ID||' -- '||f_DATE_OF_VALUE||' -- '||f_VALUE_air_temp||' -- '||f_VALUE_air_humidity||' -- '||f_VALUE_air_pressure||' -- '||f_VALUE_air_CO2||' -- '||f_VALUE_air_TVOC      ||' -- '||f_VALUE_lux||' -- '||f_VALUE_flame||' -- '||f_VALUE_soil_humidity||' -- '||f_VALUE_sound);
            sensorValue := sensorsArray(f_VALUE_air_temp,f_VALUE_air_humidity,f_VALUE_air_pressure,f_VALUE_air_CO2,f_VALUE_air_TVOC,f_VALUE_soil_humidity,f_VALUE_lux,f_VALUE_flame,f_VALUE_sound); 
            sensorName := sensorNameArray('air_temperature','air_humidity','air_pressure','air_CO2','air_TVOC','soil_humidity','lux','flame','sound'); 
            total := sensorValue.count;


             -- START LOOP INSERIR valores de cada JSON
            FOR i IN 1..total LOOP
                  BEGIN  
                  --/* try 
                            SELECT iot_sensor.ID INTO f_IOT_SENSOR_ID
                                    FROM iot_sensor 
                                    INNER JOIN iot_sensor_type
                                    ON iot_sensor.iot_sensor_type_id = iot_sensor_type.id
                                    WHERE iot_sensor_type_id=(select iot_sensor_type.id FROM iot_sensor_type WHERE name=sensorName(i))
                                    AND iot_sensor.iot_node_id=(select iot_node.ID FROM iot_node WHERE iot_node.mac=f_IOT_NODE_MAC);

                       INSERT INTO iot_sensor_data (iot_sensor_id, date_of_value, value) VALUES (f_IOT_SENSOR_ID ,f_DATE_OF_VALUE, sensorValue(i));
                       --DBMS_OUTPUT.PUT_LINE('INSERIDO: '||i);

                  EXCEPTION --/*catch 

                  WHEN OTHERS THEN
                      DBMS_OUTPUT.PUT_LINE('ERROR - Name: '||sensorName(i)||' - Value: '||sensorValue(i));
                      INSERT INTO iot_log_table (date_fetch, error) VALUES (date_to_unix_ts(SYSDATE),'ERROR - Name: '||sensorName(i)||' - Value: '||sensorValue(i));

                  END;
            END LOOP;
            /* --- LOG's*/
            INSERT INTO iot_log_table (date_fetch, error) VALUES (date_to_unix_ts(SYSDATE),'none');
            --DBMS_OUTPUT.PUT_LINE('INSERIDO: '||j||' JSON: '||v_json_query);


--END LOOP;
-- FIM PRIMEIRO LOOP dividir ARRAY de JSON   

COMMIT;
END GET_API_sensor_VALUES;

/
--------------------------------------------------------
--  DDL for Procedure HMAC_REQUEST_CHECK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "HMAC_REQUEST_CHECK" AS

     v_hmac_request bda.ws_authentication.hmac_request_type;
     v_nonce          iot_person.nonce%TYPE;
     v_key            iot_person.key%TYPE;
     v_secret         iot_person.secret%TYPE;
     v_pos            number(9);
     v_api_sign       VARCHAR2(88);
     v_user_ok        BOOLEAN := false;
     v_binary_hash            RAW(2048);
BEGIN
    SELECT key, secret
    INTO v_key, v_secret
    FROM iot_person
    WHERE iot_person.email = 'daniel@cenas.com';

     v_hmac_request := bda.ws_authentication.hmac('persons','','',v_secret);

     v_pos := instr(v_hmac_request.post_data,'=',-1)+1;
     v_nonce := substr(v_hmac_request.post_data, v_pos);
     v_api_sign := v_hmac_request.api_sign;

    dbms_output.put_line('-------- POS, hmac_request,NONCE, API_SIGN-------');     
    dbms_output.put_line(v_pos);
    dbms_output.put_line(v_hmac_request.post_data);
    dbms_output.put_line(v_nonce);
    dbms_output.put_line(v_api_sign);   
    dbms_output.put_line('---------------SECRET-------------------');     
    dbms_output.put_line(v_secret);   
    dbms_output.put_line(utl_raw.cast_to_raw(v_secret)); 
    dbms_output.put_line(utl_encode.base64_decode(utl_raw.cast_to_raw(v_secret))); 
    dbms_output.put_line('---------------KEY -------------------');     
    dbms_output.put_line(v_key);   
    dbms_output.put_line(v_key);   
    dbms_output.put_line('--------------------------------------');     

     v_user_ok := bda.ws_authentication.check_hmac('persons','','', v_nonce, v_key, v_api_sign, v_secret);
     IF v_user_ok = true THEN
            dbms_output.put_line('User OK');
     ELSE
            dbms_output.put_line('Wrong user credentials');
     END IF;
END HMAC_request_check;

/
--------------------------------------------------------
--  DDL for Procedure TEST_GET_API_SENSOR_VALUES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEST_GET_API_SENSOR_VALUES" IS

    /*Vers�o 2 com ARRAY JSON*/
    totalArray INTEGER;

    /*Vers�o 1 com JSON*/
    /*JSON stuff*/   
    v_json       CLOB;
    v_json_query CLOB;
    v_json_value CLOB;
    /*Multiplos valores de sensores no mesmonode*/   
    type sensorsArray IS VARRAY(9) OF NUMBER(6,2); 
    type sensorNameArray IS VARRAY(9) OF VARCHAR2(20);
    sensorValue sensorsArray;     
    sensorName sensorNameArray; 
    total INTEGER; 


    /*MODEL: iot_sensor_data*/
    f_IOT_NODE_MAC        VARCHAR2(20);  
    f_IOT_SENSOR_ID       NUMBER(8);
    f_DATE_OF_VALUE       NUMBER(16,0);

    f_VALUE_air_temp      NUMBER(6,2);
    f_VALUE_air_humidity  NUMBER(6,2);    
    f_VALUE_air_pressure  NUMBER(6,2);
    f_VALUE_air_CO2       NUMBER(6,2);    
    f_VALUE_air_TVOC      NUMBER(6,2);
    f_VALUE_lux           NUMBER(6,2);    
    f_VALUE_flame         NUMBER(6,2);   
    f_VALUE_soil_humidity NUMBER(6,2);    
    f_VALUE_sound         NUMBER(6,2);

    f_LONGITUDE     CLOB;    
    f_LATITUDE      CLOB;



BEGIN
    v_json := bda.bda.return_web_page('http://my-json-server.typicode.com/daeynasvistas/SmartFarm/nodes');
   -- dbms_output.put_line(v_json);


-- START PRIMEIRO LOOP dividir ARRAY de JSON   
--FOR j IN 0..3 LOOP

     SELECT JSON_QUERY(v_json, '$['j']' 
            WITH CONDITIONAL WRAPPER EMPTY ON ERROR ) AS value
           --WITH CONDITIONAL WRAPPER) AS value
      INTO v_json_query  FROM DUAL;

 /*  ------------  TEST VERS�O 2 --ARRAY JSON ---------- */      
  --  SELECT JSON_VALUE(v_json_query, '$.id')
  --    INTO v_json_value
  --    FROM DUAL;
  --    dbms_output.put_line(v_json_value);
           SELECT 
                date_to_unix_ts(SYSDATE), --JSON_VALUE(v_json, '$.date_of_value'),
                JSON_VALUE(v_json_query, '$.id'),
                TO_NUMBER(JSON_VALUE(v_json_query, '$.air_temp'), '999.99'),
                TO_NUMBER(JSON_VALUE(v_json_query, '$.air_humidity'), '999.99'),
                TO_NUMBER(JSON_VALUE(v_json_query, '$.air_pressure'), '9999'),
                TO_NUMBER(JSON_VALUE(v_json_query, '$.air_CO2'), '9999'),
                TO_NUMBER(JSON_VALUE(v_json_query, '$.air_TVOC'), '9999'),
                TO_NUMBER(JSON_VALUE(v_json_query, '$.lux'), '9999'),
                TO_NUMBER(JSON_VALUE(v_json_query, '$.flame'), '9999'),
                TO_NUMBER(JSON_VALUE(v_json_query, '$.soil_humidity'), '9999'),
                TO_NUMBER(JSON_VALUE(v_json_query, '$.sound'), '9999')
            INTO 
                f_DATE_OF_VALUE,
                f_IOT_NODE_MAC,
                f_VALUE_air_temp,f_VALUE_air_humidity,f_VALUE_air_pressure,f_VALUE_air_CO2,f_VALUE_air_TVOC,f_VALUE_lux,f_VALUE_flame,f_VALUE_soil_humidity,f_VALUE_sound

            FROM dual;
              -- dbms_output.put_line(f_IOT_SENSOR_ID||' -- '||f_DATE_OF_VALUE||' -- '||f_VALUE_air_temp||' -- '||f_VALUE_air_humidity||' -- '||f_VALUE_air_pressure||' -- '||f_VALUE_air_CO2||' -- '||f_VALUE_air_TVOC      ||' -- '||f_VALUE_lux||' -- '||f_VALUE_flame||' -- '||f_VALUE_soil_humidity||' -- '||f_VALUE_sound);
            sensorValue := sensorsArray(f_VALUE_air_temp,f_VALUE_air_humidity,f_VALUE_air_pressure,f_VALUE_air_CO2,f_VALUE_air_TVOC,f_VALUE_soil_humidity,f_VALUE_lux,f_VALUE_flame,f_VALUE_sound); 
            sensorName := sensorNameArray('air_temperature','air_humidity','air_pressure','air_CO2','air_TVOC','soil_humidity','lux','flame','sound'); 
            total := sensorValue.count;


             -- START LOOP INSERIR valores de cada JSON
            FOR i IN 1..total LOOP
                  BEGIN  
                  --/* try 
                            SELECT iot_sensor.ID INTO f_IOT_SENSOR_ID
                                    FROM iot_sensor 
                                    INNER JOIN iot_sensor_type
                                    ON iot_sensor.iot_sensor_type_id = iot_sensor_type.id
                                    WHERE iot_sensor_type_id=(select iot_sensor_type.id FROM iot_sensor_type WHERE name=sensorName(i))
                                    AND iot_sensor.iot_node_id=(select iot_node.ID FROM iot_node WHERE iot_node.mac=f_IOT_NODE_MAC);

                       INSERT INTO iot_sensor_data (iot_sensor_id, date_of_value, value) VALUES (f_IOT_SENSOR_ID ,f_DATE_OF_VALUE, sensorValue(i));
                       --DBMS_OUTPUT.PUT_LINE('INSERIDO: '||i);

                  EXCEPTION --/*catch 

                  WHEN OTHERS THEN
                      DBMS_OUTPUT.PUT_LINE('ERROR - Name: '||sensorName(i)||' - Value: '||sensorValue(i));
                      INSERT INTO iot_log_table (date_fetch, error) VALUES (date_to_unix_ts(SYSDATE),'ERROR - Name: '||sensorName(i)||' - Value: '||sensorValue(i));

                  END;
            END LOOP;
            /* --- LOG's*/
            INSERT INTO iot_log_table (date_fetch, error) VALUES (date_to_unix_ts(SYSDATE),'none');
            DBMS_OUTPUT.PUT_LINE('INSERIDO: '||j||' JSON: '||v_json_query);


--END LOOP;
-- FIM PRIMEIRO LOOP dividir ARRAY de JSON   

COMMIT;
END TEST_GET_API_sensor_VALUES;

/
--------------------------------------------------------
--  DDL for Procedure TEST_2_GET_API_SENSOR_VALUES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEST_2_GET_API_SENSOR_VALUES" IS

    /*Vers�o 2 com ARRAY JSON*/
    totalArray INTEGER;

    /*Vers�o 1 com JSON*/
    /*JSON stuff*/   
    v_json       CLOB;
    v_json_query CLOB;
    v_json_value CLOB;
    /*Multiplos valores de sensores no mesmonode*/   
    type sensorsArray IS VARRAY(9) OF NUMBER(6,2); 
    type sensorNameArray IS VARRAY(9) OF VARCHAR2(20);
    sensorValue sensorsArray;     
    sensorName sensorNameArray; 
    total INTEGER; 


    /*MODEL: iot_sensor_data*/
    f_IOT_NODE_MAC        VARCHAR2(20);  
    f_IOT_SENSOR_ID       NUMBER(8);
    f_DATE_OF_VALUE       NUMBER(16,0);

    f_VALUE_air_temp      NUMBER(6,2);
    f_VALUE_air_humidity  NUMBER(6,2);    
    f_VALUE_air_pressure  NUMBER(6,2);
    f_VALUE_air_CO2       NUMBER(6,2);    
    f_VALUE_air_TVOC      NUMBER(6,2);
    f_VALUE_lux           NUMBER(6,2);    
    f_VALUE_flame         NUMBER(6,2);   
    f_VALUE_soil_humidity NUMBER(6,2);    
    f_VALUE_sound         NUMBER(6,2);

    f_LONGITUDE     CLOB;    
    f_LATITUDE      CLOB;



BEGIN
    v_json := bda.bda.return_web_page('http://my-json-server.typicode.com/daeynasvistas/SmartFarm/nodes');
   -- dbms_output.put_line(v_json);

 /*  ------------  TEST VERS�O 2 --ARRAY JSON ---------- */

    SELECT JSON_QUERY(v_json, '$[0]' 
            EMPTY ON ERROR) AS value
           --WITH CONDITIONAL WRAPPER) AS value
      INTO v_json_query
      FROM DUAL;
      dbms_output.put_line(v_json_query);

  --  SELECT JSON_VALUE(v_json_query, '$.id')
  --    INTO v_json_value
  --    FROM DUAL;
  --    dbms_output.put_line(v_json_value);

 /*  ------------  TEST VERS�O 2 --ARRAY JSON ---------- */



   SELECT 
        date_to_unix_ts(SYSDATE), --JSON_VALUE(v_json, '$.date_of_value'),
        JSON_VALUE(v_json_query, '$.id'),
        TO_NUMBER(JSON_VALUE(v_json_query, '$.air_temp'), '999.99'),
        TO_NUMBER(JSON_VALUE(v_json_query, '$.air_humidity'), '999.99'),
        TO_NUMBER(JSON_VALUE(v_json_query, '$.air_pressure'), '9999'),
        TO_NUMBER(JSON_VALUE(v_json_query, '$.air_CO2'), '9999'),
        TO_NUMBER(JSON_VALUE(v_json_query, '$.air_TVOC'), '9999'),
        TO_NUMBER(JSON_VALUE(v_json_query, '$.lux'), '9999'),
        TO_NUMBER(JSON_VALUE(v_json_query, '$.flame'), '9999'),
        TO_NUMBER(JSON_VALUE(v_json_query, '$.soil_humidity'), '9999'),
        TO_NUMBER(JSON_VALUE(v_json_query, '$.sound'), '9999')
    INTO 
        f_DATE_OF_VALUE,
        f_IOT_NODE_MAC,
        f_VALUE_air_temp,f_VALUE_air_humidity,f_VALUE_air_pressure,f_VALUE_air_CO2,f_VALUE_air_TVOC,f_VALUE_lux,f_VALUE_flame,f_VALUE_soil_humidity,f_VALUE_sound

    FROM dual;
      -- dbms_output.put_line(f_IOT_SENSOR_ID||' -- '||f_DATE_OF_VALUE||' -- '||f_VALUE_air_temp||' -- '||f_VALUE_air_humidity||' -- '||f_VALUE_air_pressure||' -- '||f_VALUE_air_CO2||' -- '||f_VALUE_air_TVOC      ||' -- '||f_VALUE_lux||' -- '||f_VALUE_flame||' -- '||f_VALUE_soil_humidity||' -- '||f_VALUE_sound);
    sensorValue := sensorsArray(f_VALUE_air_temp,f_VALUE_air_humidity,f_VALUE_air_pressure,f_VALUE_air_CO2,f_VALUE_air_TVOC,f_VALUE_soil_humidity,f_VALUE_lux,f_VALUE_flame,f_VALUE_sound); 
    sensorName := sensorNameArray('air_temperature','air_humidity','air_pressure','air_CO2','air_TVOC','soil_humidity','lux','flame','sound'); 
    total := sensorValue.count;



    FOR i IN 1..total LOOP
          BEGIN  
          --/* try 
                    SELECT iot_sensor.ID INTO f_IOT_SENSOR_ID
                            FROM iot_sensor 
                            INNER JOIN iot_sensor_type
                            ON iot_sensor.iot_sensor_type_id = iot_sensor_type.id
                            WHERE iot_sensor_type_id=(select iot_sensor_type.id FROM iot_sensor_type WHERE name=sensorName(i))
                            AND iot_sensor.iot_node_id=(select iot_node.ID FROM iot_node WHERE iot_node.mac=f_IOT_NODE_MAC);

               INSERT INTO iot_sensor_data (iot_sensor_id, date_of_value, value) VALUES (f_IOT_SENSOR_ID ,f_DATE_OF_VALUE, sensorValue(i));

          EXCEPTION --/*catch 

          WHEN OTHERS THEN
              DBMS_OUTPUT.PUT_LINE('ERROR - Name: '||sensorName(i)||' - Value: '||sensorValue(i));
              INSERT INTO iot_log_table (date_fetch, error) VALUES (date_to_unix_ts(SYSDATE),'ERROR - Name: '||sensorName(i)||' - Value: '||sensorValue(i));

          END;
    END LOOP;




/* --- LOG's*/
INSERT INTO iot_log_table (date_fetch, error) VALUES (date_to_unix_ts(SYSDATE),'none');
COMMIT;


END TEST_2_GET_API_sensor_VALUES;

/
--------------------------------------------------------
--  DDL for Package TEST_WS_AUTHENTICATION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "TEST_WS_AUTHENTICATION" IS
    PROCEDURE basic;

    PROCEDURE from_base64;

END test_ws_authentication;

/
--------------------------------------------------------
--  DDL for Function CREATE_NONCE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CREATE_NONCE" 
    RETURN NUMBER IS
        v_nonce iot_person.nonce%TYPE;
        v_systimestamp TIMESTAMP;
    BEGIN

        v_systimestamp := systimestamp;
        v_nonce := trunc((CAST(v_systimestamp AS DATE) - TO_DATE('01/01/1970', 'dd/mm/yyyy')) * 86400000000) + to_number(substr(TO_CHAR(v_systimestamp, 'ffff'), 1, 6));

        RETURN v_nonce;
    END create_nonce;

/
--------------------------------------------------------
--  DDL for Function CREATE_USER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CREATE_USER" (
        v_username VARCHAR2
    ) RETURN NUMBER IS
        v_id users.id%TYPE;
    BEGIN
        INSERT INTO iot_person (
            email,
            key,
            secret,
            creation_date,
            nonce
        ) VALUES (
            v_username,
            BDA.ws_authentication.generate_key,
            BDA.ws_authentication.generate_secret,
            date_to_unix_ts(SYSDATE),
            0
        ) RETURNING id INTO v_id;

        RETURN v_id;
    END create_user;

/
--------------------------------------------------------
--  DDL for Function DATE_TO_UNIX_TS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "DATE_TO_UNIX_TS" ( PDate in date ) return number is
   l_unix_ts number;
begin
   l_unix_ts := ROUND(( PDate - TO_DATE('01.01.1970','dd.mm.yyyy')) * 60 * 60 * 24);
   return l_unix_ts;
end;

/
--------------------------------------------------------
--  DDL for Function IOT_HMAC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "IOT_HMAC" (
        v_username VARCHAR2,
        v_root VARCHAR2,
        v_id VARCHAR2,
        v_data VARCHAR2
                
    ) RETURN string AS
    
        v_hmac_request bda.ws_authentication.hmac_request_type;
        v_key            iot_person.key%TYPE;
        v_secret         iot_person.secret%TYPE;

    BEGIN
        SELECT key, secret
        INTO v_key, v_secret
        FROM iot_person
        WHERE iot_person.email = v_username;

        v_hmac_request := bda.ws_authentication.hmac(v_root, v_id, v_data, v_secret);

        RETURN '------';
    END IOT_hmac;

/
--------------------------------------------------------
--  DDL for Function REQUEST_CHECK
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "REQUEST_CHECK" (
        v_username VARCHAR2
    ) RETURN BOOLEAN IS

     v_hmac_request bda.ws_authentication.hmac_request_type;
     v_nonce          iot_person.nonce%TYPE;
     v_key            iot_person.key%TYPE;
     v_secret         iot_person.secret%TYPE;
     v_pos            number(9);
     v_api_sign       VARCHAR2(88);
     v_user_ok        BOOLEAN := false;
BEGIN



    SELECT key, secret
    INTO v_key, v_secret
    FROM iot_person
    WHERE iot_person.email = 'daniel@cenas.com';

     v_hmac_request := bda.ws_authentication.hmac('daniel@cenas.com','nodes','1015',v_secret);

     v_pos := instr(v_hmac_request.post_data,'=',-1)+1;
     v_nonce := substr(v_hmac_request.post_data, v_pos);
     v_api_sign := v_hmac_request.api_sign;

   -- dbms_output.put_line('---------------------------------------');     
   -- dbms_output.put_line(v_nonce);
   -- dbms_output.put_line(v_key);   
   -- dbms_output.put_line(v_api_sign);   

   -- dbms_output.put_line('---------------------------------------');     

        v_user_ok := bda.ws_authentication.check_hmac('daniel@cenas.com','nodes','1015', v_nonce, v_key, v_api_sign, v_secret);

        IF v_user_ok = true THEN
            dbms_output.put_line('User OK');
        ELSE
            dbms_output.put_line('Wrong user credentials');
        END IF;
END request_check;

/
--------------------------------------------------------
--  DDL for Function TEST_HMAC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "TEST_HMAC" (
        v_path VARCHAR2,
        v_nonce VARCHAR2,
        v_api_key VARCHAR2,
        v_api_sign VARCHAR2
                
    ) RETURN integer IS
    
    v_user_ok   BOOLEAN := false;
    v_secret    iot_person.secret%TYPE;
    v_email     iot_person.email%TYPE;
    v_key       iot_person.key%TYPE;
    n_nonce     iot_person.nonce%type;

    BEGIN

  --- Vers 0.1
    SELECT key, secret, email
    INTO v_key, v_secret, v_email
    FROM iot_person
    WHERE iot_person.key = v_api_key;

        v_user_ok := bda.ws_authentication.check_hmac(v_path,'','', v_nonce , v_api_key, v_api_sign, v_secret);
       
        if(v_user_ok=true) then 
             return 1;
        else return 0;
        end if;
    END test_hmac;

/
--------------------------------------------------------
--  DDL for Function UPDATE_NONCE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "UPDATE_NONCE" (v_key VARCHAR2,  v_nonce iot_person.nonce%TYPE )
    RETURN NUMBER IS
        v_systimestamp TIMESTAMP;
    BEGIN

       -- N�O h� esse detalhe no android em java -- guardar o nonce que vem do android
       -- v_systimestamp := systimestamp;
       -- v_nonce := trunc((CAST(v_systimestamp AS DATE) - TO_DATE('01/01/1970', 'dd/mm/yyyy')) * 86400000000) + to_number(substr(TO_CHAR(v_systimestamp, 'ffff'), 1, 6));

        ---//-------------------------------------------------------------------
          UPDATE iot_person SET iot_person.nonce = v_nonce
          WHERE iot_person.key = v_key;
        --//---------------------------------------------------------------------

        RETURN v_nonce;
    END update_nonce;

/
--------------------------------------------------------
--  Constraints for Table IOT_NODE
--------------------------------------------------------

  ALTER TABLE "IOT_NODE" ADD CONSTRAINT "IOT_NODE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "IOT_NODE" MODIFY ("IOT_PERSON_ID" NOT NULL ENABLE);
  ALTER TABLE "IOT_NODE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ARTIGOS
--------------------------------------------------------

  ALTER TABLE "ARTIGOS" ADD UNIQUE ("NOME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ARTIGOS" ADD CONSTRAINT "ARTIGO_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ARTIGOS" MODIFY ("PRECO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table IOT_SENSOR_ALERT
--------------------------------------------------------

  ALTER TABLE "IOT_SENSOR_ALERT" ADD CONSTRAINT "IOT_SENSOR_ALERT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "IOT_SENSOR_ALERT" MODIFY ("IOT_SENSOR_ID" NOT NULL ENABLE);
  ALTER TABLE "IOT_SENSOR_ALERT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table IOT_SENSOR
--------------------------------------------------------

  ALTER TABLE "IOT_SENSOR" ADD CONSTRAINT "IOT_SENSOR_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "IOT_SENSOR" MODIFY ("IOT_NODE_ID" NOT NULL ENABLE);
  ALTER TABLE "IOT_SENSOR" MODIFY ("IOT_SENSOR_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "IOT_SENSOR" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table IOT_SENSOR_TYPE
--------------------------------------------------------

  ALTER TABLE "IOT_SENSOR_TYPE" ADD CONSTRAINT "IOT_SENSOR_TYPE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "IOT_SENSOR_TYPE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table IOT_SENSOR_DATA
--------------------------------------------------------

  ALTER TABLE "IOT_SENSOR_DATA" ADD CONSTRAINT "IOT_SENSOR_DATA_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "IOT_SENSOR_DATA" MODIFY ("IOT_SENSOR_ID" NOT NULL ENABLE);
  ALTER TABLE "IOT_SENSOR_DATA" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table IOT_PERSON
--------------------------------------------------------

  ALTER TABLE "IOT_PERSON" ADD CONSTRAINT "IOT_PERSON_KEY" UNIQUE ("KEY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "IOT_PERSON" ADD CONSTRAINT "IOT_PERSON_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "IOT_PERSON" ADD CONSTRAINT "IOT_PERSON_EMAIL" UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "IOT_PERSON" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "IOT_PERSON" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table IOT_LOG_TABLE
--------------------------------------------------------

  ALTER TABLE "IOT_LOG_TABLE" ADD CONSTRAINT "IOT_LOG_TABLE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "IOT_LOG_TABLE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table IOT_NODE
--------------------------------------------------------

  ALTER TABLE "IOT_NODE" ADD CONSTRAINT "IOT_NODE_IOT_PERSON_FK" FOREIGN KEY ("IOT_PERSON_ID")
	  REFERENCES "IOT_PERSON" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table IOT_SENSOR
--------------------------------------------------------

  ALTER TABLE "IOT_SENSOR" ADD CONSTRAINT "IOT_SENSOR_IOT_NODE_FK" FOREIGN KEY ("IOT_NODE_ID")
	  REFERENCES "IOT_NODE" ("ID") ENABLE;
  ALTER TABLE "IOT_SENSOR" ADD CONSTRAINT "IOT_SENSOR_IOT_SENSOR_TYPE_FK" FOREIGN KEY ("IOT_SENSOR_TYPE_ID")
	  REFERENCES "IOT_SENSOR_TYPE" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table IOT_SENSOR_ALERT
--------------------------------------------------------

  ALTER TABLE "IOT_SENSOR_ALERT" ADD CONSTRAINT "IOT_SENSOR_ALERT_IOT_SENSOR_FK" FOREIGN KEY ("IOT_SENSOR_ID")
	  REFERENCES "IOT_SENSOR" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table IOT_SENSOR_DATA
--------------------------------------------------------

  ALTER TABLE "IOT_SENSOR_DATA" ADD CONSTRAINT "IOT_SENSOR_DATA_IOT_SENSOR_FK" FOREIGN KEY ("IOT_SENSOR_ID")
	  REFERENCES "IOT_SENSOR" ("ID") ENABLE;



/*   --     JOBS for the BOYS ------------- */
begin
    DBMS_SCHEDULER.CREATE_JOB (
         job_name             => 'get_API_values',
         job_type             => 'STORED_PROCEDURE',
         job_action           => 'GET_API_sensor_VALUES',
         start_date           => SYSTIMESTAMP,
         repeat_interval      => 'FREQ=MINUTELY;INTERVAL=30;',
         enabled              => TRUE);
end;

exec DBMS_SCHEDULER.enable('get_API_values');

       


-- Generated by Oracle SQL Developer REST Data Services 18.4.0.376.1900
-- Exported REST Definitions from ORDS Schema Version 18.4.0.r3541002
-- Schema: BDA_1007249   Date: Fri Jun 28 15:13:53 WEST 2019
--
BEGIN
  ORDS.ENABLE_SCHEMA(
      p_enabled             => TRUE,
      p_schema              => 'BDA_1007249',
      p_url_mapping_type    => 'BASE_PATH',
      p_url_mapping_pattern => 'bda_1007249',
      p_auto_rest_auth      => FALSE);    

  ORDS.DEFINE_MODULE(
      p_module_name    => 'SENSOR_API',
      p_base_path      => '/APIv3/',
      p_items_per_page =>  25,
      p_status         => 'PUBLISHED',
      p_comments       => NULL);      
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'SENSOR_API',
      p_pattern        => '/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'SENSOR_API',
      p_pattern        => '/',
      p_method         => 'GET',
      p_source_type    => 'json/query',
      p_items_per_page =>  25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'SELECT ''MCM 2019 - SmartFarm Oracle API'' msg FROM DUAL'
      );
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'data/{timeStamp}',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'data/{timeStamp}',
      p_method         => 'GET',
      p_source_type    => 'json/query',
      p_items_per_page =>  0,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'SELECT
    iot_sensor.id,
    iot_sensor_data.date_of_value,
    iot_sensor_type.name         AS type,
    iot_sensor_data.value,
    iot_sensor.name,
    iot_sensor.code,
    iot_sensor_type.unit,
    iot_sensor_data.longitude   AS Longitude,
    iot_sensor_data.latitude    AS Latitude,
    iot_sensor_type.description,
    iot_node.mac,
    iot_node.id                 AS NodeID

FROM
    iot_sensor,
    iot_sensor_data,
    iot_person,
    iot_sensor_type,
    iot_node
WHERE
    iot_sensor.id = iot_sensor_data.iot_sensor_id
    AND iot_sensor.iot_sensor_type_id = iot_sensor_type.id
    AND iot_person.id = iot_node.iot_person_id
    AND iot_sensor.iot_node_id = iot_node.id
    -- AND iot_sensor_data.date_of_value BETWEEN ( 1557162016 ) AND ( 1557325928 )
    AND iot_sensor_data.date_of_value > :timeStamp -- RECEBER só as novidades
    AND iot_person.key = :v_api_key -- RECEBER só do utilizador que pediu
    AND test_hmac(''persons'', :v_nonce, :v_api_key, :v_api_sign) = 1 --Verificar
    AND ROWNUM <= 10000 -- DEBUG'
      );
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'data/{timeStamp}',
      p_method             => 'GET',
      p_name               => 'API_key',
      p_bind_variable_name => 'v_api_key',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'data/{timeStamp}',
      p_method             => 'GET',
      p_name               => 'API_nonce',
      p_bind_variable_name => 'v_nonce',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'data/{timeStamp}',
      p_method             => 'GET',
      p_name               => 'API_sign',
      p_bind_variable_name => 'v_api_sign',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'data/{timeStamp}',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_items_per_page =>  0,
      p_mimes_allowed  => 'application/json',
      p_comments       => NULL,
      p_source         => 
'DECLARE
    new_id   iot_sensor_data.id%TYPE;
BEGIN
    INSERT INTO iot_sensor_data (
        iot_sensor_id,
        date_of_value,
        value,
        longitude,
        latitude

    ) VALUES (
        :iot_sensor_id,  
        :date_of_value,
        :value,
        :longitude,
        :latitude


    ) RETURNING id INTO new_id;

    :new_id := new_id;
    :status := 201;
END;'
      );
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'nodes/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'nodes/',
      p_method         => 'GET',
      p_source_type    => 'json/query',
      p_items_per_page =>  20,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'SELECT
    iot_node.id,
    iot_node.model,
    iot_node.firm_vers,
    iot_node.mac,
    iot_node.longitude,
    iot_node.latitude,
    iot_node.altitude,
    iot_node.ip,
    iot_node.has_api,
    iot_person.email person
FROM
    iot_node,
    iot_person
WHERE
    iot_node.iot_person_id = iot_person.id
    AND iot_person.ativo = 1 And ( iot_person.key ) = :v_api_key
    AND test_hmac(''persons'', :v_nonce, :v_api_key, :v_api_sign) = 1'
      );
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/',
      p_method             => 'GET',
      p_name               => 'API_key',
      p_bind_variable_name => 'v_api_key',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/',
      p_method             => 'GET',
      p_name               => 'API_nonce',
      p_bind_variable_name => 'v_nonce',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/',
      p_method             => 'GET',
      p_name               => 'API_sign',
      p_bind_variable_name => 'v_api_sign',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'nodes/',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_items_per_page =>  0,
      p_mimes_allowed  => 'application/json',
      p_comments       => NULL,
      p_source         => 
'DECLARE
    new_id   iot_node.id%TYPE;

    v_id       iot_person.id%TYPE;
    v_key       iot_person.key%TYPE;
    v_secret    iot_person.secret%TYPE;
    v_email     iot_person.email%TYPE;
    v_user_ok   BOOLEAN := false;

    v_nonce     iot_person.nonce%type;
    n_nonce     iot_person.nonce%type;

BEGIN

  --- Vers 0.1
    SELECT key, secret, email, id, nonce
    INTO v_key, v_secret, v_email, v_id, v_nonce
    FROM iot_person
    WHERE iot_person.key = :v_api_key;

    --- Checkar esta cena a ver se utilizador é mesmo o chuck noris
     v_user_ok := bda.ws_authentication.check_hmac(''persons'','''','''', :v_api_nonce , :v_api_key, :v_api_sign, v_secret);

         IF (v_user_ok = true) AND (v_nonce < :v_api_nonce+1000000) THEN
            dbms_output.put_line(''User OK'');
            :status := 201;
             --//-------------------------- INSERT
                 INSERT INTO iot_node (
                    IOT_PERSON_ID, MODEL, FIRM_VERS, MAC, IP, LATITUDE, LONGITUDE, ALTITUDE, HAS_API) VALUES (
                    v_id, :MODEL,:FIRM_VERS,:MAC, :IP, :LATITUDE, :LONGITUDE,:ALTITUDE, :HAS_API            
                ) RETURNING ID INTO new_id;
                :new_id := new_id;
             --//------------------------------------------------------------------
             v_nonce := update_nonce(:v_api_key,:v_api_nonce);
            --//-----------------------------------------------------------------
             COMMIT;
         ELSE
            dbms_output.put_line(''Wrong user credentials'');
            :status := 403;
         END IF;

    -- Quando o Batman tenta usar API_key do Chuck norris
    EXCEPTION
       WHEN NO_DATA_FOUND THEN  :status := 404; -- catches all ''no data found'' errors

END;'
      );
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/',
      p_method             => 'POST',
      p_name               => 'API_key',
      p_bind_variable_name => 'v_api_key',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/',
      p_method             => 'POST',
      p_name               => 'API_nonce',
      p_bind_variable_name => 'v_api_nonce',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/',
      p_method             => 'POST',
      p_name               => 'API_sign',
      p_bind_variable_name => 'v_api_sign',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/',
      p_method             => 'POST',
      p_name               => 'nodeId',
      p_bind_variable_name => 'new_id',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/',
      p_method             => 'POST',
      p_name               => 'X-ORDS-STATUS-CODE',
      p_bind_variable_name => 'status',
      p_source_type        => 'HEADER',
      p_param_type         => 'INT',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'nodes/{nodeID}',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'nodes/{nodeID}',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_items_per_page =>  10,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'DECLARE
    check_email   iot_person.email%TYPE;

    v_ID        iot_person.ID%TYPE;
    v_key       iot_person.key%TYPE;
    v_secret    iot_person.secret%TYPE;
    v_email     iot_person.email%TYPE;
    v_user_ok   BOOLEAN := false;

    v_nonce     iot_person.nonce%type;

    --// --- build meu JSON -----------------
--    iot_node_id             iot_node.id%TYPE;
--    iot_node_model          iot_node.model%TYPE;
--    iot_node_firm_vers      iot_node.firm_vers%TYPE;
--    iot_node_mac            iot_node.mac%TYPE;
--   iot_node_longitude      iot_node.longitude%TYPE;
--    iot_node_latitude       iot_node.latitude%TYPE;
--    iot_node_altitude       iot_node.altitude%TYPE;
--    iot_node_ip             iot_node.ip%TYPE;
--    iot_person_id           iot_person.id%TYPE;
--    iot_person_email        iot_person.email%TYPE;

P_OUT_EMP   sys_refcursor;


BEGIN

  --- Vers 0.1
    SELECT  secret, iot_person.id, nonce
    INTO  v_secret, v_id, v_nonce
    FROM iot_person
    WHERE iot_person.key = :v_api_key;

    --- Checkar esta cena a ver se utilizador é mesmo o chuck noris
     v_user_ok := bda.ws_authentication.check_hmac(''persons'','''','''', :v_api_nonce , :v_api_key, :v_api_sign, v_secret);

         IF (v_user_ok = true) AND (v_nonce < :v_api_nonce+1000000) THEN
            dbms_output.put_line(''User OK'');
            :status := 200;

            --//-----------------------------------------------------
            SELECT iot_node.id, iot_node.model, iot_node.firm_vers, iot_node.mac, iot_node.longitude, iot_node.latitude, iot_node.altitude, iot_node.ip, iot_person.id, iot_person.email
            INTO  :iot_node_id, :iot_node_model, :iot_node_firm_vers, :iot_node_mac, :iot_node_longitude, :iot_node_latitude, :iot_node_altitude, :iot_node_ip, :iot_person_id ,:iot_person_email
               FROM IOT_NODE JOIN IOT_PERSON
                ON IOT_NODE.iot_person_id = IOT_PERSON.Id
                WHERE iot_node.id = :nodeID 
                AND iot_person.ativo = 1
                and iot_person.ID = v_id;
            --//-----------------------------------------------------
            v_nonce := update_nonce(:v_api_key,:v_api_nonce);
         --//---------------------------------------------------------------------

         ELSE
            dbms_output.put_line(''Wrong user credentials'');
            :status := 403;
         END IF;

    -- Quando o Batman tenta usar API_key do Chuck norris
    EXCEPTION
       WHEN NO_DATA_FOUND THEN  :status := 404; -- catches all ''no data found'' errors

END;'
      );
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'GET',
      p_name               => 'altitude',
      p_bind_variable_name => 'iot_node_altitude',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'GET',
      p_name               => 'API_key',
      p_bind_variable_name => 'v_api_key',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'GET',
      p_name               => 'API_nonce',
      p_bind_variable_name => 'v_api_nonce',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'GET',
      p_name               => 'API_sign',
      p_bind_variable_name => 'v_api_sign',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'GET',
      p_name               => 'firm_vers',
      p_bind_variable_name => 'iot_node_firm_vers',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'GET',
      p_name               => 'id',
      p_bind_variable_name => 'iot_node_id',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'GET',
      p_name               => 'iot_person_email',
      p_bind_variable_name => 'iot_person_email',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'GET',
      p_name               => 'iot_person_id',
      p_bind_variable_name => 'iot_person_id',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'INT',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'GET',
      p_name               => 'ip',
      p_bind_variable_name => 'iot_node_ip',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'GET',
      p_name               => 'latitude',
      p_bind_variable_name => 'iot_node_latitude',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'GET',
      p_name               => 'longitude',
      p_bind_variable_name => 'iot_node_longitude',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'GET',
      p_name               => 'mac',
      p_bind_variable_name => 'iot_node_mac',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'GET',
      p_name               => 'model',
      p_bind_variable_name => 'iot_node_model',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'GET',
      p_name               => 'X-ORDS-STATUS-CODE',
      p_bind_variable_name => 'status',
      p_source_type        => 'HEADER',
      p_param_type         => 'INT',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'nodes/{nodeID}',
      p_method         => 'DELETE',
      p_source_type    => 'plsql/block',
      p_items_per_page =>  0,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'DECLARE
    v_ID        iot_person.ID%TYPE;
    v_key       iot_person.key%TYPE;
    v_secret    iot_person.secret%TYPE;
    v_email     iot_person.email%TYPE;
    v_user_ok   BOOLEAN := false;

    v_nonce     iot_person.nonce%type;

BEGIN

  --- Vers 0.1
    SELECT  secret, iot_person.id, nonce
    INTO  v_secret, v_id, v_nonce
    FROM iot_person
    WHERE iot_person.key = :v_api_key;

    --- Checkar esta cena a ver se utilizador é mesmo o chuck noris
     v_user_ok := bda.ws_authentication.check_hmac(''persons'','''','''', :v_api_nonce , :v_api_key, :v_api_sign, v_secret);

         IF (v_user_ok = true) AND (v_nonce < :v_api_nonce+1000000) THEN
            dbms_output.put_line(''User OK'');
               :status := 204;
            --//-----------------------------------------------------
               DELETE FROM IOT_NODE 
               WHERE IOT_NODE.id = :nodeID
               AND IOT_NODE.iot_person_id = v_id;
            --//-----------------------------------------------------
             v_nonce := update_nonce(:v_api_key,:v_api_nonce);
            --//------------------------------------------------------
            COMMIT;
         ELSE
            dbms_output.put_line(''Wrong user credentials'');
            :status := 403;
         END IF;

    -- Quando o Batman tenta usar API_key do Chuck norris
    EXCEPTION
       WHEN NO_DATA_FOUND THEN  :status := 404; -- catches all ''no data found'' errors

END;'
      );
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'DELETE',
      p_name               => 'API_key',
      p_bind_variable_name => 'v_api_key',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'DELETE',
      p_name               => 'API_nonce',
      p_bind_variable_name => 'v_api_nonce',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'DELETE',
      p_name               => 'API_sign',
      p_bind_variable_name => 'v_api_sign',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'DELETE',
      p_name               => 'X-APEX-STATUS-CODE',
      p_bind_variable_name => 'status',
      p_source_type        => 'HEADER',
      p_param_type         => 'INT',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'nodes/{nodeID}',
      p_method         => 'PUT',
      p_source_type    => 'plsql/block',
      p_items_per_page =>  0,
      p_mimes_allowed  => 'application/json',
      p_comments       => NULL,
      p_source         => 
'DECLARE
    new_id   iot_node.id%TYPE;

    v_id       iot_person.id%TYPE;
    v_key       iot_person.key%TYPE;
    v_secret    iot_person.secret%TYPE;
    v_email     iot_person.email%TYPE;
    v_user_ok   BOOLEAN := false;

    v_nonce     iot_person.nonce%TYPE;

BEGIN

  --- Vers 0.1
    SELECT key, secret, email, id, nonce
    INTO v_key, v_secret, v_email, v_id, v_nonce
    FROM iot_person
    WHERE iot_person.key = :v_api_key;

    --- Checkar esta cena a ver se utilizador é mesmo o chuck noris
     v_user_ok := bda.ws_authentication.check_hmac(''persons'','''','''', :v_api_nonce , :v_api_key, :v_api_sign, v_secret);

         IF (v_user_ok = true) AND (v_nonce < :v_api_nonce+1000000) THEN
            dbms_output.put_line(''User OK'');
            :status := 200;
             --//-----------------------------------------------------
                   UPDATE iot_node SET model = :MODEL, mac = :MAC,
                                       firm_vers = :FIRM_VERS, longitude= :LONGITUDE, latitude= :LATITUDE, altitude = :ALTITUDE, has_API = :HAS_API, ip = :IP
                      WHERE iot_node.id = :nodeID
                      RETURNING ID INTO :new_id;

            --//-----------------------------------------------------
            v_nonce := update_nonce(:v_api_key,:v_api_nonce);
            --//----------------------------------------------------
             COMMIT;
         ELSE
            dbms_output.put_line(''Wrong user credentials'');
            :status := 403;
         END IF;

    -- Quando o Batman tenta usar API_key do Chuck norris
    EXCEPTION
       WHEN NO_DATA_FOUND THEN  :status := 404; -- catches all ''no data found'' errors

END;'
      );
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'PUT',
      p_name               => 'API_key',
      p_bind_variable_name => 'v_api_key',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'PUT',
      p_name               => 'API_nonce',
      p_bind_variable_name => 'v_api_nonce',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'PUT',
      p_name               => 'API_sign',
      p_bind_variable_name => 'v_api_sign',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'PUT',
      p_name               => 'id',
      p_bind_variable_name => 'new_id',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes/{nodeID}',
      p_method             => 'PUT',
      p_name               => 'X-ORDS-STATUS-CODE',
      p_bind_variable_name => 'status',
      p_source_type        => 'HEADER',
      p_param_type         => 'INT',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'persons/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'persons/',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_items_per_page =>  25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'DECLARE
    check_email   iot_person.email%TYPE;

    v_key       iot_person.key%TYPE;
    v_secret    iot_person.secret%TYPE;
    v_email     iot_person.email%TYPE;
    v_user_ok   BOOLEAN := false;

    v_nonce iot_person.nonce%type;
BEGIN

  --- Vers 0.1
    SELECT key, secret, email, nonce
    INTO v_key, v_secret, v_email, v_nonce
    FROM iot_person
    WHERE iot_person.key = :v_api_key;

    --- Checkar esta cena a ver se utilizador é mesmo o chuck noris
     v_user_ok := bda.ws_authentication.check_hmac(''persons'','''','''', :v_api_nonce , :v_api_key, :v_api_sign, v_secret);

         IF (v_user_ok = true) AND (v_nonce < :v_api_nonce+1000000) THEN
            dbms_output.put_line(''User OK'');
            :status := 200;
            --/-------------------------------------------------------------------
             SELECT email into 
               :check_email     --- CONSIGO SABER EMAIL PELO API-KEY (secret)
             FROM iot_person WHERE iot_person.email= v_email;
            --//----------------------------------------------------------------------
             v_nonce := update_nonce(:v_api_key,:v_api_nonce);
            --//-----------------------------------------------------------------

         ELSE
            dbms_output.put_line(''Wrong user credentials'');
            :status := 403;
         END IF;

    -- Quando o Batman tenta usar API_key do Chuck norris
    EXCEPTION
       WHEN NO_DATA_FOUND THEN  :status := 404; -- catches all ''no data found'' errors

END;'
      );
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'persons/',
      p_method             => 'GET',
      p_name               => 'API_key',
      p_bind_variable_name => 'v_api_key',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'persons/',
      p_method             => 'GET',
      p_name               => 'API_nonce',
      p_bind_variable_name => 'v_api_nonce',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'persons/',
      p_method             => 'GET',
      p_name               => 'API_sign',
      p_bind_variable_name => 'v_api_sign',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'persons/',
      p_method             => 'GET',
      p_name               => 'email',
      p_bind_variable_name => 'check_email',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'persons/',
      p_method             => 'GET',
      p_name               => 'X-ORDS-STATUS-CODE',
      p_bind_variable_name => 'status',
      p_source_type        => 'HEADER',
      p_param_type         => 'INT',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'persons/',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_items_per_page =>  0,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'DECLARE
    new_id       iot_person.id%TYPE;
    new_secret   iot_person.secret%TYPE;
    new_key      iot_person.key%TYPE;
BEGIN

        INSERT INTO iot_person (
            email,
            key,
            secret,
            creation_date,
            nonce
        ) VALUES (
            :email,
            BDA.ws_authentication.generate_key,
            BDA.ws_authentication.generate_secret,
            date_to_unix_ts(SYSDATE),
            0
        ) RETURNING id, secret, key INTO new_id, new_secret, new_key;


    :new_id := new_id;
    :new_secret := new_secret;
    :new_key := new_key;

    :status := 201;
END;'
      );
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'sensors',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'sensors',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_items_per_page =>  0,
      p_mimes_allowed  => 'application/json',
      p_comments       => NULL,
      p_source         => 
'DECLARE
    new_id   iot_sensor_data.id%TYPE;
BEGIN
    INSERT INTO iot_sensor_data (
        date_of_value,
        value,
        longitude,
        latitude,
        iot_sensor_id
    ) VALUES (
        TO_TIMESTAMP(:date_of_value, ''DD-MM-YYYY"T"HH24:MI:SS''),
        :value,
        :longitude,
        :latitude,
        :iot_sensor_id

    ) RETURNING ID INTO new_id;

    :new_id := new_id;
    :status := 201;
END;'
      );
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'sensors/{nodeID}',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'sensors/{nodeID}',
      p_method         => 'GET',
      p_source_type    => 'json/query',
      p_items_per_page =>  100,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'--    SELECT iot_node.id, iot_node.model, iot_node.firm_vers, iot_node.mac, iot_node.longitude, iot_node.latitude, iot_node.altitude, iot_node.ip, iot_person.email
--       FROM IOT_NODE JOIN IOT_PERSON
--        ON IOT_NODE.iot_person_id = IOT_PERSON.Id
--        WHERE iot_node.id = :nodeID 
--  AND test_hmac(''persons'', :v_nonce, :v_api_key, :v_api_sign) = 1

SELECT  ID,
        code, 
        name, 
        (SELECT name from iot_sensor_type where id=iot_sensor_type_id) sensor_type,  
        (SELECT unit from iot_sensor_type where id=iot_sensor_type_id) sensor_UNIT, 
        date_installed

    FROM iot_sensor
    WHERE iot_node_id =:nodeID
    AND test_hmac(''persons'', :v_nonce, :v_api_key, :v_api_sign) = 1'
      );
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'sensors/{nodeID}',
      p_method             => 'GET',
      p_name               => 'API_key',
      p_bind_variable_name => 'v_api_key',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'sensors/{nodeID}',
      p_method             => 'GET',
      p_name               => 'API_nonce',
      p_bind_variable_name => 'v_nonce',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'sensors/{nodeID}',
      p_method             => 'GET',
      p_name               => 'API_sign',
      p_bind_variable_name => 'v_api_sign',
      p_source_type        => 'HEADER',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      


  COMMIT; 
END;



-----   PRCEDIMENTOS DE TEST PARA HMAC
----------   CREATE SIGN ----------
create or replace FUNCTION  request_check (
        v_username VARCHAR2
    ) RETURN BOOLEAN IS

     v_hmac_request bda.ws_authentication.hmac_request_type;
     v_nonce          iot_person.nonce%TYPE;
     v_key            iot_person.key%TYPE;
     v_secret         iot_person.secret%TYPE;
     v_pos            number(9);
     v_api_sign       VARCHAR2(88);
     v_user_ok        BOOLEAN := false;
BEGIN


     
    SELECT key, secret
    INTO v_key, v_secret
    FROM iot_person
    WHERE iot_person.email = 'daniel@cenas.com';
        
     v_hmac_request := bda.ws_authentication.hmac('daniel@cenas.com','nodes','1015',v_secret);
     
     v_pos := instr(v_hmac_request.post_data,'=',-1)+1;
     v_nonce := substr(v_hmac_request.post_data, v_pos);
     v_api_sign := v_hmac_request.api_sign;

   -- dbms_output.put_line('---------------------------------------');     
   -- dbms_output.put_line(v_nonce);
   -- dbms_output.put_line(v_key);   
   -- dbms_output.put_line(v_api_sign);   
    
   -- dbms_output.put_line('---------------------------------------');     
   
        v_user_ok := bda.ws_authentication.check_hmac('daniel@cenas.com','nodes','1015', v_nonce, v_key, v_api_sign, v_secret);

        IF v_user_ok = true THEN
            dbms_output.put_line('User OK');
        ELSE
            dbms_output.put_line('Wrong user credentials');
        END IF;
END request_check;
/

--------------------------------------  CRIAR REQUEST TEST ------------------------

create or replace FUNCTION IOT_hmac (
        v_username VARCHAR2,
        v_root VARCHAR2,
        v_id VARCHAR2,
        v_data VARCHAR2
                
    ) RETURN string AS
    
        v_hmac_request bda.ws_authentication.hmac_request_type;
        v_key            iot_person.key%TYPE;
        v_secret         iot_person.secret%TYPE;

    BEGIN
        SELECT key, secret
        INTO v_key, v_secret
        FROM iot_person
        WHERE iot_person.email = v_username;

        v_hmac_request := bda.ws_authentication.hmac(v_root, v_id, v_data, v_secret);

        RETURN '------';
    END IOT_hmac;





----------------------------  UPDATE MANUALMENTE ----------------------------
-- Temperatura
UPDATE iot_sensor_data
SET value = round(dbms_random.value(16, 23), 1) 
WHERE iot_sensor_id = 1;

-- Humidade
UPDATE iot_sensor_data
SET value = round(dbms_random.value(28, 55), 1) 
WHERE iot_sensor_id = 2;

-- Pressão ATM
UPDATE iot_sensor_data
SET value = round(dbms_random.value(980, 1030), 0) 
WHERE iot_sensor_id = 3;

--- CO2
UPDATE iot_sensor_data
SET value = round(dbms_random.value(380, 600), 0) 
WHERE iot_sensor_id = 4;


--- TVOC
UPDATE iot_sensor_data
SET value = round(dbms_random.value(0, 120), 0) 
WHERE iot_sensor_id = 5;

--- SOLO humidade
UPDATE iot_sensor_data
SET value = round(dbms_random.value(2, 100), 0) 
WHERE iot_sensor_id = 6;

--- Luminosidade
UPDATE iot_sensor_data
SET value = round(dbms_random.value(886, 1003), 0) 
WHERE iot_sensor_id = 7;

--- Fogo
UPDATE iot_sensor_data
SET value = round(dbms_random.value(10, 20), 0) 
WHERE iot_sensor_id = 8;

--- Som
UPDATE iot_sensor_data
SET value = round(dbms_random.value(10, 125), 0) 
WHERE iot_sensor_id = 9;

commit;

select * from iot_sensor_type;

select *
from iot_sensor_data, iot_sensor
where iot_sensor_data.iot_sensor_id = iot_sensor.id;

        
```
### V0.0.7

![Logical](https://user-images.githubusercontent.com/2634610/59598964-50e3bb80-90f5-11e9-9a9f-622354b8ca15.png)


### V0.0.5

![0 5](https://user-images.githubusercontent.com/2634610/57238653-d7e74380-7021-11e9-9cc6-0850cb267dae.png)


### V0.0.4

![Relational_v4](https://user-images.githubusercontent.com/2634610/57220005-b8382700-6ff1-11e9-8b7e-663c4224453d.png)

![Logical_4](https://user-images.githubusercontent.com/2634610/57220004-b8382700-6ff1-11e9-9a2b-1a63315b3a0c.png)


### V0.0.3

![Relational_1](https://user-images.githubusercontent.com/2634610/56832378-b89f2800-6863-11e9-83d0-87eae160fd18.png)

![logic](https://user-images.githubusercontent.com/2634610/56832582-4ed34e00-6864-11e9-984a-f65a97449d98.png)


### V0.0.2

![Relational_1](https://user-images.githubusercontent.com/2634610/56147983-4136e200-5fa1-11e9-948c-c34dbb49a90c.png)

![Logical](https://user-images.githubusercontent.com/2634610/56147984-4136e200-5fa1-11e9-9e86-606eb2059150.png)




### V0.0.1

![Logical_0_0_1](https://user-images.githubusercontent.com/2634610/55103203-ed328f00-50bf-11e9-8e64-88a0bccc437e.png)

