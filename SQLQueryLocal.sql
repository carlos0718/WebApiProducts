create database ApiEcommerce
go
use ApiEcommerce
go


create table Category(
	Id int primary key identity(1,1),
	[Name] varchar(20) not null
)
go
create table Products(
	Id int primary key identity(1,1),
	[Name] varchar(50) not null,
	[Description] varchar(max),
	Rate int not null,
	Price decimal(10,2) not null,
	CategoryId int foreign key references Category(Id)
)
go
alter table Products 
add [Image] varchar(max) 
go
alter table Products 
add Title varchar(max) 
go
alter table Products
drop column [Name]

update Products set Title = [Name]
