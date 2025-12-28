SELECT *
FROM neighbourhood_sales

-- Total rows of number of sales
SELECT COUNT(number_of_sales)
    FROM neighbourhood_sales
    WHERE borough IS NOT NULL;
 
-- Total Number of houses sold between 2010 and 2022

SELECT 
    SUM(number_of_sales) AS total_houses_sold
FROM neighbourhood_sales
WHERE year BETWEEN 2010 AND 2022; 

-- Total number of houses sold in each year
SELECT year, 
    SUM(number_of_sales) AS total_houses_sold
FROM neighbourhood_sales
GROUP BY year
ORDER BY total_houses_sold DESC; 

-- Percentage of number of houses sold 2010-2022
SELECT year,
    SUM(number_of_sales) AS total_sales_per_year,
    (SUM(number_of_sales) * 100.0) / (SELECT SUM(number_of_sales) FROM neighbourhood_sales) AS percentage_of_total_sales
FROM neighbourhood_sales
GROUP BY year
ORDER BY percentage_of_total_sales ASC;

-- Percentage of average total price in 2010-2022 
SELECT year,
    AVG(total_average_price) AS average_total_price,
    (AVG(total_average_price) * 100.0) / SUM(AVG(total_average_price)) OVER () AS percentage_of_total_average
FROM neighbourhood_sales
GROUP BY year
ORDER BY average_total_price DESC;

-- borough with lowest and highest number of houses sold between 2010 and 2022 respectfully
SELECT borough, 
    SUM(number_of_sales) AS total_houses_sold
FROM neighbourhood_sales
WHERE year BETWEEN 2010 AND 2022
GROUP BY borough
ORDER BY total_houses_sold ASC
LIMIT 10;

SELECT borough, 
    SUM(number_of_sales) AS total_houses_sold
FROM neighbourhood_sales
WHERE year BETWEEN 2010 AND 2022
GROUP BY borough
ORDER BY total_houses_sold DESC
LIMIT 10;

-- years with the highest and lowest houses sold and the borough and neighbourhood respectfully
SELECT year, borough, neighbourhood, 
    SUM(number_of_sales) AS total_houses_sold
FROM neighbourhood_sales
GROUP BY year, borough, neighbourhood
ORDER BY total_houses_sold DESC
LIMIT 10;

SELECT year, borough, neighbourhood, 
    SUM(number_of_sales) AS total_houses_sold
FROM neighbourhood_sales
GROUP BY year, borough, neighbourhood
ORDER BY total_houses_sold ASC
LIMIT 10;

-- Most popular type of home 
SELECT type_of_home, 
    SUM(number_of_sales) AS total_sales
FROM neighbourhood_sales
GROUP BY type_of_home
ORDER BY total_sales DESC
LIMIT 3;

-- Total average for each year
SELECT year, 
    AVG(total_average_price) AS average_price_per_year
FROM neighbourhood_sales
GROUP BY year
ORDER BY year ASC; 

-- Column with Null values 
SELECT borough, neighbourhood
FROM neighbourhood_sales
WHERE borough AND neighbourhood IS NULL;

-- Number of rows with NULL values 
SELECT COUNT(*)
FROM neighbourhood_sales
WHERE borough IS NULL

-- average highest sale price for rows with null vs non-null

SELECT 
CASE WHEN borough IS NULL THEN 'NULL' ELSE 'NOT NULL' END AS sale_price,
    AVG(average_sale_price) AS total_average
FROM neighbourhood_sales
GROUP BY sale_price;

-- count of null borough rows
SELECT 
    CASE WHEN borough IS NULL THEN 'NULL' ELSE 'NOT NULL' END AS total_null,
    COUNT(*) AS total_rows
FROM neighbourhood_sales
GROUP BY total_null;

-- percentage of rows have null vs non-null in borough
SELECT 
    CASE WHEN borough IS NULL THEN 'NULL' ELSE 'NOT NULL' END AS null_percentage,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM neighbourhood_sales) AS percentage
FROM neighbourhood_sales
GROUP BY null_percentage;

-- Total number of sales for rows with null values vs non-null values
SELECT 
    CASE WHEN borough IS NULL THEN 'NULL' ELSE 'NOT NULL' END AS total_price_status,
    SUM(number_of_sales) AS total_number_of_sales
FROM neighbourhood_sales
GROUP BY total_price_status; 
















