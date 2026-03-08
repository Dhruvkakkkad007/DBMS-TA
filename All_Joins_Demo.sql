--What is JOIN?
--JOIN is used to combine rows from two or more tables based on a related column.

--Types Of Joins:

--1.INNER JOIN
--2.LEFT JOIN
--3.RIGHT JOIN
--4.FULL JOIN
--5.CROSS JOIN


CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Courses (
    StudentID INT,
    CourseName VARCHAR(50)
);


INSERT INTO Students VALUES
(1,'Rahul'),
(2,'Priya'),
(3,'Aman'),
(4,'Neha');

INSERT INTO Courses VALUES
(1,'Java'),
(2,'DBMS'),
(5,'Python');
SELECT * FROM Students
SELECT * FROM Courses
--Rahul → match

--Priya → match

--Aman → no course

--Neha → no course

--Python course → student missing

--1.INNER JOIN

--Returns only matching rows from both tables.

SELECT Students.StudentID, Students.Name, Courses.CourseName
FROM Students
INNER JOIN Courses
ON Students.StudentID = Courses.StudentID;

--Output
-- StudentID	Name	CourseName
--  1	        Rahul	Java
--  2	        Priya	DBMS


--Only common StudentID appear.

--2️ LEFT JOIN (LEFT OUTER JOIN)


SELECT Students.StudentID, Students.Name, Courses.CourseName
FROM Students
LEFT JOIN Courses
ON Students.StudentID = Courses.StudentID;

--Output
--  StudentID	Name	CourseName
--  1	        Rahul	Java
--  2	        Priya	DBMS
--  3	        Aman	NULL
--  4	        Neha	NULL


--Students without courses = NULL

--3.RIGHT JOIN

--Returns all rows from right table and matching rows from left table.


SELECT Students.StudentID, Students.Name, Courses.CourseName
FROM Students
RIGHT JOIN Courses
ON Students.StudentID = Courses.StudentID;

--OUTPUT
-- StudentID	Name	CourseName
-- 1	        Rahul	Java
-- 2	        Priya	DBMS
-- NULL	        NULL	Python


--Course Python exists but student not found.

--4.FULL JOIN

--Returns all rows from both tables.


SELECT s.StudentID, s.Name, c.CourseName
FROM Students s
FULL OUTER JOIN Courses c
ON s.StudentID = c.StudentID;


--OUTPUT
--StudentID	Name	CourseName
--1	        Rahul	Java
--2	        Priya	DBMS
--3	        Aman	NULL
--4	        Neha	NULL
--NULL	    NULL	Python


--Returns:
--Matching rows
--Left table unmatched rows
--Right table unmatched rows


--5. CROSS JOIN 

--Every row of first table combines with every row of second table.


SELECT Students.Name, Courses.CourseName
FROM Students
CROSS JOIN Courses;


--Output (Example)

--Name	Course
--Rahul	Java
--Rahul	DBMS
--Rahul	Python
--Priya	Java
--Priya	DBMS
--Priya	Python
--Aman	Java
--Aman	DBMS
--Aman	Python

--LOGIC
--Students rows × Courses rows
--4 × 3 = 12 rows





--Golden Trick

--INNER JOIN  => Only Match
--LEFT JOIN   => All Left + Match
--RIGHT JOIN  => All Right + Match
--FULL JOIN   => Everything
--CROSS JOIN  => All Combinations