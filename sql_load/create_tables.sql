CREATE TABLE olist_customers(
    customer_unique_id VARCHAR(40) PRIMARY KEY,
    customer_zip_code INT,
    customer_city TEXT,
    customer_state VARCHAR(3)
);

CREATE TABLE olist_order_fact(
    order_id VARCHAR(40) PRIMARY KEY,
    customer_unique_id VARCHAR(40),
    order_status VARCHAR(20),
    order_purchase_date TIMESTAMP,
    order_approved_timestamp TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP,
    FOREIGN KEY (customer_unique_id) REFERENCES olist_customers(customer_unique_id)
);

CREATE TABLE olist_products(
    prodcuct_id VARCHAR(50) PRIMARY KEY,
    product_category VARCHAR(100),
    product_name_length INT,
    Product_description_length INT,
    product_photo_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

CREATE TABLE olist_sellers(
    seller_id VARCHAR(50) PRIMARY KEY,
    seller_zipcode VARCHAR(10),
    seller_city VARCHAR(50),
    seller_state VARCHAR(4)

);

CREATE TABLE olist_order_items(
    order_id VARCHAR(40),
    order_item_id INT,
    prodcuct_id VARCHAR(40),
    seller_id VARCHAR(40),
    shipping_limit_date TIMESTAMP,
    price NUMERIC,
    freight_value NUMERIC,
    PRIMARY KEY(order_id, order_item_id),
    FOREIGN KEY(prodcuct_id) REFERENCES olist_products(prodcuct_id),
    FOREIGN KEY(seller_id) REFERENCES olist_sellers(seller_id)
);


CREATE TABLE product_category_translation(
    product_category VARCHAR(100),
    product_category_english VARCHAR(100)
)



