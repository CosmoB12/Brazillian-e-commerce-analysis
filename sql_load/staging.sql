-- creates staging tables
CREATE TABLE olist_order_raw(
    order_id VARCHAR(40) PRIMARY KEY,
    customer_id VARCHAR(40),
    order_status VARCHAR(20),
    order_purchase_date TIMESTAMP,
    order_approved_timestamp TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

CREATE TABLE olist_customers_raw(
    customer_id VARCHAR(40),
    customer_unique_id VARCHAR(40),
    customer_zip_code INT,
    customer_city TEXT,
    customer_state VARCHAR(3)
);

CREATE TABLE olist_products_raw(
    product_id VARCHAR(50) PRIMARY KEY,
    product_category VARCHAR(100),
    product_name_length INT,
    Product_description_length INT,
    product_photo_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

CREATE TABLE olist_order_items_raw(
    order_id VARCHAR(40),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(40),
    shipping_limit_date TIMESTAMP,
    price NUMERIC,
    freight_value NUMERIC
);

CREATE TABLE olist_customer_reviews(
    review_id VARCHAR(50),
    order_id VARCHAR (50),
    review_score INT,
    review_comment_title VARCHAR(40),
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_date TIMESTAMP
)



COPY olist_order_raw
FROM 'D:\SQL Projects\Brazillian e-commerce analysis\csv_files\olist_orders_dataset.csv'
WITH (FORMAT csv,HEADER true,DELIMITER ',',ENCODING 'UTF8');

COPY olist_customers_raw
FROM 'D:\SQL Projects\Brazillian e-commerce analysis\csv_files\olist_customers_dataset.csv'
WITH (FORMAT csv,HEADER true,DELIMITER ',',ENCODING 'UTF8');

COPY olist_products_raw
FROM 'D:\SQL Projects\Brazillian e-commerce analysis\csv_files\olist_products_dataset.csv'
WITH (FORMAT csv,HEADER true,DELIMITER ',',ENCODING 'UTF8');

COPY olist_sellers
FROM 'D:\SQL Projects\Brazillian e-commerce analysis\csv_files\olist_sellers_dataset.csv'
WITH (FORMAT csv,HEADER true,DELIMITER ',',ENCODING 'UTF8');

COPY product_category_translation
FROM 'D:\SQL Projects\Brazillian e-commerce analysis\csv_files\product_category_name_translation.csv'
WITH (FORMAT csv,HEADER true,DELIMITER',',ENCODING 'UTF8');

COPY olist_order_items_raw
FROM 'D:\SQL Projects\Brazillian e-commerce analysis\csv_files\olist_order_items_dataset.csv'
WITH (FORMAT csv,HEADER true,DELIMITER',',ENCODING 'UTF8');

COPY olist_locations
FROM 'D:\SQL Projects\Brazillian e-commerce analysis\csv_files\olist_geolocation_dataset.csv'
WITH (FORMAT csv,HEADER true,DELIMITER',',ENCODING 'UTF8');

COPY olist_customer_reviews
FROM 'D:\SQL Projects\Brazillian e-commerce analysis\csv_files\olist_order_reviews_dataset.csv'
WITH (FORMAT csv,HEADER true,DELIMITER',',ENCODING 'UTF8');

