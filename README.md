# Market SQL Database

A relational database project modeling a Nigerian electronics retail market — customers, products, suppliers, orders, and order line items — built in MySQL.

## Problem

A small electronics retailer needs a structured way to track customers, the products they buy, who supplies those products, and the orders placed over time — instead of scattered spreadsheets.

## What I did

- Designed a 5-table relational database: `Customer`, `Products`, `Suppliers`, `Orders`, and `Order_Items`.
- Applied primary and foreign keys to enforce one-to-many relationships (one customer → many orders; one order → many order items).
- Normalized the schema by separating order line items from order headers, avoiding repeated data.
- Wrote `CREATE TABLE` statements with appropriate data types for IDs, text, dates, and decimal prices.
- Populated the tables with `INSERT` statements using realistic Nigerian customer and pricing data (Lagos and Abuja customers, Naira pricing).
- Wrote `SELECT` queries to verify each table, and a multi-table `JOIN` query to calculate each customer's total order value.

## Entity relationships

Customer (1) ──< Orders (1) ──< Order_Items >── (1) Products
Suppliers (independent reference table)


## Key query: order totals per customer

```sql
SELECT c.FirstName, c.LastName, o.Order_id,
       SUM(p.Price * oi.Quantity) AS Order_Total
FROM Customer c
JOIN Orders o ON c.Customer_id = o.Customer_id
JOIN Order_Items oi ON o.Order_id = oi.Order_id
JOIN Products p ON oi.Product_id = p.Product_id
GROUP BY c.FirstName, c.LastName, o.Order_id;
```

## Tools

MySQL, SQL (DDL and DML), relational database design, primary/foreign keys, JOINs, aggregation.

## File

- `market_analysis.sql` — full script: database creation, table creation, data inserts, and verification/analysis queries.

## Author

**Betty Ejakpovi** — Data Analyst (Excel · SQL · Power BI)
[LinkedIn](https://www.linkedin.com/in/orherime-ejakpovi) · [Portfolio](https://claude.ai/artifact/23Vv8oDfKdk5FSzsrqq6E3)
