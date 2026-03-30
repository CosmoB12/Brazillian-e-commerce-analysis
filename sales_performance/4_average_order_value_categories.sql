SELECT 
    product_category_final,
    AVG(order_value) AS average_order_value
FROM(
SELECT
    order_id,
    CASE
        WHEN pc.product_category_english IS NULL THEN p.product_category
        ELSE pc.product_category_english
    END AS product_category_final,
   COUNT(*) AS total_items_sold,
   SUM(oi.price + oi.freight_value) AS order_value
FROM olist_products AS p
JOIN olist_order_items AS oi
    ON p.product_id = oi.product_id
LEFT JOIN product_category_translation AS pc 
    ON pc.product_category = p.product_category
GROUP BY 
    p.product_category,
    order_id,
    pc.product_category_english
ORDER BY 
    order_value DESC
) AS sub

GROUP BY
    product_category_final
