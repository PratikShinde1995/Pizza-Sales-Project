create database pizza;
use pizza;

select count(*) from pizza_sales; 
select * from pizza_sales;
desc pizza_sales;

alter table pizza_sales
modify order_date date;

select sum(total_price) as total_revenue
from pizza_sales;

select sum(total_price)/count(distinct order_id) as avg_order_value
from pizza_sales;

select sum(quantity) as total_pizza_sold
from pizza_sales;

select count(distinct order_id) as total_orders
from pizza_sales;

select sum(quantity)/count(distinct order_id) as avg_pizza_per_order
from pizza_sales;

#DAILY TREND
select dayname(order_date) as order_day, count(distinct order_id) AS total_orders
from pizza_sales
group by dayname(order_date);

select count(distinct order_id) from pizza_sales;

#HOURLY TREND
SELECT HOUR(order_time) as order_hours, count(distinct order_id) as total_orders
from pizza_sales
group by hour(order_time)
order by hour(order_time);

select pizza_category,sum(total_price)*100/(select sum(total_price) 
from pizza_sales where month(order_date)=1) as total_sales
from pizza_sales 
where month(order_date)=1
group by pizza_category;

select pizza_size,sum(total_price) as total_sales, sum(total_price)*100/
(select sum(total_price) from pizza_sales where quarter(order_date)=1
) as PCT
from pizza_sales
where quarter(order_date)=1
group by pizza_size
order by PCT desc; 

select pizza_category,sum(quantity) as total_pizzas_sold
from pizza_sales
group by pizza_category;

select pizza_name, sum(quantity) as total_pizzas_sold
from pizza_sales
group by pizza_name
order by sum(quantity)
limit 5;















