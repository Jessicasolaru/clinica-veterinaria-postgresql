-- 1) Obtener todos los dueños y sus mascotas
SELECT
    d.id_dueno,
    d.nombre AS nombre_dueno,
    m.id_mascota,
    m.nombre AS nombre_mascota,
    m.tipo,
    m.fecha_nacimiento
FROM dueno d
LEFT JOIN mascota m ON d.id_dueno = m.id_dueno
ORDER BY d.id_dueno, m.id_mascota;

-- 2) Atenciones con detalle del profesional
SELECT
    a.id_atencion,
    a.fecha_atencion,
    a.descripcion,
    m.nombre AS mascota,
    p.nombre AS profesional,
    p.especialidad
FROM atencion a
JOIN mascota m ON a.id_mascota = m.id_mascota
JOIN profesional p ON a.id_profesional = p.id_profesional
ORDER BY a.id_atencion;

-- 3) Cantidad de atenciones por profesional
SELECT
    p.id_profesional,
    p.nombre AS profesional,
    p.especialidad,
    COUNT(a.id_atencion) AS cantidad_atenciones
FROM profesional p
LEFT JOIN atencion a ON p.id_profesional = a.id_profesional
GROUP BY p.id_profesional, p.nombre, p.especialidad
ORDER BY cantidad_atenciones DESC, p.id_profesional;

-- 4) Actualizar dirección de Juan Pérez
UPDATE dueno
SET direccion = 'Pasaje Los Alerces 999'
WHERE nombre = 'Juan Pérez';

-- Verificación
SELECT * FROM dueno WHERE nombre = 'Juan Pérez';

-- 5) Eliminar atención con id 2
DELETE FROM atencion
WHERE id_atencion = 2;

-- Verificación
SELECT * FROM atencion ORDER BY id_atencion;
