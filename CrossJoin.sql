create table BreakFast(
 Bname varchar(25)
)
insert into BreakFast values('Dosa') 
insert into BreakFast values('Idli') 
insert into BreakFast values('Vadapao') 
insert into BreakFast values('Misal') 
insert into BreakFast values('Poha') 


create table SoftDrinks(
Sname varchar(25)
)
insert into SoftDrinks values('Tea')
insert into SoftDrinks values('Coffee')
insert into SoftDrinks values('Milk')
insert into SoftDrinks values('Juice')
insert into SoftDrinks values('Green Tea')

select * from BreakFast cross join SoftDrinks

