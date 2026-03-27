SELECT
    AVG(orders_made) as average_order_per_customer
FROM(
    SELECT 
        oc.customer_unique_id,
        COUNT(DISTINCT order_id) AS orders_made
            
    FROM olist_customers AS oc

    JOIN olist_order_fact  AS oo
        ON oc.customer_unique_id = oo.customer_unique_id

    GROUP BY
        oc.customer_unique_id
            

)sub