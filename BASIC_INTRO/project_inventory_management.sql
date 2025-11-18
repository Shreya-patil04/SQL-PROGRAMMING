-- INVENTORY MANAGEMENT SYSTEM

CREATE DATABASE IF NOT EXISTS inventory_db;
USE inventory_db;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    stock INT,
    price DECIMAL(10,2)
);

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- INSERT DATA
INSERT INTO products (product_name, category, stock, price) VALUES
('Keyboard', 'Electronics', 50, 550),
('Mouse', 'Electronics', 80, 300),
('Notebook', 'Stationery', 200, 40);

INSERT INTO sales (product_id, quantity, sale_date) VALUES
(1, 5, '2024-03-10'),
(2, 10, '2024-03-15'),
(3, 20, '2024-03-20');

-- REPORT: SALES + STOCK BALANCE
SELECT 
    p.product_name,
    p.category,
    p.stock,
    SUM(s.quantity) AS total_sold,
    (p.stock - SUM(s.quantity)) AS remaining_stock
FROM products p
JOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_id;
