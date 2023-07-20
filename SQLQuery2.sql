create table Book(
Bookid int,
BoookName varchar(20) not null,
AuthorId int primary key,
price float
)
sp_help Book
--Author Table
create table Author(
AuthorId int foreign key(AuthorId) references Book(AuthorId),
AuthorName varchar(25) not null,
PhoneNo int unique,
Email varchar(20) unique,
Address varchar(20) not null,
City varchar(15) not null
)
sp_help Author
--Award Table
create table Award(
Awardid int unique,
AwardTypeId int primary key,
AuthorId int,
constraint fk_aw_au foreign key(AuthorId) references Book(AuthorId)
)
alter table Award add constraint fk_aw_au foreign key(
sp_help Award


