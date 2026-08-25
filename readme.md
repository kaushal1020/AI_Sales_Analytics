# 📊 AI-Powered Sales Analytics

An end-to-end Sales Analytics and AI project that transforms deliberately dirty sales data into actionable business insights using **Python, Pandas, NumPy, MySQL, Matplotlib, Seaborn, Excel, and the Gemini API**.

The project demonstrates a complete real-world data analytics workflow — from **data quality investigation and cleaning** to **SQL-based analysis, Python analytics, visualization, business insights, and AI-powered natural-language analysis**.

---

## 🚀 Project Overview

Businesses generate large amounts of sales data, but raw business data is rarely clean.

Sales datasets can contain:

- Missing values
- Duplicate transactions
- Incorrect data types
- Inconsistent text
- Invalid numerical values
- Incorrect dates
- Currency symbols inside numerical columns
- Extreme values and outliers
- Invalid discounts
- Incorrect customer information

This project simulates that real-world situation using a deliberately dirty sales dataset.

The objective was to build a complete analytics pipeline capable of:

1. Profiling the raw dataset
2. Identifying data-quality problems
3. Cleaning and validating the data
4. Creating a reliable analytical dataset
5. Storing the cleaned data in MySQL
6. Performing SQL-based business analysis
7. Performing advanced analysis using Python
8. Calculating important sales KPIs
9. Creating business-focused visualizations
10. Generating business insights
11. Integrating Gemini AI
12. Building a local AI Sales Analyst
13. Making the entire project reproducible and portfolio-ready

The complete project runs locally using **Jupyter Notebook and Python**.

No website, web application, mobile application, Power BI, or Tableau dashboard is required.

---

# 🎯 Project Objectives

The major objectives of this project are:

- Perform complete data profiling
- Detect and fix data-quality problems
- Maintain data integrity
- Remove duplicate transactions
- Handle missing values intelligently
- Validate customer information
- Standardize inconsistent text
- Detect invalid numerical values
- Investigate outliers
- Store cleaned data in MySQL
- Perform SQL business analysis
- Perform Python-based exploratory and business analysis
- Calculate revenue, cost, profit, and margin
- Analyze products, customers, regions, categories, and salespeople
- Analyze monthly sales performance
- Analyze the impact of discounts
- Create meaningful visualizations
- Generate AI-powered business interpretations
- Build a reusable local AI Sales Analyst workflow
- Document the entire project for GitHub and portfolio purposes

---

# 🏗️ Project Architecture

The project follows this analytical pipeline:

```text
                    DIRTY SALES DATA
                           │
                           ▼
                 ┌───────────────────┐
                 │  Data Profiling   │
                 └─────────┬─────────┘
                           │
                           ▼
                 ┌───────────────────┐
                 │ Data Quality Check│
                 └─────────┬─────────┘
                           │
            ┌──────────────┼──────────────┐
            ▼              ▼              ▼
       Missing Data   Duplicate Data   Invalid Data
            │              │              │
            └──────────────┼──────────────┘
                           ▼
                 ┌───────────────────┐
                 │   Data Cleaning   │
                 └─────────┬─────────┘
                           │
                           ▼
                 ┌───────────────────┐
                 │ Clean Sales Data  │
                 └─────────┬─────────┘
                           │
              ┌────────────┴────────────┐
              ▼                         ▼
        ┌───────────┐             ┌───────────┐
        │   MySQL   │             │  Python   │
        │  Analysis │             │ Analytics │
        └─────┬─────┘             └─────┬─────┘
              │                         │
              └────────────┬────────────┘
                           ▼
                 ┌───────────────────┐
                 │ Business Analysis │
                 └─────────┬─────────┘
                           │
                           ▼
                 ┌───────────────────┐
                 │ Matplotlib +      │
                 │ Seaborn Charts    │
                 └─────────┬─────────┘
                           │
                           ▼
                 ┌───────────────────┐
                 │ Business Insights │
                 └─────────┬─────────┘
                           │
                           ▼
                 ┌───────────────────┐
                 │    Gemini API     │
                 └─────────┬─────────┘
                           │
                           ▼
                 ┌───────────────────┐
                 │  AI Sales Analyst │
                 └───────────────────┘
```

---

# 📁 Project Structure

```text
AI_Sales_Analytics/
│
├── data/
│   ├── dirty_sales_data.csv
│   ├── customer_master_final.csv
│   ├── clean_sales_data.csv
│   ├── sales_data.csv
│   ├── sales_data.xlsx
│   ├── business_summary.json
│   └── ai_analysis_data.json
│
├── excel/
│   └── dirty_sales_data.xlsx
│
├── mysql/
│   └── sales_analysis.sql
│
├── notebooks/
│   ├── 01_data_profiling_cleaning.ipynb
│   ├── 02_python_sales_analysis.ipynb
│   └── 03_ai_sales_analyst.ipynb
│
├── charts/
│   ├── category_revenue.png
│   ├── discount_profit.png
│   ├── monthly_net_revenue.png
│   ├── monthly_profit.png
│   ├── payment_mode_revenue.png
│   ├── regional_revenue.png
│   ├── salesperson_revenue.png
│   ├── top_10_customers.png
│   └── top_10_products_revenue.png
│
├── python/
│   └── reusable scripts
│
├── .gitignore
├── README.md
└── requirements.txt
```

---

# 🧹 Phase 1 — Data Profiling and Cleaning

The project started with a deliberately dirty dataset containing approximately:

```text
5,030 rows
15 columns
```

The original columns were:

```text
Order_ID
Order_Date
Customer_ID
Customer_Name
Product
Category
Quantity
Unit_Price
Cost_Price
Discount
City
State
Region
Salesperson
Payment_Mode
```

The dataset intentionally contained multiple real-world data-quality problems.

---

## 🔎 Data Quality Problems Identified

### Missing Customer Names

Some `Customer_Name` values were missing.

Instead of randomly filling these values, the customer master dataset was used.

The relationship:

```text
Customer_ID → Customer_Name
```

was used to recover and validate customer information.

---

### Missing Quantity

There were:

```text
64 missing Quantity values
```

The missing quantities were investigated and filled using the **median quantity for the corresponding product**.

This was preferred over using a single global median because different products can have different typical order quantities.

---

### Missing Payment Mode

There were:

```text
30 missing Payment_Mode values
```

Customer payment history was investigated.

The missing values were filled using the customer's most common historical payment mode.

This approach uses customer behavior rather than arbitrary replacement.

---

### Duplicate Transactions

The original dataset contained duplicate transactions.

Duplicate transactions were identified and removed.

Dataset size changed from:

```text
5,030 rows
```

to:

```text
5,000 rows
```

---

### Invalid Quantities

The dataset contained invalid quantity values, including negative quantities.

An extreme quantity of:

```text
999
```

was also identified as an intentionally extreme value.

Invalid quantities were handled during the cleaning process.

---

### Unit Price Cleaning

Some `Unit_Price` values contained currency symbols or text.

For example:

```text
₹55,000
```

was converted into:

```text
55000
```

The resulting column was converted into a numerical format.

Price outliers were investigated using the **Interquartile Range (IQR)** method.

However, legitimate high-value products were not automatically deleted.

A business rule was also checked:

```text
Unit_Price >= Cost_Price
```

No violations were found.

---

### Invalid Discounts

Invalid discount values such as:

```text
150
```

were identified.

Since a discount percentage above 100% is invalid, such values were converted into missing values.

The remaining missing discount values were filled using the median discount for the corresponding product.

---

### Date Standardization

The dataset contained mixed date formats.

The `Order_Date` column was converted into a consistent datetime format.

This allowed the dataset to be used reliably for:

- Monthly analysis
- Time-series analysis
- Trend analysis
- Date-based aggregation

---

### Text Standardization

Text columns were standardized to remove inconsistent spacing and capitalization.

The following fields were standardized:

```text
Customer_Name
Product
Category
City
State
Region
Salesperson
```

Payment modes were handled separately to preserve values such as:

```text
UPI
```

rather than incorrectly converting them to:

```text
Upi
```

---

# ✅ Final Data Validation

After cleaning, the final analytical dataset contains:

```text
5,000 rows
15 columns
```

Validation checks included:

```text
Missing values              → 0
Duplicate rows              → 0
Invalid quantities          → 0
Invalid discounts           → 0
Invalid Customer_IDs        → 0
Unit_Price < Cost_Price     → 0
```

The final dataset is stored as:

```text
data/clean_sales_data.csv
```

---

# 🗄️ Phase 2 — MySQL Database

The cleaned dataset was imported into MySQL for structured database analysis.

MySQL was used to demonstrate how a data analyst can move beyond notebook-based analysis and work with relational databases.

The SQL phase includes:

- Database creation
- Table creation
- Data import
- Data validation
- Filtering
- Sorting
- Aggregation
- Grouping
- CASE statements
- JOIN operations
- Customer master analysis
- CTEs
- Window functions
- Business analysis queries

The SQL queries are stored in:

```text
mysql/sales_analysis.sql
```

---

# 🐍 Phase 3 — Python Sales Analytics

Python was used for detailed analytical processing.

The primary libraries used were:

```text
Pandas
NumPy
Matplotlib
Seaborn
```

Python was used to calculate:

- Total orders
- Total units sold
- Gross revenue
- Net revenue
- Total cost
- Profit
- Profit margin
- Average order value
- Monthly performance
- Product performance
- Category performance
- Regional performance
- Customer performance
- Salesperson performance
- Discount impact

---

# 📊 Key Business KPIs

The final analysis produced the following high-level metrics:

| KPI | Value |
|---|---:|
| Total Orders | 5,000 |
| Total Units Sold | 20,103 |
| Gross Revenue | ₹296,176,220 |
| Net Revenue | ₹267,607,482.50 |
| Total Cost | ₹229,533,135 |
| Net Profit | ₹38,074,347.50 |
| Net Profit Margin | 14.23% |
| Average Net Order Value | ₹53,521.50 |

> Values are based on the cleaned dataset and the business calculations implemented in the project.

---

# 📅 Monthly Sales Analysis

Monthly aggregation was performed to understand:

- Number of orders
- Units sold
- Gross revenue
- Net revenue
- Profit

The analysis identified:

### Best Month

```text
April 2026
```

with approximately:

```text
Orders:          636
Units Sold:      2,588
Gross Revenue:   ₹40.80M
Net Revenue:     ₹36.99M
Profit:          ₹5.10M
```

### Important Data Observation

The dataset also contains months with very low transaction volume.

These periods should be interpreted carefully because low-volume periods can distort comparisons.

---

# 💻 Product Performance

Product-level analysis was performed using:

- Orders
- Units sold
- Gross revenue
- Net revenue
- Profit
- Profit margin

The analysis identified:

```text
Top revenue product:
Laptop
```

Laptop generated approximately:

```text
Gross Revenue: ₹123.27M
Net Revenue:   ₹111.68M
Profit:        ₹10.99M
```

This makes laptops a major revenue contributor in the dataset.

---

# 🏷️ Category Analysis

Category performance was analyzed using revenue and profitability metrics.

The strongest category identified by the analysis was:

```text
Electronics
```

This indicates that electronics products represent a major contributor to overall business performance.

---

# 🌎 Regional Analysis

Sales were analyzed across different regions.

The analysis identified:

```text
Best Region:
North
```

Regional analysis can help management understand:

- Where demand is strongest
- Which regions generate more revenue
- Where additional sales efforts may be required
- Whether sales performance is geographically concentrated

---

# 👥 Customer Analysis

Customer-level analysis was performed to identify high-value customers.

The analysis identified:

```text
Best Customer:
Rohan Saxena
```

Customer analysis can be used to identify:

- High-value customers
- Repeat customers
- Revenue concentration
- Customer retention opportunities
- Potential loyalty-program candidates

---

# 👨‍💼 Salesperson Analysis

Salesperson performance was analyzed using revenue and profit metrics.

The analysis identified:

```text
Best Salesperson:
Priya
```

Salesperson performance analysis can support:

- Performance benchmarking
- Sales coaching
- Incentive planning
- Best-practice sharing
- Team performance evaluation

---

# 💰 Discount Analysis

Discounts were analyzed to understand their relationship with profitability.

The dataset contains discount values ranging from:

```text
0% → 20%
```

The project investigates whether increasing discounts are associated with:

- Higher sales
- Lower margins
- Higher order volume
- Reduced profitability

The goal is not simply to maximize sales, but to understand the balance between **revenue growth and profitability**.

---

# 📈 Data Visualization

The project uses both:

### Matplotlib

for flexible chart creation and customization.

### Seaborn

for statistical and business-oriented visualizations.

Generated charts include:

```text
Category Revenue
Discount vs Profit
Monthly Net Revenue
Monthly Profit
Payment Mode Revenue
Regional Revenue
Salesperson Revenue
Top 10 Customers
Top 10 Products
```

Charts are stored in:

```text
charts/
```

These visualizations make it easier to communicate analytical findings to non-technical stakeholders.

---

# 🤖 Phase 4 — AI Sales Analyst

One of the main objectives of this project was to combine traditional data analytics with Generative AI.

The project integrates the **Gemini API** with Python.

The AI does not independently calculate the raw business metrics.

Instead, Python performs the numerical analysis first.

The calculated results are then provided to the AI model for interpretation.

The workflow is:

```text
Raw Data
   ↓
Python Analysis
   ↓
Verified KPIs
   ↓
Business Summary
   ↓
Gemini API
   ↓
AI Interpretation
   ↓
Business Recommendations
```

This approach helps separate:

```text
Numerical calculation
```

from:

```text
Natural-language interpretation
```

---

# 🧠 AI Sales Analyst Capabilities

The AI Sales Analyst can answer business questions such as:

```text
Which product is most profitable?

Which region performs best?

Who is our best customer?

Which salesperson performs best?

Which month had the highest profit?

Are discounts hurting profitability?

Why is the profit margin low?

What are the biggest business risks?

What opportunities should management focus on?
```

The AI receives actual calculated business results rather than being asked to guess from raw data.

---

# 💡 AI-Generated Business Insights

The AI analysis identified several important business themes.

### 1. Strong Overall Business Scale

The business generated approximately:

```text
₹296.18M Gross Revenue
₹267.61M Net Revenue
₹38.07M Net Profit
```

This demonstrates substantial sales volume and positive profitability.

---

### 2. Laptop Dominance

Laptops were identified as the strongest product by revenue and profit.

This makes laptops an important product category for:

- Inventory planning
- Pricing strategy
- Cross-selling
- Upselling
- Promotional campaigns

---

### 3. Profitability Opportunity

The overall net profit margin is approximately:

```text
14.23%
```

However, product-level margins can vary significantly.

This means management should avoid evaluating products purely on revenue.

A product with high revenue but low margin may require:

- Pricing optimization
- Cost reduction
- Discount optimization
- Supplier negotiation

---

### 4. Salesperson Best Practices

Since Priya was identified as the strongest salesperson, her sales strategies can potentially be studied and shared with the wider sales team.

---

### 5. Customer Opportunity

High-value customers such as Rohan Saxena represent potential opportunities for:

- Retention programs
- Personalized offers
- Cross-selling
- Premium services
- Loyalty programs

---

# 🔐 API Security

The Gemini API key is **not intended to be stored directly inside the source code**.

Environment variables are used to protect API credentials.

Sensitive files such as:

```text
.env
```

are excluded using:

```text
.gitignore
```

This prevents API credentials from accidentally being committed to GitHub.

---

# 📓 Jupyter Notebooks

## 01 — Data Profiling & Cleaning

```text
notebooks/01_data_profiling_cleaning.ipynb
```

This notebook contains:

- Dataset inspection
- Data profiling
- Missing-value analysis
- Duplicate detection
- Data-type validation
- Invalid-value detection
- Outlier investigation
- Text standardization
- Customer validation
- Final cleaning
- Data-quality validation

---

## 02 — Python Sales Analysis

```text
notebooks/02_python_sales_analysis.ipynb
```

This notebook contains:

- Dataset loading
- KPI calculations
- Revenue analysis
- Cost analysis
- Profit analysis
- Profit margin
- Monthly analysis
- Product analysis
- Category analysis
- Customer analysis
- Regional analysis
- Salesperson analysis
- Discount analysis
- Matplotlib visualizations
- Seaborn visualizations
- Business summary generation

---

## 03 — AI Sales Analyst

```text
notebooks/03_ai_sales_analyst.ipynb
```

This notebook contains:

- Gemini API setup
- Business summary loading
- AI prompt engineering
- Business analysis
- AI-generated insights
- AI-generated recommendations
- Natural-language business questions
- AI Sales Analyst functionality

---

# 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Python | Core programming and analysis |
| Pandas | Data manipulation |
| NumPy | Numerical analysis |
| Matplotlib | Data visualization |
| Seaborn | Statistical visualization |
| MySQL | Relational database and SQL analysis |
| MS Excel | Data inspection and supporting analysis |
| Jupyter Notebook | Main analysis environment |
| Gemini API | Generative AI business analysis |
| Git | Version control |
| GitHub | Portfolio and source-code management |

---

# 📦 Installation

Clone the repository:

```bash
git clone https://github.com/kaushal1020/AI_Sales_Analytics.git
```

Move into the project directory:

```bash
cd AI_Sales_Analytics
```

Create a virtual environment:

```bash
python -m venv venv
```

Activate the environment on Windows:

```bash
venv\Scripts\activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

Launch Jupyter Notebook:

```bash
jupyter notebook
```

---

# 🔑 Gemini API Configuration

Create an environment file:

```text
.env
```

Add:

```text
GEMINI_API_KEY=your_api_key_here
```

The `.env` file should **never be committed to GitHub**.

The repository already contains a `.gitignore` configuration to prevent sensitive environment files from being tracked.

---

# 🗄️ MySQL Setup

Create a MySQL database and import the cleaned sales data.

The SQL analysis file is available at:

```text
mysql/sales_analysis.sql
```

The SQL notebook/workflow can then be used to reproduce the database analysis.

---

# 📊 Example Business Questions

The project can answer questions such as:

### Sales

```text
What is the total revenue?

What is the total profit?

What is the average order value?

Which month generated the highest revenue?
```

### Products

```text
Which product generates the most revenue?

Which product is most profitable?

Which products have low profit margins?
```

### Customers

```text
Who are the highest-value customers?

Which customers generate the most revenue?

Which customers could be targeted for retention?
```

### Regions

```text
Which region performs best?

Which region generates the highest profit?

Where should sales efforts be increased?
```

### Salespeople

```text
Who is the best salesperson?

Which salesperson generates the highest revenue?

Which sales strategies can be replicated?
```

### Discounts

```text
Are larger discounts reducing profitability?

Which products are most affected by discounts?

What discount strategy could improve margins?
```

### AI

```text
What are the biggest risks in the business?

What are the most important opportunities?

What should management do next?
```

---

# 📌 Key Project Outcomes

This project demonstrates the ability to perform an end-to-end data analytics workflow:

```text
Raw Data
   ↓
Data Quality Investigation
   ↓
Data Cleaning
   ↓
Data Validation
   ↓
Database Storage
   ↓
SQL Analysis
   ↓
Python Analysis
   ↓
KPI Calculation
   ↓
Visualization
   ↓
Business Insights
   ↓
Generative AI
   ↓
AI-Powered Business Recommendations
```

The project therefore combines **traditional analytics and Generative AI** into a single workflow.

---

# 🔮 Future Improvements

Possible future improvements include:

- More advanced natural-language question routing
- Automated anomaly detection
- Automated sales forecasting
- Customer segmentation
- Product recommendation analysis
- Automated monthly business reports
- More advanced AI-powered diagnostics
- Reusable Python analysis modules
- Automated data-quality reports
- Additional SQL optimization
- Automated insight generation

These improvements can be added without changing the core architecture of the project.

---

# 👨‍💻 Skills Demonstrated

This project demonstrates practical experience with:

### Data Analytics

- Data cleaning
- Data validation
- Exploratory data analysis
- KPI development
- Business analysis
- Outlier analysis

### Python

- Pandas
- NumPy
- Functions
- Data transformation
- Aggregation
- JSON handling
- API integration

### SQL

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- Aggregate functions
- CASE
- JOIN
- CTE
- Window functions
- Business analysis

### Visualization

- Matplotlib
- Seaborn
- Business charts
- Trend analysis

### Generative AI

- API integration
- Prompt engineering
- Structured business context
- AI-generated insights
- AI-generated recommendations

### Software / Portfolio

- Git
- GitHub
- Project organization
- Documentation
- Environment-variable security

---



# ⭐ Conclusion

AI-Powered Sales Analytics demonstrates how a modern data analyst can combine **data cleaning, SQL, Python analytics, visualization, and Generative AI** into a single practical business solution.

The project does not rely on a website or dashboard application.

Instead, the complete workflow is designed to run locally using:

```text
Python
Jupyter Notebook
MySQL
Excel
Gemini API
Git/GitHub
```

The final result is a portfolio-ready analytics project that moves beyond simple data visualization and demonstrates the complete process of turning **messy business data into reliable analysis, actionable insights, and AI-assisted decision support**.

---

## 👤 Author

**Kaushal Kumar**

Electronics & Communication Engineering

Madan Mohan Malaviya University of Technology

---

## 📂 Repository

GitHub:

https://github.com/kaushal1020/AI_Sales_Analytics