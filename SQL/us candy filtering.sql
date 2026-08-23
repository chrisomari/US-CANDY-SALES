---create the core fact table
select
row_ID,
Order_ID,
cast (order_date as date)As order_date,
cast(ship_date as date) as ship_date,
ship_mode,
customer_ID,
Product_ID,
sales,
units,
gross_profit,
cost
into fact_sales
from Candy_Sales

---extract only the zip codes that exist in the customer data
Select distinct
cast (zip as nvarchar(20)) as postal_code, 
lat as latitude,
lng as longitude
into dim_geography
from uszips
where cast (zip as nvarchar(20))in (select postal_code from dim_customer);