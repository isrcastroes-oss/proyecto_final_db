SELECT
v.id_venta,
c.nombre || ' ' || c.apellido AS cliente,
ve.nombre || ' ' || ve.apellido AS vendedor,
v.fecha_venta,
v.total
FROM icastro.ventas v
JOIN icastro.clientes c ON v.id_cliente = c.id_cliente
JOIN icastro.vendedores ve ON v.id_vendedor = ve.id_vendedor
ORDER BY v.fecha_venta;

SELECT
c.nombre,
c.apellido,
v.fecha_venta,
v.total
FROM icastro.ventas v
JOIN icastro.clientes c ON v.id_cliente = c.id_cliente
WHERE v.fecha_venta BETWEEN '2024-01-01' AND '2024-03-31';


SELECT
ve.nombre,
ve.apellido,
SUM(v.total) AS total_vendido
FROM icastro.ventas v
JOIN icastro.vendedores ve ON v.id_vendedor = ve.id_vendedor
GROUP BY ve.nombre, ve.apellido
ORDER BY total_vendido DESC;


SELECT
TO_CHAR(v.fecha_venta, 'YYYY-MM') AS mes,
COUNT(*) AS cantidad_ventas
FROM icastro.ventas v
GROUP BY mes
ORDER BY mes;


SELECT
m.nombre AS marca,
vehi.modelo,
dv.precio_unitario
FROM icastro.detalle_venta dv
JOIN icastro.vehiculos vehi ON dv.id_vehiculo = vehi.id_vehiculo
JOIN icastro.marcas m ON vehi.id_marca = m.id_marca;


SELECT
c.nombre,
c.apellido,
COUNT(v.id_venta) AS total_compras
FROM icastro.clientes c
JOIN icastro.ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.nombre, c.apellido
HAVING COUNT(v.id_venta) > 1;


