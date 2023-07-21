create table Customer(
id int primary key,
name varchar(25),
Country varchar(25),
City varchar(25),
PostCode int
)
select 10+5 as 'result'
--40.	Add a column of type DATE called Birthday in Persons table
alter table Customer add BirthDate date
select * from Customer
insert into Customer values(1,'Vidyashree','India','Pune',416404,'1999-11-04') 
insert into Customer values(2,'Akshata','England','Lundon',112112,'1999-09-13') 
insert into Customer values(3,'Anjali','Germany','Berline',325415,'2000-12-04') 
insert into Customer values(4,'Pankaj','Norway','Oslo',146980,'1999-10-25') 
insert into Customer values(5,'Sagar','France','Paris',416785,'2000-06-05') 
--.1.Write a statement that will select the City column from the Customers table
select city from Customer
--2.	Select all the different values from the Country column in the Customers table.
select distinct Country from Customer
--3.	Select all records where the City column has the value "London
select * from Customer where city='Lundon'
--4.	Use the NOT keyword to select all records where City is NOT "Berlin".
select * from Customer where not city='Berline'

--5.	Select all records where the CustomerID column has the value 5.
select * from Customer where id=5

--6.	Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 325415.
select * from Customer where city='Berline'and PostCode=325415

--7.	Select all records where the City column has the value 'Berlin' or 'London'.
select * from Customer where city='Berline' or city='Lundon'

--8.	Select all records from the Customers table, sort the result alphabetically by the column City.
select * from Customer order by City 

--9.	Select all records from the Customers table, sort the result reversed alphabetically by the column City.
select * from Customer order by City desc

--10.	Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City
select * from Customer order by Country,City

--11.	Select all records from the Customers where the PostalCode column is empty.
select * from Customer where PostCode is  null

--12.	Select all records from the Customers where the PostalCode column is NOT empty.
select * from Customer where PostCode is not null

--13.	Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".
update  Customer set City='Osloo' where Country='Norway'

--14.	Delete all the records from the Customers table where the Country value is 'Norway'.
delete from Customer where Country='Norway'

--20.	Select all records where the value of the City column starts with the letter "a".
select * from Customer where City like 'a%'

--21.	Select all records where the value of the City column ends with the letter "a".
select * from Customer where City like '%a'

--22.	Select all records where the value of the City column contains the letter "a".
select * from Customer where City like '%a%'

--23.	Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
select * from Customer  where City like 'a%b'

--24.	Select all records where the value of the City column does NOT start with the letter "a".
select * from Customer where City not like '%a'

--25.	Select all records where the second letter of the City is an "a".
select * from Customer where City like '_a%'

--26.	Select all records where the first letter of the City is an "a" or a "c" or an "s".
select * from Customer where City like '[acs]%'

--27.	Select all records where the first letter of the City starts with anything from an "a" to an "f".
select * from Customer where City like '[a-f]%'

--28.	Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
select * from Customer where City not like '[acf]%'

--29.	Use the IN operator to select all the records where the Country is either "Norway" or "France".
select * from Customer where Country in('Germany','France')

--30.	Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
select * from Customer where Country not in('Germany','France')

--34.	When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
select 'PostCode' as 'Pno' 

--35.	When displaying the Customers table, refer to the table as Consumers instead of Customers.
select 'Customer' as 'Cosumner'

--36.	List the number of customers in each country.

--37.	List the number of customers in each country, ordered by the country with the most customers first.


--41.	Delete the column Birthday from the Persons table
alter table Customer drop column BirthDate

create table Product(
id int,
Price int,
ProductName varchar(25)
)
insert into Product values(1,5,'Geitost')
insert into Product values(2,52,'Pavlova')
insert into Product values(3,15,'Khari')
insert into Product values(4,35,'BunPav')
insert into Product values(5,18,'BIscuit')
truncate table Product

--15.	Use the MIN function to select the record with the smallest value of the Price column.
select min(Price) as 'Min Price' from Product

--16.	Use an SQL function to select the record with the highest value of the Price column.
select max(Price) as 'Max Price' from Product

--17.	Use the correct function to return the number of records that have the Price value set to 15
select * from Product where Price=15

--18.	Use an SQL function to calculate the average price of all products.
select avg(Price) as 'avg Price' from Product

--19.	Use an SQL function to calculate the sum of all the Price column values in the Products table
select sum(Price) as 'sum Price' from Product

--31.	Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20
select * from Product where Price between 10 and 20

--32.	Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.
select * from Product where Price not between 10 and 20

--33.	Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'
select * from Product where ProductName between 'Geitost' and 'Pavlova' order by ProductName desc 

--38.	Write the correct SQL statement to create a new database called testDB.
create table testDB(
id int,
name varchar(20)
)
select * from testDB

--39.	Write the correct SQL statement to delete a database named testDB
drop table testDB
