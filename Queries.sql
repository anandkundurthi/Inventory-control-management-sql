SELECT DATABASE();
USE Inventory_control_management;
SELECT DATABASE();

SELECT *
FROM products;

SELECT product_name, category, price
FROM products;

SELECT product_name
FROM products
WHERE category = 'Electronics';


SELECT product_name
FROM products
WHERE quantity < 10;

SELECT supplier_name
FROM suppliers;

SELECT
COUNT(*)AS total_number_of_products
FROM products;

SELECT
MAX(price)AS maximum_product_price
FROM products;

SELECT
MIN(price)AS minimum_product_price
FROM products;

SELECT product_name
FROM products
ORDER BY price DESC;

SELECT 
COUNT(quantity)AS total_quantity
FROM products;


SELECT
COUNT(*)total_number_of_products,category
FROM products
GROUP BY category;


SELECT
AVG(price) AS Avg_price_products
FROM products
GROUP BY category;


SELECT category,
COUNT(*) AS total_products
FROM products
GROUP BY category
HAVING COUNT(*) > 5;


SELECT product_name
FROM products
WHERE price BETWEEN 5000 AND 20000;


SELECT
COUNT(*) AS total_stock_movements
FROM stock_movements;


SELECT
COUNT(movement_type) AS stock_in_movements
FROM stock_movements
WHERE movement_type = "IN"
GROUP BY movement_type;


SELECT
COUNT(movement_type) AS stock_out_movements
FROM stock_movements
WHERE movement_type = 'OUT'
GROUP BY movement_type;


SELECT product_name
FROM products
WHERE quantity = 0;

SELECT product_name
FROM products
ORDER BY price DESC
LIMIT 5;


SELECT supplier_name
FROM suppliers
WHERE email LIKE '%gmail%';



SELECT stock_movements.movement_type, 
products.product_name
FROM stock_movements
JOIN products ON stock_movements.product_id = products.product_id;


SELECT P.product_name,
S.movement_type, S.quantity,
S.movement_date
FROM products P
JOIN stock_movements S ON P.product_id = S.product_id;


SELECT 
SUM(S.quantity) AS total_IN_quantity
FROM stock_movements S
JOIN products P ON P.product_id = S.product_id
WHERE S.movement_type = 'IN'
GROUP BY P.product_name;

SELECT 
SUM(S.quantity) AS total_OUT_quantity
FROM stock_movements S
JOIN products P ON P.product_id = S.product_id
WHERE S.movement_type = 'OUT'
GROUP BY P.product_name;


SELECT P.product_name
FROM products P
JOIN stock_movements S ON P.product_id = S.product_id
WHERE S.movement_type NOT IN ('IN', 'OUT');


SELECT P.product_name,
SUM(CASE WHEN S.movement_type = 'OUT' THEN S.quantity ELSE 0 END) AS total_out,
SUM(CASE WHEN S.movement_type = 'IN' THEN S.quantity ELSE 0 END) AS total_in
FROM products P
JOIN stock_movements S ON P.product_id = S.product_id
GROUP BY P.product_id, P.product_name
HAVING total_out > total_in;


SELECT P.product_name,
SUM(S.movement_id) AS total_no_of_stocks
FROM products P
JOIN stock_movements S ON P.product_id = S.product_id
GROUP BY P.product_name;


SELECT P.product_name
FROM products P
JOIN stock_movements S ON P.product_id = S.product_id
WHERE P.category = 'Electronics'
GROUP BY P.product_name, P.category;


SELECT P.product_name,
COUNT(S.movement_id) AS highest_stock_movements
FROM products P
JOIN stock_movements S ON P.product_id = S.product_id
GROUP BY P.product_id, P.product_name
ORDER BY highest_stock_movements DESC
LIMIT 1;


SELECT DISTINCT
P.product_name
FROM products P
JOIN stock_movements S ON P.product_id = S.product_id
WHERE S.movement_date BETWEEN '2026-01-01' AND '2026-01-31';
