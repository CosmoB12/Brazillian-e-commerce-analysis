-- olist order fact
INSERT INTO olist_order_fact
SELECT
    o.order_id,
    c.customer_unique_id,
    o.order_status,
    o.order_purchase_date,
    o.order_approved_timestamp,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date
FROM 
    olist_order_raw AS o
JOIN 
    olist_customers_raw  AS c ON o.customer_id = c.customer_id;
    
-- olist customers 
INSERT INTO olist_customers 
SELECT DISTINCT ON (customer_unique_id)
    customer_unique_id,
    customer_zip_code,
    customer_city,
    customer_state
FROM 
    olist_customers_raw

-- olist products
INSERT INTO olist_products
SELECT 
    product_id,
    product_category,
    product_name_length,
    Product_description_length,
    product_photo_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm 
FROM
    olist_products_raw

-- olist order items
INSERT INTO olist_order_items
SELECT
    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date,
    price,
    freight_value
FROM 
    olist_order_items_raw

    
INSERT INTO olist_order_items
SELECT *
FROM olist_order_items_raw oi
WHERE EXISTS (
    SELECT 1
    FROM olist_products p
    WHERE TRIM(p.product_id) = TRIM(oi.product_id)
)
AND EXISTS (
    SELECT 1
    FROM olist_sellers s
    WHERE TRIM(s.seller_id) = TRIM(oi.seller_id)
);


SELECT 
    product_id
FROM
    olist_order_items_raw
EXCEPT
    SELECT
        product_id
    FROM 
        olist_products

INSERT INTO olist_order_items
SELECT DISTINCT
   oi.product_id
FROM
    olist_order_items_raw AS oi
LEFT JOIN
    olist_products AS p ON oi.product_id = p.product_id
WHERE 
    p.product_id IS NULL;

