/*==================================================
  SALES DATA ANALYSIS PROJECT
  ==================================================*/

/*==================================================
  DATA PREVIEW
  ==================================================*/

-- Preview first 10 records
SELECT *
FROM SALES_DATA
WHERE ROWNUM <= 10;


/*==================================================
  1. SALES PERFORMANCE ANALYSIS
  ==================================================*/

-- Total Sales Revenue
SELECT SUM(SALES) AS TOTAL_SALES
FROM SALES_DATA;

-- Total Orders
SELECT COUNT(DISTINCT ORDERNUMBER) AS TOTAL_ORDERS
FROM SALES_DATA;


/*==================================================
  2. COUNTRY SALES ANALYSIS
  ==================================================*/

-- Country Wise Sales
SELECT COUNTRY,
       SUM(SALES) AS TOTAL_SALES
FROM SALES_DATA
GROUP BY COUNTRY
ORDER BY TOTAL_SALES DESC;

/*==================================================
  3. PRODUCT PERFORMANCE ANALYSIS
  ==================================================*/

-- Product Line Performance
SELECT PRODUCTLINE,
       SUM(SALES) AS TOTAL_SALES
FROM SALES_DATA
GROUP BY PRODUCTLINE
ORDER BY TOTAL_SALES DESC;


/*==================================================
  4. TIME-BASED SALES ANALYSIS
  ==================================================*/

-- Monthly Sales Trend
SELECT MONTH_ID,
       SUM(SALES) AS TOTAL_SALES
FROM SALES_DATA
GROUP BY MONTH_ID
ORDER BY MONTH_ID DESC;

-- Yearly Sales Trend
SELECT YEAR_ID,
       SUM(SALES) AS TOTAL_SALES
FROM SALES_DATA
GROUP BY YEAR_ID
ORDER BY YEAR_ID DESC;


/*==================================================
  5. CUSTOMER ANALYSIS
  ==================================================*/

-- Top Customers by Revenue
SELECT CUSTOMERNAME,
       SUM(SALES) AS TOTAL_SALES
FROM SALES_DATA
GROUP BY CUSTOMERNAME
ORDER BY TOTAL_SALES DESC;


/*==================================================
  6. DEAL SIZE ANALYSIS
  ==================================================*/

-- Deal Size Revenue Distribution
SELECT DEALSIZE,
       SUM(SALES) AS TOTAL_SALES
FROM SALES_DATA
GROUP BY DEALSIZE
ORDER BY TOTAL_SALES DESC;


/*==================================================
  7. REGION SALES ANALYSIS
  ==================================================*/

-- Territory Wise Sales
SELECT TERRITORY,
       SUM(SALES) AS TOTAL_SALES
FROM SALES_DATA
GROUP BY TERRITORY
ORDER BY TOTAL_SALES DESC;


/*==================================================
  8. KPI METRICS
  ==================================================*/

-- Average Order Value
SELECT SUM(SALES) / COUNT(DISTINCT ORDERNUMBER) AS AVG_ORDER_VALUE
FROM SALES_DATA;

-- Total Customers
SELECT COUNT(DISTINCT CUSTOMERNAME) AS TOTAL_CUSTOMERS
FROM SALES_DATA;

-- Total Quantity Sold
SELECT SUM(QUANTITYORDERED) AS TOTAL_QUANTITY
FROM SALES_DATA;

-- Average Selling Price
SELECT AVG(PRICEEACH) AS AVG_PRICE
FROM SALES_DATA;


/*==================================================
  9. PERFORMANCE & RANKING ANALYSIS
  ==================================================*/

-- Sales by Territory and Product
SELECT TERRITORY,
       PRODUCTLINE,
       SUM(SALES) AS TOTAL_SALES
FROM SALES_DATA
GROUP BY TERRITORY, PRODUCTLINE
ORDER BY TOTAL_SALES DESC;

-- Sales Trend by Year and Month
SELECT YEAR_ID,
       MONTH_ID,
       SUM(SALES) AS TOTAL_SALES
FROM SALES_DATA
GROUP BY YEAR_ID, MONTH_ID
ORDER BY YEAR_ID, MONTH_ID;

-- Rank Countries by Sales
SELECT COUNTRY,
       SUM(SALES) AS TOTAL_SALES,
       RANK() OVER (ORDER BY SUM(SALES) DESC) AS SALES_RANK
FROM SALES_DATA
GROUP BY COUNTRY;

-- Product Sales Contribution Percentage
SELECT PRODUCTLINE,
       SUM(SALES) AS TOTAL_SALES,
       ROUND(
           (SUM(SALES) /
           (SELECT SUM(SALES) FROM SALES_DATA)) * 100, 2
       ) AS SALES_PERCENT
FROM SALES_DATA
GROUP BY PRODUCTLINE
ORDER BY TOTAL_SALES DESC;
