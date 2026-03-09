BEGIN;

-- Agregar nueva mascota (dueño id 1)
INSERT INTO mascota (nombre, tipo, fecha_nacimiento, id_dueno)
VALUES ('Milo', 'Perro', '2022-11-03', 1);

-- Crear atención para la mascota recién agregada
INSERT INTO atencion (fecha_atencion, descripcion, id_mascota, id_profesional)
VALUES ('2026-03-09', 'Control anual y vacunas', currval(pg_get_serial_sequence('mascota','id_mascota')), 1);

-- Actualizar información del dueño
UPDATE dueno
SET telefono = '555-0001'
WHERE id_dueno = 1;

COMMIT;
