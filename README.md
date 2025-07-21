# H-E-B Curbside Database Project 📦🛒

This is a SQL-based relational database project simulating H-E-B's Curbside operations. It includes a full mock schema, synthetic data, and sample analytical queries designed to showcase database design, business operations modeling, and SQL querying skills.

## 🔧 Project Overview

This project models the operations behind H-E-B’s curbside fulfillment system, including:

- Customers placing orders
- Personal shoppers picking items
- Curbside employees delivering
- Labor tracking
- Revenue and cost calculations
- Survey feedback collection

## 🗃️ Database Tables

- `customer`: Customer details (200 rows)
- `product`: Product catalog (200+ rows with names and prices)
- `personal_shopper`: Shopper staff data (50 rows)
- `curbie`: Curbside employee data (50 rows)
- `order`: Orders placed with time, date, and associated customer
- `order_product`: Line items per order
- `order_revenue`: Captures pricing per order
- `order_personal_shopper`: Maps orders to shoppers and curbies
- `labor`: Weekly labor hours and wages
- `shopper_stats` and `curbie_stats`: Performance stats
- `customer_survey`: Ratings and feedback

## 🛠️ Technologies Used

- **MySQL** (Workbench and CLI)
- **Excel** (for data import)
- **ERD Tool** (Lucidchart or equivalent for schema design)
- **Git + GitHub** for version control
- Future expansion: R and Python for analysis

## 🧪 Sample SQL Queries

- Total revenue and profit by week
- Labor costs over time
- Survey results aggregation
- High/low performance shopper analysis
- Orders with 5-star and 1-star feedback tied to shoppers/curbies

## 📈 Future Extensions

- Use **R** to import the database and perform statistical analysis (e.g., regress labor costs on revenue).
- Use **Python** for dashboarding, automation, or anomaly detection.
- Create a lightweight Flask API to query the database.

## 📂 Folder Structure

