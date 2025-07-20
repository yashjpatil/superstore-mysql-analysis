# superstore-mysql-analysis

# 🗃️ Superstore Sales Analysis (MySQL)

This project provides a data-driven analysis of the Superstore dataset using **MySQL queries**. It focuses on data cleaning, summarization, trend analysis, and performance insights by region, product, category, and time period.

---

## 📊 Objective

To answer key business questions like:
- What is the total sales, profit, and quantity sold?
- Which region or category is the most profitable?
- Which products are underperforming?
- What are the monthly sales trends?
- How do discounts affect profit margins?

---

## 📁 Dataset

- **Table Name**: `superstore_orders`
- **Records**: ~9994
- **Columns**: Sales, Profit, Quantity, Discount, Order Date, Region, Category, Sub-Category, Product Name, etc.
- **Source**: Sample - Superstore (Kaggle/Tableau)

---

## 🛠 Tools Used

- MySQL (tested on MySQL 8.0+)
- SQL Workbench / DBeaver / XAMPP
- SQL Functions: `SUM()`, `GROUP BY`, `ORDER BY`, `DATE_FORMAT()`, `CASE`, `ROUND()`

---

## 📈 Key Insights

- ✅ **West region** has the highest sales overall
- ✅ **Technology** is the top category by both profit and sales
- ⚠️ Found invalid rows with `Quantity <= 0` and `Sales <= 0` (data cleaning step)
- 📉 Bottom 300 products are losing money
- 📆 Peak sales observed in **November–December**
- 💸 High discounts lead to lower profit margins in some categories

---

## 🧹 Data Cleaning Queries

```sql
-- Check for null values in key fields
SELECT 
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Null_Sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Null_Profit
FROM superstore_orders;

-- Remove rows with invalid sales or quantity
SELECT * FROM superstore_orders WHERE Quantity <= 0 OR Sales <= 0;
