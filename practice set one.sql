create table author(
authorid int primary key,
name varchar(25) not null,
country varchar(25) unique
)
sp_help author
create table Category(
categoryid int primary key

)
alter table Category add Description varchar(10)
sp_help Category


create table Books(
bookid int primary key,
title varchar(25) unique,
authorid int,
constraint fk_auth_book foreign key(authorid) references author(authorid),
catergoryid int foreign key(catergoryid) references Category(categoryid),
year int,
price float,
publisher varchar(20),
rating int
)
alter table Books alter column rating int not null
sp_help Books

create table Order_Details(
orderno int primary key,
bookid int foreign key(bookid) references Books(bookid),
quantity int not null
)
sp_help Order_Details