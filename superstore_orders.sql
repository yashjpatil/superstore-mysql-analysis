show databases;
use superstore;

DESCRIBE superstore_orders;

SELECT 
    SUM(CASE WHEN `Sales` IS NULL THEN 1 ELSE 0 END) AS Null_Sales,
    SUM(CASE WHEN `Profit` IS NULL THEN 1 ELSE 0 END) AS Null_Profit,
    SUM(CASE WHEN `Quantity` IS NULL THEN 1 ELSE 0 END) AS Null_Quantity
FROM superstore_orders;

SELECT * FROM superstore_orders WHERE Quantity <= 0 OR Sales <= 0;


SELECT `Row ID`, COUNT(*) 
FROM superstore_orders 
GROUP BY `Row ID` 
HAVING COUNT(*) > 1;



SELECT 
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM superstore_orders;



select Region, round(sum(Sales),2) as Sales,
round(sum(Profit),2) as Profit
from superstore_orders
group by Region 
order by Sales DESC;




select
Category, `Sub-Category`,
round(sum(Sales),2) as Total_Sales
from superstore_orders
group by Category, `Sub-Category`
order by Total_Sales desc;




SELECT 
    `Product Name`, 
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore_orders
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 5;





select `Product Name`,
round(sum(Profit)) as Total_Profit
from superstore_orders
group by `Product Name`
order by Total_Profit asc
limit 300;



SELECT 
    DATE_FORMAT(`Order Date`, '%Y-%m') AS Month,
    ROUND(SUM(Sales), 2) AS Monthly_Sales
FROM superstore_orders
GROUP BY Month
ORDER BY Month;





SELECT 
    Category,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM superstore_orders
GROUP BY Category
ORDER BY Profit_Margin_Percent DESC;





SELECT 
    Category, 
    ROUND(AVG(Discount), 2) AS Avg_Discount, 
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore_orders
GROUP BY Category
ORDER BY Avg_Discount DESC;


