# US Candy Distributor — Sales & Logistics Intelligence
An end-to-end Business Intelligence solution analyzing sales performance, product margins,
customer geography, and fulfillment logistics for a national candy distributor.
This project demonstrates advanced relational data modeling in **SQL Server (T-SQL)**, Star
Schema architecture, explicit **DAX** measure design, and an interactive executive report in
**Power BI Desktop**.
---
## Table of Contents
1. [Project Overview & Business Problem](#-project-overview--business-problem)
2. [Data Architecture & Modeling](#-data-architecture--modeling)
3. [SQL Engineering & Data Cleaning](#-sql-engineering--data-cleaning)
4. [Power BI Dashboards](#-power-bi-dashboards)
5. [Key Business Insights](#-key-business-insights)
6. [Strategic Recommendations](#-strategic-recommendations)
7. [Repository Structure](#-repository-structure)
---
## Project Overview & Business Problem
Management of a national candy distributor needed actionable clarity across two primary
operational areas:
* **Product Profitability & Target Tracking:** Determine which candy divisions drive top-line
revenue versus bottom-line margin, and track divisional performance against targets.
* **Logistics & Regional Cost Allocation:** Evaluate customer order patterns, shipment mode
distribution, and operating cost concentration across geographic regions.
---
## Data Architecture & Modeling
The original data was provided as a flat transactional export alongside secondary dimension and
geographic lookup tables (`uszips`).
To maximize query speed, eliminate redundant data, and optimize DAX filter context, the
database was re-architected into a **Star Schema**:
* **`Fact_Sales`** (Grain: 1 line item per order) — `Row_ID`, `Order_ID`, `Order_Date`,
`Ship_Date`, `Customer_ID`, `Product_ID`, `Ship_Mode`, `Sales`, `Units`, `Gross_Profit`, `Cost`.
* **`Fact_Targets`** (Grain: 1 target per division) — `Division`, `Target`.
* **`Dim_Customer`** (Grain: 1 unique customer) — `Customer_ID`, `Country_Region`,
`State_Province`, `City`, `Postal_Code`.
* **`Dim_Product`** (Grain: 1 unique product) — `Product_ID`, `Product_Name`, `Division`,
`Factory_ID`.
* **`Dim_Factory`** (Grain: 1 manufacturing site) — `Factory_ID`, `Latitude`, `Longitude`.
* **`Dim_Date`** (DAX Dynamic Calendar) — `Date`, `Year`, `Month Number`, `Month Name`,
`Quarter`, `YearMonth`.
---
## SQL Engineering & Data Cleaning
Key engineering challenges resolved in T-SQL:
* **Relational Normalization:** Deconstructed flat sales records into dedicated dimension
tables using `SELECT DISTINCT` and `INTO` DDL statements.
* **Implicit Conversion Clashes:** Handled alphanumeric postal code formats by explicitly
casting zip data types during joins to reference tables.
## Power BI Dashboards
### Page 1: Executive Sales & Margin Performance
Focuses on company revenue, profit margins, monthly sales trajectories, and target
achievement by product line.
![Executive Sales & Margin
Performance](https://github.com/chrisomari/US-CANDY-SALES/blob/main/images/CAndysalesdashboard.png)
---
### Page 2: Logistics Efficiency & Supply Chain Operations
Analyzes operational cost distribution, fulfillment preferences, average order values, and order
volume density across US states.
![Logistics Efficiency & Supply Chain
Operations](https://github.com/chrisomari/US-CANDY-SALES/blob/main/images/logisticsefficiency.png)
## Key Business Insights
Volume & Cost Concentration in Chocolate:
Evidence: Total orders and operational costs are heavily skewed toward the Chocolate division,
which accounts for the vast majority of the company's $48.34K total operational cost footprint.
Implication: The company’s financial performance is sensitive to raw material cost changes and
factory-level processing disruptions in the Chocolate supply chain.
Standard Class Fulfillment Dominance:
Evidence: Standard Class represents 60.15% (~5K orders) of total fulfillment, followed by Second
Class (19.34%), First Class (15.35%), and Same Day (5.17%).
Implication: Customer purchasing behavior prioritizes regular ground delivery over expedited
transit options.
Geographic Order Clusters:
Evidence: Order concentration peaks in high-population states (e.g., California, New York,
Washington, Texas), maintaining a healthy $16.58 Average Order Value (AOV) across 8,549 total
orders.
## Strategic Recommendations
Freight Consolidation & Carrier Negotiation: Consolidate scheduled shipments for the 60%+
Standard Class volume to negotiate tiered bulk carrier discounts with national freight providers.
Product Line Diversification: Expand marketing and sales distribution efforts for Sugar and Other
divisions to improve profit margin balance across categories.
Premium Expedited Fulfillment: Implement dedicated surcharges for First Class and Same Day
fulfillment to protect operational margins on high-distance shipments.
