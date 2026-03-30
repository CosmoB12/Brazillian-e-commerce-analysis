# 🛒 E-Commerce Analytics Project (Olist Dataset)

##  Project Overview
This project analyzes a Brazilian e-commerce dataset to uncover insights into sales performance, customer behavior, and delivery operations.

The goal is to simulate a real-world data analyst workflow from raw data ingestion to data modeling and business insights.

---

##  Dataset
- Source: [Brazilian E-Commerce Public Dataset (Olist)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- ~100,000 orders
- Includes customers, orders, products, payments, and delivery data

---

##  Tools & Technologies
- SQL (PostgreSQL)
- Data Modeling (Relational Schema)
- Git & GitHub

---

## Project Structure



## 🧱 Data Model

The database was designed using a **relational schema** to support efficient e-commerce analytics.  
It follows a **fact–dimension structure**, with transactional data stored in a central fact table and descriptive attributes stored in dimension tables.

---

### 📌 Core Structure

- **Fact Table**
  - `olist_order_fact` — stores order-level transactional data (timestamps, status, delivery information)

- **Dimension Tables**
  - `olist_customers` — customer identifiers and location data  
  - `olist_products` — product attributes and categories  
  - `olist_sellers` — seller information  

- **Bridge Table**
  - `olist_order_items` — connects orders to products and sellers, capturing item-level details such as price and freight cost  

- **Supporting Tables**
  - `product_category_translation` — translates product categories into English  
  - `olist_customer_reviews` — customer ratings and feedback  
  - `olist_locations` — geographic data for location-based analysis  

![Entity Relationship Diagram](assets\ERD.png)
---

### 🔗 Key Relationships

- Each **order** is linked to a single customer via `customer_unique_id`
- Each **order** can contain multiple items (handled in `olist_order_items`)
- Each **order item** is associated with:
  - one product  
  - one seller  
- Product categories are standardized using the translation table  

---

### 🧠 Design Decisions

- Used `customer_unique_id` instead of `customer_id` to ensure consistency across multiple orders per customer  
- Implemented a **composite primary key** (`order_id`, `order_item_id`) in the order items table to uniquely identify each item within an order  
- Separated **order-level data** from **item-level data** to maintain normalization  
- Included supporting tables (reviews, locations) to enable deeper analysis such as customer satisfaction and geographic trends  

---

### 📊 Why This Model Works

This structure enables:

- Efficient aggregation of sales and revenue  
- Flexible customer-level analysis (e.g., retention, segmentation)  
- Product and category performance analysis  
- Operational insights such as delivery performance  

## 🔄 Data Pipeline

1. **Raw Data Ingestion**
   - Loaded CSV files into staging tables

2. **Data Cleaning**
   - Resolved missing values and inconsistencies
   - Fixed malformed records and encoding issues

3. **Data Transformation**
   - Built final tables from staging layer
   - Ensured referential integrity across tables

---

## 📊 Key Analyses

The analysis is organized into four key areas, each focusing on a different aspect of the business.

---

### 👥 Customer Behaviour

**Focus:** Understanding customer purchasing patterns and engagement.

**Queries:**
- 1_repeat_customers.sql — Identifies repeat vs one-time customers  

![repeat_customers](assets\repeat_customers.png)

- 2_average_orders.sql — Calculates the average number of orders per customer  

![average_orders](assets\repeat_customers.png)

- 3_high_value_customers.sql — Segments customers based on total spend (top 10%)  

![high_value_customers](assets\high_value_customers.png)

**Insight:**  
Approximately 96.9% of customers are one-time buyers, while only 3.1% make repeat purchases. This indicates very low customer retention and suggests that the business relies heavily on acquiring new customers rather than retaining existing ones. This behavior aligns with earlier findings where high-value customers were also predominantly one-time buyers, reinforcing the pattern of infrequent but high-value transactions.

---

### ⭐ Customer Satisfaction (Reviews)

**Focus:** Evaluating customer experience and factors influencing satisfaction.

**Queries:**
- 1_average_review_score.sql — Measures overall customer satisfaction  
![average_review_score](assets\average_review_score.png)
- 3_review_vs_order_value.sql — Compares order value with review scores  
![review_vs_order_value](assets\review_vs_order_value.png)
- review_vs_delivery_time.sql — Analyzes the impact of delivery time on reviews  
![review_vs_delivery_time](assets\review_vs_delivery_time.png)
 
**Insight:**  
Analysis shows a strong relationship between delivery performance and customer satisfaction. Orders with lower review scores tend to have significantly longer delivery times (e.g., 1-star reviews average ~21 days vs ~11 days for 5-star reviews).

Interestingly, customers who leave 1-star reviews also have the highest average order value, suggesting that high-spending customers are more sensitive to delays. This highlights delivery performance as a critical driver of customer satisfaction, particularly among high-value customers.

---

### 🚚 Delivery Operations

**Focus:** Assessing delivery efficiency and operational performance.

**Queries:**
- 1_average_delivery_time.sql — Calculates average delivery time  

![average_delivery_time](assets\average_delivery_time.png)

- 2_late_vs_ontime_deliveries.sql — Compares late vs on-time deliveries  

![late_vs_ontime_deliveries](assets\late_vs_ontime_deliveries.png)

- 3_delivery_time_by_state.sql — Analyzes delivery time across different states  

![delivery_time_by_state](assets\delivery_time_by_state.png)

**Insight:**  
Delivery operations are generally consistent, with extreme delays (>60 days) accounting for only a small fraction (~0.3%) of total deliveries, indicating these are outliers rather than systemic issues. 

Delivery performance varies significantly across states, with average delivery times ranging from 9 days in high-performing regions (e.g., SP) to as high as 29 days in others (e.g., RR).

This indicates substantial regional disparities in logistics efficiency, with northern and more remote states experiencing significantly longer delivery times compared to more developed regions.

---

### 📈 Sales Performance

**Focus:** Understanding revenue trends and product performance.

**Queries:**
- 1_revenue_trend.sql — Analyzes revenue trends over time  

![revenue_trend](assets\revenue_trend.png)
- 2_top_categories.sql — Identifies top-performing product categories  

![top_categories](assets\top_categories.png)
- 3_average_order_value.sql — Calculates overall average order value  

![average_order_value](assets\average_order_value.png)
- 4_average_order_value_categories.sql — Compares AOV across product categories  

![average_order_value_categories](assets\average_order_value_categories.png)

**Insight:**  
Revenue growth is influenced by both order volume and category performance, with certain product categories contributing disproportionately to total revenue.

---

## 📌 Key Insights

- Revenue growth is driven by both order volume and customer spending
- Customer retention is low, with most customers making only one purchase
- High-value customers are not necessarily repeat buyers
- Delivery performance is generally stable, with few extreme delays

---
## 🧠 Overall Insights

This analysis reveals key patterns across customer behavior, sales performance, delivery operations, and customer satisfaction.

- **Low Customer Retention:**  
  Approximately 96.9% of customers are one-time buyers, indicating that the platform relies heavily on acquiring new customers rather than retaining existing ones.

- **Revenue Driven by One-Time, High-Value Purchases:**  
  High-value customers are often not repeat buyers, suggesting that revenue is largely generated from infrequent but high-spending transactions.

- **Strong Revenue Growth:**  
  The business experienced significant growth from 2017 to 2018, driven primarily by an increase in order volume rather than changes in average order value.

- **Category-Based Revenue Concentration:**  
  A small number of product categories (e.g., health & beauty, watches & gifts) contribute a large share of total revenue, while other categories operate on lower margins or niche demand.

- **Delivery Performance Impacts Satisfaction:**  
  There is a clear relationship between delivery time and review scores, with longer delivery times leading to lower customer ratings.

- **High-Value Customers Are More Sensitive to Delivery Delays:**  
  Customers who spend more tend to give lower ratings when delivery expectations are not met, making delivery performance critical for retaining valuable customers.

- **Regional Disparities in Delivery Efficiency:**  
  Delivery times vary significantly across states (9 to 29 days), indicating uneven logistics performance and potential infrastructure challenges in certain regions.

---

### 📌 Conclusion

While the platform demonstrates strong growth and revenue generation, it faces challenges in customer retention and delivery consistency. Improving logistics performance—particularly in slower regions—and implementing strategies to retain high-value customers could significantly enhance long-term business performance.

## 🚀 Future Improvements

- Build interactive dashboard (Power BI / Tableau)
- Perform RFM segmentation
- Analyze customer satisfaction using review scores

---

## 📎 How to Run This Project

1. Create a PostgreSQL database
2. Run SQL scripts in order:
   - `create_database.sql`
   - `create_tables.sql`
   - `staging_tables.sql`
   - `modify_tables.sql`
3. Run analysis queries

---

## 💡 Author

**Odimate Briggs**  
Aspiring Data Analyst

---
