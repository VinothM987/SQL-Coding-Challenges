-- 1️.Create Database
CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- 2️.Create Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0)
);

-- 3️.Create Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    sale_amount DECIMAL(10,2) CHECK (sale_amount > 0),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- 4️.Insert Sample Data into Product Table
INSERT INTO Product (product_id, product_name, price) VALUES
(1, 'Laptop', 85000.00),
(2, 'Smartphone', 45000.00),
(3, 'Headphones', 5000.00),
(4, 'Keyboard', 1200.00),
(5, 'Mouse', 800.00),
(6, 'Monitor', 15000.00),
(7, 'Webcam', 3500.00);

-- 5️.Insert Sample Data into Sales Table
INSERT INTO Sales (sale_id, product_id, quantity, sale_amount) VALUES
(1, 1, 2, 170000.00),
(2, 2, 3, 135000.00),
(3, 3, 5, 25000.00),
(4, 4, 10, 12000.00),
(5, 5, 15, 12000.00),
(6, 6, 2, 30000.00),
(7, 7, 4, 14000.00);

select * from Product;
select * from Sales;

-- Question 1: ORDER BY & LIMIT

select * from product
order by price desc
limit 3;

-- Question 2: Aggregate Functions

select count(sale_id) as Total_Sales from sales;
select sum(sale_amount) as Total_Sales_Amount from sales;
select avg(sale_amount) as Average_Sale_Amount from sales;
select max(sale_amount) as Highest_Sale_Amount from sales;
select min(sale_amount) as Lowest_Sale_Amount from sales;

-- Question 3: GROUP BY & HAVING

select p.product_id, p.product_name, sum(s.sale_amount) as total_sales
from product as p
join sales as s
on s.product_id = p.product_id
group by product_id, product_name
having total_sales > 100;

-- Question 4: Window Functions

select *, 
dense_rank() over (order by price desc) as Price_Dense
from product;

select *, 
rank() over (order by price desc) as Price_Rank
from product;