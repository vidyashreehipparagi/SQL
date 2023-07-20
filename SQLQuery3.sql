create table Book
(
id int primary key,
bookname varchar(20) not null,
authorname varchar(20) not null,
price numeric(12,2) not null
)
sp_help Book

create table Dept(
did int primary key,
dname varchar(20) not null,
)
create table Emp(
eid int primary key,
ename varchar(25) not null,
did int,
constraint fk_dept_emp foreign key(did) references  Dept(did)
)
sp_help Dept
sp_help Emp

--alter table Emp add constraint fk_dept_emp foreign key(did) references  Dept(did)

create table Users(
userid int primary key,
username varchar(20) not null
)
create table Product(
pid int primary key,
pname varchar(20) not null
)
create table Orders(
oid int primary key,
userid int foreign key(userid) references Users(userid),
pid int foreign key(pid) references Product(pid)
)

sp_help Orders
