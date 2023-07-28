create table Product(
id int,
pname varchar(20)
)
select * from Product
insert into Product values(1,'Pen')
insert into Product values(2,'Book')
insert into Product values(3,'Pencile')
alter table Product add Price int
update  Product set Price=200 where id in(1,2)
create table TraceProduct(
id int primary key identity(1,1),
description varchar(200)
)
select * from TraceProduct
create trigger tr_Product_Insert
on Product after insert 
as begin
declare @id int;
declare @pname varchar(20);
declare @price int;
select @id=id,@pname=pname,@price=Price from inserted
insert into TraceProduct values('new record add'+cast(@id as varchar)+'name='+@pname+'Price='+cast(GETDATE()as varchar))
end
insert into Product values(4,'Eraser',255)

---------------------delete--------------------
create trigger tr_Product_Delete1
on Product after delete 
as begin
declare @id int;
declare @pname varchar(20);
declare @price int;
select @id=id,@pname=pname,@price=Price from deleted
insert into TraceProduct values('new record add'+cast(@id as varchar)+'name='+@pname+'Price='+cast(GETDATE()as varchar))
end
delete from Product where id=3







