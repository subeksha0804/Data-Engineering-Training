USE retail_sales;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    store_id INT
);
INSERT INTO products VALUES
(1,'Laptop','Electronics',50000),
(2,'Phone','Electronics',25000);

SELECT * FROM products; 
UPDATE products
SET price = 55000
WHERE product_id = 1; 

DELETE FROM products
WHERE product_id = 2;

DELIMITER //

CREATE PROCEDURE daily_sales(IN sid INT)
BEGIN
    SELECT store_id,
           SUM(quantity) AS total_sales
    FROM sales
    WHERE store_id = sid
    GROUP BY store_id;
END //

DELIMITER ;
CALL daily_sales(1); 

CREATE INDEX idx_product
ON products(product_name);