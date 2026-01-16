-- TABLAS MAESTRAS
CREATE SCHEMA IF NOT EXISTS icastro;

CREATE TABLE icastro.clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    cedula VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20),
    fecha_registro DATE NOT NULL
);

CREATE TABLE icastro.vendedores (
    id_vendedor SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    fecha_contratacion DATE NOT NULL
);

CREATE TABLE icastro.marcas (
    id_marca SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    pais_origen VARCHAR(50)
);

CREATE TABLE icastro.vehiculos (
    id_vehiculo SERIAL PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    anio INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    id_marca INT NOT NULL,
    disponible BOOLEAN NOT NULL,
    CONSTRAINT fk_marca
        FOREIGN KEY (id_marca)
        REFERENCES icastro.marcas(id_marca)
);

-- TABLAS TRANSACCIONALES

CREATE TABLE icastro.ventas (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    fecha_venta DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES icastro.clientes(id_cliente),
    CONSTRAINT fk_vendedor
        FOREIGN KEY (id_vendedor)
        REFERENCES icastro.vendedores(id_vendedor)
);

CREATE TABLE icastro.detalle_venta (
    id_detalle SERIAL PRIMARY KEY,
    id_venta INT NOT NULL,
    id_vehiculo INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_venta
        FOREIGN KEY (id_venta)
        REFERENCES icastro.ventas(id_venta),
    CONSTRAINT fk_vehiculo
        FOREIGN KEY (id_vehiculo)
        REFERENCES icastro.vehiculos(id_vehiculo)
);