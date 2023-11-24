--��2

Create table Academics
(
ID int CONSTRAINT PK_Academics Primary Key Identity,
FIO nvarchar(100),
BirthDate Date,
Spec nvarchar(30),
YearZvanie int
)

--1.	������� ���, ������������� � ���� �������� ���� ����������.
Select FIO, Spec, BirthDate From Academics

--2.	������� ����������� ���� �� ���������� �������, ������� �������� ���������� �� ���������� � ����: ������� ���� �������� ������� ������ � 1974�.
Select '� ���������� ������'=(FIO +' ������� ������ � '+ CAST(YearZvanie as nvarchar)) from Academics

--3.	������� ��� ���������� � ����������� ���� ������ 5 ��� ����� ���������� �������.
SELECT FIO, YearZvanie, '����� 5 ��� ����� ���������� ������'=(YearZvanie + 5) From Academics

--4.	������� ������ ����� ���������� ������, ����� ���������.
Select distinct YearZvanie from Academics
--5.	������� ������ ����������, ��������������� �� �������� ���� ��������.
Select FIO, BirthDate From Academics
Order by BirthDate desc

--6.	������� ������ ����������, ��������������� � �������� ���������� ������� �������������, �� �������� ���� ���������� ������, � � ���������� ������� ���.
Select Spec, YearZvanie, FIO from Academics
Order by Spec desc, YearZvanie desc, FIO 

--7.	������� ������ ������ �� ������ ����������, ���������������� � �������� ���������� ������� ���.
Select top 1 * From Academics
Order by FIO

--8.	������� ������� ���������, ������� ������ ���� ������� ������.
Select FIO from Academics
WHERE  YearZvanie = (Select MIN(YearZvanie) FROM Academics)

--9.	������� ������ 10% ����� �� ������ ����������, ���������������� � ���������� ������� ���.
Select top 10 percent * From Academics
Order by FIO Desc

--10.	������� �� ������� ����������, ��������������� �� ����������� ���� ���������� ������, ������ ����������, � ������� ��� ���������� ������ � ���� �� ������ ���� � ��������������� �������.
Select * From Academics
where YearZvanie IN (Select distinct top 5 YearZvanie From Academics Order by YearZvanie)
Order by YearZvanie

--11.	�������, ������� � ��������, ������ ����������, ��������������� �� ����������� ���� ��������.
Select * From Academics
Order by BirthDate offset 9 rows

--12.	������� ������� � ������� ������ �� ������ ����������, ���������������� � ���������� ������� ���.
Select * From Academics
Order by FIO Offset 8 rows
Fetch next 2 rows only

--��3
Create table Country
(
ID int CONSTRAINT PK_Country Primary Key Identity,
Name_Country nvarchar(50),
Capital nvarchar(50),
Square_Country int,
Population int,
Continent nvarchar(30)
)

--1.	������� �������� � ������� ���� ���������� ����� �� �������.
SELECT Top 5 Name_Country, Square_Country From Country
Order by Square_Country desc

--2.	������� ������ ����������� �����, ��������� ������� �� ��������� 1 ���. ���.
Select * From Country
Where Continent = '������' AND Population < 1000000

--3.	������� ������ �����, ��������� ������� ������ 5 ���. ���., � ������� ������ 100	���. ��. ��, � ��� ����������� �� � ������.
Select * From Country
Where Population > 5000000 AND Square_Country < 100000 AND Continent <> '������'

--4.	������� ������ ����� �������� � ����� �������, ��������� ������� ������ 20	���. ���., ��� ����� ������, � ������� ��������� ������ 30 ���. ���.
Select * From Country
WHERE Continent in ('�������� �������','����� �������') AND Population > 20000000 OR
Continent = '������' AND Population > 30000000

--5.	������� ������ �����, ��������� ������� ���������� �� 10 �� 100 ���. ���., � ������� �� ������ 500 ���. ��. ��.
Select * From Country 
WHERE Population Between 10000000 AND 100000000 AND Square_Country <= 500000

--6.	������� ������ �����, �������� ������� �� ���������� � ����� �ʻ.
Select * From Country
WHERE Name_Country NOT LIKE '�%'

--7.	������� ������ �����, � �������� ������� ������ ����� � ��, � ������������� � ��.
Select * From Country
WHERE Name_Country LIKE '__�%�_'
--8.	������� ������ �����, � �������� ������� ������ ����� � �������.
Select * From Country
WHERE Name_Country LIKE '_[���������]%'

--9.	������� ������ �����, �������� ������� ���������� � ���� �� �ʻ �� �ϻ.
Select * From Country
WHERE Name_Country LIKE '[�-�]%'

--10.	������� ������ �����, �������� ������� ���������� � ���� �� ��� �� �û, �� �� � ����� ���.
Select * From Country
WHERE Name_Country LIKE '[�-�]%' AND Name_Country LIKE '[^�]%'

--11.	������� ������ �����, ������� ������� ���� � ����.
Select * From Country
WHERE Capital IS NOT Null

--12.	������� ������ ����� ������, �������� � ����� �������.
Select * From Country
WHERE Continent IN ('������','�������� �������','����� �������')


--��4

--1.	������� ������ ����������, ��������������� �� ���������� �������� � ���.
Select * From Academics
Order by Len(FIO)

--2.	������� ������ ����������, ������ ������ ������� � ���.
Select Trim(FIO) AS �������� From Academics
Order by Len(FIO)

--3.	����� ������� ��� � ��� ������� ���������. ������� ��� � ����� �������.
Select FIO, CHARINDEX('��', FIO) AS '����� �������' From Academics

--4.	������� ��� � ��������� ��� ����� ������������� ��� ������� ���������.
Select FIO, RIGHT(Spec, 2) From Academics

--5.	������� ������ ����������, ��� � ������� ������� � ��������.
select FIO, CONCAT(SUBSTRING(Fio, 0, CHARINDEX(' ', Fio)+1), 
(SUBSTRING(Fio, Len(SUBSTRING(Fio, 0, CHARINDEX(' ', Fio))) + 2, 1) + '.'), 
(SUBSTRING(FIO, CHARINDEX(' ',FIO,Len(SUBSTRING(Fio, 0, CHARINDEX(' ', Fio))) + 2), 2)+ '.')) From Academics

--6.	������� ������ ������������� � ���������� � �������� ����. ������ ���������.
Select distinct Spec, REVERSE(Spec) From Academics

--7.	������� ���� ������� � ����� ������ ������� ���, ������� ��� ���.
Select REPLICATE('������� ', 17)

--9.	������� ���������� ���� �� ����� ��������.
Select DATEDIFF(Day, GetDate(), '30-12-2023')

--10.	������� ���������� ������� �� ������ ��������.
Select DATEDIFF(Month, '03-04-2006', GetDate())

--11.	������� ��� � ������������ ���� �������� ������� ���������.
Select Fio, BirthDate,
Case
When Year(BirthDate) % 4 = 0 Then '����������'
Else '���'
End as '������������'
From Academics

--12.	������� ������ ������������� ��� ����������. ��� ������ ������������� ������� �������� ��� ���������, � ����������� �� ���������� ��������.
Select Distinct Spec,
CASE
WHEN Len(Spec) > 9 Then '�������'
Else '��������'
END AS �����
From Academics

--��5
--1.	������� ����������� ������� �����.
Select Min(Square_Country) '�������' From Country 

--2.	������� ���������� �� ��������� ������ � �������� � ����� �������.
Select Name_Country FROM Country
Where Population = (Select Max(Population) From Country WHERE Continent in ('�������� �������','����� �������'))

--3.	������� ������� ��������� �����. ��������� ��������� �� ������ �����.
Select Round(AVG(Cast(Population as decimal)), 1) From Country

--4.	������� ���������� �����, � ������� �������� ������������� �� ���, ����� �����, � ������� �������� ������������� �� �����.
Select Count(Id) from Country
Where Name_Country Like '%��' AND Name_Country Not Like '%����'

--5.	������� ���������� �����������, ��� ���� ������, �������� ������� ���������� � ����� �л.
Select distinct Count(Continent) ����� from Country
Where Name_Country like '�%'

--6.	������� ��� ������ � ���������� �������� ������, ��� ������ � ���������� ��������?
Select Max(Square_Country)/Min(Square_Country) As ����� From Country

--7.	������� ���������� ����� � ���������� ������, ��� 100 ���. ���. �� ������ ���-�������. ��������� ������������� �� ���������� ����� �� �����������.
Select Continent, Count(Id) ���������� From Country
Where Population > 100000000
Group by Continent
Order by Count(Id)

--8.	������� ���������� ����� �� ���������� ���� � ��������. ��������� ������������� �� ��������.
Select Len(Name_Country) '���-�� ����', Count(Name_Country) '���-�� �����' From Country
Group by Len(Name_Country)

--9.	���������, ��� ����� 20 ��� ��������� ���� �������� �� 10%. ������� ������ ����������� � �������������� ����������:
Select Continent, (Sum(Population) * 1.1) '�������������� ���������' From Country
Group by Continent

--10.	������� ������ �����������, ��� ������� �� ������� ����� ����������� � ����������� �������� �� ����� � 10000 ���:
Select Continent From Country
Group by Continent
Having Max(Square_Country)/Min(Square_Country) <= 10000

--11.	������� ������� ����� �������� ����������� �����.
Select Avg(Len(Name_Country)) from Country
Where Continent = '������'

--12.	������� ������ �����������, � ������� ������� ��������� ����� ����� � ������-���� ����� 1 ���. ���. ������, ��� 30 ���. �� ��. ��.
Select Continent from Country
Where Population > 1000000
Group by Continent
Having Avg(Population/Square_Country) > 30


--��6
Create Table Faculty
(
Id_Faculty nvarchar(2) Constraint PK_Facukty Primary Key,
Name_Faculty nvarchar(100)
)

Create Table Lectern
(
Id_Lectern nvarchar(2) Constraint PK_Lectern Primary Key,
Name_Lectern nvarchar(100),
Id_Faculty nvarchar(2) Constraint FK_Lectern_To_Faculty Foreign key references Faculty(Id_Faculty)
)

Create table Employee
(
Id_Employee Int Constraint PK_Employee Primary Key,
Id_Lectern nvarchar(2) Constraint FK_Employee_To_Lectern Foreign key references Lectern(Id_Lectern),
Surname nvarchar(50),
Position nvarchar(30),
Salary decimal(8,2),
Chief Int Constraint FK_Employee_To_Chief Foreign key references Employee(Id_Employee)
)

Create table Specs
(
Id_Spec nvarchar(8) Constraint PK_Specs Primary Key,
Direction nvarchar(50),
Id_Lectern nvarchar(2) Constraint FK_Specs_To_Lectern Foreign key references Lectern(Id_Lectern)
)

Create table Subject
(
Id_Subject int Constraint PK_Subject Primary Key,
Cize_Subject int,
Name_Subject nvarchar(30),
Id_Lectern nvarchar(2) Constraint FK_Subject_To_Lectern Foreign key references Lectern(Id_Lectern)
)

Create Table Request
(
Id_Spec nvarchar(10) Constraint FK_Request_To_Spec Foreign key references Specs(Id_Spec),
Id_Subject Int Constraint FK_Request_To_Subject Foreign key references Subject(Id_Subject)
CONSTRAINT PK_Request PRIMARY KEY(Id_Spec, Id_Subject)
)

Create table Head_Lectern
(
Id_HL Int Constraint PK_HL Primary Key Constraint FK_HL_To_Employee Foreign key references Employee(Id_Employee),
Stage Int
)

Create table Engineer
(
Id_Engineer Int Constraint PK_Engineer Primary Key Constraint FK_Engineer_To_Employee Foreign key references Employee(Id_Employee),
Profession nvarchar(30)
)

Create table Teacher
(
Id_Teacher Int Constraint PK_Teacher Primary Key Constraint FK_Teacher_To_Employee Foreign key references Employee(Id_Employee),
Grade nvarchar(30),
Degree nvarchar(10)
)

Create table Student
(
Id_Student Int Constraint PK_Student Primary Key,
Id_Spec nvarchar(8) Constraint FK_Student_To_Spec Foreign key references Specs(Id_Spec),
Surname_Student nvarchar(50),
)

Create table Exam
(
Date_Exam date,
Id_Subject int Constraint FK_Exam_To_Subject Foreign Key references Subject(Id_Subject),
Id_Student int Constraint FK_Exam_To_Student Foreign Key references Student(Id_Student),
Id_Employee int Constraint FK_Exam_To_Employee Foreign Key references Employee(Id_Employee),
Auditory nvarchar(10),
Mark int,
Constraint PK_Exam Primary KEY (Date_Exam, Id_Student)
)

--1.	������� �� ������ ��������, ��������������� � �������� ������ � ���������, ������� ��������� �� ������ ���������� (��������, ���).
SELECT s.Surname_Student FROM dbo.Student s JOIN dbo.Specs s1
ON s.Id_Spec = s1.Id_Spec JOIN dbo.Lectern l
ON s1.Id_Lectern = l.Id_Lectern JOIN dbo.Faculty f
ON l.Id_Faculty = f.Id_Faculty
WHERE f.Id_Faculty = '��'

--2.	������� �� ������ ��������, ��������������� � ���������� ������ � ����������� �������� (���������, ����, ��������, ������� �����������). ����������� ��������� �� �������, �� ������� ���� ������ � ������� ���������������.
SELECT DISTINCT f.Name_Faculty, l.Id_Lectern, l.Name_Lectern, e.Surname FROM dbo.Lectern l JOIN dbo.Faculty f ON l.Id_Faculty = f.Id_Faculty
JOIN dbo.Specs s ON l.Id_Lectern = s.Id_Lectern
JOIN dbo.Employee e ON l.Id_Lectern = e.Id_Lectern
WHERE e.Position = '���. ��������'

--3.	������� � ������� ��� ������� ���������� ����� � ������� ��� ����������������� ������������. ��� ���������� ��������� ���� ������������ �������� ������.
SELECT e.Surname,
CASE e2.Surname
When e.Surname Then Null
Else e2.Surname
End As ������������
FROM dbo.Employee e JOIN dbo.Employee e2 ON e.Chief = e2.Id_Employee


--4.	������� ������ ���������, ������� ������� ��� ��������.
SELECT s.Surname_Student, COUNT(e.Id_Student) '���-�� ������� ���������' FROM dbo.Student s JOIN dbo.Exam e ON s.Id_Student = e.Id_Student
GROUP BY s.Surname_Student
HAVING COUNT(e.Id_Student) >= 2

--5.	������� ������ ��������� � ���������, ������� 20000 ���.
SELECT e2.Surname, e2.Salary FROM dbo.Engineer e JOIN dbo.Employee e2 ON e.Id_Engineer = e2.Id_Employee
WHERE e2.Salary < 20000

--6.	������� ������ ���������, ������� �������� � �������� ���������.
--�505
SELECT s.Surname_Student FROM dbo.Student s JOIN dbo.Exam e ON s.Id_Student = e.Id_Student
WHERE e.Auditory = '�505'

--7.	������� �� ������ �������� � �������� ������� ������ � ������� ���������, � ����� ���������� ������� ��������� � ������� ���� ��� ������� �������� ������ ��� ��� ���������, 
--� ������� ������� ���� �� ������ ��������� (��������, 4).
SELECT s.Id_Student, s.Surname_Student, COUNT(e.Id_Student) '������� ��������', AVG(e.Mark) '������� ����' FROM dbo.Student s JOIN dbo.Exam e 
ON s.Id_Student = e.Id_Student
GROUP BY s.Id_Student, s.Surname_Student
HAVING AVG(e.Mark) >= 4

--8.	������� ������ ���������� ��������� � �� ��������, � �������.
SELECT e.Surname, e.Salary, t.Degree From dbo.Head_Lectern hl JOIN dbo.Employee e ON hl.Id_HL = e.Id_Employee
JOIN dbo.Teacher t ON e.Id_Employee = t.Id_Teacher

--9.	������� ������ �����������.
SELECT t.Id_Teacher, e.Surname FROM dbo.Teacher t JOIN dbo.Employee e ON t.Id_Teacher = e.Id_Employee
WHERE t.Grade = '���������'

--10.	������� �������� ����������, �������, ��������� � ������� �������������, ���� � ����� ���������� ��������� � ��������������� ������� � �������� ��������� ����.
SELECT s.Name_Subject, e2.Surname, e2.Position, e.Date_Exam, e.Auditory FROM dbo.Exam e JOIN dbo.Subject s ON e.Id_Subject = s.Id_Subject JOIN dbo.Employee e2 ON e.Id_Employee = e2.Id_Employee
ORDER BY e.Date_Exam

--11.	������� ������� ��������������, ��������� ����� ���� ���������.
SELECT e2.Surname FROM dbo.Exam e JOIN dbo.Employee e2 ON e.Id_Employee = e2.Id_Employee
GROUP BY e2.Surname
Having count(e.Date_Exam) > 3


--12.	������� ������ ���������, �� ������� �� ������ �������� � ��������� ����.
SELECT s.Surname_Student FROM dbo.Student s
EXCEPT
SELECT s.Surname_Student FROM dbo.Student s JOIN dbo.Exam e ON s.Id_Student = e.Id_Student
WHERE e.Date_Exam = '10.06.2015'

--��� 7
--1	������� ������������ ��������� ���������� ��������, ������� �������� ������ � �������� ������ 500 ��. �� � � �������� ������ 5 ���. ��. ��:
SELECT c.Name_Country, c.Square_Country from Country c
WHERE c.Square_Country < 500
UNION ALL
SELECT c.Name_Country, c.Square_Country from Country c
WHERE c.Square_Country > 5000000

--2 ������� ������ ����� � �������� ������ 1 ���. ��. ��, ��������� ������ � ����-������ ������ 100 ���. ���.:
SELECT c.Name_Country, c.Square_Country from Country c
WHERE c.Square_Country > 1000000
EXCEPT
SELECT c.Name_Country, c.Square_Country from Country c
WHERE c.Population < 100000000

--3	������� ������ ����� � �������� ������ 500 ��. �� � � ���������� ������ 100	���. ���.

SELECT c.Name_Country, c.Square_Country from Country c
WHERE c.Square_Country < 500
INTERSECT
SELECT c.Name_Country, c.Square_Country from Country c
WHERE c.Population < 100000


--��� 8
--1 ������� ������ ����� � ���������� ����������� ������� ������ �� ��� � ����� ������� ���� ����� ����.
SELECT c.Name_Country, c.Square_Country, Round(Cast(c.Square_Country AS float) * 100/
(SELECT Sum(c.Square_Country) FROM dbo.Country c),3) AS ������� FROM dbo.Country c
GROUP BY c.Name_Country, c.Square_Country

--2. ������� ������ ����� ����, ��������� ��������� ������� ������, ��� ������� ��������� ��������� ���� ����� ����.
SELECT c.Name_Country, (c.Population/c.Square_Country) AS '��������� ���������' FROM dbo.Country c
WHERE (c.Population/c.Square_Country) >= (SELECT AVG(c.Population/c.Square_Country) FROM dbo.Country c)

--3. � ������� ���������� ������� ������ ����������� �����, ��������� ������� ������ 5 ���. ���.
SELECT c.Name_Country FROM dbo.Country c
WHERE c.Continent = '������' AND c.Population > 5000000

--4. ������� ������ ����� � ���������� ����������� �� ������� � ��������� ���-���� ��� ����� ����, ��� ��� ���������.
SELECT c.Name_Country, c.Square_Country, c.Continent, Round(Cast(c.Square_Country AS float) * 100/
(SELECT Sum(c1.Square_Country) FROM dbo.Country c1
WHERE c1.Continent = c.Continent),3) AS ������� FROM dbo.Country c
GROUP BY c.Name_Country, c.Square_Country, c.Continent

--5. ������� ������ ����� ����, ������� ������� ������, ��� ������� ������� ����� ��� ����� �����, ��� ��� ���������.
SELECT c.Name_Country, c.Square_Country FROM dbo.Country c
WHERE c.Square_Country >= (SELECT AVG(c1.Square_Country) FROM dbo.Country c1
WHERE c1.Continent = c.Continent)

--6. ������� ������ ����� ����, ������� ��������� � ��� ������ �����, ������� ����-����� ��������� ������� ��������� �����������.
SELECT c.Name_Country FROM dbo.Country c
WHERE c.Continent IN (SELECT ccc.Continent FROM (
SELECT c.Continent, AVG(c.Population/c.Square_Country) AS Ass FROM dbo.Country c
GROUP BY c.Continent
HAVING AVG(c.Population/c.Square_Country) >
(SELECT AVG(c.Population/c.Square_Country) FROM dbo.Country c)) ccc)

--7.	������� ������ ���������������� �����, � ������� ����� ������ �����, ��� � ����� ����������� ������.
SELECT c.Name_Country FROM dbo.Country c
WHERE c.Continent = '����� �������' AND
c.Population > (SELECT MAX(c2.Population) FROM dbo.Country c2 WHERE c2.Continent = '������')

--8.	������� ������ ����������� �����, � ������� ����� ������ �����, ��� ���� �� �	����� ���������������� ������.
SELECT c.Name_Country FROM dbo.Country c
WHERE c.Continent = '������' AND
c.Population > (SELECT Min(c2.Population) FROM dbo.Country c2 WHERE c2.Continent = '����� �������')

--9.	���� � ������ ���� ���� �� ���� ������, ������� ������� ������ 2 ���. ��. ��, ������� ������ ���� ����������� �����.
SELECT c.Name_Country FROM dbo.Country c
WHERE c.Continent = '������' AND EXISTS (SELECT c2.Square_Country from dbo.Country c2 
WHERE c2.Continent = '������' AND c2.Square_Country > 2000000)

--10.	������� ������ ����� ��� ����� �����, ��� ��������� ������ ������.
SELECT c.Name_Country FROM dbo.Country c
WHERE c.Continent = (SELECT c2.Continent from dbo.Country c2 WHERE c2.Name_Country = '�����')

--11.	������� ������ �����, ��������� ������� �� ��������� ��������� ������ ������.
SELECT c.Name_Country FROM dbo.Country c
WHERE c.Population <= (SELECT c.Population FROM dbo.Country c WHERE c.Name_Country = '�����')

--12.	������� �������� ������ � ���������� ���������� ����� ����� � ���������� �������� �� ������ ����������.
SELECT c.Name_Country FROM dbo.Country c
WHERE c.Population = (
SELECT MAX(c.Population) from dbo.Country c
WHERE c.Square_Country IN
(SELECT MIN(c.Square_Country) FROM dbo.Country c
GROUP BY c.Continent))

--��9
--1.	������� ������� �����������_������������. ���������� �������� ����, ����-���������, �������� �� ���������
CREATE TABLE ����������_��������������
(
ID int CONSTRAINT PK_���������� PRIMARY KEY IDENTITY,
Type nvarchar(50) CONSTRAINT DF_��� DEFAULT '������������� ����������'
)

--2.	������� ������� �������_������������. ���������� �������� ����, ���������� / ������ �� NULL, ������� �� �������� ��������.
CREATE TABLE ������_��������������
(
��_������ int CONSTRAINT PK_������ PRIMARY KEY IDENTITY,
������ nvarchar(50) NOT NULL,
������� nvarchar(50),
�����_����� nvarchar(50),
��������� int NOT NULL CONSTRAINT CK_��������� CHECK (��������� < 7888000),
������� nvarchar(50) CONSTRAINT CK_������� CHECK (������� < 149939),
���_���������� int CONSTRAINT FK_������������� FOREIGN KEY REFERENCES ����������_��������������(ID)
)

--3.	������� ������� ������_������������. ���������� �������� ����, �������� ������� �ID� ������� �����������, ��� ������� ������ ���������� �������� �� ��������� �����������.

CREATE TABLE �����_��������������
(
��_������ int CONSTRAINT PK_����� PRIMARY KEY IDENTITY,
�������� nvarchar(50),
����� nvarchar(50) CONSTRAINT DF_����� DEFAULT '����������',
CONSTRAINT UQ_����� UNIQUE(��_������)
)

--4.	������� ������� ���������_������������. ���������� �������� ����, �����-��� ������� �ID� ������� �����������, ��� ������� ������ ���������� �������� �� ����-����� �������.
CREATE TABLE ��������_��������������
(
��_�������� int CONSTRAINT PK_�������� PRIMARY KEY IDENTITY,
�������� nvarchar(50),
����� nvarchar(50) CONSTRAINT DF_�������� DEFAULT '������',
CONSTRAINT UQ_�������� UNIQUE(��_��������)
)

--��� 10
CREATE TABLE Pupil
(
ID int CONSTRAINT PK_Pupil PRIMARY KEY,
Surname nvarchar(20) NOT NULL,
Subject nvarchar(20) NOT NULL,
School nvarchar(20) NOT NULL,
Balls decimal(5,2) CONSTRAINT CK_Balls_Between0_100 CHECK (Balls >= 0 AND Balls <= 100) NULL
)

--1 � ������� �������� ������ ����� ������ ��� ������� ����� � 18 ��������, ������ �������� �� ����� ����������.
INSERT dbo.Pupil
VALUES
(11, '�������', '�����', '����� �18', NULL)

--2.	� ������� �������� ������ ��� ������.
INSERT dbo.Pupil
VALUES
(12, '������', '�����', '����� �11', 43),
(13, '�������', '����������', '��������', 93),
(14, '��������', '������', '�����', 99.5)

--3.	� ������� �������� �������� ������ ��������, ����� ��������� �� � 21, ������� �� ����������, � ������ �� 56.
Update Pupil
SET School = '����� �21',
Subject = '����������',
Balls = 56
Where Surname = '�������'

--4.	� ������� �������� �������� ������ ���� �������� �� �����, ������ ��������� �� 10%, ���� ��� ���� 60 ������.
Update Pupil
Set Balls = Balls * 1.1
Where Subject = '�����' AND Balls < 60

--5.	� ������� �������� ������� ������ ���� �������� �� ����� �21.
Delete Pupil
Where School = '����� �21'

--6.	������� ������� ������������ � ����������� ���� ������ ���� �����������, ����� ���, ������� ������� ������ 60 ������.
SELECT * INTO GymnasiumPupil from Pupil
Where School = '��������'

--7.	�������� ������� ������������.
Truncate TABLE GymnasiumPupil


--��� 11
--1.	���� ����� A � B. ����� � ������� �� ������������.
Declare @A int = 6,  @B int = 9
Print Cast(@A as nvarchar) + ' * ' + cast(@B as nvarchar) + ' = ' + cast(@A*@B as nvarchar)

--2.	� ������� �������� ����� ������� ����� �������� ������� ��������� � �����������.
DECLARE @LiceyAVG decimal = 0, @GymnasiumAVG decimal = 0

select @LiceyAVG = AVG(p.Balls) from Pupil p
Where p.School = '�����'
select @GymnasiumAVG = AVG(p.Balls) from Pupil p
Where p.School = '��������'

Print '������� ���� ���������: ' + Cast(@LiceyAVG as nvarchar)
Print '������� ���� �����������: ' + Cast(@GymnasiumAVG as nvarchar)
Print '�������: ' + Cast(@LiceyAVG-@GymnasiumAVG as nvarchar)

--3.	� ������� �������� ��������� �� �������� ���������� �����.
DECLARE @StrCount int;
SET @StrCount = (select count(ID) from Pupil)
If @StrCount % 2 = 0 
	Print '���-�� ����� ������'
Else
	Print '���-�� ����� ��������'

--4.	���� �������������� �����. ������� ����� ��� ����.
DECLARE @Num int = 1235, @Sum int = 0, @Len int = 0
While @Len <= LEN(cast(@Num AS nvarchar))
begin
	set @Sum = @Sum + cast(substring(cast(@Num as nvarchar), @Len, 1) as int)
	set @Len = @Len + 1
end
Print @Sum

--5.	���� ��������� ����� ����� a, b � c. ����� ���������� �� ���.
Declare @A int = Rand() * 100, @B int = Rand() * 100, @C int = Rand() * 100
Print Cast(@A as nvarchar) + ' ' + Cast(@B as nvarchar) + ' ' + Cast(@C as nvarchar)
IF @A < @B
	IF @A < @C Print @A
	ELSE Print @C
ELSE
	IF @B < @C Print @B
	ELSE Print @C

--6.	���� ��������� ����� ����� a. ���������, ������� �� ������ ����� �� 11.
Declare @a int = Rand() * 100
If @a % 11 = 0 Print Cast(@a as nvarchar) + ' ������� �� 11'
Else Print Cast(@a as nvarchar) + ' �� ������� �� 11'

--7.	���� ��������� ����� ����� N (N < 1000). ���� ��� �������� �������� ����� 3, �� ������� ���, ���� �� �������� � ������� ����.
Declare @a int = Rand() * 1000, @N int
Set @N = @a
WHILE @N % 3 = 0
	SET @N = @N / 3
	IF @N = 1 PRINT Cast(@a as nvarchar) + ' �������� �������� 3'
	ELSE PRINT Cast(@a as nvarchar) + ' �� �������� �������� 3'

--8.	���� ��������� ����� ����� a � b. ����� ���������� ����� ������� (���).
Declare @a int = Rand() * 100,  @b int = Rand() * 100, @c int, @aNOK int, @bNOK int
PRINT '@a = ' + CAST(@a AS NVARCHAR) 
PRINT '@b = ' + CAST(@b AS NVARCHAR)
PRINT '@c = ' + CAST(@c AS NVARCHAR)
set @aNOK = @a
set @bNOK = @b
WHILE @aNOK != @bNOK
BEGIN
	IF @aNOK < @bNOK
	begin
		SET @c = @aNOK
		set @aNOK = @bNOK
		set @bNOK = @c
	end
	SET @aNOK = @aNOK - @bNOK
END
set @c = (@a*@b)/@aNOK
PRINT '��K = ' +CAST(@c AS NVARCHAR)

--9.	���� ��� ����� ����� A � B (A<B). ����� ����� ��������� ���� ����� ����� �� A �� B ������������.
Declare @A int = 2, @B int = 5, @SUMMA int = 0
While @A <= @B
	begin
		SET @SUMMA = @SUMMA + SQUARE(@A)
		SET @A = @A + 1
	end
Print @SUMMA

--10.	����� ������ ����������� �����, ������� ��� ������� �� 2, 3, 4, 5, � 6 ���� ������� 1, �� ������� �� 7.
Declare @Number int = 0, @t int = 1
while @t = 1
begin
	If @Number % 2 = 1 AND @Number % 3 = 1 AND @Number % 4 = 1 AND @Number % 5 = 1 AND @Number % 6 = 1
		SET @t = 0
	ELSE SET @Number = @Number + 7
end
Print @Number

--11.	������� ���� ������� �� ����� ������� ���, ������� � ��� ����.
Declare @Surname nvarchar(14) = '��������������', @len int = 1
While @len <= len(@Surname)
begin
	Print @Surname
	set @len = @len + 1
end

--12.	�������� ��� ��� ������ �� ����� � ������� �����:
Declare @Name nvarchar(15) = '�������������', @len int = 1
While @len <= Len(@Name)
begin
	Print Space((Len(@Name) - @Len)) + Reverse(Substring(@Name,2, @len-1)) + Substring(@Name, 1, @len)
	SET @len = @len + 1
end


-- ��� 12
--1.	�������� ������� ��� ������ �������� ������ � �������� ��������, � �������� ��.
Create Function NameFromCapital(@Cap nvarchar(30))
Returns nvarchar(30)
AS
Begin
	Declare @Name nvarchar(30)
	Select @Name = c.Name_Country from Country c Where c.Capital = @Cap
	Return @Name
End

Select dbo.NameFromCapital('�����')

--2.	�������� ������� ��� �������� ��������� � ���. ���. � �������� ��.
Create Function PopulationInMillion(@Id int)
returns int
as
begin
	declare @num int
	Select @num = c.Population/1000000 from Country c Where c.ID = @Id
	Return @num
end

Select c.Name_Country, c.Population, dbo.PopulationInMillion(c.ID) as '��������� � ���.���.' from Country c

--3.	�������� ������� ��� ���������� ��������� ��������� �������� ����� ����� � �������� ��.
Create Function PopOnSqr(@Continent nvarchar(30))
Returns int
as
begin
	declare @Pop int
	Select @Pop = c.Population/c.Square_Country from Country c Where c.Continent = @Continent
	return @Pop
end

Select c.Continent, dbo.PopOnSqr(c.Continent) as '��������� ���������' from Country c
Group by c.Continent

--4.	�������� ������� ��� ������ ������, ������� �� ��������� � �������� ��.
Create Function ThirdOnPopCountry()
returns nvarchar(30)
as
begin
	declare @Name nvarchar(30)
	Select @Name = c.Name_Country from Country c Order By c.Population desc Offset 2 Rows Fetch Next 1 Row only
	return @Name
end

Select dbo.ThirdOnPopCountry() as '������ ������ �� ���������'

--5.	�������� ������� ��� ������ ������ � ������������ ���������� � �������� ��-��� ����� � �������� ��. 
--���� ����� ����� �� �������, ������� ����.
Create Function MaxPopOnContinent(@Continent nvarchar(30)='����')
returns nvarchar(30)
as
begin
	declare @Name nvarchar(30)
	Select  Top 1 @Name = c.Name_Country from Country c 
	Where c.Continent = @Continent 
	Order By c.Population desc
	return @Name
end

Select c.Continent, dbo.MaxPopOnContinent(c.Continent) as '������ � ����. ����������' from Country c
Group by c.Continent

Select dbo.MaxPopOnContinent(Default) as '������ � ����. ����������' 

--6.	�������� ������� ��� ������ ���� � �������� ����� �� ������� �� ������������� �� ����� � ��������� �� ��� ������� ������.
Create Function TestZamena(@word nvarchar(30))
returns nvarchar(30)
as
begin
	declare @word2 nvarchar(30)
	set @word2 = substring(@word, 0, 3) + '����' + right(@word,2)
	return @word2
end

select dbo.TestZamena('����')
--7.	�������� �������, ������� ���������� ���������� �����, �� ���������� � �������� �������� �����.
create function CountryAmount(@Letter char(1))
returns int
as
begin
	declare @number int
	select @number = count(c.Name_Country) from Country c where CHARINDEX(@Letter, c.Name_Country) = 0
	return @number
end

select dbo.CountryAmount('�')

--8.	�������� ������� ��� �������� ������ ����� � �������� ������ ��������� ����� � �������� ��.
Create function CountryLessSqr(@sqr int)
returns table
	return (select c.Name_Country from Country c where c.Square_Country < @sqr)

select * from dbo.CountryLessSqr(500000)

--9.	�������� ������� ��� �������� ������ ����� � ���������� � ��������� �������� �������� � �������� ��.
Create function CountryBetweenPop(@popmin int, @popmax int)
returns table
	return (select c.Name_Country from Country c where c.Population between @popmin and @popmax)

select * from dbo.CountryBetweenPop(500000, 2000000)

--10.	�������� ������� ��� �������� ������� � ��������� ���������� � ��������� ���������� � �������� ��.
Create function ContinentAndSumPop()
returns table
	return (select c.Continent, sum(c.Population) as Population from Country c Group by c.Continent)

select * from dbo.ContinentAndSumPop()

--11.	�������� ������� IsPalindrom(P) ������ ����, ������������ 1, ���� ����� �������� P (P > 0) �������� �����������, 
--� 0 � ��������� ������.
Create function IsPalindrom(@P int)
returns int
as
begin
	declare @true int
	if left(cast(@P as nvarchar(30)), len(cast(@P as nvarchar(30)))/2) = reverse(right(cast(@P as nvarchar(30)), len(cast(@P as nvarchar(30)))/2))
		set @true = 1
	else 
		set @true = 0
	return @true
end

select dbo.IsPalindrom(123321)

--12.	�������� ������� Quarter(x, y) ������ ����, ������������ ����� ������������ ��������, ���������� ����� � ���������� 
--������������� ������������ (x, y).
Create function Quarter(@x decimal, @y decimal)
returns int
as
begin
	declare @quarter int
	if @x > 0 and @y > 0 set @quarter = 1
	if @x < 0 and @y > 0 set @quarter = 2
	if @x < 0 and @y < 0 set @quarter = 3
	if @x > 0 and @y < 0 set @quarter = 4
	return @quarter
end

select dbo.Quarter(-3.5, -7) as '����� ������������ ��������'

--13.	�������� ������� IsPrime(N) ������ ����, ������������ 1, ���� ����� �������� N (N > 1) �������� ������� ������, 
--� 0 � ��������� ������.
Create function IsPrime(@N int)
returns int
as
begin
	declare @true int = 1, @nn int = 2
	While @nn < @N/2
	begin
		if @N % @nn = 0 set @true = 0
		set @nn = @nn + 1
	end
	return @true
end

select dbo.IsPrime(7) as '������� �� �����'

--14.	�������� ��� ��� �������� ��������� ���� ������� 
Drop Function dbo.IsPrime


--��� 13
--1.	�������� �������������, ���������� ������ ����������� �����, ��������� ������� ������ 10 ���. ���.,
--� ������� ������ 500 ���. ��. ��, � ����������� ���.
Create View Lab13_1
as
select c.Name_Country from Country c Where c.Continent = '������' and c.Population > 10000000 and c.Square_Country > 500000

Select * from Lab13_1

--2.	�������� �������������, ���������� ������ �����������, ������� ������� �����, ������� ��������� �� ���,
--������� ��������� ���������, � ����������� ���.
Create View Lab13_2
as
select c.Continent, avg(c.Square_Country) as '������� �������', avg(c.Population/c.Square_Country) as '������� ���������' from Country c group by c.Continent

Select * from Lab13_2

--3.	�������� �������������, ���������� ������� ��������������, �� ���������, ���-���, �������, ����� ������, ���������� �� ���������,
--� ����������� ���.
Create View Lab13_3
as
select e.Surname, e.Position, t.Grade, t.Degree, e.Id_Lectern, count(e2.Date_Exam) as '���������� ���������'
from Employee e join Teacher t on t.Id_Teacher = e.Id_Employee join Exam e2 on e.Id_Employee = e2.Id_Employee
where e.Position = '�������������'
group by e.Surname, e.Position, t.Grade, t.Degree, e.Id_Lectern

Select * from Lab13_3

--4.	�������� ��������� ����������, ���������� ��� ������� (������ ������, ��������� ������, ����������� ����),
--��������� �� ��� �������� ����, � ����������� ��.
Declare @Table1 Table (MonthNum int, MonthTitle nvarchar(20), DayAmount int)

insert @Table1 Values 
(1, '������', 31),
(2, '�������', 28),
(3, '����', 31),
(4, '������', 30),
(5, '���', 31),
(6, '����', 30),
(7, '����', 31),
(8, '������', 30),
(9, '��������', 30),
(10, '�������', 31),
(11, '������', 30),
(12, '�������', 31)

select * from @Table1

--5.	�������� ��������� ����������, ���������� ������ �����, ������� ������� �
--100	��� ������, ��� ������� ������� ����� �� ����������, ��� ��� ���������, � ����������� ��.
Declare @Table2 Table (NameCountry nvarchar(30), SquareCountry int, ContinentCounry nvarchar(30))
Insert INTO @Table2
Select c.Name_Country, c.Square_Country, c.Continent from Country c Where c.Square_Country * 100 < 
(select AVG(cc.Square_Country) as AvgSqr from Country cc Where c.Continent = cc.Continent)

select * from @Table2

--6.	�������� ��������� ��������� �������, ������� ��� ������� (������ ������, ����������� ���������, ����������� ���������),
--��������� � ����������� ��.
Select DATENAME(WEEK, e.Date_Exam) as '����� ������', count(distinct e.Id_Subject) as '���������� ���������',
count(distinct e.Id_Student) as '���������� ���������' into #Table3 from Exam e
group by DATENAME(WEEK, e.Date_Exam)

Select * from #Table3

--7.	�������� ���������� ��������� �������, ���������� �������� �����������, ���������� � ���������� ������� ����� �� ���,
--��������� � ����������� ��.
Select c.Continent, MAX(c.Square_Country) as '���������� �������', MIN(c.Square_Country) as '���������� �������' 
INTO ##Table4 from Country c
Group By c.Continent

Select * from ##Table4

--8.	� ������� ���������� ��������� ��������� �������� ������ ��� ������ ������ �����������, ��� �������� ������,
--��� ������� �������� �� ����������, �� �������� � �����-��� ����������.
WITH Table5 as
(Select AVG(ee.Salary) as '������� ��', ff.Name_Faculty, ff.Id_Faculty from Employee ee join Lectern ll ON ll.Id_Lectern = ee.Id_Lectern JOIN Faculty ff ON ff.Id_Faculty = ll.Id_Faculty 
Group By ff.Id_Faculty, ff.Name_Faculty)

Select e.Surname, e.Salary, t.Name_Faculty from Employee e join Lectern l ON e.Id_Lectern = l.Id_Lectern 
JOIN Table5 t ON l.Id_Faculty = t.Id_Faculty
Where e.Salary < t.[������� ��]

--9.	�������� ������� ��� �������� ���� ��������� ���� �������������.
 Drop View Lab13_1, Lab13_2, Lab13_3


 --��14
-- 1.	�������� ������, ���������� ��������������� �� ������ ������� � ����� ��������, �������� ���, �������� ������ ������, �������� � ���������� ������.
DECLARE MyCursor CURSOR
FOR
SELECT
Surname, Balls
FROM
Pupil
ORDER BY
Balls

OPEN MyCursor
FETCH MyCursor
CLOSE MyCurso
DEALLOCATE MyCursor

--2.	�������� ������ � ����������, ���������� ������ ��������, �������� ���, �������� �����, ����������, � ����� ���������, ���������, ������ ������, �������� � ������-���� ������.
DECLARE MyCursor CURSOR SCROLL
FOR
SELECT *
FROM
Pupil

OPEN MyCursor
FETCH ABSOLUTE 5 FROM MyCursor
FETCH PRIOR FROM MyCursor
FETCH ABSOLUTE -4 FROM MyCursor
FETCH NEXT FROM MyCursor
FETCH FIRST FROM MyCursor

CLOSE MyCursor
DEALLOCATE MyCursor


--3.	�������� ������ � ����������, ���������� ������ ��������, �������� ���, �������� ���������, ����� ������� ����� �����������, ������ ������� ������ ����������� ������, �������� � ���������� ������.
DECLARE MyCursor CURSOR SCROLL
FOR
	SELECT *
	FROM
		Pupil

OPEN MyCursor
FETCH LAST FROM MyCursor
FETCH RELATIVE -6 FROM MyCursor
FETCH RELATIVE 4 FROM MyCursor

CLOSE MyCursor
DEALLOCATE MyCursor

--4.	� ������� �������, ��������� ����� ������ � �������� � ���������� � ���������� ������.
DECLARE MyCursor CURSOR SCROLL
FOR
	SELECT
		Balls
	FROM
		Pupil
	Order by
		Balls

OPEN MyCursor
DECLARE @Cum float = 0,@Ball float
FETCH First FROM MyCursor INTO @Ball
Set @Cum = @Cum + @Ball
FETCH LAST FROM MyCursor INTO @Ball
Set @Cum = @Cum + @Ball
Print @Cum

CLOSE MyCursor
DEALLOCATE MyCursor

--5.	� ������� �������, ������������ ������ ���� �������� <������ ������� � �������� ���������, ����������� ��������> ����������� � ���������.
DECLARE MyCursor CURSOR SCROLL FOR
	SELECT
		Surname, Subject
	FROm
		Pupil

DECLARE @S NVARCHAR(2000), @F NVARCHAR(50), @W NVARCHAR(50)
OPEN MyCursor
SET @S = '�������'
FETCH NEXT FROM MyCursor INTO @F, @W
WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @S=@S+','+@F+' �� �������� "'+@W+'"'
		FETCH NEXT FROM MyCursor INTO @F, @W
	END
SET @S = @S + ' ����������� �� ���������.'
PRINT @S

CLOSE MyCursor
DEALLOCATE MyCursor

--6.	�������� ������, ���������� ������ ��������, � ��� ������� �������� �������� � �������� ��������.
DECLARE MyCursor CURSOR SCROLL
FOR
	SELECT *
	From Pupil

OPEN MyCursor
FETCH ABSOLUTE 1 FROM MyCursor
WHILE @@FETCH_STATUS = 0
	BEGIN
		FETCH RELATIVE 2 FROM MyCursor
	END

CLOSE MyCursor
DEALLOCATE MyCursor


--7.	�������� ������, ���������� ��������������� �� �������� ������ ������ ��������, �������� ���, ��� ������� ������� �������� �������, �������, �����, ����� � ���������� ����������� ������ � ���������� ��������.
DECLARE MyCursor CURSOR SCROLL
FOR
	SELECT *
	From Pupil
	Order by Balls Desc

OPEN MyCursor
DECLARE @ID int, @Sur nvarchar(30), @Sub nvarchar(30), @Scoo nvarchar(30), @B Float, @PerB float = 1
FETCH FIRST From MyCursor INTO @ID, @Sur, @Sub, @Scoo, @B
Set @PerB = @B
WHILE @@FETCH_STATUS = 0
	Begin
		Select 
		@ID AS ID, @Sur AS �������, @Sub AS �������, @Scoo AS �����, @B AS ����, Concat(Round((@B/@PerB)*100, 2), ' %') AS �����������
		Set @PerB = @B
		Fetch next from MyCursor into  @ID, @Sur, @Sub, @Scoo, @B
	end
CLOSE MyCursor
DEALLOCATE MyCursor

--�� 15
--1.	������� ������ �������� � ������� ����� ������� ������� � ������������ ������ � ������ ������.
Select p.Surname, p.Balls, (MAX(p.Balls) OVER() - p.Balls) as ������� from Pupil p

--2.	������� ������ �������� � ���������� ����������� � �������� ����� � ������ ������.
Select p.Surname, p.Balls, Concat(Round(p.Balls / AVG(p.Balls) OVER() *100, 2), ' %') as ����������� from Pupil p

--3.	������� ������ �������� � ����������� ���� � ����� � ������ ������.
Select p.Surname, p.Balls, (MIN(p.Balls) Over(Partition by p.School Order by p.School)) as '����������� ���� � �����' from Pupil p

--4.	������� ������ �������� � ��������� ���� � ����� � ������ ������, ������������� �� ������ � ������� �������.
Select p.Surname, p.Balls, (SUM(p.Balls) Over(Partition by p.School Order by p.School)) as '��������� ���� � �����' from Pupil p

--5.	������� ������ �������� � ����� ������ ��� ���������� �� �������� � �������� ���������� �������.
Select
	ROW_NUMBER() Over(Order by p.Surname DESC) AS '� ������', p.* From Pupil p

--6.	������� ������ ��������, ����� ������ ������ ����� � ���������� �������� � ����� ��� ���������� �� ������ �� ��������.
 Select
	ROW_NUMBER() Over(Partition by p.School Order by p.Balls DESC) AS '� ������', p.*,
	(Count(p.Balls) Over(Partition by p.School Order by p.School)) as '���-�� �������� � �����'
	From Pupil p

--7.	������� ������ �������� � ���� �� ������.
SELECT RANK() OVER (ORDER BY p.Balls Desc) AS ����, p.* from Pupil p

--8.	������� ������ �������� � ������ ���� �� ������. ��������� ������������� �� ������� � ���������� �������.
SELECT DENSE_RANK() Over(ORDER BY p.Balls Desc) AS ����, p.* from Pupil p
ORDER BY p.Surname

--9.	������� ������ ��������, �������������� �� ���� ������� �� �������.
SELECT Ntile(5) Over(ORDER BY p.Surname Desc) AS ������, p.* from Pupil p

--10.	������� ������ ��������, �������������� �� ���� ������� �� ������ ������ �����.
SELECT Ntile(3) Over(PARTITION BY p.School ORDER BY p.Balls) AS ������, p.* from Pupil p

--11.	������� ������ �������� � ������� � ������� �������, ������������ ���� �� ��� ������� ��� ���������� �� ����������� ������.
Select p.Surname, p.Balls, p.Balls - LAG(p.Balls,3) OVER(ORDER BY p.Balls) as ������� from Pupil p

--12.	������� ������ �������� � ������� � ������� ���������� ������� ��� ���������� �� �������� ������, �������� �� ��������� ������������ 0.
 Select p.Surname, p.Balls, p.Balls - LEAD(p.Balls,1,0) OVER(ORDER BY p.Balls DESC) as ������� from Pupil p

 --��16
-- 1.	�������� ������, ������� ������� ������������ ���� �������� �� ������, �� ������� �������� �� ������ ����� � ������������� �����.
SELECT ISNULL(p.School, '�� ������') �����, ISNULL(p.Subject, '�� ���� ���������') �������, MAX(p.Balls) ���� from Pupil p GROUP BY p.School, p.Subject WITH ROLLUP

--2.	�������� ������, ������� ������� ����������� ���� �������� �� ������ � �� ���������, � ������������� �����.
SELECT ISNULL(p.School, '�� ������') �����, ISNULL(p.Subject, '�� ���� ���������') �������, MIN(p.Balls) ���� from Pupil p GROUP BY p.School, p.Subject WITH CUBE

--3.	�������� ������, ������� ������� ������� ���� �������� �� ������ � �� ���������.
SELECT ISNULL(p.School, '�� ������') �����, ISNULL(p.Subject, '�� ���� ���������') �������, AVG(p.Balls) ���� from Pupil p GROUP BY Grouping SETS(p.School, p.Subject)
 
--4.	�������� ������, ������� ������� ���������� �������� �� ������ ����� �� ����-����� � ������������� �����. NULL �������� �������� �� ��������������� �����.
SELECT ISNULL(p.School, '�� ������') �����, ISNULL(p.Subject, '�� ���� ���������') �������, COUNT(Surname) ����� from Pupil p GROUP BY ROLLUP(p.School, p.Subject)

--5.	�������� ������, ������� ������� ��������� ���� �������� �� ������ � �� ����-�����, � ������������� �����. 
--� �������� ������� NULL �������� �������� �� ��������������� ����� � ����������� �� �����������.
SELECT ISNULL(p.School, '�� ������') �����, ISNULL(p.Subject, '�� ���� ���������') �������, SUM(p.Balls) ����� from Pupil p GROUP BY CUBE(p.School, p.Subject) 

--6.	�������� ������, ������� ������� ������������ ���� �������� �� ������ � �� ���������. 
--� �������� ������� NULL �������� �������� �� ��������������� ����� � ����-������� �� ������� �����������.
SELECT 
	CASE GROUPING_ID(p.Subject, p.School)
	WHEN 1 THEN '��� �����'
	WHEN 3 THEN '�����'
	ELSE ''
END AS '�����',
ISNULL(p.School, '') �����, ISNULL(p.Subject, '') �������, MAX(p.Balls) �������� from Pupil p GROUP BY Cube(p.School, p.Subject) 

--7.	�������� ������, ������� ������� ������� ���� �������� �� ������ � �������.
SELECT '������� ����' AS [������� ���� �� ������], [����� �11],[��������],[�����]
'������� ����' FROM (SELECT p.Balls, p.School from Pupil p) AS pp
PIVOT (Avg(pp.Balls) FOR School IN ([����� �11],[��������],[�����])) AS Pivot_Table

--8.	�������� ������, ������� ������� ������� ���� �������� �� ������ � ������� � �� ��������� � ������.
SELECT Subject, [����� �11],[��������],[�����]
'������� ����' FROM (SELECT p.Subject, p.Balls, p.School from Pupil p) AS pp
PIVOT (Avg(pp.Balls) FOR School IN ([����� �11],[��������],[�����])) AS Pivot_Table

--9.	�������� ������, ������� ������� �������� ���������, ������� �������� � ����� � ���� �������.
SELECT Surname_Subject_School
FROM (
    SELECT Subject, Surname, School
    FROM Pupil
) AS Source
UNPIVOT (
    Surname_Subject_School FOR Attribute IN (Subject, Surname, School)
) unpivo

--��17
--1.	�������� � ��������� ������������ SQL-������, ���������� ������ N ����� �� �������� �������.
DECLARE @DSQL NVARCHAR(100), @TN NVARCHAR(50), @N int = 3
SET @TN = 'dbo.Pupil'
SET @DSQL = 'SELECT TOP ' + Cast(@N as nvarchar) + ' * FROM ' + @TN
EXECUTE (@DSQL)

--2.	�������� � ��������� ������������ SQL-������, ���������� ��� ������ �� ���-���� ��������, ��������� ����� �������� ������� ����������� � �������� ���������.
Declare @L1 CHAR(1)
Declare @L2 CHAR(1)
Set @L1 = '�'
Set @L2 = '�'

EXECUTE('Select * From Country WHERE Name_Country LIKE ''%_['+@L1+'-'+@L2+']''')

--3.	�������� ��������� ������� #Temp � �������� � ��� �������� �������� ������� ��������. 
--�������� ������, �������, ��������� ����� ������� #Temp, �������� ������ ��� ��������������� ������� �� ������� ��������.
CREATE TABLE #TEMP (TABLENAME NVARCHAR(50))

INSERT INTO #TEMP VALUES
('ID'),
('Name_Country'),
('Capital'),
('Square_Country'),
('Population'),
('Continent')


DECLARE TC CURSOR
FOR SELECT TABLENAME FROM #TEMP

OPEN TC
DECLARE @TN NVARCHAR(50)
FETCH FROM TC INTO @TN
WHILE @@FETCH_STATUS = 0
	BEGIN
		EXECUTE ('SELECT ' + @TN + ' FROM Country')
		FETCH FROM TC INTO @TN
	END

CLOSE TC
DEALLOCATE TC
DROP TABLE #TEMP

--4.	�������� ���������, ������� ��������� ��� �������� ������ ��������, �������� ������� � �������� �������� ������� �� �������� �������.
Declare @NameTable nvarchar(50), @Col1 nvarchar(50), @Col2 nvarchar(50)
Set @NameTable = 'Country'
Set @Col1 = 'Name_Country'
Set @Col2 = 'Capital'

Exec('Select ' + @Col1 + ' ,' + @Col2 + ' From ' + @NameTable)

--5.	�������� ���������, ����������� ��� �������� ������ ��������, �������� �������, �������� ������������ �������, ���� ���������, �������� �������� � ���������� ��-������ ������� �� �������� ������� � �������� ��������.
--������� ������, � ���������� ������, ��� 10 ���
Declare @NameTable nvarchar(50), @Col1 nvarchar(50), @Col2 nvarchar(50), @CheckChar varchar(3), @CheckValue int
Set @NameTable = 'Country'
Set @Col1 = 'Name_Country'
Set @Col2 = 'Population'
Set @CheckChar = '>'
Set @CheckValue = 10000000

Exec('Select ' + @Col1 + ' ,' + @Col2 + ' From ' + @NameTable +
' Where ' + @Col2 + ' ' + @CheckChar + ' ' + @CheckValue)

--6.	�������� ������ ����������� ����� �� ������� �������� � ������������� � RAW ������� XML.
Select * from Country where Continent = '������' For XML RAW

--7.	�������� ������ ����� � ���������� ������ 100 ���. ���. �� ������� �������� � ������������� � PATH ������� XML.
Select * from Country Where Population > 100000000 For XML PATH

--8.	�������� ������ �������� �� ����� ������ �� ������� �������� � ��������-����� � PATH ������� JSON
SELECT * From Pupil Where School = '�����' FOR JSON PATH