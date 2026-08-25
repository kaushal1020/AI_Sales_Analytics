USE sales_analytics;
CREATE TABLE IF NOT EXISTS sales (
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Product VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    Unit_Price DECIMAL(12,2),
    Cost_Price DECIMAL(12,2),
    Discount DECIMAL(5,2),
    City VARCHAR(100),
    State VARCHAR(100),
    Region VARCHAR(50),
    Salesperson VARCHAR(100),
    Payment_Mode VARCHAR(30)
);
SELECT COUNT(*) AS total_rows
FROM sales;
SELECT *
FROM sales
LIMIT 5;
DESCRIBE sales;

SELECT
    Order_ID,
    Customer_Name,
    Product,
    Quantity
FROM sales;

-- STEP 1 — Create the KPI Summary
SELECT
    COUNT(*) AS total_orders,
    SUM(Quantity) AS total_units_sold,
    ROUND(SUM(Quantity * Unit_Price), 2) AS gross_sales,
    ROUND(SUM(Quantity * Cost_Price), 2) AS total_cost,
    ROUND(SUM(Quantity * (Unit_Price - Cost_Price)),2) AS total_profit,
    ROUND(
		SUM(Quantity * (Unit_Price - Cost_Price))
        / SUM(Quantity * Unit_Price) * 100,
        2
    ) AS profit_margin_percent
FROM sales;

-- STEP 2 — Monthly Sales
SELECT
    YEAR(Order_Date) AS year,
    MONTH(Order_Date) AS month,
    ROUND(SUM(Quantity * Unit_Price), 2) AS sales,
    SUM(Quantity) AS units_sold,
    COUNT(*) AS orders
FROM sales
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY year,month;
    
-- STEP 3 — Product Performance
SELECT
    Product,
    SUM(Quantity) AS units_sold,
    ROUND(SUM(Quantity * Unit_Price), 2) AS sales,
    ROUND(SUM(Quantity * (Unit_Price - Cost_Price)), 2) AS profit
FROM sales
GROUP BY Product
ORDER BY sales DESC;

-- STEP 4 — Category Performance
SELECT
    Category,
    SUM(Quantity) AS units_sold,
    ROUND(SUM(Quantity * Unit_Price), 2) AS sales,
    ROUND(SUM(Quantity * (Unit_Price - Cost_Price)), 2) AS profit
FROM sales
GROUP BY Category
ORDER BY sales DESC;
    
-- STEP 5 — Regional Performance
SELECT
    Region,
    COUNT(*) AS orders,
    SUM(Quantity) AS units_sold,
    ROUND(SUM(Quantity * Unit_Price), 2) AS sales,
    ROUND(SUM(Quantity * (Unit_Price - Cost_Price)), 2) AS profit
FROM sales
GROUP BY Region
ORDER BY sales DESC;

-- STEP 6 — Salesperson Performance
SELECT
    Salesperson,
    COUNT(*) AS orders,
    SUM(Quantity) AS units_sold,
    ROUND(SUM(Quantity * Unit_Price), 2) AS sales,
    ROUND(SUM(Quantity * (Unit_Price - Cost_Price)), 2) AS profit
FROM sales
GROUP BY Salesperson
ORDER BY sales DESC;

-- STEP 7 — Top Customers
SELECT
    Customer_ID,
    Customer_Name,
    COUNT(*) AS orders,
    SUM(Quantity) AS units_bought,
    ROUND(SUM(Quantity * Unit_Price), 2) AS sales,
    ROUND(SUM(Quantity * (Unit_Price - Cost_Price)), 2) AS profit
FROM sales
GROUP BY
    Customer_ID,
    Customer_Name
ORDER BY sales DESC
LIMIT 10;

-- STEP 8 — Payment Mode Analysis
SELECT
    Payment_Mode,
    COUNT(*) AS orders,
    SUM(Quantity) AS units_sold,
    ROUND(SUM(Quantity * Unit_Price), 2) AS sales
FROM sales
GROUP BY Payment_Mode
ORDER BY sales DESC;

-- STEP 9 — Discount Analysis

SELECT
    MIN(Discount) AS min_discount,
    MAX(Discount) AS max_discount,
    ROUND(AVG(Discount), 2) AS avg_discount
FROM sales;

-- __________________________________
-- SQL PROJECT ANALYSIS
-- ___________________________________
-- 1. CASE — Business Classification
SELECT
    Order_ID,
    Product,
    Quantity,
    Unit_Price,
    Cost_Price,
    CASE
        WHEN Unit_Price > Cost_Price THEN 'Profitable'
        WHEN Unit_Price = Cost_Price THEN 'Break Even'
        ELSE 'Loss'
    END AS profit_status
FROM sales
LIMIT 20;

-- 2. HAVING — Find High-Performing Products
SELECT
    Product,
    ROUND(SUM(Quantity * Unit_Price), 2) AS sales
FROM sales
GROUP BY Product
HAVING SUM(Quantity * Unit_Price) > 100000
ORDER BY sales DESC;

-- 3. Top 5 Products by Profit
SELECT
    Product,
    ROUND(
        SUM(Quantity * (Unit_Price - Cost_Price)),
        2
    ) AS profit
FROM sales
GROUP BY Product
ORDER BY profit DESC
LIMIT 5;

-- 4. JOIN — Connect Customer Master
SELECT
    s.Order_ID,
    s.Customer_ID,
    s.Customer_Name,
    c.Customer_Name
FROM sales s
JOIN customer_master c
    ON s.Customer_ID = c.Customer_ID
LIMIT 10;

-- 5. CTE — Advanced Analysis
WITH product_sales AS (
    SELECT
        Product,
        SUM(Quantity * Unit_Price) AS sales
    FROM sales
    GROUP BY Product
)
SELECT *
FROM product_sales
ORDER BY sales DESC;

-- 6. Window Functions
SELECT
    Product,
    SUM(Quantity * Unit_Price) AS sales,
    RANK() OVER (
        ORDER BY SUM(Quantity * Unit_Price) DESC
    ) AS sales_rank
FROM sales
GROUP BY Product;

-- _______________________________________
-- Analysis
-- _______________________________________
 
 -- Customer Revenue Analysis
 SELECT
    c.Customer_ID,
    c.Customer_Name,
    COUNT(s.Order_ID) AS total_orders,
    SUM(s.Quantity) AS total_units,
    ROUND(SUM(s.Quantity * s.Unit_Price), 2) AS total_sales,
    ROUND(
        SUM(s.Quantity * (s.Unit_Price - s.Cost_Price)),
        2
    ) AS total_profit
FROM customer_master c
JOIN sales s
    ON c.Customer_ID = s.Customer_ID
GROUP BY
    c.Customer_ID,
    c.Customer_Name
ORDER BY total_sales DESC
LIMIT 10;
  
-- Customer Ranking
WITH customer_sales AS (
    SELECT
        c.Customer_ID,
        c.Customer_Name,
        SUM(s.Quantity * s.Unit_Price) AS total_sales
    FROM customer_master c
    JOIN sales s
        ON c.Customer_ID = s.Customer_ID
    GROUP BY
        c.Customer_ID,
        c.Customer_Name
)
SELECT
    Customer_ID,
    Customer_Name,
    ROUND(total_sales, 2) AS total_sales,
    RANK() OVER (
        ORDER BY total_sales DESC
    ) AS sales_rank
FROM customer_sales
ORDER BY sales_rank;

-- Top Customer Contribution
WITH customer_sales AS (
    SELECT
        Customer_ID,
        SUM(Quantity * Unit_Price) AS total_sales
    FROM sales
    GROUP BY Customer_ID
)
SELECT
    Customer_ID,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(
        total_sales /
        SUM(total_sales) OVER () * 100,
        2
    ) AS sales_contribution_percent
FROM customer_sales
ORDER BY total_sales DESC;


