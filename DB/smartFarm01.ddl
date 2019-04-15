-- Generated by Oracle SQL Developer Data Modeler 18.4.0.339.1536
--   at:        2019-04-15 14:39:50 BST
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c



DROP TABLE iot_person CASCADE CONSTRAINTS;

DROP TABLE iot_sensor CASCADE CONSTRAINTS;

DROP TABLE iot_sensor_data CASCADE CONSTRAINTS;

DROP TABLE iot_sensor_group CASCADE CONSTRAINTS;

DROP TABLE iot_sensor_type CASCADE CONSTRAINTS;

CREATE TABLE iot_person (
    person_id   NUMBER(10) NOT NULL,
    username    VARCHAR2(50)
);

ALTER TABLE iot_person ADD CONSTRAINT iot_person_pk PRIMARY KEY ( person_id );

CREATE TABLE iot_sensor (
    sensor_id                        NUMBER(7) NOT NULL,
    code                             VARCHAR2(20),
    name                             VARCHAR2(20),
    description                      NVARCHAR2(80),
    date_installed                   DATE,
    date_terminate                   DATE,
    iot_sensor_type_sensor_type_id   NUMBER(8) NOT NULL,
    iot_person_person_id             NUMBER(10) NOT NULL
);

ALTER TABLE iot_sensor ADD CONSTRAINT iot_sensor_pk PRIMARY KEY ( sensor_id );

CREATE TABLE iot_sensor_data (
    data_id                NUMBER(8) NOT NULL,
    iot_sensor_sensor_id   NUMBER(7) NOT NULL,
    date_of_value          DATE,
    value                  FLOAT(6),
    pos                    mdsys.sdo_geometry
);

ALTER TABLE iot_sensor_data ADD CONSTRAINT iot_sensor_data_pk PRIMARY KEY ( data_id );

CREATE TABLE iot_sensor_group (
    sensor_group_id                  NUMBER(10) NOT NULL,
    code                             VARCHAR2(10),
    name                             VARCHAR2(30),
    iot_sensor_type_sensor_type_id   NUMBER(8) NOT NULL
);

ALTER TABLE iot_sensor_group ADD CONSTRAINT iot_sensor_group_pk PRIMARY KEY ( sensor_group_id );

CREATE TABLE iot_sensor_type (
    sensor_type_id   NUMBER(8) NOT NULL,
    name             VARCHAR2(50),
    unit             VARCHAR2(10),
    descrition       NVARCHAR2(50)
);

ALTER TABLE iot_sensor_type ADD CONSTRAINT iot_sensor_type_pk PRIMARY KEY ( sensor_type_id );

ALTER TABLE iot_sensor
    ADD CONSTRAINT iot_sensor_iot_person_fk FOREIGN KEY ( iot_person_person_id )
        REFERENCES iot_person ( person_id );

ALTER TABLE iot_sensor
    ADD CONSTRAINT iot_sensor_iot_sensor_type_fk FOREIGN KEY ( iot_sensor_type_sensor_type_id )
        REFERENCES iot_sensor_type ( sensor_type_id );

ALTER TABLE iot_sensor_data
    ADD CONSTRAINT sensor_data_sensor_fk FOREIGN KEY ( iot_sensor_sensor_id )
        REFERENCES iot_sensor ( sensor_id );

ALTER TABLE iot_sensor_group
    ADD CONSTRAINT sensor_group_sensor_type_fk FOREIGN KEY ( iot_sensor_type_sensor_type_id )
        REFERENCES iot_sensor_type ( sensor_type_id );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
