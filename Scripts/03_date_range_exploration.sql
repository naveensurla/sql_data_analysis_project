-- ============================================================================
-- Date Range Exploration (MySQL Version)
-- ============================================================================
-- Purpose:
--   - Determine the earliest and latest dates in the dataset.
--   - Explore customer age range.
--   - Use MySQL date functions for insights.
-- ============================================================================

-- First and last order date, and range in months
SELECT 
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    TIMESTAMPDIFF(MONTH, MIN(order_date), MAX(order_date)) AS order_range_months
FROM fact_sales;

-- Oldest and youngest customer birthdates, with age calculation
SELECT
    MIN(birthdate) AS oldest_birthdate,
    TIMESTAMPDIFF(YEAR, MIN(birthdate), CURDATE()) AS oldest_age,
    MAX(birthdate) AS youngest_birthdate,
    TIMESTAMPDIFF(YEAR, MAX(birthdate), CURDATE()) AS youngest_age
FROM dim_customers;
