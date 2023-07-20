--Course table--
Create table Course(
cid int primary key,
cname varchar(20) not null,
subject varchar(15),
fee int,
duration int not null
)
--Student table--
create table student( 
sid int,
sname varchar primary key,
cid int foreign key(cid) references Course(cid),
phNo int unique,
email varchar unique,
paidfess int
)
---Attendance table--
create table Attendence(
NoOfAttendedStuudents int,
NoOfAbsentStudents int
)

sp_help Course
sp_help student
sp_help Attendence