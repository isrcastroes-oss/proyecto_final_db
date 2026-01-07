# Proyecto Final Base de Datos  
Sistema de Venta de Vehículos

## Descripción
Este proyecto corresponde al trabajo final de la asignatura de Bases de Datos.
Consiste en el diseño e implementación de un sistema de venta de vehículos,
utilizando PostgreSQL (Supabase), aplicando un modelo entidad-relación con
tablas maestras y transaccionales.

El sistema permite registrar clientes, vendedores, marcas, vehículos y ventas,
incluyendo el detalle de cada venta.

## Modelo Entidad Relación (MER)
El modelo entidad-relación fue diseñado previamente y respeta las relaciones
entre tablas maestras y transaccionales, utilizando claves primarias (PK) y
claves foráneas (FK) correctamente definidas.

## Estructura del Proyecto
El repositorio contiene los siguientes archivos SQL:

- `01_create_tables.sql`: creación del esquema y de las tablas del sistema.
- `02_inserts.sql`: inserción de datos de prueba (más de 100 registros).
- `03_selects.sql`: consultas SQL que permiten obtener información relevante
  del sistema.

## Tecnologías Utilizadas
- PostgreSQL
- Supabase
- SQL

## Instrucciones de Ejecución
Para probar el proyecto desde una base de datos vacía, ejecutar los archivos
en el siguiente orden:

1. Ejecutar `01_create_tables.sql`
2. Ejecutar `02_inserts.sql`
3. Ejecutar `03_selects.sql`

Los scripts pueden ejecutarse desde el editor SQL de Supabase o cualquier
entorno compatible con PostgreSQL.

## Autor
Nombre del estudiante: Israel Castro  
Esquema utilizado: `icastro`