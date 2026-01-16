-- =====================================================
-- CONSULTAS
-- =====================================================


-- =====================================================
-- TOP 5 CLIENTES POR GASTO TOTAL (USANDO CTE)
-- =====================================================

WITH total_por_cliente AS (
    SELECT
        c.id_cliente,
        c.nombre,
        c.apellido,
        c.email,
        SUM(v.total) AS total_gastado
    FROM icastro.clientes c
    JOIN icastro.ventas v ON c.id_cliente = v.id_cliente
    GROUP BY c.id_cliente, c.nombre, c.apellido, c.email
)
SELECT
    nombre,
    apellido,
    email,
    total_gastado
FROM total_por_cliente
ORDER BY total_gastado DESC
LIMIT 5;


-- =====================================================
-- VEHÍCULOS MÁS VENDIDOS
-- =====================================================

WITH ventas_por_vehiculo AS (
    SELECT
        ve.id_vehiculo,
        ve.modelo,
        m.nombre AS marca,
        COUNT(dv.id_detalle) AS unidades_vendidas,
        SUM(dv.precio_unitario) AS monto_total
    FROM icastro.detalle_venta dv
    JOIN icastro.vehiculos ve ON dv.id_vehiculo = ve.id_vehiculo
    JOIN icastro.marcas m ON ve.id_marca = m.id_marca
    GROUP BY ve.id_vehiculo, ve.modelo, m.nombre
)
SELECT
    modelo,
    marca,
    unidades_vendidas,
    monto_total,
    RANK() OVER (ORDER BY unidades_vendidas DESC) AS ranking_cantidad,
    RANK() OVER (ORDER BY monto_total DESC) AS ranking_monto
FROM ventas_por_vehiculo
ORDER BY unidades_vendidas DESC;


-- =====================================================
-- RESUMEN DE VENTAS POR MARCA
-- =====================================================

SELECT
    m.nombre AS marca,
    COUNT(dv.id_detalle) AS unidades_vendidas,
    SUM(dv.precio_unitario) AS monto_total
FROM icastro.detalle_venta dv
JOIN icastro.vehiculos ve ON dv.id_vehiculo = ve.id_vehiculo
JOIN icastro.marcas m ON ve.id_marca = m.id_marca
GROUP BY m.nombre
ORDER BY monto_total DESC;


-- =====================================================
-- PRODUCTIVIDAD POR VENDEDOR (USANDO CTE)
-- =====================================================

WITH ventas_por_vendedor AS (
    SELECT
        ve.id_vendedor,
        ve.nombre,
        ve.apellido,
        COUNT(v.id_venta) AS numero_ventas,
        SUM(v.total) AS total_vendido
    FROM icastro.vendedores ve
    JOIN icastro.ventas v ON ve.id_vendedor = v.id_vendedor
    GROUP BY ve.id_vendedor, ve.nombre, ve.apellido
)
SELECT
    nombre,
    apellido,
    numero_ventas,
    total_vendido,
    total_vendido / NULLIF(numero_ventas, 0) AS ticket_promedio
FROM ventas_por_vendedor
ORDER BY total_vendido DESC;


-- =====================================================
-- PIPELINE MENSUAL DE VENTAS
-- =====================================================

SELECT
    DATE_TRUNC('month', fecha_venta) AS mes,
    SUM(total) AS total_vendido
FROM icastro.ventas
GROUP BY mes
ORDER BY mes;


-- =====================================================
-- PARTICIPACIÓN PORCENTUAL POR MARCA DENTRO DE CADA MES
-- =====================================================

WITH ventas_mensuales AS (
    SELECT
        DATE_TRUNC('month', v.fecha_venta) AS mes,
        m.nombre AS marca,
        SUM(dv.precio_unitario) AS total_marca
    FROM icastro.ventas v
    JOIN icastro.detalle_venta dv ON v.id_venta = dv.id_venta
    JOIN icastro.vehiculos ve ON dv.id_vehiculo = ve.id_vehiculo
    JOIN icastro.marcas m ON ve.id_marca = m.id_marca
    GROUP BY mes, m.nombre
),
total_por_mes AS (
    SELECT
        mes,
        SUM(total_marca) AS total_mes
    FROM ventas_mensuales
    GROUP BY mes
)
SELECT
    vm.mes,
    vm.marca,
    vm.total_marca,
    ROUND((vm.total_marca / tpm.total_mes) * 100, 2) AS porcentaje_participacion
FROM ventas_mensuales vm
JOIN total_por_mes tpm ON vm.mes = tpm.mes
ORDER BY vm.mes, porcentaje_participacion DESC;


-- =====================================================
-- AUDITORÍA
-- =====================================================

SELECT
    v.id_venta,
    v.total AS total_venta,
    SUM(dv.precio_unitario) AS total_detalle
FROM icastro.ventas v
JOIN icastro.detalle_venta dv ON v.id_venta = dv.id_venta
GROUP BY v.id_venta, v.total
HAVING v.total <> SUM(dv.precio_unitario);


-- =====================================================
-- AUDITORÍA
-- =====================================================

SELECT DISTINCT
    ve.id_vehiculo,
    ve.modelo,
    ve.disponible
FROM icastro.detalle_venta dv
JOIN icastro.vehiculos ve ON dv.id_vehiculo = ve.id_vehiculo
WHERE ve.disponible = TRUE;
