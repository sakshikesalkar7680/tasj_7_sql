select * from sales

select * from customer
	
--1)--report of all states sales,qunatity, discount, profit with aggregation
	
select c.state,
sum(s.sales) as sum_sales,
avg(s.sales) as avg_sales,
min(s.sales) as min_sales,
max(s.sales) as max_sales,
count(s.sales) as sales_count,
	
sum(s.quantity) as sum_quantity,
avg(s.quantity) as avg_quantity,
min(s.quantity) as min_quantity,
max(s.quantity) as max_quantity,
count(s.quantity) as count_quantity,
	
sum(s.discount) as sum_discount,
avg(s.discount) as avg_discount,
min(s.discount) as min_discount,
max(s.discount) as max_discount,
count(s.discount) as count_discount,
	
sum(s.profit) as sum_profit,
avg(s.profit) as avg_profit,
min(s.profit) as min_profit,
max(s.profit) as max_profit,
count(s.profit) as profit_count
from
sales as s
inner join
customer as c on s.customer_id = c.customer_id 
	group by
	c.state;

--2)-- get data of all states and cities average customer age

select state,
city, avg(age) as avg_age
from customer group by
state, city;

--3)-- get data of 2017 to 2018 with product name and sales per quantity

select 
p.product_name,
s.order_date, sum(s.sales)/ sum(s.quantity) as sales_per_quantity
from
sales as s
inner join
product as p on s.product_id = p.product_id where
s.order_date between '2017-01-01' and '2018-12-31' group by
p.product_name, s.order_date;

--que1- get totral sales, quantity, and profit fro each product category in 2018

select 
p.category, sum(s.sales) as total_sales,
sum(s.quantity) as total_quantity,
sum(s.profit) as total_profit
from
sales as s
inner join
product as p on s.product_id = p.product_id where
s.order_date between '2017-01-01' and '2018-12-31' group by
p.category;

--que2- find the top 5 states by total profit

select
c.state,
sum(s.profit) as total_profit
from 
	sales as s
inner join
customer as c on s.customer_id = c.customer_id group by
c.state order by total_profit desc limit 5;

--que3- get monthly average sales per product for the year 2017

select 
	p.product_name,
	extract(month from s.order_date) as month,
avg(s.sales) as avg_sales 
from
sales as s
inner join
product as p on s.product_id = p.product_id
where
extract(year from s.order_date) = 2017
group by p.product_name,month order by month, p.product_name;

--que4- find the state with the highest average discount in 2017

select c.state, avg(s.discount) as avg_discount
from
sales as s
inner join
customer as c on s.customer_id = c.customer_id
where
extract(year from s.order_date) = 2017
group by
c.state
order by avg_discount desc limit 1;



