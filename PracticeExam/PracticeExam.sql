-- 2
create table Categories(
	CateID char(6) primary key,
	CateName nvarchar(100) not null,
	Description nvarchar(200)
);

create table Parts(
	PartID int primary key identity(1,1),
	PartName nvarchar(100) not null,
	CateID char(6) foreign key references Categories(CateID),
	Description nvarchar(1000),
	Price money not null default 0,
	Quantity int default 0,
	Warranty int default 1,
	Photo nvarchar(200) default 'photo/nophoto.png'
);

-- 3
insert into Categories(CateID,CateName,Description)
values('AAA',N'RAM',N'RAM là bộ nhớ tạm của máy giúp lưu trữ thông tin hiện hành để CPU có thể truy xuất và xử lý.'),
('BBB',N'CPU',N'CPU là bộ xử lý trung tâm'),
('CCC',N'HDD',N'HDD là ổ cứng truyền thống');

insert into Parts(PartName,CateID,Description,Price,Quantity,Warranty,Photo)
values(N'HDD Seagate Barracuda 1TB 7200rpm','CCC',N'Ổ cứng dung lượng lớn, giá rẻ',20,100,12,N'https://product.hstatic.net/1000026716/product/hdd_seagate_gearvn.jpg'),
(N'Intel Core i3-10105','BBB',N'Hiệu năng tốt so với giá thành',110,200,36,N'https://anphat.com.vn/media/product/37652_10105_2.jpg'),
(N'Ram Kingston Hyper 8gb- DDr4- Bus 2666','AAA',N'RAM đời mới',25,50,24,N'https://duyhungpc.com/uploads/files/ram%20kington%208G.jpg');

-- 4
select * from Parts where Price > 100;

-- 5
select * from Parts where CateID in (select CateID from Categories where CateName like '%CPU%');

-- 6
create view v_Parts as
select A.PartID, A.PartName, B.CateName, A.Price, A.Quantity from Parts A
inner join Categories B on A.CateID=B.CateID;

-- 7
create view v_TopParts as
select top 5* from Parts order by Price desc;