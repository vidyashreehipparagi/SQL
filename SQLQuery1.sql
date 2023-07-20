--create database DPLaskya
--create database Test

--use Test
--drop database Test
create table Employee
(
id int,
empname varchar(25),
salary numeric(12,2)
)
sp_help Employee

--alter is used to modify schema
alter table Employee add Qualification varchar(10)

--to modify column
alter table Employee alter column Qualification varchar(15)
--to delete colum.n
alter table Employee drop column Qualification

--rename column
sp_rename 'Employee.salary','empsalary'

sp_help Employee

alter table Employee alter column empname varchar(25) not null
alter table Employee alter column empsalary numeric(12,2) not null
alter table Employee alter column id int not null

alter table Employee add email varchar(40) not null unique
alter table Employee add constraint un_emp unique(email)

--unique for multiple column 
alter table Employee add constraint un_emp unique(id,email)
alter table Employee drop constraint un_emp

Create table Student
(
id int,
name varchar(30),
constraint pk_stud primary key(id)
)
alter table Employee add constraint pk_emp primary key(id)
 alter table Employee drop constraint pk_emp
 alter table Employee add id int primary key