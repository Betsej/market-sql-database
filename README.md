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
