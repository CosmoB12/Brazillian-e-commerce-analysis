SELECT
    COUNT(CASE WHEN order_delivered_customer_date <= order_estimated_delivery_date THEN order_id  END) AS on_time_deliveries,
    COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN order_id  END) AS late_deliveries,
    COUNT(*) AS total_deliveries,
    ROUND(COUNT(
        CASE WHEN order_delivered_customer_date > order_estimated_delivery_date 
        THEN order_id 
        END)* 100.0 /COUNT(*),
        2
    )AS late_deliveries_percentage


FROM
    olist_order_fact
