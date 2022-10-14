create table Customers(
	Id int primary key identity(1,1),
	Name nvarchar(255) not null,
	Address nvarchar(255) not null,
	PhoneNumber int unique not null
);

create table Orders(
	Code int primary key,
	Date date not null check(Date <= getdate()),
	CustomerId int foreign key references Customers(Id)
);

create table Goods(
	Id int primary key identity(1,1),
	Name nvarchar(255) not null,
	Description ntext not null,
	Unit nvarchar(255) not null,
	Price int not null
);

create table OrderGoods(
	OrderCode int foreign key references Orders(Code),
	GoodId int foreign key references Goods(Id)
);