WITH customer_orders AS(
    SELECT 
        oc.customer_unique_id,
        COUNT(DISTINCT order_id) AS orders_made
        
    FROM olist_customers AS oc

    JOIN olist_order_fact  AS oo
        ON oc.customer_unique_id = oo.customer_unique_id

    GROUP BY
        oc.customer_unique_id
        
    ORDER BY 
        orders_made DESC
)

SELECT
    COUNT(CASE WHEN orders_made > 1 THEN customer_unique_id END) AS repeat_customers,
    COUNT(CASE WHEN orders_made = 1 THEN customer_unique_id END) AS one_time_customers
    
FROM
    customer_orders

