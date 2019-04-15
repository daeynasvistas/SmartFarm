
### V0.0.1

![Logical_0_0_1](https://user-images.githubusercontent.com/2634610/55103203-ed328f00-50bf-11e9-8e64-88a0bccc437e.png)

```SQL
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
```
