# 🛒 E-Commerce Performance Review  
**Olist — Sales & Marketing Insights Report**
![E-Commerce Dashboard](assets/dashboard.png)

### Key Metrics:
- **Revenue:** R$ 15.84M  
- **Orders:** 99K  
- **Customers:** 99K  
- **Average Order Value:** R$ 159.27  
- **Avg Delivery Time:** 12 days  

### What This Dashboard Enables:
- Track revenue trends over time  
- Identify top-performing product categories  
- Monitor customer retention  
- Evaluate delivery performance and its impact on satisfaction  
- Compare regional logistics efficiency  


---

## 📌 Executive Summary

This analysis was conducted to evaluate **revenue growth, customer behavior, and delivery performance**, with the goal of identifying opportunities to improve **customer retention, revenue efficiency, and overall customer experience**.

### Key Findings:
- **Customer retention is critically low** — ~97% of customers purchase only once  
- **Revenue is driven by one-time, high-value purchases**, not repeat customers  
- **Delivery delays significantly reduce customer satisfaction**, especially among high spenders  
- **Performance varies widely by region**, impacting customer experience  

### Business Implication:
The business is currently optimized for **acquisition, not retention** — which is costly and unsustainable long term.

---

## 🎯 Business Questions

This analysis focuses on answering key questions relevant to the **Marketing and Sales teams**:

1. How is revenue evolving over time?  
2. Which products and categories drive the most revenue?  
3. Are customers coming back after their first purchase?  
4. What drives customer satisfaction (and dissatisfaction)?  
5. How does delivery performance impact business outcomes?  

---

## 👥 Customer Behaviour — Are We Retaining Customers?

### What We Found:
- **96.9% of customers are one-time buyers**
- Only **3.1% return for a second purchase**

### What This Means:
- The business is heavily dependent on **constant customer acquisition**
- Marketing spend is likely inefficient due to **low lifetime value (LTV)**

### Key Insight:
Even **high-value customers are not returning**, meaning:  
> We are generating revenue, but not building relationships.

### Recommendation:
- Introduce **retention strategies**:
  - Email remarketing campaigns  
  - First-to-second purchase incentives  
  - Loyalty or discount programs  
- Segment and target **high-value first-time buyers immediately after purchase**

---

## ⭐ Customer Satisfaction — What’s Driving Reviews?

### What We Found:
- Customers who give **1-star reviews experience ~2x longer delivery times**
- **High-spending customers give the lowest ratings when delivery is delayed**

### What This Means:
- Customer satisfaction is **not primarily driven by price or product**
- It is strongly tied to **delivery experience**

### Key Insight:
> The customers generating the most revenue are also the most sensitive to poor delivery.

### Recommendation:
- Prioritize **fast and reliable delivery for high-value orders**
- Set accurate delivery expectations at checkout  
- Proactively communicate delays to customers  

---

## 🚚 Delivery Operations — Where Are We Losing Customers?

### What We Found:
- Most deliveries are within a reasonable timeframe  
- However, delivery time varies significantly by region:
  - Fast regions: ~9 days  
  - Slow regions: up to ~29 days  

### What This Means:
- Logistics performance is **inconsistent**
- Customers in slower regions are more likely to churn or leave poor reviews  

### Key Insight:
> Delivery inconsistency — not just delays — is hurting the customer experience.

### Recommendation:
- Optimize logistics in **underperforming regions**
- Consider:
  - Regional warehouse strategy  
  - Better carrier allocation  
- Adjust **marketing expectations by region** (don’t promise what you can’t deliver)

---

## 📈 Sales Performance — What’s Driving Revenue?

### What We Found:
- Revenue growth is primarily driven by **increased order volume**
- A small number of product categories generate **disproportionate revenue**
- Average order value varies significantly across categories  

### What This Means:
- Growth is coming from **more customers**, not better monetization  
- Some categories are significantly more valuable than others  

### Key Insight:
> Not all products contribute equally — focus should be on high-performing categories.

### Recommendation:
- Double down on **top-performing categories** in marketing campaigns  
- Bundle or upsell within high AOV categories  
- Re-evaluate low-performing categories  

---

## 🧠 Final Business Takeaways

- The company has strong **top-line growth**, but weak **customer retention**
- **Delivery performance is a key driver of both retention and satisfaction**
- **High-value customers are at risk** due to poor delivery experiences
- Revenue is currently **transactional, not relationship-driven**

---

## 🚀 Strategic Next Steps

If we were to act on this analysis immediately:

1. **Retention First Strategy**
   - Shift part of marketing budget from acquisition → retention  

2. **Delivery Optimization**
   - Focus on consistency, not just speed  
   - Prioritize high-value customers  

3. **Customer Segmentation**
   - Identify and target:
     - High-value customers  
     - At-risk customers (bad delivery experience)  

4. **Category Focus**
   - Scale what’s already working  
   - Reduce investment in low-performing segments  

---

## ⚙️ Technical Appendix (For Data Teams)

### Dataset
- Source: [Brazilian E-Commerce Public Dataset (Olist)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- ~100,000 orders
- Includes customers, orders, products, payments, and delivery data

### Tools & Technologies
- SQL (PostgreSQL)
- Data Modeling (Relational Schema)
- Git & GitHub
- Power Bi

### Data Model
- Fact Table: `olist_order_fact`
- Dimension Tables: `olist_customers`, `olist_products`, `olist_sellers`
- Bridge Table: `olist_order_items`
- Supporting Tables: reviews, locations, category translation

![Entity Relationship Diagram](assets/ERD.png)

### Data Pipeline
1. Raw data ingestion (CSV → staging tables)  
2. Data cleaning (missing values, inconsistencies)  
3. Data transformation (final analytical tables)  

### How to Run
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
Data Analyst | Turning Data into Business Decisions