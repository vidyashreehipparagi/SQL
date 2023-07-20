--MOVIES TABLE-->
create table Movies(
MoviesId int primary key,
MovieName varchar(20) unique,
ReleaseYear varchar(20) not null,
BoxOfficeCollection int
)
--ROlesTABLE--
create table Roles(
RollId int primary key,
RollName varchar(15) not null
)

--CELEBRITY TABLE--
create table Celebrity(
celebrityId int primary key,
celebrityName varchar(20),
Birthdate int not null,
PhoneNum int unique,
Email varchar(20) unique
)

--BOLLYWOOD DATA TABLE--
create table BollyWoodData(
BollywoodDataId int primary key,
celebrityId int foreign key(celebrityId) references Celebrity(celebrityId),
MoviesId int foreign key(MoviesId) references Movies(MoviesId),
RollId int foreign key(RollId) references Roles(RollId)
)
sp_help Movies
sp_help Roles
sp_help Celebrity
sp_help BollyWoodData