/*
===============================================================================
Database Exploration using MySQL
===============================================================================
Purpose:
    - To explore the structure of the database: list of tables and columns.
    - To inspect column metadata for specific tables.

Tables Used:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS
===============================================================================
*/

-- ✅ Step 1: Retrieve all tables in the current database
SELECT 
    TABLE_SCHEMA,     -- Name of the database
    TABLE_NAME,       -- Name of the table
    TABLE_TYPE        -- BASE TABLE or VIEW
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'datawarehouse'; 

-- ✅ Step 2: Get column details for dim_customers
SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'datawarehouse' 
  AND TABLE_NAME = 'dim_customers';

-- ✅ Step 3: Likewise Get column details for dim_products
SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'datawarehouse' 
  AND TABLE_NAME = 'dim_products';
  
  
-- ✅ Step 4: Likewise Get column details for fact_sales
SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'datawarehouse' 
  AND TABLE_NAME = 'fact_sales';
