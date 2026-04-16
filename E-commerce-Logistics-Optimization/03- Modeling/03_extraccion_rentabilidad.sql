SELECT 
    p.product_category_name AS categoria_producto,
    c.customer_state AS estado_destino, 
    COUNT(o.order_id) AS cantidad_ventas_en_rojo,
    ROUND(AVG(p.product_weight_g), 2) AS peso_promedio_gramos,
    ROUND(AVG(i.freight_value), 2) AS costo_flete_promedio,
    ROUND(SUM(i.price - i.freight_value - (i.price * 0.15)), 2) AS margen_total_perdido
FROM 
    `proyecto-final-numa.ecommerce_data.orders` o
INNER JOIN 
    `proyecto-final-numa.ecommerce_data.items` i 
    ON o.order_id = i.order_id
INNER JOIN 
    `proyecto-final-numa.ecommerce_data.product` p 
    ON i.product_id = p.product_id
INNER JOIN 
    `proyecto-final-numa.ecommerce_data.customers` c
    ON o.customer_id = c.customer_id
WHERE 
    o.order_status = 'delivered'
    AND i.price > 0
    AND p.product_weight_g > 0
    AND p.product_category_name IS NOT NULL
GROUP BY 
    p.product_category_name, 
    c.customer_state
HAVING 
    margen_total_perdido < 0
ORDER BY 
    margen_total_perdido ASC;