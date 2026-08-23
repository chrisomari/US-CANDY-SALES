---standardize product table
select
product_id,
product_name,
division, 
factory as factoryID
into dim_product
from Candy_Products


---standardise factory table
select factory as factory_ID,
latitude,
longitude
into Dim_factory
from Candy_factories 