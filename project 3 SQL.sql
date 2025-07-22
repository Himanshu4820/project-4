create database project3;

use project3;

select * from bigbasket_products1;

-- Group by category/brand and calculate price averages

SELECT category, brand, AVG(sale_price) AS avg_price
FROM bigbasket_products1
GROUP BY category, brand;

--  Use subqueries to find top 5 expensive items in each category

SELECT *
FROM (
    SELECT *, 
           RANK() OVER (PARTITION BY category ORDER BY sale_price DESC) AS rk
    FROM bigbasket_products1
) ranked
WHERE rk <= 5;

-- Window functions for ranking or running averages (if explored)

SELECT *,
       AVG(sale_price) OVER (PARTITION BY category ORDER BY sale_price) AS running_avg
FROM bigbasket_products1;



