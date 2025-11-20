-- Create Database
CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- Create Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0)
);

-- Create Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    sale_amount DECIMAL(10,2) CHECK (sale_amount > 0),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Insert Sample Data into Product Table
INSERT INTO Product (product_id, product_name, price) VALUES
(1, 'Laptop', 85000.00),
(2, 'Smartphone', 45000.00),
(3, 'Headphones', 5000.00),
(4, 'Keyboard', 1200.00),
(5, 'Mouse', 800.00),
(6, 'Monitor', 15000.00),
(7, 'Webcam', 3500.00);

-- Insert Sample Data into Sales Table
INSERT INTO Sales (sale_id, product_id, quantity, sale_amount) VALUES
(1, 1, 2, 170000.00),
(2, 2, 3, 135000.00),
(3, 3, 5, 25000.00),
(4, 4, 10, 12000.00),
(5, 5, 15, 12000.00),
(6, 6, 2, 30000.00),
(7, 7, 4, 14000.00);


-- Order by
SELECT * FROM Product 
ORDER BY price desc;

-- Order by with Limit
SELECT * FROM Product
ORDER BY price DESC
LIMIT 3;

-- Aggregate Functions - Total sales
 SELECT SUM(sale_amount) AS total_sales FROM Sales;
 
-- Aggregate Functions - Average price
SELECT AVG(price) average_price FROM Product;

-- Aggregate Functions - count , max & min
 SELECT COUNT(sale_amount) AS count_of_sale FROM Sales;
 SELECT MAX(sale_amount) AS max_sale FROM Sales;
 SELECT MIN(sale_amount) AS min_sale FROM Sales;
 
-- Group by - Total sales per product
SELECT product_id, SUM(sale_amount) total_sales FROM Sales
GROUP BY product_id;

-- Group by with having 
SELECT p.product_name,
s.product_id, SUM(s.sale_amount) total_amount
FROM Product p
JOIN Sales s
ON p.product_id = s.product_id
GROUP BY p.product_name,s.product_id
HAVING SUM(s.sale_amount)>50000;

-- Group by with order by
SELECT p.product_name,
s.product_id, SUM(s.sale_amount) total_amount
FROM Product p
JOIN Sales s
ON p.product_id = s.product_id
GROUP BY p.product_name,s.product_id
ORDER BY SUM(s.sale_amount) DESC;

-- Limit  with group by 
SELECT p.product_name,
s.product_id, SUM(s.sale_amount) total_amount
FROM Product p
JOIN Sales s
ON p.product_id = s.product_id
GROUP BY p.product_name,s.product_id
ORDER BY SUM(s.sale_amount) DESC
LIMIT 3;

-- Having with aggregate condition
SELECT p.product_name,
s.product_id, SUM(s.sale_amount) total_amount
FROM Product p
JOIN Sales s
ON p.product_id = s.product_id
GROUP BY p.product_name,s.product_id
HAVING SUM(s.sale_amount)>30000 AND AVG(s.sale_amount)>10000;      
