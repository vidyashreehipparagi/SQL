create table Dept(
did int primary key,
Dname varchar(30)
)
insert into Dept values(30,'HR')
insert into Dept values(40,'Finance')
insert into Dept values(50,'HR')
insert into Dept values(60,'Admin')
insert into Dept values(70,'manager')
insert into Dept values(80,'HR')
insert into Dept values(90,'Developmen')
insert into Dept values(100,'Testing')
insert into Dept values(110,'Store')


create table Employees
(
E_id int primary key,
f_name varchar(10),
l_name varchar(10),
e_mail varchar(20), 
ph_no varchar(20),
hire_d date,
job_title varchar(20), 
job_id varchar(10),
salary int, 
comm_pct int ,
manager_id int ,
did int foreign key(did)references Dept(did),
pf int
)

sp_help Employees

insert into Employees values(1,'snehal','shirsath','ss@gmail.com','999999999','2023-7-20','programmer',101,20000,0,1001,30,0)
insert into Employees values(2,'sagar','kawade','sk@gmail.com','888888888',null,'programmer',102,16000,0,1002,100,0)
insert into Employees values(3,'pankaj','daundkar','pd@gmail.com','777777777','2023-5-20','shipping clerk',103,35000,0,1003,40,0)
insert into Employees values(4,'pratik','chavan','pc@gmail.com','666666666',null,'associate',104,40000,0,1004,60,1000)
insert into Employees values(5,'binod','BLAKE','bb@gmail.com','555555555','2023-3-20','shipping clerk',105,9000,0,1005,80,0)
insert into Employees values(6,'vidyashree','hippargi','vh@gmail.com','999999999','2023-7-20','manager',101,50000,0,1001,50,null)
insert into Employees values(7,'akshata','sabne','as@gmail.com','888888888','2023-8-20',null,102,21000,0,1002,30,0)
insert into Employees values(8,'nilesh','SCOTT','nj@gmail.com','777777777','2023-9-20',null,103,15000,0,1003,30,0)
insert into Employees values(9,'girish','FORD','gj@gmail.com','666666666',null,'admin',104,33000,0,1004,80,0)
insert into Employees values(10,'cat','FORD','cf@gmail.com','555555555','2023-11-20','admin',105,11000,0,1005,100,100)

select * from Employees
truncate table Employees

--1. Write a query to display the names (first_name, last_name) and salary for 
--all employees whose salary is not in the range $10,000 through $15,000.
select f_name,l_name,salary from Employees where salary not between 10000 and 15000

--2. Write a query to display the names (first_name, last_name) and 
--department ID of all employees in departments 30 or 100 in ascending 
--alphabetical order by department ID.
select e.f_name,e.l_name,d.did from Employees e
join Dept d on e.did=d.did
where d.did=30 or d.did=100
order by e.f_name,d.did

-- 3.Write a query to display the names (first_name, last_name) and salary for 
--all employees whose salary is not in the range $10,000 through $15,000 
--and are in department 30 or 100
select e.f_name,e.l_name,d.did,e.salary from Employees e
join Dept d on e.did=d.did
where e.salary not between 10000 and 15000 and d.did=30 or d.did=100

--4. Write a query to display the names (first_name, last_name) whose hire date is not known
select f_name,l_name from Employees where hire_d is null

--5. Write a query to display the first_name of all employees who have both "b" and "c" in their first name.
select f_name from Employees where f_name like '[b,c]%' 

--6. Write a query to display the last name, job, and salary for all employees 
--whose job is that of a Programmer or a Shipping Clerk, and whose salary 
--is not equal to $4,500, $10,000, or $15,000
select l_name, job_title,salary from Employees where job_title='programmer'or job_title='shipping clerk' and salary<>4500 and salary<>10000 and salary<>15000

--7. Write a query to display all details of first 5 employees whose salary is less among all employees.
select top 5 * from Employees order by salary 

--8. Write a query to display the jobs/designations available in the employees table.
select distinct job_title from Employees

--9. Write a query to display the names (first_name, last_name), salary and PF (15% of salary) of all employees.
update Employees set pf=salary-(salary*0.15) where e_id in(1,2,3,4,5,6,7,8,9,10)
select f_name, l_name ,salary , pf from Employees 

--10. Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.
select * from Employees where l_name in('BLAKE', 'SCOTT', 'KING','FORD')