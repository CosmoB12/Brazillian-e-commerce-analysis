WITH order_total AS (
    SELECT 
        order_id,
        SUM(price + freight_value) AS total_order_value
          
    FROM 
        olist_order_items 
    GROUP BY
        order_id
    ORDER BY
        total_order_value DESC
        
)
SELECT
    review_score,
    AVG(total_order_value) avg_order_value
FROM 
    order_total AS oo
JOIN olist_customer_reviews AS oc
    ON oo.order_id = oc.order_id
GROUP BY
    oc.review_score

