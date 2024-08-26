--create database CompanyDB
--create schema sales

--create SEQUENCE   sales.i
--start with 1
--increment by 1


create table sales.employees(
employee_id INT default(next value for sales.i),
first_name VARCHAR(50),
 last_name VARCHAR(50),
 salary DECIMAL(10,3),
primary key(employee_id)
)

alter table sales.employees
add hire_date  DATE

--•	Select all columns from the "employees" table
select *
from sales.employees

--•	Retrieve only the "first_name" and "last_name" columns from the "employees" table.
select first_name,last_name 
from sales.employees

--•	Retrieve “full name” as a one column from "first_name" and "last_name" columns from the "employees" table.
select first_name+' '+last_name as 'full name'
from sales.employees

--•	Show the average salary of all employees
SELECT AVG(salary) AS average_salary
FROM sales.employees;

--•	Select employees whose salary is greater than 5000
select employee_id,first_name 
from sales.employees
where salary>5000

--•	Retrieve employees hired in the year 2021.
select employee_id,first_name,Year(hire_date) as hire_date_2021
from sales.employees
where Year(hire_date)=2021

--•	List employees whose last names start with 'S.'
select employee_id,first_name,last_name
from sales.employees
where last_name like '[S]%'

--•	Display the top 10 highest-paid employees.
select top 10  employee_id,first_name ,salary
from sales.employees
order by salary desc

--•	Find employees with salaries between 4000 and 6000.
select  employee_id,first_name ,salary
from sales.employees
where salary  between 4000 and 6000

--•	Show employees with names containing the substring 'man.'
select  employee_id,first_name,last_name ,salary
from sales.employees
where first_name like '%man%' or last_name like '%man%'

--•	Display employees with a NULL value in the "hire_date" column.
select  employee_id,first_name,last_name ,salary
from sales.employees
where hire_date is null

--•	Select employees with a salary in the set (4000, 4500, 5000).
select  employee_id,first_name,last_name ,salary
from sales.employees
where salary in(4000, 4500, 5000)

--•	Retrieve employees hired between '2022-01-01' and '2021-09-01.'
select  employee_id,first_name,last_name ,salary ,hire_date
from sales.employees
where hire_date  between '2021-09-01' and   '2022-01-01'

--•	List employees with salaries in descending order.
select  employee_id,first_name ,salary
from sales.employees
order by salary desc

--•	Show the first 5 employees ordered by "last_name" in ascending order.
select  employee_id,first_name ,last_name
from sales.employees
order by last_name asc

--•	Display employees with a salary greater than 5500 and hired in 2021.
select  employee_id,first_name ,salary ,hire_date
from sales.employees
where salary>5500 and YEAR(hire_date)=2021

--•	Select employees whose first name is 'John' or 'Jane.'
select  employee_id,first_name ,salary ,hire_date
from sales.employees
where first_name like 'John'or first_name like 'Jane'

--•	List employees with a salary less than or equal to 5500 and a hire date after '2022-01-01.'
select  employee_id,first_name ,salary ,hire_date
from sales.employees
where salary<=5500 and  hire_date> '2022-01-01'

--•	Retrieve employees with a salary greater than the average salary.
SELECT employee_id,first_name ,salary ,hire_date 
FROM sales.employees
where salary > (
    SELECT AVG(salary) 
    FROM sales.employees
)

--•	Display the 3rd to 7th highest-paid employees.
select  employee_id,first_name ,salary
from sales.employees
order by salary desc
offset 2 rows
fetch next 5 rows only

--•	List employees hired after '2021-01-01' in alphabetical order.
select  employee_id,first_name ,salary ,hire_date
from sales.employees
where  hire_date> '2021-01-01'
order by first_name

--•	Retrieve employees with a salary greater than 5000 and last name not starting with 'A.'
select  employee_id,first_name ,salary ,last_name
from sales.employees
where salary>5000 and last_name not like '[A]%'

--•	Display employees with a salary that is not NULL.
select  employee_id,first_name ,salary ,last_name
from sales.employees
where salary is not null

--•	Show employees with names containing 'e' or 'i' and a salary greater than 4500.
select  employee_id,first_name ,salary ,last_name
from sales.employees
where  salary>4500 and (first_name like '%[ei]%' or  last_name like '%[ei]%')
