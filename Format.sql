--Countries table
create table Countries(
countryId int primary key,
CountryName varchar(20),
)

--FORMAT TABLE--
create table Formats1(
formatId int primary key,
FormatName varchar(20) not null
)

--BATSMAN TABLE--
create table Batsman(
PlayerId int primary key,
PlayerName varchar(20) not null,
Age int,
countryId int foreign key(countryId) references Countries(countryid),
totalruns int,
total50s int,
total100s int,
PlayerGrade int
)
--B_F_MAPPING TABLE--
create table B_F_Mapping(
id int,
PlayerId int foreign key(PlayerId) references Batsman(PlayerId),
formatId int foreign key(formatId) references Formats1(formatId)
)

sp_help Countries
sp_help Formats
sp_help Batsman
sp_help B_F_Mapping