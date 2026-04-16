/*
=============================================================================
PROYECTO: E-commerce-Logistics-Optimization
FASE 03: Perfilado y Diagnóstico de Datos (Sanity Check)
OBJETIVO: Identificar valores nulos, negativos, inconsistencias de tipeo y 
          duplicados en las variables críticas antes de calcular el margen.
=============================================================================
*/

-- Escáner 1: Tabla ITEMS (Donde está la plata)
-- Buscamos si hay productos regalados (precio 0) o fletes imposibles (negativos)
SELECT 
    'Tabla ITEMS' AS tabla_analizada,
    COUNTIF(price IS NULL) AS nulos_precio,
    COUNTIF(price <= 0) AS invalidos_precio_cero_negativo,
    COUNTIF(freight_value IS NULL) AS nulos_flete,
    COUNTIF(freight_value < 0) AS invalidos_flete_negativo
FROM `proyecto-final-numa.ecommerce_data.items`;

-- Escáner 2: Tabla PRODUCT (Donde está el peso y la categoría)
-- Buscamos productos sin categorizar o sin peso (vital para la hipótesis del jefe)
SELECT 
    'Tabla PRODUCT' AS tabla_analizada,
    COUNTIF(product_category_name IS NULL OR TRIM(product_category_name) = '') AS categorias_vacias_o_nulas,
    COUNTIF(product_weight_g IS NULL) AS nulos_peso,
    COUNTIF(product_weight_g <= 0) AS invalidos_peso_cero
FROM `proyecto-final-numa.ecommerce_data.product`;

-- Escáner 3: Tabla ORDERS (Donde está la verdad de la transacción)
-- Buscamos si el sistema duplicó órdenes accidentalmente o si hay órdenes "fantasma" sin estado
SELECT 
    'Tabla ORDERS' AS tabla_analizada,
    (COUNT(order_id) - COUNT(DISTINCT order_id)) AS ordenes_duplicadas,
    COUNTIF(order_status IS NULL OR TRIM(order_status) = '') AS estados_vacios_o_nulos
FROM `proyecto-final-numa.ecommerce_data.orders`;