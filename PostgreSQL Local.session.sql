CREATE DATABASE sql_practice;

CREATE TABLE employee(
employee_id INT PRIMARY KEY,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(100) unique
);

INSERT INTO employee(employee_id,first_name,last_name,email)
values
(1,'shihab','farraz','shihab1234@gmail.com'),
(2,'jonny','kappor','jonny1122@gmail.com'),
(3,'rohit','puja','rohit1234@gmail.com');

SELECT * from employee;

select first_name,email from employee;

-- Exact match: Find a specific employee by their first name
select * from employee where first_name='shihab';

-- The '%' symbol is a wildcard that matches any sequence of characters before the '@'
select * from employee where email like '%@gmail.com';

--The UPDATE command alters existing data inside your table.
update employee
set first_name='rani' where employee_id=3;

--The DELETE command removes specific rows of data from your table.
delete from employee where employee_id=2;

--Let's add a new column for salary. Run this command:
alter table employee add column salary decimal(10,2);

update employee
set salary =70000.00 where employee_id=1;
update employee 
set salary=85000 where employee_id=3;

--Aggregate Functions

-- COUNT: Find out exactly how many employees you have in the table
select count(*) from employee;

-- SUM: Calculate the total payroll cost for all employees
select sum(salary) as total_salary from employee; 

-- AVG: Find the average salary
select avg(salary) as avg_salary from employee;

-- MIN & MAX: Find the lowest and highest salaries
select min(salary) as minimum ,max(salary) as maximum from employee;

SELECT * from employee;

alter tableyee employee add column depertment_id int;

update employee set depertment_id=1 where employee_id=1;
update employee set depertment_id=2 where employee_id=3;

--Categorizing Data (GROUP BY)
--Let's find the average salary for each department:
select depertment_id ,avg(salary) as avg_salary
from employee
group by depertment_id;

--delete all inserted value
DELETE FROM employee;

INSERT INTO employee(employee_id, first_name, last_name, email, salary, depertment_id)
VALUES 
(1, 'Jane', 'Smith', 'jane.smith@gmail.com', 75000.00, 1),
(2, 'Bob', 'Johnson', 'bob.j@gmail.com', 60000.00, 2),
(3, 'Alice', 'Williams', 'alice.w@gmail.com', 85000.00, 1),
(4, 'David', 'Brown', 'david.b@gmail.com', 95000.00, 4),
(5, 'Sarah', 'Davis', 'sarah.d@gmail.com', 52000.00, 2),
(6, 'Michael', 'Miller', 'mike.m@gmail.com', 72000.00, 1),
(7, 'Emily', 'Wilson', 'emily.w@gmail.com', 68000.00, 3),
(8, 'Sarah', 'Davis', 'devis@gmail.com', 52000.00, 4),
(9, 'joael', 'Miller', 'niike.m@gmail.com', 72000.00, 3);

--The HAVING clause filters the results of a GROUP BY based on aggregate conditions.
select depertment_id ,avg(salary) as avg_salary
from employee
group by depertment_id
having avg(salary)>60000;

-- The ORDER BY clause sorts your final result set in Ascending (ASC) or Descending (DESC) order.   
select * from employee 
order by salary desc;
