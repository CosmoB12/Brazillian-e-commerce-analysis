WITH customer_order_value AS(
    SELECT 

        oc.customer_unique_id,
        SUM(freight_value + price) AS total_value,
        COUNT(DISTINCT oi.order_id) as order_number        
    FROM olist_customers AS oc
    JOIN olist_order_fact  AS oo
        ON oc.customer_unique_id = oo.customer_unique_id
    JOIN olist_order_items AS  oi
        ON oo.order_id = oi.order_id
    GROUP BY
        oc.customer_unique_id
),

ranked_customers AS (
    SELECT 
        customer_unique_id,
        total_value,
        order_number,
        NTILE(10) OVER (ORDER BY total_value DESC) AS revenue_group
    FROM  
        customer_order_value
)

SELECT
    *
FROM 
    ranked_customers
WHERE  
    revenue_group = 1


ORDER BY   
    total_value DESC


+