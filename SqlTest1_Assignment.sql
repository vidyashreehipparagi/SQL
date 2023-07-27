create table Author(
AuthorId int primary key,
author_Name varchar(30),
Ph_NO int,
email varchar(25),
address varchar(25),
city varchar(25)
)
insert into Author values(1,'Chetan Bhagat',789563210,'chetan@gmail.com','Viman Nagar','Mumbai')
insert into Author values(2,'Sham Surve',7895698,'shamgmail.com','Vishal Nagar','Pune')
insert into Author values(3,'Soma Mohite',689563252,'soma@gmail.com','Karve Nagar','Pune')
insert into Author values(4,'Reena Sharma',889453210,'reena@gmail.com','Hanuman Nagar','Sangli')
insert into Author values(5,'Dr.Ranganathan',665653210,'ranganathan@gmail.com','Ramarao nagar','Mumbai')
select * from Author


sp_help Author

create table Book(
BookId int primary key,
BookName varchar(25),
AuthorId int foreign key(AuthorId) references Author(AuthorId),
Price int,
PublisherDate Date
)
insert into Book values(1,'Diary of Ann Frank',1,201,'2020-10-12')
insert into Book values(2,'Indian History',2,250,'2020-11-11')
insert into Book values(3,'Indian Economy',3,100,'2020-12-10')
insert into Book values(4,'Science and Technology',1,250,'2020-10-09')
insert into Book values(5,'Environmental Studies',4,500,'2020-09-08')
insert into Book values(6,'Indian Geography',5,450,'2020-08-07')
insert into Book values(7,'General Studies',4,150,'2020-07-06')
insert into Book values(8,'Mental ability',2,201,'2020-10-12')
insert into Book values(9,'Mental ability',3,200,'2020-10-12')

select * from Book
sp_help Book
create table AwardMaster(
AwardTypeId int primary key,
Award_Name varchar(25),
Award_Price varchar(25))
insert into AwardMaster values(101,'Dnyanpeeth','11 lack')
insert into AwardMaster values(102,'ABC','10k')
insert into AwardMaster values(103,'bcd','20k')
insert into AwardMaster values(104,'Padmabhooshan','1 lack') 
insert into AwardMaster values(105,'Padmashree','2lack ')
select * from AwardMaster
sp_help AwardMaster
create table Award
(
AwardId int,
AwardTypeId int foreign key(AwardTypeId) references AwardMaster(AwardTypeId),
AuthorId int foreign key(AuthorId) references Author(AuthorId),
BookId int foreign key(BookId) references Book(BookId),
Years int)
insert into Award values(1,101,1,1,2020)
insert into Award values(2,102,2,5,2021)
insert into Award values(3,103,3,2,2022)
insert into Award values(4,104,4,3,2023)
insert into Award values(15,105,1,4,2019)
select * from Author
select * from Book
select * from AwardMaster
select * from Award


sp_help Award

--1.	Write a query to show book name , author name and award name for all books which has received any award. 
select b.BookName,a.author_Name,aw.Award_Name from Book b  
inner join Award am on b.BookId=am.BookId 
inner join Author a on b.AuthorId=a.AuthorId 
inner join AwardMaster aw on aw.AwardTypeId=am.AwardTypeId

------------------------------------------------------------------------------------------------------------------------------
         
--2.	Write a query to update author name of authors whose book price is > 100. Prefix author name with ‘Honourable’ .
 UPDATE Author SET 
 author_name = CONCAT('Honourable ', author_name)
 WHERE AuthorId IN
 (
    SELECT AuthorId
    FROM Book
    WHERE Price > 100)


------------------------------------------------------------------------------------------------------------------------------

--3.	Write a query to display authors and number of books written by that author.
--Show author who has written maximum books at the top. 
     select top (1) a.author_Name,count(*) from Author a join Book b on  a.AuthorId=b.AuthorId
	 group by a.author_Name
------------------------------------------------------------------------------------------------------------------------------
--4.	Write a query to select book name with 5 th highest price.
select  * from Book order by Price desc offset 4 rows fetch next 1 rows only

------------------------------------------------------------------------------------------------------------------------------

--5.	Select list of books which have same price as book ‘Diary of Ann Frank’.
select BookName from Book where price in(select price from Book where BookName='Diary of Ann Frank')
------------------------------------------------------------------------------------------------------------------------------


--6.	Increase price of all books written by Mr. Chetan Bhagat by 20%.
update  b  set b.Price=b.Price+(b.Price*0.2 )from book b
 join author a  on
b.AuthorId=a.AuthorId where a.author_Name='Soma Mohite'
update Book set Price=Price+Price*0.2 where AuthorId 
in(select AuthorId from Author where author_Name='Soma Mohite')

------------------------------------------------------------------------------------------------------------------------------

--7.	Show award names and number of books which got these awards. 
select award_name,count(*) from AwardMaster m,book b,award a
where m.AwardTypeId=a.AwardTypeId and a.BookId=b.BookId group by Award_Name;
------------------------------------------------------------------------------------------------------------------------------


--8.	Delete all books written by ‘Chetan Bhagat’ 
delete from Book where AuthorId in (select AuthorId from Author where author_Name='Chetan Bhagat')
------------------------------------------------------------------------------------------------------------------------------

--join
delete b  from book b,Author a where 
a.AuthorId=b.AuthorId and a.author_Name='Sham Surve';

sp_help award;
alter table award drop constraint FK__Award__BookId__3F466844

alter table award add constraint bid_FK foreign key(BookId) references book(bookId)
on delete cascade on update cascade;
------------------------------------------------------------------------------------------------------------------------------

--9.	Create view to show name of book and year when it has received award. 
create view GetByBookYear
as
select b.BookName,am.Years from Book b  
inner join Award am on b.BookId=am.BookId 

select * from GetByBookYear
------------------------------------------------------------------------------------------------------------------------------

--10.	Create trigger to ensure min price of any book must be Rs. 100. 

--11.	Increase price of book by 10% if that book has received any award.
update Book set Price=Price+Price*0.1 where BookId in( select BookId from Award where AwardId is not null)
select * from Book
------------------------------------------------------------------------------------------------------------------------------

--12.	Show names of author and number of books written by that Author.

select a.author_Name,COUNT(b.BookId) as 'number of books'
from Author a join Book b
on a.AuthorId=b.AuthorId
group by a.author_Name
------------------------------------------------------------------------------------------------------------------------------

--13.	Show names of authors whose books are published before year 2020.
select author_Name from Author where AuthorId in(select AuthorId from Book where PublisherDate <2020)
------------------------------------------------------------------------------------------------------------------------------


--14.	Show name of books which has published within 1 year after 15 August 2020.
select BookName from Book where PublisherDate between '2020-08-16' and '2021-08-15'
------------------------------------------------------------------------------------------------------------------------------

--15.	Delete all authors whose no book is published in year 2020.
sp_help award
alter table award drop constraint FK__Award__AwardType__3D5E1FD2

alter table award add constraint aid_FK foreign key(AuthorId) references Author(AuthorId)
on delete cascade on update cascade;
delete  from  Author  where AuthorId in(select AuthorId from Book where PublisherDate between '2020-01-01' and '2020-12-31')