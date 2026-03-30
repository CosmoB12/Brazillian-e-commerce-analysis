SELECT
    AVG(total_value) AS average_order_value
FROM(
    SELECT
        order_id,
        SUM(price + freight_value)  AS total_value   
    FROM olist_order_items
    GROUP BY order_id
) AS sub    