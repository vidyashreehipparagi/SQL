create table Provience_Names(
Provience_Id int primary key,
Provience_Name varchar(30)
)
insert into Provience_Names values(1,'Madras')
insert into Provience_Names values(2,'Bombay')
insert into Provience_Names values(3,'Madras')
insert into Provience_Names values(4,'Kolkatta')
insert into Provience_Names values(5,'Madras')
select * from Provience_Names





create table patients(
patient_id int primary key,
First_Name  varchar(20),
Last_Name varchar(20),
Gender varchar(10),
BirthDate varchar(20),
City varchar(25),
Provience_Id int foreign key(Provience_Id) references Provience_Names(Provience_Id),
Allergies varchar(30),
Height decimal(3,0),
Weights Decimal(4,0)
)
select * from
insert into patients values(101,'Vidyashree','Hipparagi','F','01/01/2000','Sangli',2,'Hay Fever',5.6,55)
insert into patients values(102,'Akshata','Sabne','F','13/07/1999','Latur',1,'Pet Allergy',5.4,45)
insert into patients values(103,'Sagar','Kawade','M','01/12/2000','Solapur',3,'Dust Allergy',5.7,57)
insert into patients values(104,'Anjali','Buddhe','F','12/04/1997','Beed',4,'Food Allergy',5.5,50)
insert into patients values(105,'Pankaj','Daundakar','M','02/11/1991','Pune',1,'Pollean Allergy',6,65)
insert into patients values(106,'Shruti','Desai','M','02/11/1991','Pune',1,null,5.4,40)
insert into patients values(107,'Harish','Hipparagi','M','24/04/2023','Satara',2,'Penicillin',4,35)
insert into patients values(108,'Prajakta','Gholape','F','30/04/1999','Kolhapur',1,'Morphine',4,15) 
insert into patients values(109,'Shruti','Desai','M','02/11/1991','Pune',1,null,5.4,40)

select * from patients

create table doctors(
docid int primary key,
f_name varchar(10),
l_name varchar(10),
speciality varchar(25)
)
alter table doctors add constraint pk_did  primary key(docid)


insert into doctors values(11,'Siddhart',' Mukherjee','Biologist')
insert into doctors values(12,'Devi','Shetty','Cardiologist')
insert into doctors values(13,'Surabi','Anand','Dermatologist')
insert into doctors values(14,'Aditya','Gupta','gynecologist')
insert into doctors values(15,'Mohamed','Rela','Neurologist')

create table admissions(
 patient_id int constraint pid_fk foreign key(patient_id) references patients(patient_id),
 ad_date varchar(20),
 dis_date varchar(20),
 diagnosis varchar(50),
 docid int foreign key(docid) references doctors(docid)
 )

 insert into admissions values(101,'01/06/2022','06/06/2022','Fever',11)
 insert into admissions values(102,'11/06/2022','16/06/2022','Cough',12)
 insert into admissions values(103,'21/11/2021','26/11/2021','Pain',15)
 insert into admissions values(104,'12/08/2022','18/08/2022','CBC',14)
 insert into admissions values(105,'05/07/2023','15/07/2023','Hiboglobin',13)
 --1.	Show the first name, last name and gender of patients who’s gender is ‘M’
 select First_Name,Last_Name,Gender from Patients where Gender='M'
 -----------------------------------------------------------------------------------------------------------------------------
--2.	Show the first name & last name of patients who does not have any allergies
select First_Name,Last_Name from Patients where Allergies is  null
 -----------------------------------------------------------------------------------------------------------------------------

--3.	Show the patients details that start with letter ‘V’
select * from patients where First_Name like 'V%'
 -----------------------------------------------------------------------------------------------------------------------------

--4.	Show the patients details that height range 5.5 to 6
select * from patients where Height between 5.5 and 6
 -----------------------------------------------------------------------------------------------------------------------------

--5.	Update the patient table for the allergies column. Replace ‘NKA’ where allergies is null
update patients set Allergies='NKA' where Allergies is null
 -----------------------------------------------------------------------------------------------------------------------------

--6.	Show how many patients have birth year is 2000
select count(*) from patients where BirthDate between '01/01/1999' and '31/01/2000'
 -----------------------------------------------------------------------------------------------------------------------------

--7.	Show the patients details who have greatest height
select * from patients where Height=(select MAx(Height) as 'Max Height' from patients)
select top 1 * from patients order by Height desc
 -----------------------------------------------------------------------------------------------------------------------------

--8.	Show the total amount of male patients and the total amount of female patients in the patients table.
select Gender,COUNT(*) from patients group by Gender
 -----------------------------------------------------------------------------------------------------------------------------

--9.	Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
select First_Name,Last_Name,Allergies from patients where Allergies='Penicillin' or Allergies='Morphine' order by First_Name,Last_Name
 -----------------------------------------------------------------------------------------------------------------------------

--10.	Show first_name, last_name, and the total number of admissions attended for each doctor
.--Every admission has been attended by a doctor.
select c.f_name, c.l_name, count(b.patient_id) as 'admissions_total'
from admissions b, doctors c
WHERE 
b.docid = c.docid
group by c.f_name, c.l_name
-----------------------------------------------------------------------------------------------------------------------------
--11.	For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.
 select p.First_Name,p.Last_Name,a.diagnosis,d.f_name,d.l_name
 from patients p 
 join admissions a on a.patient_id=p.patient_id
 join doctors d on d.docid=a.docid
 select ad_date from admissions
 -----------------------------------------------------------------------------------------------------------------------------
 select * from patients
 select * from doctors
 select * from admissions
 




