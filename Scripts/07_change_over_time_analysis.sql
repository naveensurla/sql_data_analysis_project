/*
===============================================================================
Change Over Time Analysis 
===============================================================================
Purpose:
    - Track trends, growth, and changes in key metrics over time.
    - Time-series analysis and identifying seasonality.
    - Measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: YEAR(), MONTH(), DATE_FORMAT(), DATE()
    - Aggregate Functions: SUM(), COUNT()
===============================================================================
*/

-- 1. Analyze sales performance by Year & Month (numerical)
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);


-- 2. Group by Month (formatted for better readability)
SELECT
    DATE_FORMAT(order_date, '%Y-%b') AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATE_FORMAT(order_date, '%Y-%b')
ORDER BY STR_TO_DATE(DATE_FORMAT(order_date, '%Y-%m-01'), '%Y-%m-%d');


-- 3. Monthly grouping using DATE() to remove time part
SELECT
    DATE_FORMAT(DATE(order_date), '%Y-%m-01') AS month_start_date,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATE_FORMAT(DATE(order_date), '%Y-%m-01')
ORDER BY month_start_date;

