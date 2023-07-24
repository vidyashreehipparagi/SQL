create table Customers
(
customerid int primary key,
customername varchar(30),
age int,
city varchar(20),
state varchar(20),
dob date)


insert into Customers values(1,'Pratik',22,'Pune','Maharashtra','1998-1-1')
insert into Customers values(2,'Pankaj',21,'Pune','Maharashtra','1998-1-1')
insert into Customers values(3,'Anjali',23,'Nashik','Maharashtra','1998-1-1')
insert into Customers values(4,'Kishor',21,'Surat','Gaujrat','1998-1-1')
insert into Customers values(5,'Parth',30,'Noida','UP','1998-1-1')

create table Orderstatus(
statusid int primary key,
statusname varchar(20)
)
insert into Orderstatus values(1,'Order')
insert into Orderstatus values(2,'Shipped')
insert into Orderstatus values(3,'Delivered')


create table Orders
(
orderid int primary key,
customerid int,
statusid int,
orderdate date,
shippeddate date,
deliverydate date
)
--alter table Orders  add statusid int foreign key(statusid) references Orderstatus(statusid)

insert into Orders values(101,1,1,null,null,null)
insert into Orders values(102,2,2,'2023-07-01',null,null)
insert into Orders values(103,3,2,'2023-07-01',null,null)
insert into Orders values(104,4,1,'2023-07-01','2023-07-02',null)
insert into Orders values(105,5,3,'2023-07-02','2023-07-03',null)
insert into Orders values(106,6,1,'2023-07-02','2023-07-04','2023-07-10')
insert into Orders values(107,2,2,'2023-07-03','2023-07-04','2023-07-11')
insert into Orders values(108,3,3,'2023-07-04','2023-07-06','2023-07-18')
insert into Orders values(109,3,2,'2023-07-05','2023-07-06','2023-07-18')
insert into Orders values(110,2,1,null,'2023-07-05','2023-07-11')
insert into Orders values(111,2,3,'2023-07-10','2023-07-11','2023-07-19')
insert into Orders values(112,3,1,'2023-07-10','2023-07-12','2023-08-01')
insert into Orders values(113,5,2,'2023-07-10','2023-07-13','2023-07-21')
insert into Orders values(114,1,1,'2023-07-10','2023-07-14','2023-07-25')
insert into Orders values(115,2,3,'2023-07-10','2023-07-15','2023-07-28')
truncate table Orders


select * from Customers
select * from Orderstatus
select * from Orders
select c1.*, o1.*
from Customers c1
inner join Orders o1 on o1.customerid=c1.customerid
select c1.*, o1.*
from Customers c1
right join Orders o1 on o1.customerid=c1.customerid
select c1.*, o1.*
from Customers c1
left join Orders o1 on o1.customerid=c1.customerid
select c1.*, o1.*
from Customers c1
full join Orders o1 on o1.customerid=c1.customerid


