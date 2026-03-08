CREATE DATABASE LAB_BCA

USE LAB_BCA


CREATE TABLE DU_Students (
    StuID INT,
    Name VARCHAR(20),
    EnrollmentNo VARCHAR(100),
    Division VARCHAR(10),
    Sem VARCHAR(100),
    BirthDate DATETIME,
    Email VARCHAR(100),
    ContactNo VARCHAR(10)
);

INSERT INTO DU_Students 
(StuID, Name, EnrollmentNo, Division, Sem, Email, ContactNo)
VALUES
(101, 'Naimish Patel', '090200107051', 'BCX-3', 3, 'naimishp49@gmail.com', '8866205253'),

(102, 'Firoz A. S.', '090200107090', 'BCY-3', 3, 'firoz.me@yahoo.com', '8885999922'),

(103, 'Krunal Vyas', '090243107101', 'BCZ-5', 5, 'krunal.vyas@gmail.com', '9990888877'),

(104, 'Vijay Patel', '090200107102', 'BCX-5', 5, 'vijay.patel123@gmail.com', '8787878787'),

(105, 'Vimal Trivedi', '090200107103', 'BCY-3', 3, 'vimal123@yahoo.com', '8789564512');


 
--1. Display all the records of DU_Students table. 

    SELECT * FROM DU_Students;


--2. Display students studying in BCY-3.

    SELECT * FROM DU_Students
    WHERE Division = 'BCY-3';


--3.Display 5th semester students.

    SELECT * FROM DU_Students
    WHERE Sem = 5;

--4.Display contact number of all students. 

    SELECT ContactNo FROM DU_Students;

--5.Display name and division of all students. 

    SELECT Name, Division FROM DU_Students;


--6.Extract last 3 digits of ContactNo. 
    SELECT Name, RIGHT(ContactNo, 3) AS Last3Digits
    FROM DU_Students;

--7.Display students sorted by Name in ascending order. 

    SELECT * FROM DU_Students
    ORDER BY Name ASC;


--8.Display Name of Student who belongs to either Semester 3 or 5. (Use IN & OR)
    SELECT Name FROM DU_Students
    WHERE Sem IN (3, 5);

--9.Find Student Name & Enrollment No in which Student Id between 103 to 105.

    SELECT Name, EnrollmentNo 
    FROM DU_Students
    WHERE StuID BETWEEN 103 AND 105;


--10. Find Student Name & Enrollment No with their Email Who belongs to 5th Semester.

    SELECT Name, EnrollmentNo, Email
    FROM DU_Students
    WHERE Sem = 5;


--11. Display All the Details of first three students.

    SELECT TOP 3 * FROM DU_Students
  


--12. Display length of each student name. 
    SELECT Name, LEN(Name) AS NameLength
    FROM DU_Students;



--13. Update semester to 5 and Contact number to 98984477 whose id is 101.

    UPDATE DU_Students
    SET Sem = 5, ContactNo = '98984477'
    WHERE StuID = 101;



--14. Display Name & Enrollment no of first 30% Students. 

    SELECT TOP 30 PERCENT Name, EnrollmentNo
    FROM DU_Students;


--15. Display current date with student name. 

    SELECT Name, GETDATE() AS Today
    FROM DU_Students;


--16. Display Unique Semesters.

    SELECT DISTINCT Sem FROM DU_Students;


--17. Display semester 5 student�s division and Enrollment No.

    SELECT Division, EnrollmentNo 
    FROM DU_Students
    WHERE Sem = 5;

--18. Retrieve All the Students who have no Enrollment No. 

    SELECT *
    FROM DU_Students
    WHERE EnrollmentNo IS NULL;


--19. Display students whose email ends with 'gmail.com'. 

    SELECT *
    FROM DU_Students
    WHERE Email LIKE '%gmail.com';


--20. Find Students who born after date 01-01-1990. 

    SELECT *
    FROM DU_Students
    WHERE BirthDate > '1990-01-01';


--21. Modify ContactNo data type to VARCHAR(15).

    ALTER TABLE DU_Students
    ALTER COLUMN ContactNo VARCHAR(15);


--22. Display students whose name contains 'Patel'. 

    SELECT *
    FROM DU_Students
    WHERE Name LIKE '%Patel%';


--23. Display student name in uppercase. 

    SELECT UPPER(Name) AS UpperName
    FROM DU_Students;

   
--24. Rename column Name to StudentName 
 
   EXEC SP_RENAME 'DU_Students.StudentName','Name'

--25. Update Division BCX-3 to BCX-4. 

    UPDATE DU_Students
    SET Division = 'BCX-4'
    WHERE Division = 'BCX-3';


--26. Update Division to BCX-5 & Semester to 5 whose Student Id Is 102. 

    UPDATE DU_Students
    SET Division = 'BCX-5', Sem = 5
    WHERE StuID = 102;


--27. Add one more Column City Varchar (50) in DU_Students table. 

    ALTER TABLE DU_Students
    ADD City VARCHAR(50);


--28. Remove All BCX-4 Division Students. 

    DELETE FROM DU_Students
    WHERE Division = 'BCX-4';


--29. Truncate the table (removes all data).

    TRUNCATE TABLE DU_Students;

--30. Remove table DU_Students from the database.

    DROP TABLE DU_Students;
