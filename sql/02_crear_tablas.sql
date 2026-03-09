--Crear tablas:

CREATE TABLE dueno (
    id_dueno INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

CREATE TABLE profesional (
    id_profesional INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL
);

CREATE TABLE mascota (
    id_mascota INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_dueno INT NOT NULL,
    CONSTRAINT fk_mascota_dueno
        FOREIGN KEY (id_dueno)
        REFERENCES dueno(id_dueno)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE atencion (
    id_atencion INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fecha_atencion DATE NOT NULL,
    descripcion TEXT NOT NULL,
    id_mascota INT NOT NULL,
    id_profesional INT NOT NULL,
    CONSTRAINT fk_atencion_mascota
        FOREIGN KEY (id_mascota)
        REFERENCES mascota(id_mascota)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_atencion_profesional
        FOREIGN KEY (id_profesional)
        REFERENCES profesional(id_profesional)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
