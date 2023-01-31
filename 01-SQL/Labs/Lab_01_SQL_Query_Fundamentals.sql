-- 0). First, How Many Rows are in the Products Table?

SELECT *
FROM northwind.products;

-- 1). Product Name and Unit/Quantity
SELECT id AS product_id,
       product_name
FROM northwind.products;

-- 2). Product ID and Name of Current Products

SELECT id AS product_id,
       product_name
FROM northwind.products
WHERE discontinued <> 0;

-- 3). Product ID and Name of Discontinued Products

SELECT id AS product_id,
       product_name
FROM northwind.products
WHERE discontinued = 0;

-- 4). Name & List Price of Most & Least Expensive Products

SELECT product_name,
       list_price
FROM northwind.products
WHERE list_price =
    (SELECT MIN(list_price)
     FROM northwind.products)
  OR list_price =
    (SELECT MAX(list_price)
     FROM northwind.products);

-- 5). Product ID, Name & List Price Costing Less Than $20

SELECT id AS product_id,
       product_name,
       list_price
FROM northwind.products
WHERE list_price < 20
ORDER BY list_price DESC;

-- 6). Product ID, Name & List Price Costing Between $15 and $20
SELECT id AS product_id, product_name, list_price FROM northwind.products WHERE list_price >= 15 and list_price <= 20;
-- 7). Product Name & List Price Costing Above Average List Price
SELECT product_name, list_price FROM northwind.products WHERE list_price > (SELECT AVG(list_price) FROM northwind.products);
-- 8). Product Name & List Price of 10 Most Expensive Products
SELECT product_name, list_price FROM northwind.products ORDER BY list_price DESC LIMIT 10;
-- 9). Count of Current and Discontinued Products
SELECT CASE discontinued WHEN 1 THEN 'yes' ELSE 'no' END AS is_discontinued FROM northwind.products ORDER BY discontinued;
-- 10). Product Name, Units on Order and Units in Stock
--      Where Quantity In-Stock is Less Than the Quantity On-Order.

 -- EXTRA CREDIT -----------------------------------------------------
 -- 11). Products with Supplier Company & Address Info
-- 12). Number of Products per Category With Less Than 5 Units
-- 13). Number of Products per Category Priced Less Than $20.00
