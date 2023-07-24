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
alter table Emplyoee add managerid int
update  Emplyoee set managerid=1 where id in (2,3,4)
update  Emplyoee set managerid=5 where id in (6,7,8)
update  Emplyoee set managerid=9 where id in (10)

select e1.name as 'Employee name' , e2.name as 'manager name'
from Emplyoee e1
inner join Emplyoee e2 on e2.id=e1.managerid

-- display emp & their manager
select e1.name as 'Employee Name',e2.name as 'Manager Name'
from Emplyoee e1 ,Emplyoee e2
where e2.id=e1.managerid and e1.managerid=5

