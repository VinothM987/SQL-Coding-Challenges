use ecommercedb;

select * from product;
select * from sales;

-- Question 1: ORDER BY

select * from product
order by price desc;

-- Question 2: ORDER BY with LIMIT

select * from product
order by price desc
limit 3;

-- Question 3: Aggregate Functions – Total Sales

select sum(sale_amount) as Total_Sales
from sales;

-- Question 4: Aggregate Functions – Average Price

select avg(sale_amount) as Average_Sale_Amount
from sales;

-- Question 5: Aggregate Functions – Count & Max/Min

select 
	count(sale_id) as Number_of_Sales,
    max(sale_amount) as Highest_Sale_Amount,
    min(sale_amount) as Lowest_Sale_Amount
from sales;

-- Question 6: GROUP BY – Total Sales per Product

select p.product_id, p.product_name, sum(s.sale_amount) as total_sales
from product as p
join sales as s
on s.product_id = p.product_id
group by product_id, product_name;

-- Question 7: GROUP BY with HAVING

select p.product_id, p.product_name, sum(sale_amount) as Total_Sales
from product as p
join sales as s
on s.product_id = p.product_id
group by product_id, product_name
having sum(s.sale_amount) > 50000;

-- Question 8: ORDER BY with GROUP BY

select p.product_id, p.product_name, sum(s.sale_amount) as total_sales
	from product as p
    join sales as s
    on s.product_id = p.product_id
group by product_id, product_name
order by total_sales desc;
  
-- Question 9: LIMIT with GROUP BY

select p.product_id, p.product_name, sum(s.sale_amount) as total_sales
	from product as p
    join sales as s
    on s.product_id = p.product_id
group by product_id, product_name
order by total_sales desc
limit 3;

-- Question 10: HAVING with Aggregate Condition

select p.product_id, p.product_name, sum(s.sale_amount) as total_sales
	from product as p
    join sales as s
    on s.product_id = p.product_id
group by product_id, product_name
having sum(s.sale_amount) > 30000 and avg(s.sale_amount > 10000);