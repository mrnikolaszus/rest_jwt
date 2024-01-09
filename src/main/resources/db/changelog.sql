--liquibase formatted sql

--changeset nick:users

CREATE TABLE USERS
(
    ID         bigserial primary key,
    EMAIL      varchar(255) not null unique,
    USERNAME   varchar(32)  not null unique,
    FIRST_NAME varchar(64)  not null,
    LAST_NAME  varchar(64)  not null,
    PASSWORD   varchar(255) not null,
    STATUS     varchar(32)  not null default 'ACTIVE',
    CREATED    timestamp    not null DEFAULT CURRENT_TIMESTAMP,
    UPDATED    timestamp    not null DEFAULT CURRENT_TIMESTAMP

);

--changeset nick:roles

CREATE TABLE ROLES
(
    ID      bigserial primary key,
    NAME    varchar(100) not null unique,
    CREATED timestamp    not null DEFAULT CURRENT_TIMESTAMP,
    UPDATED timestamp    not null DEFAULT CURRENT_TIMESTAMP,
    STATUS  varchar(32)  not null default 'ACTIVE'

);

--changeset nick:userRoles

CREATE TABLE USER_ROLES
(
    USER_ID bigint,
    ROLE_ID bigint,
    FOREIGN KEY (USER_ID) REFERENCES USERS (ID) ON DELETE CASCADE ON UPDATE RESTRICT,
    FOREIGN KEY (ROLE_ID) REFERENCES ROLES (ID) ON DELETE CASCADE ON UPDATE RESTRICT,

    PRIMARY KEY (USER_ID, ROLE_ID)

);

--changeset nick:addingRoles

INSERT INTO ROLES(NAME)
values ('ROLE_USER'),('ROLE_ADMIN');
