### V0.0.5

![0 5](https://user-images.githubusercontent.com/2634610/57238653-d7e74380-7021-11e9-9cc6-0850cb267dae.png)

```SQL

---->> VERSÃO 0.5 <<------


DROP TABLE iot_node CASCADE CONSTRAINTS;
DROP TABLE iot_person CASCADE CONSTRAINTS;
DROP TABLE iot_sensor CASCADE CONSTRAINTS;
DROP TABLE iot_sensor_data CASCADE CONSTRAINTS;
DROP TABLE iot_sensor_type CASCADE CONSTRAINTS;
--Versão 0.4
DROP TABLE iot_sensor_alert CASCADE CONSTRAINTS;
--Versão 0.5
DROP TABLE iot_log_table CASCADE CONSTRAINTS;


DROP SEQUENCE IOT_PERSON_SEQ;
DROP SEQUENCE IOT_SENSOR_SEQ;
DROP SEQUENCE IOT_DATA_SEQ;
DROP SEQUENCE IOT_TYPE_SEQ;
DROP SEQUENCE IOT_NODE_SEQ;
--Versão 0.4
DROP SEQUENCE IOT_ALERT_SEQ;
--Versão 0.5
DROP SEQUENCE IOT_LOG_SEQ;


--Versão 0.5
CREATE TABLE iot_log_table (
    id           NUMBER(10) NOT NULL,
    date_fetch   NUMBER(16),
    error        VARCHAR2(80)
)
LOGGING;

ALTER TABLE iot_log_table ADD CONSTRAINT iot_log_table_pk PRIMARY KEY ( id );


CREATE TABLE iot_node (
    id              NUMBER(8) NOT NULL,
    iot_person_id   NUMBER(10) NOT NULL,
    model           VARCHAR2(25),
    firm_vers       VARCHAR2(8),
    mac             VARCHAR2(20),
    longitude       NUMBER(8, 6),
    latitude        NUMBER(8, 6),
    altitude        NUMBER(5),
    has_api         CHAR(1),
    ip              VARCHAR2(20)
)
LOGGING;

ALTER TABLE iot_node ADD CONSTRAINT iot_node_pk PRIMARY KEY ( id );

CREATE TABLE iot_person (
    id              NUMBER(10) NOT NULL,
    email           VARCHAR2(50) NOT NULL,
    password        VARCHAR2(100) NOT NULL,
    key             VARCHAR2(60),
    secret          VARCHAR2(100),
    creation_date   NUMBER(16),
    nonce           NUMBER(16),
    ativo           CHAR(1)
)
LOGGING;

ALTER TABLE iot_person ADD CONSTRAINT iot_person_pk PRIMARY KEY ( id );

CREATE TABLE iot_sensor (
    id                   NUMBER(10) NOT NULL,
    iot_sensor_type_id   NUMBER(5) NOT NULL,
    iot_node_id          NUMBER(8) NOT NULL,
    code                 VARCHAR2(20),
    name                 VARCHAR2(20),
    description          VARCHAR2(80),
    date_installed       NUMBER(16),
    date_terminate       NUMBER(16)
)
LOGGING;

ALTER TABLE iot_sensor ADD CONSTRAINT iot_sensor_pk PRIMARY KEY ( id );

CREATE TABLE iot_sensor_alert (
    id              NUMBER(10) NOT NULL,
    iot_sensor_id   NUMBER(10) NOT NULL,
    date_alert      NUMBER(16),
    description     VARCHAR2(80),
    alert_send      CHAR(1)
)
LOGGING;

ALTER TABLE iot_sensor_alert ADD CONSTRAINT iot_sensor_alert_pk PRIMARY KEY ( id );

CREATE TABLE iot_sensor_data (
    id              NUMBER(8) NOT NULL,
    iot_sensor_id   NUMBER(10) NOT NULL,
    date_of_value   NUMBER(16),
    value           NUMBER(6, 2),
    longitude       NUMBER(8, 6),
    latitude        NUMBER(8, 6)
)
LOGGING;

ALTER TABLE iot_sensor_data ADD CONSTRAINT iot_sensor_data_pk PRIMARY KEY ( id );

CREATE TABLE iot_sensor_type (
    id            NUMBER(5) NOT NULL,
    name          VARCHAR2(20),
    unit          VARCHAR2(5),
    description   VARCHAR2(80)
)
LOGGING;

ALTER TABLE iot_sensor_type ADD CONSTRAINT iot_sensor_type_pk PRIMARY KEY ( id );

ALTER TABLE iot_node
    ADD CONSTRAINT iot_node_iot_person_fk FOREIGN KEY ( iot_person_id )
        REFERENCES iot_person ( id )
    NOT DEFERRABLE;

ALTER TABLE iot_sensor_alert
    ADD CONSTRAINT iot_sensor_alert_iot_sensor_fk FOREIGN KEY ( iot_sensor_id )
        REFERENCES iot_sensor ( id )
    NOT DEFERRABLE;

ALTER TABLE iot_sensor_data
    ADD CONSTRAINT iot_sensor_data_iot_sensor_fk FOREIGN KEY ( iot_sensor_id )
        REFERENCES iot_sensor ( id )
    NOT DEFERRABLE;

ALTER TABLE iot_sensor
    ADD CONSTRAINT iot_sensor_iot_node_fk FOREIGN KEY ( iot_node_id )
        REFERENCES iot_node ( id )
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
  INTO :new.id
  FROM dual;
END;
/

/*----------------------  DATA ---------------------------------- */
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

/*----------------------  ALERT ---------------------------------- */
--Versão 0.4
CREATE SEQUENCE IOT_alert_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE; 
 
  CREATE OR REPLACE TRIGGER alert_on_insert
  BEFORE INSERT ON iot_sensor_alert
  FOR EACH ROW
BEGIN
  SELECT IOT_alert_seq.nextval
  INTO :new.id
  FROM dual;
END;
/

/*----------------------  LOG ---------------------------------- */
--Versão 0.5
CREATE SEQUENCE IOT_log_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE; 
 
  CREATE OR REPLACE TRIGGER log_on_insert
  BEFORE INSERT ON iot_log_table
  FOR EACH ROW
BEGIN
  SELECT IOT_log_seq.nextval
  INTO :new.id
  FROM dual;
END;
/

/*----------------------  END ---------------------------------- */
        
/*ADD FUNCTION */
create or replace function date_to_unix_ts( PDate in date ) return number is
   l_unix_ts number;
begin
   l_unix_ts := ROUND(( PDate - TO_DATE('01.01.1970','dd.mm.yyyy')) * 60 * 60 * 24);
   return l_unix_ts;
end;
/



/*----------------------  END ---------------------------------- */
        
/* DUMMY DATA
/*add PERSON*/
INSERT INTO iot_person (email, password) VALUES ('daniel@ept.pt','123456789'); --Versão 0.4


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
INSERT INTO iot_node (IOT_PERSON_ID, MODEL, FIRM_VERS, MAC, IP, LATITUDE, LONGITUDE, ALTITUDE) VALUES (1, 'ESP32 Lora', '0.1','1A0000000','192.000.000.000',40.777083,-7.354986,1090);




/*add SENSOR*/
INSERT INTO iot_sensor (CODE, NAME, DESCRIPTION, DATE_INSTALLED, DATE_TERMINATE, IOT_SENSOR_TYPE_ID,IOT_NODE_ID) 
                VALUES ('BME280',  'Digital Sensor', 'Temperature, Humidity, Atmospheric Pressure', date_to_unix_ts(SYSDATE),NULL, 1000, 1000);
INSERT INTO iot_sensor (CODE, NAME, DESCRIPTION, DATE_INSTALLED, DATE_TERMINATE, IOT_SENSOR_TYPE_ID,IOT_NODE_ID) 
                VALUES ('BME280',  'Digital Sensor', 'Temperature, Humidity, Atmospheric Pressure', date_to_unix_ts(SYSDATE),NULL, 1001, 1000);
INSERT INTO iot_sensor (CODE, NAME, DESCRIPTION, DATE_INSTALLED, DATE_TERMINATE, IOT_SENSOR_TYPE_ID,IOT_NODE_ID) 
                VALUES ('BME280',  'Digital Sensor', 'Temperature, Humidity, Atmospheric Pressure', date_to_unix_ts(SYSDATE),NULL, 1002, 1000);

INSERT INTO iot_sensor (CODE, NAME, DESCRIPTION, DATE_INSTALLED, DATE_TERMINATE, IOT_SENSOR_TYPE_ID,IOT_NODE_ID) 
                VALUES ('CCS811',  'Air Mass Sensor', 'NTC CO2 eCO2 TVOC Air Mass Sensor', date_to_unix_ts(SYSDATE),NULL, 1003, 1000);
INSERT INTO iot_sensor (CODE, NAME, DESCRIPTION, DATE_INSTALLED, DATE_TERMINATE, IOT_SENSOR_TYPE_ID,IOT_NODE_ID) 
                VALUES ('CCS811',  'Air Mass Sensor', 'NTC CO2 eCO2 TVOC Air Mass Sensor', date_to_unix_ts(SYSDATE),NULL, 1004, 1000);
                                                            
INSERT INTO iot_sensor (CODE, NAME, DESCRIPTION, DATE_INSTALLED, DATE_TERMINATE, IOT_SENSOR_TYPE_ID,IOT_NODE_ID) 
                VALUES ('YL-38',  'Soil Hygrometer', 'Detection Module Moisture Sensor', date_to_unix_ts(SYSDATE),NULL, 1005, 1000);
    
INSERT INTO iot_sensor (CODE, NAME, DESCRIPTION, DATE_INSTALLED, DATE_TERMINATE, IOT_SENSOR_TYPE_ID,IOT_NODE_ID) 
                VALUES ('GL5528',  'Photosensitive', 'detect the light intensity', date_to_unix_ts(SYSDATE),NULL, 1006, 1000);
    
INSERT INTO iot_sensor (CODE, NAME, DESCRIPTION, DATE_INSTALLED, DATE_TERMINATE, IOT_SENSOR_TYPE_ID,IOT_NODE_ID) 
                VALUES ('LM393',  'UV Detector', 'detect flame', date_to_unix_ts(SYSDATE),NULL, 1007, 1000);
    
INSERT INTO iot_sensor (CODE, NAME, DESCRIPTION, DATE_INSTALLED, DATE_TERMINATE, IOT_SENSOR_TYPE_ID,IOT_NODE_ID) 
                VALUES ('OKY3131',  'Sound Detection', 'High Sensitive Microphone', date_to_unix_ts(sysdate),NULL, 1008, 1000);

    


/*
select * from iot_person;  
select * from iot_sensor_type;  
select * from iot_node;
select * from iot_sensor;
desc iot_sensor;


*/        
  

/*

PROCEDIMENTOS Vers 0.4

*/

/*--------------------------------------------------------------------------*/
/*---------------RECEBER VALORES DE UM SENSOR ESP32 -----------------------*/
/*--------------------------------------------------------------------------*/
CREATE OR REPLACE PROCEDURE GET_API_sensor_VALUES IS

    /*Versão 2 com ARRAY JSON*/
    totalArray INTEGER;

    /*Versão 1 com JSON*/
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
   
 /*  ------------  TEST VERSÃO 2 --ARRAY JSON ---------- */
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
 /*  ------------  TEST VERSÃO 2 --ARRAY JSON ---------- */

   
  
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


END GET_API_sensor_VALUES;
/




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
-- Schema: BDA_1007249   Date: Thu Jun 13 10:44:33 BST 2019
--
BEGIN
  ORDS.ENABLE_SCHEMA(
      p_enabled             => TRUE,
      p_schema              => 'BDA_1007249',
      p_url_mapping_type    => 'BASE_PATH',
      p_url_mapping_pattern => 'bda_1007249',
      p_auto_rest_auth      => FALSE);    

  ORDS.DEFINE_MODULE(
      p_module_name    => 'API',
      p_base_path      => '/API/',
      p_items_per_page =>  25,
      p_status         => 'PUBLISHED',
      p_comments       => NULL);      
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'API',
      p_pattern        => '/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'API',
      p_pattern        => 'Artigos/{ID}',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'API',
      p_pattern        => 'Artigos/{ID}',
      p_method         => 'GET',
      p_source_type    => 'json/collection',
      p_items_per_page =>  25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'SELECT * FROM artigos'
      );
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'API',
      p_pattern        => 'vendas',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_MODULE(
      p_module_name    => 'APIv2',
      p_base_path      => '/v2/',
      p_items_per_page =>  25,
      p_status         => 'PUBLISHED',
      p_comments       => NULL);      
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'APIv2',
      p_pattern        => '/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'APIv2',
      p_pattern        => '/',
      p_method         => 'GET',
      p_source_type    => 'json/query',
      p_items_per_page =>  25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'select ''Hello World'' from dual'
      );
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'APIv2',
      p_pattern        => 'artigos',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'APIv2',
      p_pattern        => 'artigos',
      p_method         => 'GET',
      p_source_type    => 'json/query',
      p_items_per_page =>  100,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'SELECT * FROM artigos'
      );
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'APIv2',
      p_pattern        => 'artigos/{ID}',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'APIv2',
      p_pattern        => 'artigos/{ID}',
      p_method         => 'GET',
      p_source_type    => 'json/item',
      p_items_per_page =>  25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'SELECT * FROM artigos WHERE id =:ID'
      );
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'APIv2',
      p_pattern        => 'vendas',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'APIv2',
      p_pattern        => 'vendas',
      p_method         => 'GET',
      p_source_type    => 'json/query',
      p_items_per_page =>  25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'SELECT * FROM vendas'
      );

  ORDS.DEFINE_MODULE(
      p_module_name    => 'examples.employees',
      p_base_path      => '/examples/employees/',
      p_items_per_page =>  7,
      p_status         => 'PUBLISHED',
      p_comments       => NULL);      
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'examples.employees',
      p_pattern        => '.',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'examples.employees',
      p_pattern        => '.',
      p_method         => 'GET',
      p_source_type    => 'json/collection',
      p_items_per_page =>  0,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'select * from emp order by empno desc'
      );

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
      p_pattern        => 'nodes',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'nodes',
      p_method         => 'GET',
      p_source_type    => 'json/query',
      p_items_per_page =>  100,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'SELECT iot_node.id, iot_node.model, iot_node.firm_vers, iot_node.mac, iot_node.longitude, iot_node.latitude, iot_node.altitude, iot_node.ip, iot_person.email person
  FROM IOT_NODE JOIN IOT_PERSON
    ON IOT_NODE.iot_person_id = IOT_PERSON.Id
    WHERE iot_person.ativo = 1'
      );
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'nodes',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_items_per_page =>  0,
      p_mimes_allowed  => 'application/json',
      p_comments       => NULL,
      p_source         => 
'DECLARE
    new_id   iot_node.id%TYPE;
BEGIN

    INSERT INTO iot_node (
        IOT_PERSON_ID, 
        MODEL, 
        FIRM_VERS,
        MAC, 
        IP, 
        LATITUDE, 
        LONGITUDE, 
        ALTITUDE
    ) VALUES (
        :IOT_PERSON_ID, 
        :MODEL, 
        :FIRM_VERS,
        :MAC, 
        :IP, 
        :LATITUDE, 
        :LONGITUDE, 
        :ALTITUDE

    ) RETURNING ID INTO new_id;

    :new_id := new_id;
    :status := 201;
END;'
      );
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes',
      p_method             => 'POST',
      p_name               => 'nodeId',
      p_bind_variable_name => 'new_id',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'SENSOR_API',
      p_pattern            => 'nodes',
      p_method             => 'POST',
      p_name               => 'X-APEX-STATUS-CODE',
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
      p_source_type    => 'json/query;type=single',
      p_items_per_page =>  0,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'SELECT iot_node.id, iot_node.model, iot_node.firm_vers, iot_node.mac, iot_node.longitude, iot_node.latitude, iot_node.altitude, iot_node.ip, iot_person.email person
  FROM IOT_NODE JOIN IOT_PERSON
    ON IOT_NODE.iot_person_id = IOT_PERSON.Id
    WHERE iot_node.id =:nodeID
    AND iot_person.ativo = 1'
      );
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'nodes/{nodeID}',
      p_method         => 'DELETE',
      p_source_type    => 'plsql/block',
      p_items_per_page =>  0,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'BEGIN
   DELETE FROM IOT_NODE WHERE IOT_NODE.id = :nodeID;
   :status := 204;
END;'
      );
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
      p_pattern        => 'sensors/data',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'SENSOR_API',
      p_pattern        => 'sensors/data',
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
'SELECT code, name, (SELECT name from iot_sensor_type where id=iot_sensor_type_id) sensor_type,  (SELECT unit from iot_sensor_type where id=iot_sensor_type_id) sensor_UNIT,date_installed
FROM iot_sensor 
WHERE iot_node_id =:nodeID'
      );


  COMMIT; 
END;










        
```
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

