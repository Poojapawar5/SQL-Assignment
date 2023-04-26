##1. create a database called 'assignment' (Note please do the assignment tasks in this database)

CREATE DATABASE assignment;


##2. Use the file ConsolidatedTables.sql to create and populate the tables for  the assignment .

##3. Create a table called countries with the following columns name, population, capital- choose appropriate datatypes for the columns
CREATE TABLE countries(
name varchar(255), 
population integer, 
capital varchar (255)
);

##a) Insert the following data into the table
insert into countries values('China',1382,'Beijing'),
('India',1326,'Delhi'),
('United States',324,'Washington D.C.'),
('Indonesia',260,'Jakarta'),
('Brazil',209,'Brasilia'),
('Pakistan',193,'Islamabad'),
('Nigeria',187,'Abuja'),
('Bangladesh',163,'Dhaka'),
('Russia',143,'Moscow'),
('Mexico',128,'Mexico City'),
('Japan',126,'Tokyo'),
('Philippines',102,'Manila'),
('Ethiopia',101,'Addis Ababa'),
('Vietnam',94,'Hanoi'),
('Egypt',93,'Cairo'),
('Germany',81,'Berlin'),
('Iran',80,'Tehran'),
('Turkey',79,'Ankara'),
('Congo',79,'Kinshasa'),
('France',64,'Paris'),
('United Kingdom',65,'London'),
('Italy',60,'Rome'),
('South Africa',55,'Pretoria'),
('Myanmar',54,'Naypyidaw');

##b) Add a couple of countries of your choice
insert into countries values('Thailand',68,'Bangkok');

##c) Change ‘Delhi' to ‘New Delhi'
UPDATE countries set capital = 'New Delhi' where capital = 'NewDelhi';

##d) Delete  Ethiopia and Vietnam from the table
delete from countries where name IN ('Ethiopia','Vietnam');

##4. Rename the table countries to big_countries . 
rename table countries to big_countries;
SELECT * From big_countries;


/*5. Create the following tables. Use auto increment wherever applicable

a. Product
product_id - primary key
product_name - cannot be null and only unique values are allowed
description
supplier_id - foreign key of supplier table

b. Suppliers
supplier_id - primary key
supplier_name
location

c. Stock
id - primary key
product_id - foreign key of product table
balance_stock*/
create table suppliers(
	suppllier_id integer primary key auto_increment,
	supplier_name varchar(30),
	location varchar(50)
);
create table product (
	product_id integer primary key auto_increment,
	product_name varchar(50) NOT NULL UNIQUE,
	description varchar(150),
	suppllier_id integer,
	foreign key(suppllier_id) references suppliers(suppllier_id)
);
create table stock(
	id integer primary key auto_increment,
	product_id integer,
	balance_stock  integer,
	foreign key(product_id) references product(product_id)
);

/*6. Enter some records into the three tables.*/
insert into suppliers values (1,'New India Suppliers','Mumbai');
insert into suppliers values (2, 'Nav Bharath Suppliers','Delhi');
insert into suppliers values (3, 'Mad Suppliers','Pune');


   insert into product values(100,'Wet Grinder', 'Heavy duty wet grinders', 1),
							(200,'Sewing Machine', ' Export quality sewing machines with 23 settings',2);

   insert into stock values (1,100,23),
							(2,200,5);

/*7. Modify the supplier table to make supplier name unique and not null.*/
alter table suppliers modify column supplier_name varchar(30) UNIQUE NOT NULL;

/*8. Modify the emp table as follows
a. Add a column called deptno*/
alter table emp add column deptno integer;

/*b. Set the value of deptno in the following order

deptno = 20 where emp_id is divisible by 2
deptno = 30 where emp_id is divisible by 3
deptno = 40 where emp_id is divisible by 4
deptno = 50 where emp_id is divisible by 5
deptno = 10 for the remaining records.*/

    update emp set deptno = 20 where emp_no%2 = 0;
    update emp set deptno = 30 where emp_no%3 = 0;
    update emp set deptno = 40 where emp_no%4 = 0;
    update emp set deptno = 50 where emp_no%5 = 0;
    update emp set deptno = 10;
    
    /*9. Create a unique index on the emp_id column.*/
create unique index hidx on emp(emp_no);

/*10. Create a view called emp_sal on the emp table by selecting the following fields in the order of highest salary to the lowest salary.
emp_no, first_name, last_name, salary*/
create view emp_sal as select emp_no, first_name, last_name, salary from emp order by salary desc;

Select * from  emp;



