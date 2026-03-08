CREATE DATABASE BAC_BSCIT_TA

USE BAC_BSCIT_TA

CREATE TABLE StudentAcademicData (
    StuID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    Credits INT NOT NULL
);

CREATE TABLE Enrollments (
    Enroll_ID INT PRIMARY KEY,
    StuID INT NOT NULL,
    CourseID INT NOT NULL,
    Marks INT NOT NULL,

    FOREIGN KEY (StuID) REFERENCES StudentAcademicData(StuID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);


INSERT INTO StudentAcademicData (StuID, Name, City) VALUES
(101, 'Amit', 'Rajkot'),
(102, 'Neha', 'Surat'),
(103, 'Rohan', 'Baroda'),
(104, 'Meera', 'Rajkot'),
(105, 'Jatin', 'Ahmedabad'),
(106, 'Kajal', 'Surat');

SELECT * FROM StudentAcademicData


INSERT INTO Course (CourseID, CourseName, Credits) VALUES
(1, 'DBMS', 4),
(2, 'Operating System', 3),
(3, 'Computer Networks', 4),
(4, 'Data Structures', 3),
(5, 'Python Programming', 4);

SELECT * FROM Course


INSERT INTO Enrollments (Enroll_ID, StuID, CourseID, Marks) VALUES
(1, 101, 1, 85),
(2, 101, 2, 78),
(3, 101, 5, 92),
(4, 102, 1, 88),
(5, 102, 3, 75),
(6, 103, 2, 67),
(7, 103, 4, 73),
(8, 104, 5, 95),
(9, 105, 1, 56),
(10, 105, 3, 61),
(11, 106, 2, 82),
(12, 106, 4, 77);

SELECT * FROM Enrollments


--Perform the following queries on the above-given tables: 


--1. Display student names with the courses they enrolled in.

SELECT 
    S.Name AS StudentName,
    C.CourseName
FROM StudentAcademicData S
JOIN Enrollments E ON S.StuID = E.StuID
JOIN Course C ON E.CourseID = C.CourseID;


--2. Display students and their marks.

SELECT S.Name, E.Marks
FROM StudentAcademicData S
JOIN Enrollments E ON S.StuID = E.StuID;

--3. Display students who enrolled in DBMS.

SELECT S.Name
FROM StudentAcademicData S
JOIN Enrollments E ON S.StuID = E.StuID
JOIN Course C ON E.CourseID = C.CourseID
WHERE C.CourseName = 'DBMS';


--4. Display all students and their enrollments (include non-enrolled students). 

SELECT S.Name, C.CourseName,E.Enroll_ID AS Enrollment, E.Marks AS Mark
FROM StudentAcademicData S
LEFT JOIN Enrollments E ON S.StuID = E.StuID
LEFT JOIN Course C ON E.CourseID = C.CourseID;

--5. Display courses that have no enrollments. 

SELECT C.CourseName
FROM Course C
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID
WHERE E.CourseID IS NULL;


--6. Display students with city and course credits. 

SELECT S.Name, S.City, C.CourseName, C.Credits
FROM StudentAcademicData S
JOIN Enrollments E ON S.StuID = E.StuID
JOIN Course C ON E.CourseID = C.CourseID;


--7. Display total number of courses each student has enrolled in.

SELECT S.Name, COUNT(E.CourseID) AS TotalCourses
FROM StudentAcademicData S
JOIN Enrollments E ON S.StuID = E.StuID
GROUP BY S.Name;


--8. Display student names with marks greater than 80. 

SELECT S.Name, E.Marks
FROM StudentAcademicData S
JOIN Enrollments E ON S.StuID = E.StuID
WHERE E.Marks > 80;


--9. Display students and courses in which credits = 4.

SELECT S.Name, C.CourseName, C.Credits
FROM StudentAcademicData S
JOIN Enrollments E ON S.StuID = E.StuID
JOIN Course C ON E.CourseID = C.CourseID
WHERE C.Credits = 4;


--10. Display average marks of each student.

SELECT S.Name, AVG(E.Marks) AS AverageMarks
FROM StudentAcademicData S
JOIN Enrollments E ON S.StuID = E.StuID
GROUP BY S.Name;


--11. Display highest marks obtained in each course. 

SELECT C.CourseName, MAX(E.Marks) AS HighestMarks
FROM Course C
JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY C.CourseName;


--12. Display students who scored below 60 in any course.

SELECT S.Name, E.Marks
FROM StudentAcademicData S
JOIN Enrollments E ON S.StuID = E.StuID
WHERE E.Marks < 60;


--13. Display students and courses from Rajkot city only.

SELECT S.Name, C.CourseName
FROM StudentAcademicData S
JOIN Enrollments E ON S.StuID = E.StuID
JOIN Course C ON E.CourseID = C.CourseID
WHERE S.City = 'Rajkot';


--14. Display total marks gained by each student.

SELECT S.Name, SUM(E.Marks) AS TotalMarks
FROM StudentAcademicData S
JOIN Enrollments E ON S.StuID = E.StuID
GROUP BY S.Name;


--15. Display the list of students who have taken at least 3 courses. 

SELECT S.Name, COUNT(E.CourseID) AS TotalCourses
FROM StudentAcademicData S
JOIN Enrollments E ON S.StuID = E.StuID
GROUP BY S.Name
HAVING COUNT(E.CourseID) >= 3;


--16. Display students who have the highest marks in their courses. 

SELECT S.Name, C.CourseName, E.Marks
FROM StudentAcademicData S
JOIN Enrollments E ON S.StuID = E.StuID
JOIN Course C ON E.CourseID = C.CourseID
WHERE E.Marks = (
    SELECT MAX(Marks)
    FROM Enrollments
    WHERE CourseID = E.CourseID
);


--17. Display students who scored above the average marks of that course.

SELECT S.Name, C.CourseName, E.Marks
FROM StudentAcademicData S
JOIN Enrollments E ON S.StuID = E.StuID
JOIN Course C ON E.CourseID = C.CourseID
WHERE E.Marks > (
      SELECT AVG(Marks)
      FROM Enrollments
      WHERE CourseID = E.CourseID
);


--18. Display each students highest and lowest marks with course names.

SELECT S.Name, C.CourseName, E.Marks
FROM StudentAcademicData S
JOIN Enrollments E ON S.StuID = E.StuID
JOIN Course C ON E.CourseID = C.CourseID
WHERE E.Marks IN (
        SELECT MAX(Marks) 
        FROM Enrollments 
        WHERE StuID = E.StuID
      )
   OR E.Marks IN (
        SELECT MIN(Marks) 
        FROM Enrollments 
        WHERE StuID = E.StuID
      );


--19. Display students enrolled in at least one 4-credit course.

SELECT DISTINCT S.Name
FROM StudentAcademicData S
JOIN Enrollments E ON S.StuID = E.StuID
JOIN Course C ON E.CourseID = C.CourseID
WHERE C.Credits = 4;


--20. Display the total marks of each course and arrange them from highest to lowest. 

SELECT C.CourseName, SUM(E.Marks) AS TotalMarks
FROM Course C
JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY C.CourseName
ORDER BY TotalMarks DESC;

