SELECT
    order_id,
    (order_purchase_date - order_delivered_customer_date) AS delivery_time
FROM   
    olist_order_fact