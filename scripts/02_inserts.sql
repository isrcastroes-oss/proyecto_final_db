-- =========================
-- CLIENTES
-- =========================
INSERT INTO icastro.clientes
(nombre, apellido, cedula, email, telefono, fecha_registro)
VALUES
('Juan', 'Perez', '0102030405', 'juan@mail.com', '0999999999', '2024-01-10'),
('Maria', 'Lopez', '0102030406', 'maria@mail.com', '0988888888', '2024-02-15'),
('Carlos', 'Mendoza', '0102030407', 'carlos@mail.com', '0977777777', '2024-03-20'),
('Ana', 'Gomez', '0102030408', 'ana@mail.com', '0966666666', '2024-04-05'),
('Diego', 'Castro', '0102030409', 'diego@mail.com', '0955555555', '2024-05-01'),
('Sofia', 'Martinez', '0102030410', 'sofia@mail.com', '0944444444', '2024-05-10');

-- =========================
-- VENDEDORES
-- =========================
INSERT INTO icastro.vendedores
(nombre, apellido, email, fecha_contratacion)
VALUES
('Luis', 'Torres', 'luis@empresa.com', '2023-01-10'),
('Pedro', 'Ramirez', 'pedro@empresa.com', '2023-02-15'),
('Andrea', 'Vera', 'andrea@empresa.com', '2023-03-20'),
('Miguel', 'Ortega', 'miguel@empresa.com', '2023-04-10');

-- =========================
-- MARCAS
-- =========================
INSERT INTO icastro.marcas (nombre, pais_origen)
VALUES
('Toyota', 'Japón'),
('Chevrolet', 'USA'),
('Hyundai', 'Corea'),
('Kia', 'Corea'),
('Nissan', 'Japón');

-- =========================
-- VEHICULOS 
-- =========================
INSERT INTO icastro.vehiculos
(modelo, anio, precio, id_marca, disponible)
VALUES
('Corolla', 2022, 18000, 1, true),
('Hilux', 2021, 25000, 1, true),
('Spark', 2020, 12000, 2, true),
('Accent', 2023, 20000, 3, true),
('Rio', 2022, 17000, 4, true),
('Sentra', 2021, 19000, 5, true);

-- =========================
-- VENTAS 
-- =========================
INSERT INTO icastro.ventas
(id_cliente, id_vendedor, fecha_venta, total)
VALUES
(1, 1, '2024-01-15', 18000),
(2, 2, '2024-02-20', 12000),
(3, 1, '2024-03-10', 20000),
(4, 3, '2024-04-18', 17000),
(5, 4, '2024-05-05', 19000);

-- =========================
-- DETALLE DE VENTA
-- =========================
INSERT INTO icastro.detalle_venta
(id_venta, id_vehiculo, precio_unitario)
VALUES
(1, 1, 18000),
(2, 3, 12000),
(3, 4, 20000),
(4, 5, 17000),
(5, 6, 19000);
