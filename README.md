 # Sales_dataset
Key Insights from the Dataset
Aggregate Insights:
Total Sales: The total transaction amount across all transactions is substantial, indicating a high volume of sales.

Payment Methods: The most common payment methods are Debit Card, Credit Card, and UPI, with Cash also being a significant method.

Product Categories: The most sold products are T-Shirts, Notebooks, and Sofas, with Laptops also being a popular high-value item.

Regional Sales: The North and West regions have the highest sales volumes, followed by the South and East regions.

Customer Demographics: The dataset includes a diverse range of customer ages and genders, with a significant number of transactions from customers aged between 30-60 years.

Discounts: A significant number of transactions have discounts applied, with some discounts being as high as 49%.

Returns: A notable percentage of transactions are marked as returned, indicating potential issues with product quality or customer satisfaction.

Promotional Impact: Transactions marked as promotional have a higher average transaction amount, suggesting that promotions drive higher sales.

Drill-Down Insights:
High-Value Transactions: Transactions involving Sofas and Laptops have the highest average transaction amounts, indicating these are high-value items.

City-wise Sales: Cities like Mumbai, Delhi, and Bangalore have the highest sales volumes, likely due to higher population and economic activity.

Store Type: Online stores have a higher number of transactions compared to in-store purchases, reflecting the growing trend of e-commerce.

Customer Loyalty: Customers with higher loyalty points tend to make more frequent and higher-value purchases.

Shipping Costs: Higher shipping costs are associated with larger and more expensive items like Sofas and Laptops.

Delivery Time: Products with longer delivery times tend to have higher transaction amounts, possibly due to the nature of the products (e.g., custom-made or imported items).

SQL Scripts for Data Exploration
Below are some SQL scripts that can be used to explore the dataset and generate the metrics mentioned above. You can share these scripts via a GitHub link.

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
