--- create dim_customer
select distinct
customer_ID, 
country_region,
state_province, 
city, 
postal_code into Dim_customer
from candy_sales
where customer_ID is not null;