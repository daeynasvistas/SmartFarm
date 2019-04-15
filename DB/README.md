

### V0.0.2

![Relational_1](https://user-images.githubusercontent.com/2634610/56147983-4136e200-5fa1-11e9-948c-c34dbb49a90c.png)

![Logical](https://user-images.githubusercontent.com/2634610/56147984-4136e200-5fa1-11e9-9e86-606eb2059150.png)

```SQL
DROP TABLE iot_node CASCADE CONSTRAINTS;

DROP TABLE iot_person CASCADE CONSTRAINTS;

DROP TABLE iot_sensor CASCADE CONSTRAINTS;

DROP TABLE iot_sensor_data CASCADE CONSTRAINTS;

DROP TABLE iot_sensor_type CASCADE CONSTRAINTS;

CREATE TABLE iot_node (
    id          NUMBER NOT NULL,
    model       VARCHAR2(25),
    firm_vers   VARCHAR2(8),
    mac         VARCHAR2(20),
    pos         mdsys.sdo_geometry,
    has_api     CHAR(1),
    ip          VARCHAR2(20)
);

ALTER TABLE iot_node ADD CONSTRAINT iot_node_pk PRIMARY KEY ( id );

CREATE TABLE iot_person (
    id         NUMBER(10) NOT NULL,
    username   VARCHAR2(50)
);

ALTER TABLE iot_person ADD CONSTRAINT iot_person_pk PRIMARY KEY ( id );

CREATE TABLE iot_sensor (
    sensor_id            NUMBER(7) NOT NULL,
    code                 VARCHAR2(20),
    name                 VARCHAR2(20),
    description          NVARCHAR2(80),
    date_installed       DATE,
    date_terminate       DATE,
    iot_person_id        NUMBER(10) NOT NULL,
    iot_sensor_type_id   NUMBER NOT NULL,
    iot_node_id          NUMBER NOT NULL
);

ALTER TABLE iot_sensor ADD CONSTRAINT iot_sensor_pk PRIMARY KEY ( sensor_id );

CREATE TABLE iot_sensor_data (
    id              NUMBER(8) NOT NULL,
    date_of_value   DATE,
    value           FLOAT(6),
    pos             mdsys.sdo_geometry,
    iot_sensor_id   NUMBER(7) NOT NULL
);

ALTER TABLE iot_sensor_data ADD CONSTRAINT iot_sensor_data_pk PRIMARY KEY ( id );

CREATE TABLE iot_sensor_type (
    id            NUMBER NOT NULL,
    name          VARCHAR2(20),
    unit          VARCHAR2(5),
    description   VARCHAR2(20)
);

ALTER TABLE iot_sensor_type ADD CONSTRAINT iot_sensor_type_pk PRIMARY KEY ( id );

ALTER TABLE iot_sensor_data
    ADD CONSTRAINT iot_sensor_data_iot_sensor_fk FOREIGN KEY ( iot_sensor_id )
        REFERENCES iot_sensor ( sensor_id );

ALTER TABLE iot_sensor
    ADD CONSTRAINT iot_sensor_iot_node_fk FOREIGN KEY ( iot_node_id )
        REFERENCES iot_node ( id );

ALTER TABLE iot_sensor
    ADD CONSTRAINT iot_sensor_iot_person_fk FOREIGN KEY ( iot_person_id )
        REFERENCES iot_person ( id );

ALTER TABLE iot_sensor
    ADD CONSTRAINT iot_sensor_iot_sensor_type_fk FOREIGN KEY ( iot_sensor_type_id )
        REFERENCES iot_sensor_type ( id );

```



### V0.0.1

![Logical_0_0_1](https://user-images.githubusercontent.com/2634610/55103203-ed328f00-50bf-11e9-8e64-88a0bccc437e.png)

