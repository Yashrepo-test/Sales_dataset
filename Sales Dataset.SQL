--1. Key Aggregate Insights
--Total Sales & Average Order Value

SELECT 
    SUM(TransactionAmount) AS Total_Sales,
    AVG(TransactionAmount) AS Avg_Order_Value,
    SUM(Quantity) AS Total_Quantity_Sold,
    AVG(DiscountPercent) AS Avg_Discount
FROM sales_data;

--Sales by Payment Method

SELECT PaymentMethod, COUNT(*) AS Num_Transactions, SUM(TransactionAmount) AS Total_Sales
FROM sales_data
GROUP BY PaymentMethod
ORDER BY Total_Sales DESC;

--Sales by Store Type

SELECT StoreType, COUNT(*) AS Num_Transactions, SUM(TransactionAmount) AS Total_Sales
FROM sales_data
GROUP BY StoreType;


--Regional Sales Performance


SELECT Region, SUM(TransactionAmount) AS Total_Sales, COUNT(*) AS Num_Transactions
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales DESC;


--Customer Demographics Analysis

SELECT CustomerGender, COUNT(*) AS Num_Customers, SUM(TransactionAmount) AS Total_Sales
FROM sales_data
GROUP BY CustomerGender;


--Promotional Sales Impact

SELECT 
    IsPromotional,
    SUM(TransactionAmount) AS Total_Sales,
    AVG(DiscountPercent) AS Avg_Discount
FROM sales_data
GROUP BY IsPromotional;


--2. Drill Down Insights
--High-Value Transactions (Above $50,000)
SELECT * FROM sales_data WHERE TransactionAmount > 50000 ORDER BY TransactionAmount DESC;


--Discount Impact on Sales
SELECT 
    CASE 
        WHEN DiscountPercent > 20 THEN 'High Discount'
        ELSE 'Low Discount'
    END AS Discount_Category,
    SUM(TransactionAmount) AS Total_Sales,
    COUNT(*) AS Num_Transactions
FROM sales_data
GROUP BY Discount_Category;


--Fastest & Slowest Deliveries

SELECT ProductName, City, DeliveryTimeDays 
FROM sales_data 
ORDER BY DeliveryTimeDays ASC;
