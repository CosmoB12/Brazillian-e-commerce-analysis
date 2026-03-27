-- sales trend 
SELECT
    month,
    SUM(CASE  WHEN year = 2016 THEN revenue END)AS year_2016,
    COUNT(CASE WHEN year = 2016 THEN order_id END) AS sales_count_2016,
    SUM(CASE  WHEN year = 2017 THEN revenue END)AS year_2017,
    COUNT(CASE WHEN year = 2017 THEN order_id END) AS sales_count_2017,
    SUM(CASE  WHEN year = 2018 THEN revenue END)AS year_2018,
    COUNT(CASE WHEN year = 2018 THEN order_id END) AS sales_count_2018

FROM(
    SELECT
        oi.order_id,
        EXTRACT(MONTH FROM o.order_purchase_date) AS month,
        EXTRACT(YEAR FROM o.order_purchase_date) AS year,
        SUM(oi.price + oi.freight_value) AS revenue

    FROM
        olist_order_items AS oi
    JOIN olist_order_fact AS o
        ON oi.order_id  =  o.order_id
    WHERE o.order_purchase_date IS NOT NULL
    GROUP BY
       oi.order_id,
       month,
       year

)sub

GROUP BY 
    month
ORDER BY 
    month


