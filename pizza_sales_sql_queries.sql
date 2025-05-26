create database pizzaDB;
select * from pizza_sales;
select sum(total_price) Total_Revenue from pizza_sales;

select sum(total_price) / count(distinct order_id)
as Avg_order_value from pizza_sales;

select sum(quantity)Total_pizza_sold from pizza_sales;

select count(distinct order_id)Total_orders from pizza_sales;

select cast(sum(quantity) /count(distinct order_id) as 
decimal(10,2)) Avg_pizzas_per_order
from pizza_sales;

SELECT 
  DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) AS order_day,
  COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d'));

select monthname(str_to_date(order_date,'%y-%m-%d'))as month_name,
count(distinct order_id) Total_Orders from pizza_sales group by 1;

select pizza_category,sum(total_price) Total_Sales,
sum(total_price) * 100/ (select sum(total_price)
from pizza_sales where month(str_to_date(order_date,'%y-%m-%d')) = 1) PCT 
from pizza_sales 
where month(str_to_date(order_date,'%y-%m-%d')) = 1
group by pizza_category;

select pizza_size,cast(sum(total_price)as decimal(10,2)) Total_Sales,
cast(sum(total_price) * 100/ (select sum(total_price) from pizza_sales) as decimal(10,2))PCT 
from pizza_sales 
group by 1
order by 3 desc;

select  pizza_name,sum(total_price) Total_Revenue from pizza_sales group by 1 
order by 2 desc limit 5;

select  pizza_name,sum(total_price) Total_Revenue from pizza_sales group by 1 
order by 2 asc limit 5;

select  pizza_name,sum(quantity) Total_Quantity from pizza_sales group by 1 
order by 2 desc limit 5;

select  pizza_name,sum(quantity) Total_Quantity from pizza_sales group by 1 
order by 2  limit 5;

select  pizza_name,count(distinct order_id) Total_orders from pizza_sales group by 1 
order by 2 desc limit 5;

select  pizza_name,count(distinct order_id) Total_orders from pizza_sales group by 1 
order by 2 asc limit 5;









