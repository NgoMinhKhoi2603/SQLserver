create table Classes(
	Code varchar(20) primary key,
	Name varchar(255) not null unique,
	Room int,
	SubjectCode varchar(20) not null foreign key references Subjects(Code)
);

create table Results(
	ID int primary key identity(1,1),
	Point int not null check(Point >= 0 and Point <= 10) default 0,
	Result varchar(255) not null check(Result in (N'Yếu',N'Trung Bình',N'Khá',N'Giỏi',N'Xuất Sắc')),
	StudentCode varchar(20) not null foreign key references Students(Code)
);

create table Students(
	Code varchar(20) primary key,
	Name varchar(255) not null,
	Birthday date not null check(Birthday < getdate()),
	ClassesCode varchar(20) foreign key references Classes(Code)
);

create table StudentSubject(
	StudentCode varchar(20) foreign key references Students(Code) not null,
	SubjectCode varchar(20) foreign key references Subjects(Code) not null
);

create table Subjects(
	Code varchar(20) primary key,
	Name varchar(255) not null unique
);