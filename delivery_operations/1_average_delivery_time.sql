WITH average_number_of_days AS(
    SELECT
        (order_delivered_customer_date::date - order_purchase_date::date) AS number_of_days
    FROM   
        olist_order_fact
    WHERE 
        order_delivered_customer_date IS NOT NULL
)
SELECT
    ROUND(AVG(number_of_days)) AS average_delivery_days
FROM
    average_number_of_days
    WHERE number_of_days < 60
   