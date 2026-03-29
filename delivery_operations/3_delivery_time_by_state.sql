SELECT 
    oc.customer_state,
    ROUND(AVG(order_delivered_customer_date::date - order_purchase_date::date)) AS average_delivery_time
   
FROM olist_order_fact AS oo 
JOIN olist_customers AS oc
ON oo.customer_unique_id = oc.customer_unique_id

GROUP BY 
    oc.customer_state

ORDER BY
    average_delivery_time
