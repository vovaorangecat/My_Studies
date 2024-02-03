CREATE TABLE cooluniversity.Universities(
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`UniName` VARCHAR(20) NOT NULL,
`City` VARCHAR(20) NULL,
PRIMARY KEY(`id`));

INSERT INTO cooluniversity.Universities(id, UniName, City) VALUES
(1, "ДУЕТ", "Кривий Ріг"),
(2, "КНУ", "Кривий Ріг"),
(3, "НУЛП", "Львів"),
(4, "КНУ", "Київ"),
(5, "СумДУ","Суми"),
(6, "КШЕ", "Київ");

SELECT * FROM cooluniversity.universities;

CREATE TABLE cooluniversity.Faculties(
`FacultiesId` int primary key not null auto_increment,
`Name` VARCHAR(50) NOT NULL,
UniversityId int UNSIGNED NOT NULL,
foreign key (UniversityId) references Universities (id)
);
INSERT INTO Faculties (Name, UniversityId) VALUES
	("Факультет інформаційних технологій",1),
    ("Економічний факультет", 2),
    ("Гірничо металургійний факультет",3),
    ("Електротехнічний факультет",4),
    ("Факультет управління бізнесом",5),
    ("Будівельний факультет",6);
    
    
SELECT * FROM cooluniversity.faculties;

CREATE TABLE cooluniversity.GroupsX(
`GroupId` int primary key not null auto_increment,
GroupNumber int,
FacultyId int UNSIGNED NOT NULL,
foreign key (FacultyId) references Faculties (UniversityId)
);
INSERT INTO Groupsx (GroupNumber, FacultyId) VALUES
(121, 1),
(145, 1),
(202, 2),
(205,2),
(312,3),
(395,3),
(411,4),
(422,4),
(555,5),
(504,5),
(630,6),
(685,6);


CREATE TABLE cooluniversity.Students(
`StudentsId` int primary key not null auto_increment,
Name varchar(20) not null,
Surname varchar(20) not null,
Age int,
GroupId int UNSIGNED NOT NULL,
foreign key (GroupId) references GroupsX (FacultyId)
);

INSERT INTO Students (Name, Surname, Age, GroupId) VALUES
("Володимир","Косяк",20,1),
("Іван", "Іванов", 20, 3),
("Грещук", "Олексій", 25,3),
("Лукач", "Левко",28,2),
("Білоус", "Щастислав",21,4),
("Мойбенко", "Кирило",26,2),
("Мироненко", "Острозора",22,5),
("Каплун", "Шушана", 31,1),
("Довгодько", "Юліанна",24,6),
("Бованенко", "Яніна",25,2),
("Романько", "Любослава",28,3),
("Гавриляк", "Емілія",27,1);

SELECT * FROM cooluniversity.universities

SELECT Name, Surname FROM cooluniversity.students

SELECT * FROM cooluniversity.students WHERE Name = 'Іван'

SELECT * FROM cooluniversity.groupsx WHERE  GroupNumber >300

SELECT * FROM cooluniversity.universities WHERE UniName LIKE '%У%'

SELECT COUNT(*) FROM universities
SELECT COUNT(*) FROM students
SELECT COUNT(*) FROM groupsx
SELECT COUNT(*) FROM faculties

SELECT Count(Surname) FROM Students WHERE Surname LIKE '%І%'
SELECT Min(GroupNumber) FROM groupsx
SELECT Max(Age) From Students
SELECT MAX(Age) FROM Students WHERE Surname LIKE '%І%'
SELECT AVG(Age) FROM Students
SELECT SUM(GroupNumber) FROM groupsx

SELECT AVG(Age) FROM Students

SELECT Count(Age), Age FROM students Group by Age

SELECT Count(Age), Age FROM students Group by Age HAVING Age >=25

SELECT Count(Age), Age, Name FROM students Group by Age HAVING Name LIKE '%в%'

SELECT * FROM cooluniversity.students ORDER BY Name ASC
SELECT * FROM cooluniversity.students ORDER BY Name DESC 
SELECT * FROM cooluniversity.students ORDER BY Surname 
SELECT * FROM cooluniversity.students ORDER BY Surname DESC
SELECT * FROM cooluniversity.students ORDER BY Surname ASC

SELECT * FROM cooluniversity.students ORDER BY Age ASC
SELECT * FROM cooluniversity.students ORDER BY Age DESC

SELECT * FROM cooluniversity.students ORDER BY Age LIMIT 5

SELECT * FROM cooluniversity.students ORDER BY Age LIMIT 5 OFFSET 1

SELECT * FROM groupsx JOIN students ON groupsx.GroupId = students.GroupId

SELECT Students.Name, Students.Surname,Students.Age, GroupsX.GroupNumber FROM Students 
JOIN GroupsX ON Students.GroupId = GroupsX.GroupId WHERE Students.Age > 22;
