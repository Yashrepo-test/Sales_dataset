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

1. Total Sales
sql
 
SELECT SUM(TransactionAmount) AS TotalSales
FROM assessment_dataset;

2. Payment Methods Distribution
sql
 
SELECT PaymentMethod, COUNT(*) AS TransactionCount, SUM(TransactionAmount) AS TotalAmount
FROM assessment_dataset
GROUP BY PaymentMethod
ORDER BY TotalAmount DESC;

3. Product Categories Sales
sql
 
SELECT ProductName, COUNT(*) AS TransactionCount, SUM(TransactionAmount) AS TotalAmount
FROM assessment_dataset
GROUP BY ProductName
ORDER BY TotalAmount DESC;

4. Regional Sales
sql
 
SELECT Region, COUNT(*) AS TransactionCount, SUM(TransactionAmount) AS TotalAmount
FROM assessment_dataset
GROUP BY Region
ORDER BY TotalAmount DESC;

5. Customer Demographics
sql
 
SELECT CustomerAge, CustomerGender, COUNT(*) AS TransactionCount, SUM(TransactionAmount) AS TotalAmount
FROM assessment_dataset
GROUP BY CustomerAge, CustomerGender
ORDER BY CustomerAge, TotalAmount DESC;

6. Discount Analysis
    
sql
 
SELECT DiscountPercent, COUNT(*) AS TransactionCount, SUM(TransactionAmount) AS TotalAmount
FROM assessment_dataset
GROUP BY DiscountPercent
ORDER BY DiscountPercent DESC;

7. Return Analysis
sql
 
SELECT Returned, COUNT(*) AS TransactionCount, SUM(TransactionAmount) AS TotalAmount
FROM assessment_dataset
GROUP BY Returned;

8. Promotional Impact
sql
 
SELECT IsPromotional, COUNT(*) AS TransactionCount, AVG(TransactionAmount) AS AverageAmount
FROM assessment_dataset
GROUP BY IsPromotional;

9. High-Value Transactions
sql
 
SELECT ProductName, AVG(TransactionAmount) AS AverageAmount
FROM assessment_dataset
GROUP BY ProductName
ORDER BY AverageAmount DESC;

10. City-wise Sales
sql
 
SELECT City, COUNT(*) AS TransactionCount, SUM(TransactionAmount) AS TotalAmount
FROM assessment_dataset
GROUP BY City
ORDER BY TotalAmount DESC;

11. Store Type Analysis
sql
 
SELECT StoreType, COUNT(*) AS TransactionCount, SUM(TransactionAmount) AS TotalAmount
FROM assessment_dataset
GROUP BY StoreType
ORDER BY TotalAmount DESC;

12. Customer Loyalty Analysis
sql
 
SELECT LoyaltyPoints, COUNT(*) AS TransactionCount, SUM(TransactionAmount) AS TotalAmount
FROM assessment_dataset
GROUP BY LoyaltyPoints
ORDER BY LoyaltyPoints DESC;

13. Shipping Costs Analysis
sql
 
SELECT ProductName, AVG(ShippingCost) AS AverageShippingCost
FROM assessment_dataset
GROUP BY ProductName
ORDER BY AverageShippingCost DESC;

14. Delivery Time Analysis
sql
 
SELECT ProductName, AVG(DeliveryTimeDays) AS AverageDeliveryTime
FROM assessment_dataset
GROUP BY ProductName
ORDER BY AverageDeliveryTime DESC;
