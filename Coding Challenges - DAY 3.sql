-- Create Database
CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- create Product table
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

-- order by and limit
SELECT * FROM Product
ORDER BY price DESC
LIMIT 3;

-- Aggregate functions
SELECT COUNT(*) AS total_sales_records FROM Sales;
SELECT SUM(sale_amount) AS total_sales FROM Sales;
SELECT AVG(sale_amount) AS average_sale FROM Sales;
SELECT MAX(sale_amount) AS maximum_sale FROM Sales;
SELECT MIN(sale_amount) AS minimun_sale FROM Sales;

-- Group by & having
SELECT product_id, SUM(sale_amount) AS total_sales FROM Sales
GROUP BY product_id
HAVING total_sales;

-- Rank 
SELECT product_id, product_name ,price,
RANK() OVER (ORDER BY price DESC) AS  procuct_rank
FROM Product;




