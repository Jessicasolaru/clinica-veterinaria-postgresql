-- Insercion de datos de ejemplo 

INSERT INTO dueno (id_dueno, nombre, direccion, telefono)
OVERRIDING SYSTEM VALUE
VALUES
(1, 'Juan Pérez', 'Calle Falsa 123', '555-1234'),
(2, 'Ana Gómez', 'Avenida Siempre Viva 456', '555-8765'),
(3, 'Carlos Ruiz', 'Calle 8 de Octubre 789', '555-8765');

INSERT INTO mascota (id_mascota, nombre, tipo, fecha_nacimiento, id_dueno)
OVERRIDING SYSTEM VALUE
VALUES
(1, 'Rex', 'Perro', '2020-05-10', 1),
(2, 'Luna', 'Gato', '2019-02-20', 2),
(3, 'Fido', 'Perro', '2021-03-15', 3);

INSERT INTO profesional (id_profesional, nombre, especialidad)
OVERRIDING SYSTEM VALUE
VALUES
(1, 'Dr. Martínez', 'Veterinario'),
(2, 'Dr. Pérez', 'Especialista en dermatología'),
(3, 'Dr. López', 'Cardiólogo veterinario');

INSERT INTO atencion (id_atencion, fecha_atencion, descripcion, id_mascota, tipo, id_profesional)
OVERRIDING SYSTEM VALUE
VALUES
(1, '2025-03-01', 'Chequeo general', 1, 'Perro', 1),
(2, '2025-03-05', 'Tratamiento dermatológico', 2, 'Gato', 2),
(3, '2025-03-07', 'Consulta cardiológica', 3, 'Perro', 3);


-- Reajustar secuencias para que el siguiente INSERT automatico no choque con IDs ya usados
SELECT setval(pg_get_serial_sequence('dueno', 'id_dueno'), COALESCE(MAX(id_dueno), 1), true) FROM dueno;
SELECT setval(pg_get_serial_sequence('mascota', 'id_mascota'), COALESCE(MAX(id_mascota), 1), true) FROM mascota;
SELECT setval(pg_get_serial_sequence('profesional', 'id_profesional'), COALESCE(MAX(id_profesional), 1), true) FROM profesional;
SELECT setval(pg_get_serial_sequence('atencion', 'id_atencion'), COALESCE(MAX(id_atencion), 1), true) FROM atencion;
