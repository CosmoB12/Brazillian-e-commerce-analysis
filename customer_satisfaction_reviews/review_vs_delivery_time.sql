SELECT 
    review_score,
    ROUND(AVG((order_delivered_customer_date::date - order_purchase_date::date))) AS average_delivery_time   
FROM 
    olist_order_fact AS  oo
JOIN olist_customer_reviews AS oc
    ON oo.order_id = oc.order_id
WHERE
    order_delivered_customer_date IS NOT NULL
    AND order_purchase_date IS NOT NULL
GROUP BY
    review_score
ORDER BY 
    average_delivery_time DESC
    


