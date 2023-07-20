create table Author1(
AuthorId int primary key,
AuthorName varchar(20) not null,
PhoneNo int unique,
Email varchar(15) unique,
Address varchar(25) not null,
City varchar(15)
)
--BOOK TABLE---
create table Book1(
BookId int primary key,
BookName varchar(20) not null,
AuthorId int foreign key(AuthorId) references Author1(AuthorId),
price numeric(12,2)
)

--AWARD MASTER TABLE---
create table AwardMaster(
AwardTypeId int primary key,
AwardName varchar(20) not null,
AwardPrice float
)
--AWARD TABLE--
create table Award1(
AwardId int primary key,
AwardTypeId int foreign key(AwardTypeId) references AwardMaster(AwardTypeId),
AuthorId int foreign key(AuthorId) references Author1(AuthorId),
BookId int foreign key(BookId) references Book1(BookId),
year int
)
sp_help Author1
sp_help Book1
sp_help AwardMaster
sp_help Award1