use e_commerce_sales_db;

-- total records
select count(*) as total_records
from ecommerce_sales_clean;

-- total orders 
select count(distinct order_id) as total_orders
from  ecommerce_sales_clean;

# sales &  revenue analysis
-- total revenue
select sum(revenue) as total_revenue
from ecommerce_sales_clean;

-- monthly sale trend
select month_name, year,
 sum(revenue) as monthly_revenue
from ecommerce_sales_clean
group by month_name,year
order by monthly_revenue desc;

-- monthly sales trend 
select category, sum(revenue) as category_revenue
from ecommerce_sales_clean
group by category
order by category_revenue desc;

-- top 10 products by revenue
select product_id, sum(revenue) as product_revenue
from ecommerce_sales_clean
group by product_id
order by product_revenue desc
limit 10;

# region & delivery analysis
-- region-wise revenue
select region, sum(revenue) as region_revenue
from ecommerce_sales_clean
group by region
order by region_revenue desc;

-- avergae delivery time by region 
select region,avg(delivery_time_days) as avg_delivery_days
from ecommerce_sales_clean
group by region
order by avg_delivery_days desc;

# customer analysis
-- new vs repeat customers
select customer_type,count(*) as customers_count
from ecommerce_sales_clean
group by customer_type
order by customers_count desc;

-- revenue by customer type
select customer_type ,sum(revenue) as revenue_by_customer_type
from ecommerce_sales_clean
group by customer_type
order by revenue_by_customer_type desc;

-- average of customer age by category
select customer_type,avg(customer_age) as avg_customer_age
from ecommerce_sales_clean
group by customer_type;

# payment & returns
-- payment method usage
select payment_method,count(*) as transaction_count
from ecommerce_sales_clean
group by payment_method
order by transaction_count desc;

-- retun rate 
select returned , count(*) as order_count
from ecommerce_sales_clean
group by returned;

-- revenue loss due to returns
select returned , sum(revenue) as revenue_loss
from ecommerce_sales_clean
where returned like lower('%yes%')
group by returned 
order by revenue_loss;

# profit & analysis
-- average profit margin 
select round(avg(profit_margin),2) as avg_profit_margin
from ecommerce_sales_clean;

-- profit by category
select category , sum(profit_margin) as profit_margin
from ecommerce_sales_clean
group by category
order by profit_margin desc ;






