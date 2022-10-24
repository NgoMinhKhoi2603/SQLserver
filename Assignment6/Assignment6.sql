create table Directories(
	Id int primary key identity(1,1),
	Name nvarchar(255) not null,
	Address nvarchar(255) not null,
	Birthday date not null check(Birthday <= getdate())
);

create table PhoneNumbers(
	Id int primary key identity(1,1),
	PhoneNumber varchar(255) not null unique,
	DirectoryId int not null foreign key references Directories(Id)
);

insert into Directories(Name,Address,Birthday)
values(N'Nguyễn Văn An',N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội','11/18/87');

select * from Directories;

insert into PhoneNumbers(PhoneNumber,DirectoryId)
values('987654321','1'),
('09873452','1'),
('09832323','1'),
('09434343','1');

select * from PhoneNumbers;

-- 4
select * from Directories;
select * from PhoneNumbers;
-- 5
select * from Directories order by Name asc;
select * from PhoneNumbers where DirectoryId in (select Id from Directories where Name like N'%Nguyễn Văn An%');
select * from Directories where Birthday in ('12/12/09');
-- 6
select DirectoryId,count(PhoneNumber) from PhoneNumbers group by DirectoryId;
select count(Birthday) from Directories where month(Birthday) = 12;
select * from PhoneNumbers a
left join Directories b on a.DirectoryId=b.Id;
select * from Directories where Id in (select DirectoryId from PhoneNumbers where PhoneNumber = '123456789');
-- 7
alter table Directories add check(Birthday <= getdate());

alter table Directories add StartDay date;
-- 8
create index chi_muc_phi_vat_ly_Name on Directories(Name);
create index chi_muc_phi_vat_ly_PhoneNumber on PhoneNumbers(PhoneNumber);