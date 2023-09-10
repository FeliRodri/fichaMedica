-- creating the database

CREATE DATABASE fichamedica;

--using the database
use fichamedica;

--creating a table
CREATE TABLE fichas(
    rut VARCHAR(15) UNSIGNED PRIMARY KEY,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50),
    telefono VARCHAR(15),
    email VARCHAR(50) NOT NULL,
    fechaNacimiento VARCHAR(15),
    estadoCivil VARCHAR(40),
    comentarios VARCHAR(300)
);

--to show all tables
SHOW TABLES;

--to describe the table
describe fichas;