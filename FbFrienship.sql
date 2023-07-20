--FBUSER TABLE
create table FBUser(
userid int primary key,
username varchar(10) unique,
email varchar(20) unique,
PhoneNum int unique,
totalposts int
)

--POST TABLE--
create table post(
postId int primary key,
userid int foreign key(userid) references FBUser(userid),
postContent varchar(10),
postImage int,
postVideo int
)
--FRIENSHIP TABLE--
create table friendshp(
userid int foreign key(userid) references FBUser(userid),
friendId int,
FrienshipStatusCode int
)

--FRIENSHPSTATUS TABLE--
create table friendshipStatus(
Statusode int,
status varchar(10)
)

sp_help FBUser
sp_help post
 sp_help friendshp
 sp_help friendshipStatus