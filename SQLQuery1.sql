create table Students(
	Code varchar(20) primary key,
	Name varchar(255),
	Birthday date,
	ClassesCode varchar(20) foreign key references Classes(Code)
);

create table Results(
	ID int primary key,
	Point int,
	Result varchar(255),
	StudentCode varchar(20) foreign key references Students(Code)
);

create table Classes(
	Code varchar(20) primary key,
	Name varchar(255),
	Room int,
	SubjectCode varchar(20) foreign key references Subjects(Code)
);

create table Subjects(
	Code varchar(20) primary key,
	Name varchar(255)
);

create table StudentSubject(
	StudentCode varchar(20) foreign key references Students(Code),
	SubjectCode varchar(20) foreign key references Subjects(Code)
);