-- COVID-19 DATA ANALYSIS USING SQL
-- Author: Soni Govindu
-- Database: MySQL
-- ============================================

-- 1. Create Database
CREATE DATABASE covid_analysis;
USE covid_analysis;

-- ============================================
-- 2. Create Table
-- ============================================
CREATE TABLE covid_data (
    report_date DATE,
    country VARCHAR(100),
    confirmed INT,
    deaths INT,
    recovered INT
);

-- ============================================
-- 3. Insert Sample Data
-- ============================================
INSERT INTO covid_data VALUES
('2020-01-01','India',0,0,0),
('2020-02-01','India',3,0,0),
('2020-03-01','India',1500,50,100),
('2020-04-01','India',35000,1200,5000),

('2020-01-01','USA',10,0,0),
('2020-02-01','USA',500,10,20),
('2020-03-01','USA',100000,2000,8000),
('2020-04-01','USA',500000,18000,70000),

('2020-01-01','Italy',50,1,0),
('2020-02-01','Italy',1200,30,50),
('2020-03-01','Italy',90000,10000,15000),
('2020-04-01','Italy',200000,25000,50000);

-- ============================================
-- 4. Total Confirmed Cases by Country
-- ============================================
SELECT 
    country,
    SUM(confirmed) AS total_confirmed_cases
FROM covid_data
GROUP BY country;

-- ============================================
-- 5. Death Rate Percentage by Country
-- ============================================
SELECT 
    country,
    ROUND((SUM(deaths) / SUM(confirmed)) * 100, 2) AS death_rate_percentage
FROM covid_data
GROUP BY country;

-- ============================================
-- 6. Recovery Rate Percentage by Country
-- ============================================
SELECT 
    country,
    ROUND((SUM(recovered) / SUM(confirmed)) * 100, 2) AS recovery_rate
FROM covid_data
GROUP BY country;

-- ============================================
-- 7. Top Affected Countries
-- ============================================
SELECT 
    country,
    SUM(confirmed) AS total_cases
FROM covid_data
GROUP BY country
ORDER BY total_cases DESC;

-- ============================================
-- 8. Monthly Growth Trends (Overall)
-- ============================================
SELECT 
    YEAR(report_date) AS year,
    MONTH(report_date) AS month,
    SUM(confirmed) AS monthly_confirmed_cases
FROM covid_data
GROUP BY YEAR(report_date), MONTH(report_date)
ORDER BY year, month;

-- ============================================
-- 9. Country-wise Monthly Growth Trends
-- ============================================
SELECT 
    country,
    YEAR(report_date) AS year,
    MONTH(report_date) AS month,
    SUM(confirmed) AS confirmed_cases
FROM covid_data
GROUP BY country, YEAR(report_date), MONTH(report_date)
ORDER BY country, year, month;

-- ============================================
-- END OF FILE
-- ============================================
