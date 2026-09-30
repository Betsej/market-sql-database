-- ===========================================
-- 1. CREATE AND SELECT THE DATABASE
-- ===========================================
CREATE DATABASE IF NOT EXISTS market;
use market;

-- ===========================================
-- 2. CREATE TABLES
-- ===========================================
DROP TABLE IF EXISTS Order_Items;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer (
  Customer_id INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Address VARCHAR(150),
  Postalcode VARCHAR(10),
  City VARCHAR(50),
  Country VARCHAR(50),
  Phone_Number VARCHAR(15),
  Score INT
);

CREATE TABLE Products (
  Product_id INT PRIMARY KEY,
  Product_Name VARCHAR(100),
  Price DECIMAL(10,2)
);

CREATE TABLE Suppliers (
  Supplier_id INT PRIMARY KEY,
  Supplier_Name VARCHAR(100),
  Phone VARCHAR(15)
);

CREATE TABLE Orders (
  Order_id INT PRIMARY KEY,
  Customer_id INT,
  Order_Date DATE,
  FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

CREATE TABLE Order_Items (
  Item_id INT PRIMARY KEY,
  Order_id INT,
  Product_id INT,
  Quantity INT,
  FOREIGN KEY (Order_id) REFERENCES Orders(Order_id),
  FOREIGN KEY (Product_id) REFERENCES Products(Product_id)
);

-- ===========================================
-- 3. INSERT DATA
-- ===========================================

-- INSERT INTO Customer
INSERT INTO Customer (
Customer_id, 
FirstName, 
LastName, 
Address, 
Postalcode, 
City, 
Country, 
Phone_Number, 
Score
)
VALUES 
(1, 
'Chidi', 
'Okafor', 
'15 Allen Avenue, Ikeja', 
'100271', 
'Lagos', 
'Nigeria', 
'08031234567', 
45
),
(2, 
'Amina', 
'Yusuf', 
'42 Aminu Kano Crescent, Wuse 2', 
'900288', 
'Abuja', 
'Nigeria', 
'08059876543',
 46
 );

-- Insert into Products 
INSERT INTO Products (Product_id, Product_Name, Price) 
VALUES 
(101, 'Oraimo Power Bank 20000mAh', 18500.00),
(102, 'Rechargeable Fan', 35000.00),
(103, 'HP Laptop Charger', 12500.00);

-- Insert into Suppliers
INSERT INTO Suppliers (Supplier_id, Supplier_Name, Phone) 
VALUES 
(1, 'Alaba Tech Hub Ltd', '08020001111'),
(2, 'Computer Village Distributors', '08020002222');

-- Insert into Orders
INSERT INTO Orders (Order_id, Customer_id, Order_Date) 
VALUES 
(1001, 1, '2026-09-01'),
(1002, 2, '2026-09-05');

-- Insert into Order_Items
INSERT INTO Order_Items (Item_id, Order_id, Product_id, Quantity) 
VALUES 
(1, 1001, 101, 2),
(2, 1001, 102, 1),
(3, 1002, 103, 1
);

-- ===========================================
-- 4. VERIFY THE DATA
-- ===========================================

-- view all products
select * from products;

-- view all suppliers
select * from suppliers;

-- view all orders
select * from orders;

-- view all order items
select * from order_items;

-- ===========================================
-- 5. BONUS: JOIN QUERY — ORDER TOTALS PER CUSTOMER
-- ===========================================
SELECT c.FirstName, c.LastName, o.Order_id,
       SUM(p.Price * oi.Quantity) AS Order_Total
FROM Customer c
JOIN Orders o ON c.Customer_id = o.Customer_id
JOIN Order_Items oi ON o.Order_id = oi.Order_id
JOIN Products p ON oi.Product_id = p.Product_id
GROUP BY c.FirstName, c.LastName, o.Order_id;
