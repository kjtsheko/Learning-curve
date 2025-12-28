-- DATA INSPECTION
SELECT*
FROM neighbourhood_sales;

DESCRIBE neighbourhood_sales;

-- looking for missing values

SELECT COUNT(*) FROM neighbourhood_sales;

SELECT borough, COUNT(*) AS null_count
FROM neighbourhood_sales
WHERE borough IS NULL
GROUP BY borough;

SELECT average_sale_price, COUNT(*) AS null_count
FROM neighbourhood_sales
WHERE average_sale_price IS NULL
GROUP BY average_sale_price;

-- dealing with duplicates

SELECT COUNT(*)AS duplicate_count 
FROM neighbourhood_sales;

SELECT borough, COUNT(borough) 
FROM neighbourhood_sales 
GROUP BY borough
HAVING COUNT(borough) > 1;

SELECT borough, neighbourhood, type_of_home, average_sale_price, COUNT(*) AS duplicate_count
FROM neighbourhood_sales 
GROUP BY borough, neighbourhood, type_of_home, average_sale_price
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS total_rows, COUNT(DISTINCT borough, average_sale_price) AS unique_rows,
       COUNT(*) - COUNT(DISTINCT borough, average_sale_price) AS duplicate_rows
FROM neighbourhood_sales;

-- Removing all duplicates

CREATE TABLE clean_table AS 
SELECT DISTINCT * 
FROM neighbourhood_sales;

DROP TABLE neighbourhood_sales;

ALTER TABLE clean_table RENAME TO neighbourhood_sales;


-- CORRECTING INCONSISTANT DATA

-- find inconsistant values

SELECT DISTINCT borough 
FROM neighbourhood_sales;

-- ADD COLUMN
SELECT number_of_sales, sum(average_sale_price) AS total_average_sale_price
FROM neighbourhood_sales
GROUP BY number_of_sales
ORDER BY number_of_sales;

ALTER TABLE  neighbourhood_sales
ADD COLUMN total_average_sale_price INT;

UPDATE neighbourhood_sales
SET total_average_sale_price = number_of_sales * average_sale_price;



























 
