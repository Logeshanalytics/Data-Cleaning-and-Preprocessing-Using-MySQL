# 📊 Data Cleaning and Preprocessing Using MySQL

## 📌 Project Overview
This project focuses on cleaning and transforming a large raw dataset containing 1,000+ columns using **MySQL**.  
The dataset included duplicate records, inconsistent formatting, missing values, and unnecessary columns.  

The goal was to convert messy raw data into a clean, structured, and analysis-ready dataset.

---

## 🛠️ Tools & Technologies
- MySQL  
- SQL (Window Functions, CTEs, String Functions)  

---

## 🔎 Data Cleaning Steps

### 1️⃣ Removing Duplicates
✅ Used the `ROW_NUMBER()` window function to identify duplicate records.  
✅ Applied Common Table Expressions (CTE) to filter and remove duplicates.  
✅ Created a staging table to maintain cleaned data separately.

### 2️⃣ Standardizing Data
✅ Applied string functions such as `TRIM()`, `LOWER()`, `UPPER()`, and `DISTINCT`.  
✅ Converted text-based date columns into proper `DATE` format using `STR_TO_DATE()`.  
✅ Modified column data types using the `ALTER` statement.

### 3️⃣ Handling NULL and Blank Values
✅ Identified missing and blank values in the dataset.  
✅ Applied logical conditions and calculations to fill values where possible.  
✅ Marked records requiring additional information for accurate completion.

### 4️⃣ Removing Unnecessary Columns
✅ Dropped irrelevant columns to improve dataset structure.  
✅ Ensured the final dataset is clean, organized, and ready for analysis.

---

## 🎯 Project Outcome
- Improved overall data quality.  
- Transformed raw, unstructured data into a structured and reliable dataset.  
- Strengthened practical SQL skills in real-world data preprocessing and cleaning.

---

## 📂 How to Use
1. Import the raw dataset into MySQL.  
2. Run the SQL scripts provided in this repository step-by-step.  
3. Access the final cleaned dataset from the staging table.

---

## 🚀 Skills Demonstrated
- Data Cleaning  
- Data Preprocessing  
- SQL Window Functions  
- Common Table Expressions (CTE)  
- Data Transformation  
- Database Management

---

## 🙏 Regards
Thank you for visiting my repository! I hope this project is helpful and showcases practical SQL data cleaning techniques.  
Feel free to connect or reach out for any questions or collaborations.

📬 Contact
Logesh P
🔗 LinkedIn: Logesh Purushoth
mail:log6379@gmail.com
