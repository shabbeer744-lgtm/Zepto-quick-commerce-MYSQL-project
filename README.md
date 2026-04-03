# Zepto-quick-commerce-MYSQL-project
This project contains a robust MySQL-based data focused on transforming raw transactional data into actionable insights for inventory management.it enables evaluation of key metrics such as , product performance, stock availability, revenue trends , optimize inventory operations, and improve overall business performance.

📌 Project Overview

The goal is to simulate how data analysts in the e-commerce or retail industry work behind the scenes, using SQL to extract, clean, and analyze large volumes of transactional data. The project focuses on uncovering meaningful insights, identifying trends in customer behavior and product performance, and supporting data-driven decision-making.

✅ Set up a messy, real-world e-commerce inventory database

✅ Perform Exploratory Data Analysis (EDA) to explore product categories, availability, and pricing inconsistencies

✅ Implement Data Cleaning to handle null values, remove invalid entries, and convert pricing from paise to rupees

✅ Write business-driven SQL queries to derive insights around pricing, inventory, stock availability, revenue and more.

📁 Dataset Overview

The dataset was sourced from Kaggle and was originally scraped from Zepto’s official product listings. It mimics what you’d typically encounter in a real-world e-commerce inventory system.

Each row represents a unique SKU (Stock Keeping Unit) for a product. Duplicate product names exist because the same product may appear multiple times in different package sizes, weights, discounts, or categories to improve visibility – exactly how real catalog data looks.

🧾 Columns:

* sku_id: Unique identifier for each product entry (Synthetic Primary Key)

* name: Product name as it appears on the app

* category: Product category like Fruits, Snacks, Beverages, etc.

* mrp: Maximum Retail Price (originally in paise, converted to ₹)

d* iscountPercent: Discount applied on MRP

* discountedSellingPrice: Final price after discount (also converted to ₹)
  
* availableQuantity: Units available in inventory

* weightInGms: Product weight in grams

* outOfStock: Boolean flag indicating stock availability

* quantity: Number of units per package (mixed with grams for loose produce)

**Rows handled:3732**

**🔧 Project Workflow**

Here’s a step-by-step breakdown of what i have done in this project:

**1. Database & Table Creation**
   
started by creating a SQL table with appropriate data types:
<img width="650" height="251" alt="image" src="https://github.com/user-attachments/assets/efa6f99a-d623-4ed1-bf1e-f9f81bcbf43f" />

**2.Data Import**
Loaded CSV using pgAdmin's import feature.

If you're not able to use the import feature, write this code instead:
<img width="794" height="91" alt="image" src="https://github.com/user-attachments/assets/bcf44f9b-300a-443d-a4ca-a32c573a3437" />

challenges while data import:
* Faced encoding issues (UTF-8 error), which were fixed by saving the CSV file using CSV UTF-8 format.
* During data exploration, 4 rows were identified as missing due to data formatting issues. These discrepancies were corrected, and the     cleaned data was reloaded into the concerned table in MySQL.

**3. 🔍 Data Exploration**

* Counted the total number of records in the dataset

* Viewed a sample of the dataset to understand structure and content

* Checked for null values across all columns

* Identified distinct product categories available in the dataset

* Compared in-stock vs out-of-stock product counts

* Detected products present multiple times, representing different SKUs

**4. 🧹 Data Cleaning**

* Identified and removed rows where MRP or discounted selling price was zero

* Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability

**5. 📊 Business Insights**

* Found top 10 best-value products based on discount percentage

* Identified high-MRP products that are currently out of stock

* Estimated potential revenue for each product category

* Filtered expensive products (MRP > ₹500) with minimal discount

* Ranked top 5 categories offering highest average discounts

* Calculated price per gram to identify value-for-money products

* Grouped products based on weight into Low, Medium, and Bulk categories

* Measured total inventory weight per product category

**🧠 Lessons Learned**

* Handling Data Type Mismatches during SSMS to MySQL migrations (e.g., converting BOOLEAN strings to BIT types).
* Managing Foreign Key Constraints during bulk data truncation and testing cycles.
* Optimizing CSV import workflows to handle large datasets without timeout errors.
* Identifying and resolving data quality issues such as missing or incorrectly formatted records during data exploration.

