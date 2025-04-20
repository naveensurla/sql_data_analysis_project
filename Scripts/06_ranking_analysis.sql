/*
===============================================================================
Ranking Analysis 
===============================================================================
Purpose:
    - To rank products and customers based on performance.
    - Identify top-performing and underperforming entities.

SQL Functions Used:
    - Window Functions: RANK(), ROW_NUMBER()
    - Clauses: GROUP BY, ORDER BY, LIMIT
===============================================================================
*/

-- Top 5 products generating the highest revenue
SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM fact_sales f
LEFT JOIN dim_products p ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;


-- Flexible ranking using window function (Top 5 products)
SELECT *
FROM (
    SELECT
        p.product_name,
        SUM(f.sales_amount) AS total_revenue,
        RANK() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_products
    FROM fact_sales f
    LEFT JOIN dim_products p ON p.product_key = f.product_key
    GROUP BY p.product_name
) ranked_products
WHERE rank_products <= 5;


-- Bottom 5 (least revenue generating) products
SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM fact_sales f
LEFT JOIN dim_products p ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue ASC
LIMIT 5;


-- Top 10 customers by revenue
SELECT
    c.customer_key,
    c.first_name,
    c.last_name,
    SUM(f.sales_amount) AS total_revenue
FROM fact_sales f
LEFT JOIN dim_customers c ON c.customer_key = f.customer_key
GROUP BY 
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_revenue DESC
LIMIT 10;


-- 3 customers with the fewest orders placed
SELECT
    c.customer_key,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT f.order_number) AS total_orders
FROM fact_sales f
LEFT JOIN dim_customers c ON c.customer_key = f.customer_key
GROUP BY 
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_orders ASC
LIMIT 3;
