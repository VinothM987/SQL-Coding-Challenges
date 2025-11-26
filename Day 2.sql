create database Online_Bookstore;
use Online_Bookstore;

-- Question 1: CREATE TABLE with PRIMARY & FOREIGN KEY
-- Question 2: ALTER TABLE – Add UNIQUE Constraint

create table Books(
BookID int primary key,
Title varchar(100) not null,
Author varchar(50) not null,
ISBN varchar(20) unique,
Price decimal(8,2) check(price>0)
);

create table Orders(
OrderID int primary key,
BookID int,
foreign key (BookID) references Books(BookID),
OrderDate date not null,
Quantity int check(Quantity > 0)
);

-- Question 3: INSERT, RETRIEVE & UPDATE with Constraints

insert into books (BookId, Title, Author, ISBN, Price) values
(1001, 'Exploring Modern Data Analytics', 'Raghav Sharma', 9789358421021, 699),
(1002, 'The Silent Echoes', 'Meera Krishnan', 9788194758734, 450),
(1003, 'AI Revolution: Future of Intelligence', 'Arjun Varma', 9789356299918, 899),
(1004, 'Journey Beyond the Stars', 'Priya Nandakumar', 9788193025540, 520),
(1005, 'Principles of Financial Logic', 'Deepak Srinivasan', 9789354073306, 780);

select * from Books;

insert into Orders (OrderID, BookID, OrderDate, Quantity) values
(901, 1001, '2023-04-13', 3),
(902, 1002, '2023-01-01', 1),
(903, 1003, '2023-03-31', 8),
(904, 1004, '2023-08-08', 5),
(905, 1005, '2023-11-24', 2);

select * from Orders;

update Books set price = 1199 where BookID = 1003;

select * from Books;

update Orders set Quantity = 4 where OrderID = 903;

select * from Orders;

-- Question 4: DELETE vs TRUNCATE

delete from Orders where OrderID = 902;

select * from Orders;

truncate Orders;

select * from Orders;