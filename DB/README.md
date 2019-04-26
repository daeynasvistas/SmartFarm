### V0.0.3

![Relational_1](https://user-images.githubusercontent.com/2634610/56832378-b89f2800-6863-11e9-83d0-87eae160fd18.png)

![logic](https://user-images.githubusercontent.com/2634610/56832582-4ed34e00-6864-11e9-984a-f65a97449d98.png)




### V0.0.2

![Relational_1](https://user-images.githubusercontent.com/2634610/56147983-4136e200-5fa1-11e9-948c-c34dbb49a90c.png)

![Logical](https://user-images.githubusercontent.com/2634610/56147984-4136e200-5fa1-11e9-9e86-606eb2059150.png)

```SQL

DROP TABLE iot_node CASCADE CONSTRAINTS;
DROP TABLE iot_person CASCADE CONSTRAINTS;
DROP TABLE iot_sensor CASCADE CONSTRAINTS;
DROP TABLE iot_sensor_data CASCADE CONSTRAINTS;
DROP TABLE iot_sensor_type CASCADE CONSTRAINTS;

DROP SEQUENCE IOT_PERSON_SEQ;
DROP SEQUENCE IOT_SENSOR_SEQ;
DROP SEQUENCE IOT_DATA_SEQ;
DROP SEQUENCE IOT_TYPE_SEQ;
DROP SEQUENCE IOT_NODE_SEQ;



CREATE TABLE iot_node (
    id          NUMBER NOT NULL,
    model       VARCHAR2(25),
    firm_vers   VARCHAR2(8),
    mac         VARCHAR2(20),
    longitude   FLOAT,
    latitude    FLOAT,
    altitude    NUMBER(10),
    has_api     CHAR(1),
    ip          VARCHAR2(20)
)
LOGGING;

ALTER TABLE iot_node ADD CONSTRAINT iot_node_pk PRIMARY KEY ( id );

CREATE TABLE iot_person (
    id              NUMBER(10) NOT NULL,
    username        VARCHAR2(50),
    password        VARCHAR2(100),
    key             VARCHAR2(60),
    secret          VARCHAR2(100),
    creation_date   NUMBER(16),
    ativo           NUMBER
)
LOGGING;

ALTER TABLE iot_person ADD CONSTRAINT iot_person_pk PRIMARY KEY ( id );

CREATE TABLE iot_sensor (
    sensor_id            NUMBER(7) NOT NULL,
    code                 VARCHAR2(20),
    name                 VARCHAR2(20),
    description          NVARCHAR2(80),
    date_installed       NUMBER(16),
    date_terminate       NUMBER(16),
    iot_person_id        NUMBER(10) NOT NULL,
    iot_sensor_type_id   NUMBER NOT NULL,
    iot_node_id          NUMBER NOT NULL
)
LOGGING;

ALTER TABLE iot_sensor ADD CONSTRAINT iot_sensor_pk PRIMARY KEY ( sensor_id );

CREATE TABLE iot_sensor_data (
    id              NUMBER(8) NOT NULL,
    date_of_value   NUMBER(16),
    value           FLOAT(6),
    longitude       FLOAT,
    latitude        FLOAT,
    iot_sensor_id   NUMBER(7) NOT NULL
)
LOGGING;

ALTER TABLE iot_sensor_data ADD CONSTRAINT iot_sensor_data_pk PRIMARY KEY ( id );

CREATE TABLE iot_sensor_type (
    id            NUMBER NOT NULL,
    name          VARCHAR2(20),
    unit          VARCHAR2(5),
    description   VARCHAR2(80)
)
LOGGING;

ALTER TABLE iot_sensor_type ADD CONSTRAINT iot_sensor_type_pk PRIMARY KEY ( id );

ALTER TABLE iot_sensor_data
    ADD CONSTRAINT iot_sensor_data_iot_sensor_fk FOREIGN KEY ( iot_sensor_id )
        REFERENCES iot_sensor ( sensor_id )
    NOT DEFERRABLE;

ALTER TABLE iot_sensor
    ADD CONSTRAINT iot_sensor_iot_node_fk FOREIGN KEY ( iot_node_id )
        REFERENCES iot_node ( id )
    NOT DEFERRABLE;

ALTER TABLE iot_sensor
    ADD CONSTRAINT iot_sensor_iot_person_fk FOREIGN KEY ( iot_person_id )
        REFERENCES iot_person ( id )
    NOT DEFERRABLE;

ALTER TABLE iot_sensor
    ADD CONSTRAINT iot_sensor_iot_sensor_type_fk FOREIGN KEY ( iot_sensor_type_id )
        REFERENCES iot_sensor_type ( id )
    NOT DEFERRABLE;



/* SEQUENCE para auto incrementar*/
/*----------------------  PERSON ---------------------------------- */
CREATE SEQUENCE IOT_person_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 CREATE OR REPLACE TRIGGER person_on_insert
  BEFORE INSERT ON iot_person
  FOR EACH ROW
BEGIN
  SELECT IOT_person_seq.nextval
  INTO :new.id
  FROM dual;
END;
/

/*----------------------  SENSOR ---------------------------------- */
CREATE SEQUENCE IOT_sensor_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 CREATE OR REPLACE TRIGGER sensor_on_insert
  BEFORE INSERT ON iot_sensor
  FOR EACH ROW
BEGIN
  SELECT IOT_sensor_seq.nextval
  INTO :new.sensor_id
  FROM dual;
END;
/

/*----------------------  DATA ---------------------------------- */
/* PERSON */
CREATE SEQUENCE IOT_data_seq
 START WITH     1000
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 
  CREATE OR REPLACE TRIGGER data_on_insert
  BEFORE INSERT ON iot_sensor_data
  FOR EACH ROW
BEGIN
  SELECT IOT_data_seq.nextval
  INTO :new.id
  FROM dual;
END;
/

/*----------------------  TYPE ---------------------------------- */
/* PERSON */
CREATE SEQUENCE IOT_type_seq
 START WITH     1000
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 
  CREATE OR REPLACE TRIGGER type_on_insert
  BEFORE INSERT ON iot_sensor_type
  FOR EACH ROW
BEGIN
  SELECT IOT_type_seq.nextval
  INTO :new.id
  FROM dual;
END;
/

/*----------------------  NODE ---------------------------------- */
/* PERSON */
CREATE SEQUENCE IOT_node_seq
 START WITH     1000
 INCREMENT BY   1
 NOCACHE
 NOCYCLE; 
 
  CREATE OR REPLACE TRIGGER node_on_insert
  BEFORE INSERT ON iot_node
  FOR EACH ROW
BEGIN
  SELECT IOT_node_seq.nextval
  INTO :new.id
  FROM dual;
END;
/

/*----------------------  END ---------------------------------- */
        
/* DUMMY DATA
/*add PERSON*/
INSERT INTO iot_person (username) VALUES ('daniel@ept.pt');

/*add IOT_TYPE*  desc iot_sensor_type;*/
/*
air_temp
air_humidity
air_pressure
air_CO2
air_TVOC
lux
flame
soil_humidity
sound
*/

INSERT INTO iot_sensor_type (name, unit, description) VALUES ('air_temperature','C','Temperatura ambiente');        
INSERT INTO iot_sensor_type (name, unit, description) VALUES ('air_humidity','%','Humidade ambiente');   
INSERT INTO iot_sensor_type (name, unit, description) VALUES ('air_pressure','atm','Pressão atmosférica');   
INSERT INTO iot_sensor_type (name, unit, description) VALUES ('air_CO2','ppm','Concentração Dióxido de Carbono');   
INSERT INTO iot_sensor_type (name, unit, description) VALUES ('air_TVOC','mg/m3','Compostos Orgânicos Voláteis');   
INSERT INTO iot_sensor_type (name, unit, description) VALUES ('soil_humidity','%','Humidade do solo');   
INSERT INTO iot_sensor_type (name, unit, description) VALUES ('lux','Lux','Luminosidade');   
INSERT INTO iot_sensor_type (name, unit, description) VALUES ('flame','UV','Deteção de chama');   
INSERT INTO iot_sensor_type (name, unit, description) VALUES ('sound','dB','Som Ambiente');   



/*add NODE*/
INSERT INTO iot_node (model, FIRM_VERS, MAC, IP, LATITUDE, LONGITUDE, ALTITUDE) VALUES ('ESP32 Lora', '0.1','00000000','192.000.000.000',40.777083,-7.354986,1090);

/*ADD FUNCTION */
create or replace function date_to_unix_ts( PDate in date ) return number is
   l_unix_ts number;
begin
   l_unix_ts := ROUND(( PDate - date '1970-01-01' ) * 60 * 60 * 24);
   return l_unix_ts;
end;



/*add SENSOR*/
INSERT INTO iot_sensor (CODE, NAME, DESCRIPTION, DATE_INSTALLED, DATE_TERMINATE, IOT_PERSON_ID,IOT_SENSOR_TYPE_ID,IOT_NODE_ID) 
                VALUES ('BME280',  'Digital Sensor', 'Temperature, Humidity, Atmospheric Pressure', date_to_unix_ts(SYSDATE),NULL, 1, 1000, 1000);
INSERT INTO iot_sensor (CODE, NAME, DESCRIPTION, DATE_INSTALLED, DATE_TERMINATE, IOT_PERSON_ID,IOT_SENSOR_TYPE_ID,IOT_NODE_ID) 
                VALUES ('BME280',  'Digital Sensor', 'Temperature, Humidity, Atmospheric Pressure', date_to_unix_ts(SYSDATE),NULL, 1, 1001, 1000);
INSERT INTO iot_sensor (CODE, NAME, DESCRIPTION, DATE_INSTALLED, DATE_TERMINATE, IOT_PERSON_ID,IOT_SENSOR_TYPE_ID,IOT_NODE_ID) 
                VALUES ('BME280',  'Digital Sensor', 'Temperature, Humidity, Atmospheric Pressure', date_to_unix_ts(SYSDATE),NULL, 1, 1002, 1000);

INSERT INTO iot_sensor (CODE, NAME, DESCRIPTION, DATE_INSTALLED, DATE_TERMINATE, IOT_PERSON_ID,IOT_SENSOR_TYPE_ID,IOT_NODE_ID) 
                VALUES ('CCS811',  'Air Mass Sensor', 'NTC CO2 eCO2 TVOC Air Mass Sensor', date_to_unix_ts(SYSDATE),NULL, 1, 1003, 1000);
INSERT INTO iot_sensor (CODE, NAME, DESCRIPTION, DATE_INSTALLED, DATE_TERMINATE, IOT_PERSON_ID,IOT_SENSOR_TYPE_ID,IOT_NODE_ID) 
                VALUES ('CCS811',  'Air Mass Sensor', 'NTC CO2 eCO2 TVOC Air Mass Sensor', date_to_unix_ts(SYSDATE),NULL, 1, 1004, 1000);
                                                            
INSERT INTO iot_sensor (CODE, NAME, DESCRIPTION, DATE_INSTALLED, DATE_TERMINATE, IOT_PERSON_ID,IOT_SENSOR_TYPE_ID,IOT_NODE_ID) 
                VALUES ('YL-38',  'Soil Hygrometer', 'Detection Module Moisture Sensor', date_to_unix_ts(SYSDATE),NULL, 1, 1005, 1000);
    
INSERT INTO iot_sensor (CODE, NAME, DESCRIPTION, DATE_INSTALLED, DATE_TERMINATE, IOT_PERSON_ID,IOT_SENSOR_TYPE_ID,IOT_NODE_ID) 
                VALUES ('GL5528',  'Photosensitive', 'detect the light intensity', date_to_unix_ts(SYSDATE),NULL, 1, 1006, 1000);
    
INSERT INTO iot_sensor (CODE, NAME, DESCRIPTION, DATE_INSTALLED, DATE_TERMINATE, IOT_PERSON_ID,IOT_SENSOR_TYPE_ID,IOT_NODE_ID) 
                VALUES ('GL5528',  'Photosensitive', 'detect the light intensity', date_to_unix_ts(SYSDATE),NULL, 1, 1006, 1000);
    
INSERT INTO iot_sensor (CODE, NAME, DESCRIPTION, DATE_INSTALLED, DATE_TERMINATE, IOT_PERSON_ID,IOT_SENSOR_TYPE_ID,IOT_NODE_ID) 
                VALUES ('OKY3131',  'Sound Detection', 'High Sensitive Microphone', date_to_unix_ts(SYSDATE),NULL, 1, 1008, 1000);

    



/*
select * from iot_person;  
select * from iot_sensor_type;  
select * from iot_node;
select * from iot_sensor;
desc iot_sensor;


*/    


    
  
        
```



### V0.0.1

![Logical_0_0_1](https://user-images.githubusercontent.com/2634610/55103203-ed328f00-50bf-11e9-8e64-88a0bccc437e.png)

