create table Emplyoee(
id int primary key,
name varchar(20) not null,
email varchar(25) unique,
age int check (age>=18)
)

insert into Emplyoee values(1,'Vidyshree','Vidyashree@gmail.com',20)
insert into Emplyoee values(2,'Vidya','Vidya@gmail.com',22)
insert into Emplyoee values(3,'Anjali','Anjali@gmail.com',20)
insert into Emplyoee values(4,'Akshata','Akshata@gmail.com',22)
insert into Emplyoee values(5,'Sagar','Sagar@gmail.com',23)
insert into Emplyoee values(6,'Pankaj','Pankaj@gmail.com',20)
insert into Emplyoee values(7,'Nilesh','Nilesh@gmail.com',22)
insert into Emplyoee values(8,'Snehal','Snehal@gmail.com',22)
insert into Emplyoee values(9,'Benzeer','Benzeer@gmail.com',25)
insert into Emplyoee values(10,'Sanket','Sanket@gmail.com',18)

select * from Emplyoee

create table Emplyoee1(
id int primary key,
name varchar(20) not null,
email varchar(25) unique,
age int check (age>=18),
country varchar(20) default 'India'
)
insert into Emplyoee1 values(1,'Vidyshree','Vidyashree@gmail.com',20,'USA')
insert into Emplyoee1 values(2,'Vidya','Vidya@gmail.com',22,'USA')
insert into Emplyoee1 (id,name,email,age) values (3,'Anjali','Anjali@gmail.com',20)
insert into Emplyoee1 values(4,'Akshata','Akshata@gmail.com',22,'India')
insert into Emplyoee1 (id,name,email,age) values(5,'Sagar','Sagar@gmail.com',23)
insert into Emplyoee1 values(6,'Pankaj','Pankaj@gmail.com',20,'USA')
insert into Emplyoee1 (id,name,email,age) values(7,'Nilesh','Nilesh@gmail.com',22)
insert into Emplyoee1 (id,name,email,age) values(8,'Snehal','Snehal@gmail.com',22)
insert into Emplyoee1  values(9,'Benzeer','Benzeer@gmail.com',25,'UK')
insert into Emplyoee1 (id,name,email,age) values(10,'Sanket','Sanket@gmail.com',18)

select * from Emplyoee1

update Emplyoee1 set name='Shruti' where id=2
update Emplyoee1 set age=23 where id in(9,4,6)
update Emplyoee1 set name='Harish',email='Harish@gmail.com',age=20 where id=4

delete from Emplyoee1 where id=10
alter table Emplyoee1 add salary int
update Emplyoee1 set salary=25000 where id in(1,4,7,10)
update Emplyoee1 set salary=30000 where id in(2,5)
update Emplyoee1 set salary=27000 where id in(3,6,8)
update Emplyoee1 set salary=20300 where id in(9)

--To find unique record 
select distinct country from Emplyoee1

--Between
select * from Emplyoee1 where age between 20 and 25

--Like Clause
select * from Emplyoee1 where name like 'v%'
select * from Emplyoee1 where name like '%a'
select * from Emplyoee1 where name like  '%e%'
select * from Emplyoee1 where name like  '%[a-k]'
select * from Emplyoee1 where name like  '%[a-k]%'
select * from Emplyoee1 where name like  '[abcdefg]%'
select * from Emplyoee1 where name like  '%[abcdefg]'
select * from Emplyoee1 where name like  'V__Y_'
select * from Emplyoee1 where name like  'A_____'

--NOT LIKE---
select * from Emplyoee1 where name not like 'V%'
select * from Emplyoee1 where name not like '[abvf]%'

--IN CLAUSE--
select * from Emplyoee1 where id in(1,2)
select * from Emplyoee1 where country in('India','USA')

--NOT IN--
select * from Emplyoee1 where age not in(22,18) 

--AND OPERATOR--
select * from Emplyoee1 where name='Vidyashee' and  age=20

--OR OPERATOR--
select * from Emplyoee1 where salary=25000 or name like '%a'

--NOT Operator--
select * from Emplyoee1 where not country='India'

