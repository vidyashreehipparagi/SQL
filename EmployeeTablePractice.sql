create table Emloyee(
empid int primary key,
empname varchar(20) not null,
salary numeric(12,2),
deptname varchar(25),
address varchar(40),
designation varchar(20),
gender varchar(20)
)
insert into Emloyee values(1,'Vidyashree',50000,'Design','Patil galli jath','Developer','Female')
insert into Emloyee values(2,'Anjali',52000,'Development','Pashan Pune','Test Engineer','Female')
insert into Emloyee values(3,'Akshata',55000,'Finance','Pune road,Latur','Accountant','Female')
insert into Emloyee values(4,'Harish',60000,'Development','Chatriag Road Jath','General Manger','Male')
insert into Emloyee values(5,'Pramod',45000,'Marketing','Hanuman Galli Athani','Assistant Manager','Male')
insert into Emloyee values(6,'Anand',55000,'Finance','Mumbai','Accountant','male')
select * from Emloyee

--display Employee name sal&degignation
select empname,salary,designation from Emloyee

--Update salary by 10% pf emp who is from pune
Update Emloyee set salary=salary+(salary*0.10) where address='Pashan Pune'
Update Emloyee set salary=(salary+(salary*0.10)) where address='Pashan Pune'

--Delete all Emp whole sal is less than 45000 & city is pune
Delete from Emloyee where salary<45000 and address='Pashan Pune'

--Update adress of emp whose designation is General Manager
Update Emloyee set address='Pune' where designation='General Manger'

--Display all female emp
select * from Emloyee where gender='Female' 

--Display all emp from PUNE
select * from Emloyee where address='Pune'

--DIAPLAY ALL EMP FROM General Manger WHERE LOCATION IS PUNE
select * from  Emloyee where deptname='Development'  and address='Pune' 

--delete emp from sales dep and sal>2500
delete from Emloyee where designation='Assistant Manager' and salary<50000

--WQT FIND THE EMP WHOSE SAL IS MORE THAN 30000 AND LESS THAN 80000
select * from Emloyee where salary>30000 and salary<80000
--WQT FIND MAX SAL
select max(salary) as 'Max Salary' from Emloyee
--WQT find total number of emp
select count(*) as 'Total Count' from Emloyee
--WQT find emp whose sal is lessthan 70000 & he is working in development
select * from Emloyee where salary<70000 and deptname='Development'
--WQT arrange all the employees in desc order of salary
select * from Emloyee order by salary desc
--WQT display emp whose sal is not in range 50000 to 60000
select * from Emloyee where salary not between 50000 and 60000 
--WQT name and designation of emp who is from Pune and Mumbai location
select empname,deptname from Emloyee where address in('Pune','Mumbai')
--WQT display all employee whoes designation contains 'e' character 
select * from Emloyee where empname like '%e%'
--top 3 record
select top 3 * from Emloyee
select top 3 * from Emloyee order by salary desc
select top 1 * from Emloyee order by salary desc
--top 2%
select top 2 percent * from Emloyee

--first 3 matching record that means it will 
--arrange in desc order then checks for the the 3 rd matching values
select top 3 with ties * from Emloyee order by salary 

--Offset is used to skip number of records
select * from Emloyee order by salary desc offset 3 rows

--featch is used to display selected number of records
select * from Emloyee order by salary desc offset 3 rows fetch next 5 rows only
select * from Emloyee order by salary desc offset 1 rows fetch next 2 rows only

create table Deptt(
did int primary key,
dname varchar(25)
)
insert into Deptt values(101,'HR')
insert into Deptt values(102,'Admin')
insert into Deptt values(103,'Development')
insert into Deptt values(104,'Finance')
insert into Deptt values(105,'Sales')
select * from Deptt
--alter table Emloyee add constraint fk_dept_emp foreign key(did) references Deptt(did)
alter table Emloyee add did int foreign key(did) references Deptt(did)
select * from Emloyee 
update Emloyee set did=1 where empid in(1,2)
update Emloyee set did=2 where empid in(3,4)
update Emloyee set did=3 where empid in(5,6)

select Emloyee.*,Deptt.*
from Emloyee 
inner join Deptt on Deptt.did=Emloyee.did




