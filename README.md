 
# 🏦 Bank Loan Analysis – Complete Data Analytics Project

## 📌 Project Title
**Bank Loan Analysis: Approval Trends, Default Risk & Loan Performance Analytics (2021-2024)**

---

## 🛠 Tools Used & Why

| Tool | Why I Used It |
|------|----------------|
| **Python (Pandas, NumPy)** | For data cleaning, handling missing values, and preprocessing loan application data |
| **Jupyter Notebook** | To write and test code interactively, visualize step-by-step results |
| **Matplotlib** | For exploratory data visualization and creating charts |
| **Power BI / Excel** | To create interactive dashboards and track KPIs for bank management |

---<img width="702" height="1600" alt="WhatsApp Image 2026-04-17 at 18 06 20" src="https://github.com/user-attachments/assets/69d690bc-b65b-448a-a5ee-9dbd56777a00" />
<img width="702" height="1600" alt="WhatsApp Image 2026-04-17 at 18 06 20 (1)" src="https://github.com/user-attachments/assets/0bc10bf5-0728-4f9e-818d-bf6841fe1393" />


## ❓ Why I Did This Project

As a data analyst, I wanted to solve real-world banking problems:

- Banks need to understand **loan approval patterns** to reduce risk
- Credit teams want to know which **employment types** get approved/rejected
- Management needs **monthly and yearly trends** for better planning
- Marketing wants **city-wise and loan purpose insights** for targeting
- Data quality issues (missing values, inconsistent formats) needed fixing before analysis

**Goal:** Provide actionable insights to improve loan approval decisions and reduce defaults.

---

## 📂 Dataset Description

- **Source:** Bank loan applications (2021-2024)
- **File:** `Clean_01 bank loan applications.csv` (4,535 rows, 17 columns, 591 KB)
- **Key Columns:** 
  - `application_id`, `applicant_name`, `applicant_age`, `gender`
  - `monthly_income`, `loan_amount_requested`, `loan_purpose`
  - `employment_type`, `credit_score`, `existing_loans_count`
  - `loan_tenure_months`, `interest_rate_pct`, `bank_name`
  - `application_date`, `approval_status`, `default_status`, `city`

---

## 🔄 Complete Workflow Pipeline

```

┌─────────────────────┐
│  Raw CSV Data       │  (4,535 rows, 17 columns, missing values)
└──────────┬──────────┘
▼
┌─────────────────────┐
│  Python Cleaning    │  → Fixed dates, filled nulls, standardized text
└──────────┬──────────┘
▼
┌─────────────────────┐
│  Python Analysis    │  → Approval rate, default analysis, loan trends
└──────────┬──────────┘
▼
┌─────────────────────┐
│  Power BI Dashboard │  → KPIs, charts, city-wise filters
└──────────┬──────────┘
▼
┌─────────────────────┐
│  Insights & Report  │  → Business recommendations
└─────────────────────┘

```

### Detailed Pipeline Steps:

| Step | Action | Tool | Why |
|------|--------|------|-----|
| 1 | Load CSV file | Pandas | Import raw loan data |
| 2 | Remove duplicates | Pandas | Ensure data integrity |
| 3 | Standardize text columns | Pandas | Convert to Title Case for consistency |
| 4 | Fix default_status values | Pandas | Replace Unknown with Yes |
| 5 | Handle missing interest_rate | Pandas | Fill with median value |
| 6 | Handle missing employment_type | Pandas | Fill with mode value |
| 7 | Handle missing existing_loans_count | Pandas | Fill with median value |
| 8 | Convert application_date | Pandas | Standardize to datetime format |
| 9 | Extract Month & Year | Pandas | For time-based analysis |
| 10 | Group by approval_status | Pandas | Find approval/rejection patterns |
| 11 | Group by month and year | Pandas | Track trends over time |
| 12 | Create visualizations | Matplotlib/Power BI | Present insights to stakeholders |

---

## 🧹 Data Cleaning Process (Python)

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

df = pd.read_csv("Clean_01 bank loan applications.csv")

# Check shape
df.shape  # (4535, 17)

# Remove duplicates
df.drop_duplicates(inplace=True)

# Standardize text columns
for col in ['city', 'approval_status', 'default_status', 'employment_type']:
    df[col] = df[col].str.title()

# Fix default_status
df['default_status'] = df['default_status'].fillna('Unknown').str.strip().str.title()
df['default_status'] = df['default_status'].str.replace('Unknown', 'Yes')

# Check missing values
df.isnull().sum().sort_values(ascending=False).head(5)

# Handle missing values
df['interest_rate_pct'] = df['interest_rate_pct'].fillna(df['interest_rate_pct'].median())
df['employment_type'] = df['employment_type'].fillna(df['employment_type'].mode()[0])
df['existing_loans_count'] = df['existing_loans_count'].fillna(df['existing_loans_count'].median())

# Convert date column
df['application_date'] = pd.to_datetime(df['application_date'], format='mixed', dayfirst=True)

# Extract Month and Year
df['Month'] = df['application_date'].dt.month_name()
df['Year'] = df['application_date'].dt.year
```

---

📊 Python Analysis – Questions I Answered

# Question Why This Matters
1 How many applications were Approved, Rejected, Pending? Understand bank's approval rate
2 What are the approval trends by Year (2021-2024)? Track performance over time
3 Which month has the most approvals? Plan marketing campaigns
4 Which employment type gets most loans? Target right customer segments
5 What is the average age of applicants? Understand customer demographics
6 Which cities have the most loan applications? Focus sales efforts
7 What loan purposes are most common? Design targeted loan products

---

📈 Key Insights Discovered

# Insight Finding
1 Total Applications 4,535 loan applications analyzed
2 Approval Trend (2021) 674 Approved, 531 Rejected, 95 Pending
3 Approval Trend (2022) 730 Approved, 493 Rejected, 74 Pending
4 Approval Trend (2023) 691 Approved, 530 Rejected, 77 Pending
5 Approval Trend (2024) 337 Approved, 266 Rejected, 37 Pending
6 Best Month for Approvals May (237 approvals), March (231), January (230)
7 Worst Month for Approvals July (168 approvals)
8 Average Applicant Age 42.5 years
9 Average Monthly Income ₹7.82 Lakhs
10 Average Loan Amount ₹8.41 Lakhs
11 Average Credit Score 636
12 Most Common Loan Purpose Car Loan, Home Loan, Personal Loan

---

⚠️ Problems I Solved

Problem Solution
Missing interest_rate_pct (365 values) Filled with median value
Missing employment_type (363 values) Filled with mode (most common type)
Missing existing_loans_count (362 values) Filled with median value
Inconsistent date formats Used pd.to_datetime() with mixed format
Inconsistent text casing Used .str.title() on all text columns
default_status had 'Unknown' values Replaced 'Unknown' with 'Yes'
Duplicate records Used drop_duplicates()

---

📁 Final Project Overview

```
Bank-Data-Analysis Repository
│
├── Clean_01 bank loan applications.csv   # Raw data (4,535 rows)
├── bank_loan.ipynb                       # Python cleaning & analysis code
├── dashboard.pbix                        # Power BI dashboard
└── README.md                             # This file
```

Key Numbers Summary:

Metric Value
Total Applications 4,535
Total Approved 2,432
Total Rejected 1,820
Total Pending 283
Overall Approval Rate ~53.6%
Average Age 42.5 years
Average Credit Score 636
Average Loan Tenure 89 months
Date Range 2021 - 2024

---

📊 Sample Python Code Used

```python
# Approval status count
df['approval_status'].value_counts()

# Year-wise approval trends
df.groupby('Year')['approval_status'].value_counts()

# Month-wise approval analysis
df.groupby('approval_status')['Month'].value_counts().sort_values(ascending=False).head(20)

# Extract month names
df['Month'] = df['application_date'].dt.month_name()

# Extract year
df['Year'] = df['application_date'].dt.year
```

---

✅ What This Project Shows About My Skills

Skill How I Demonstrated It
Data Cleaning Handled 360+ missing values, fixed dates, standardized text
Python (Pandas) Used groupby, value_counts, dt extractors, fillna
Problem Solving Fixed inconsistent date formats and text casing
Business Thinking Connected each analysis to banking decisions
Visualization Created charts for approval trends by month/year
Documentation Wrote clear README for stakeholders and recruiters

---

🚀 Business Recommendations

1. Increase approval rate – Focus on months with high approval history (May, March, January)
2. Reduce rejections – Analyze why July has lowest approvals (168 vs 237 in May)
3. Target right employment types – Salaried employees get most loans
4. City-wise marketing – Focus on Delhi, Mumbai, Chennai, Hyderabad, Pune
5. Loan purpose focus – Promote Car Loans, Home Loans, Personal Loans
6. Credit score improvement – Average credit score is 636, help customers improve to 700+

---

👨‍💻 Author

Manoj152004 – Aspiring Data Analyst
This project demonstrates end-to-end data analysis skills for banking domain.

 
