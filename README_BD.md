# Base de Datos - Clinica Veterinaria (PostgreSQL + pgAdmin 4)

Diseñar e implementar una base de datos relacional para una clinica veterinaria en PostgreSQL usando pgAdmin 4, incluyendo:

- Creacion de base de datos.
- Creacion de tablas con claves primarias y foraneas.
- Insercion de datos de ejemplo.
- Consultas SQL solicitadas.
- Operaciones de actualizacion y eliminacion.
- Uso de transacciones.
- Documentacion para entrega en GitHub.

# Evidencias de ejecución

1. Base de datos creada correctamente. Verificación ejecutada:
   SELECT current_database();

2. Creación de tablas dueno, mascota, profesional y atencion. Verificación ejecutada:
   SELECT table_name
   FROM information_schema.tables
   WHERE table_schema = 'public'
   ORDER BY table_name;

3. Se insertaron registros en todas las tablas usando OVERRIDING SYSTEM VALUE para columnas identity (GENERATED ALWAYS). Verificacion ejecutada:

```sql
   SELECT * FROM dueno ORDER BY id_dueno;
   SELECT * FROM mascota ORDER BY id_mascota;
   SELECT * FROM profesional ORDER BY id_profesional;
   SELECT * FROM atencion ORDER BY id_atencion;

4. Consultas solicitadas:

- Se obtuvo el listado de duenos con sus mascotas (JOIN).
- Se obtuvo el listado de atenciones con datos del profesional.
- Se conto la cantidad de atenciones por profesional.
- Se actualizo la direccion de Juan Pérez.
- Se elimino la atencion con id_atencion = 2.
  Verificaciones usadas:
  SELECT * FROM dueno WHERE nombre = 'Juan Pérez';
  SELECT * FROM atencion ORDER BY id_atencion;

5. Transacción
   Se ejecuto una transaccion con BEGIN ... COMMIT que realizo:
   Insercion de una nueva mascota.
   Insercion de una nueva atencion asociada.
   Actualizacion del telefono del dueno con id_dueno = 1.

Script:
BEGIN;
-- INSERT mascota
-- INSERT atencion
-- UPDATE dueno
COMMIT;

Verificación:
SELECT * FROM mascota ORDER BY id_mascota;
SELECT * FROM atencion ORDER BY id_atencion;
SELECT * FROM dueno WHERE id_dueno = 1;

6. Problemas encontrados:
   ERROR: cannot insert a non-DEFAULT value into column "id_dueno"
   Column "id_dueno" is an identity column defined as GENERATED ALWAYS.

Causa
Las columnas id\_\* fueron creadas como GENERATED ALWAYS AS IDENTITY, por lo que PostgreSQL no permite insertar IDs manuales sin instruccion adicional.

Solucion aplicada
Se uso OVERRIDING SYSTEM VALUE en los INSERT del archivo 03_insertar_datos.sql.

Adicionalmente, se reajustaron secuencias para evitar conflictos en futuros inserts automaticos.

# Conclusiones

Se implementó correctamente una base de datos relacional en PostgreSQL para una clinica veterinaria.
Se aplicaron claves primarias, foraneas e integridad referencial.
Se manipularon datos con INSERT, UPDATE, DELETE y consultas JOIN.
Se aplico una transaccion para asegurar atomicidad en operaciones relacionadas.
```
