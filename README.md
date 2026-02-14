# 🦠 COVID-19 Data Analysis Using SQL

## 📌 Project Overview
This project performs data analysis on a COVID-19 dataset using SQL and MySQL.  
The goal is to analyze confirmed cases, deaths, recovery rates, and monthly growth trends.

## 🛠 Tools & Technologies
- MySQL
- SQL
- XAMPP

## 📊 Key Analysis
- Country-wise total confirmed cases
- Death rate percentage by country
- Recovery rate percentage
- Top affected countries
- Monthly growth trends using date and aggregate functions
- Country-wise monthly trends

## 🗂 Database Structure
Table: covid_data
- report_date (DATE)
- country (VARCHAR)
- confirmed (INT)
- deaths (INT)
- recovered (INT)

## 📈 Sample Query
```sql
SELECT 
    country,
    SUM(confirmed) AS total_confirmed_cases
FROM covid_data
GROUP BY country;
