--create database SEDCACADEMYDB
use SEDCACADEMYDB

create table dbo.Student(
Id int Identity (1,1),
FirstName nvarchar (30) not null,
LastName nvarchar (30) not null,
DateOfBirth date not null,
EnrolledDate date not null,
Gender nchar (10) not null,
NationalIdNumber int not null,
StudentCardNumber smallint Null
)

create table dbo.Course(
Id int Identity (1,1),
[Name] nvarchar (30) not null,
Credit int not null,
AcademicYear smallint not null,
Semester smallint not null,
)

create table dbo.Teacher(
Id int Identity (1,1),
FirstName nvarchar (30) not null,
LastName nvarchar (30) not null,
DateOfBirth date not null,
Academicrank nvarchar (100) not null,
HireDate date not null,
)

create table dbo.GradeDetais(
Id int Identity (1,1),
GradeId int not null,
AchievmentTypeId int not null,
AchievmentPoints int not null,
AchievmentMaxPoints int not null,
AchievmentDate date not null,
)

create table dbo.Grade(
Id int Identity (1,1),
StudentId int not null,
CourseId int not null,
TeacherId int not null,
Grade smallint not null,
Comment nvarchar (MAX) Null,
CreatedDate date not null
)

create table dbo.AchievementType (
Id int Identity (1,1),
[Name] nvarchar (30) not null,
[Description] nvarchar (MAX) Null,
ParticipationRate int Null
)