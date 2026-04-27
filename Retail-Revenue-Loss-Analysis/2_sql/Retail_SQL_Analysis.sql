CREATE DATABASE retail_project;
USE retail_project;
CREATE TABLE retail_data (
order_id VARCHAR(50),
order_date VARCHAR(20),
ship_date VARCHAR(20),
ship_mode VARCHAR(50),
customer_name VARCHAR(100),
segment VARCHAR(50),
state VARCHAR(50),
country VARCHAR(50),
market VARCHAR(50),
region VARCHAR(50),
product_id VARCHAR(50),
category VARCHAR(50),
sub_category VARCHAR(50),
product_name VARCHAR(255),
sales FLOAT,
quantity INT,
discount FLOAT,
profit FLOAT,
shipping_cost FLOAT,
order_priority VARCHAR(50),
year INT
);
SET GLOBAL local_infile = 1;
USE retail_project;
LOAD DATA LOCAL INFILE 'C:/Apps/SuperStoreOrders.csv'
INTO TABLE retail_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT COUNT(*) FROM retail_data;
SELECT 
ROUND(SUM(sales),2) AS total_sales,
ROUND(SUM(profit),2) AS total_profit,
ROUND(SUM(CASE WHEN profit < 0 THEN profit ELSE 0 END),2) AS total_loss
FROM retail_data;
SELECT 
CASE 
    WHEN discount >= 0.3 THEN 'High Discount'
    ELSE 'Normal Discount'
END AS discount_type,
ROUND(SUM(profit),2) AS total_profit
FROM retail_data
GROUP BY discount_type;
SELECT 
category,
ROUND(SUM(profit),2) AS total_profit
FROM retail_data
GROUP BY category;
SELECT 
region,
ROUND(SUM(profit),2) AS total_profit
FROM retail_data
GROUP BY region
ORDER BY total_profit;
SELECT 
product_name,
ROUND(SUM(profit),2) AS total_profit
FROM retail_data
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;
SELECT 
product_name,
ROUND(SUM(profit),2) AS total_profit
FROM retail_data
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;
SELECT 
state,
ROUND(SUM(profit),2) AS total_profit
FROM retail_data
GROUP BY state
ORDER BY total_profit;
SELECT 
segment,
ROUND(SUM(profit),2) AS total_profit
FROM retail_data
GROUP BY segment;
SELECT 
CASE 
    WHEN discount >= 0.3 THEN 'High Discount'
    ELSE 'Normal Discount'
END AS discount_type,
ROUND(SUM(sales),2) AS total_sales,
ROUND(SUM(profit),2) AS total_profit
FROM retail_data
GROUP BY discount_type;