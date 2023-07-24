create table Regions(
Rid int primary key,
Rname varchar(25)
)
insert into Regions values(1,'North')
insert into Regions values(2,'West')
insert into Regions values(3,'East')
insert into Regions values(4,'South') 
sp_help Regions


create table Countries(
Cid int primary key,
Country_Name varchar(40),
Rid int foreign key(Rid) references Regions(Rid)
)
insert into Countries values(11,'India',1)
insert into Countries values(12,'USA',2)
insert into Countries values(13,'Canada',3)
insert into Countries values(14,'Maxico',4)
insert into Countries values(15,'Brezil',1)
sp_help Countries

create table Locations(
Lid int primary key,
Street_Address varchar(25),
Postal_Code varchar(12),
City varchar(30),
State_Province varchar(12),
Cid int foreign key(Cid) references Countries(Cid)
)
insert into Locations values(101,'Karve nagar','123654','Pune','Maharashtra',11)
insert into Locations values(102,'Ramrao Nagar','653654','Sangli','Maharashtra',12)
insert into Locations values(103,'Jaynagar','15874','Daharawad','Karnataka',13)
insert into Locations values(104,'Ambica Nagar','125874','Satara','Maharashtra',14)
insert into Locations values(105,'Indian street','423654','Oslo','Brezil',15)


sp_help Locations

create table Department(
Did int primary key,
Department_Name varchar(30),
Manager_Id int,
Lid int foreign key(Lid) references Locations(Lid)
)
insert into Department values(201,'CS',1,101)
insert into Department values(202,'Admin',2,102)
insert into Department values(203,'HR',3,103)
insert into Department values(204,'Finance',4,104)
insert into Department values(205,'Training And Placement',5,105)

sp_help Department

create table Jobs(
--Lid int foreign key(Lid) references Locations(Lid),
Job_Id int primary key,
Job_title varchar(25),
Min_Salary int,
Max_Salary int
)
insert into Jobs values(21,'Trainee',25000,30000)
insert into Jobs values(22,'Hr',30000,50000)
insert into Jobs values(23,'Manager',50000,80000)
insert into Jobs values(24,'Devoper',25000,40000)
insert into Jobs values(25,'Test Engineer',40000,60000)
update Jobs set Job_title='Programmer' where Job_Id=24


sp_help Jobs

create table Employee1(
Eid int,
First_Name varchar(20),
Last_Name varchar(25),
Email varchar(25),
Phone_Number varchar(20),
Hire_Date date,
Job_Id int foreign Key(Job_Id) references Jobs(Job_Id),
Salary int,
Commision_PCT int,
MAnagaer_id int,
Did int foreign key(Did) references Department(Did)
)
insert into Employee1 values(1,'Vidyashree','Hipparagi','vidyashree@gmail.com','9754126322','2023-07-22',21,40000,1200,31,201)
insert into Employee1 values(1,'Harish','Hipparagi','harish@gmail.com','9442998751','2023-05-02',22,30000,1250,32,202)
insert into Employee1 values(1,'Akshata','Sabne','ak@gmail.com','8964752322','2023-05-14',23,58000,1500,33,203)
insert into Employee1 values(1,'Anjali','Buddhe','anjali@gmail.com','702856482','2022-05-18',24,60000,2200,34,204)
insert into Employee1 values(1,'Prajakta','Gholape','pg@gmail.com','9856974222','2021-05-24',25,75000,3000,35,205)
insert into Employee1 values(1,'Pratika','Desai','pd@gmail.com','887596312','2021-05-4',25,56000,2000,36,204)


sp_help Employee
select * from Regions
select * from Countries
select * from Locations
select * from Department
select * from Jobs
select * from Employee1


--1. Write a query to list the number of jobs available in the employees table.
 select j.Job_Title 
 from Employee1 e 
  inner join Jobs j on e.Job_Id=j.Job_Id
  group  by Job_title

--2. Write a query to get the total salaries payable to employees.
select Sum(salary) as 'Total Salary' from Employee1
--3. Write a query to get the minimum salary from employees table.
select Min(salary) as 'Min Salary' from Employee1
--4. Write a query to get the maximum salary of an employee working as a 
--Programmer.
select MAX(salary) as'Max Sal' from Employee1 where Job_Id=24
--5. Write a query to get the average salary and number of employees working 
--the department 90.
select avg(salary),count(*) from Employee1 where Did=202
--6. Write a query to get the highest, lowest, sum, and average salary of all 
--employees.
select MAX(salary) as'Max Sal' from Employee1
select Min(salary) as'Min Sal' from Employee1
select sum(salary) as'sum Sal' from Employee1
select avg(salary) as'avg Sal' from Employee1


--7. Write a query to get the number of employees with the same job.
select job_id, count(*) from Employee1
group by Job_Id
--8. Write a query to get the difference between the highest and lowest 
--salaries.
select (MAX(salary)-Min(salary)) as 'Salary difference' from Employee1
--9. Write a query to find the manager ID and the salary of the lowest-paid 
--employee for that manager.
select 
--10. Write a query to get the department ID and the total salary payable 
--in each department.
select Did, count(salary) from Employee1
group by Did
--11. Write a query to get the average salary for each job ID excluding 
--programmer.

--12. Write a query to get the total salary, maximum, minimum, average 
--salary of employees (job ID wise), for department ID 90 only.
select job_id,sum(salary) as 'Total slary',max(salary) as 'maximum sal',avg(salary) as 'average salary'
from Employee1
where Did=201
group by Job_Id
--13. Write a query to get the job ID and maximum salary of the 
--employees where maximum salary is greater than or equal to $4000.
select Job_Id,max(Salary) 
from Employee1
group by Job_Id
Having max(salary)>=4000
--14. Write a query to get the average salary for all departments 
--employing more than 10 employees.
select Did,avg(salary) as 'avg sal'from Employee1
group by Did
having count(*)>4