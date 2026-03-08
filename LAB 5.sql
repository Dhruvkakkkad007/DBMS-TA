                                        --LAB 5--
CREATE TABLE Students (
    StuID INT,
    FirstName VARCHAR(25),
    LastName VARCHAR(25),
    Website VARCHAR(50),
    City VARCHAR(25),
    Division VARCHAR(20)
);


INSERT INTO Students (StuID, FirstName, LastName, Website, City, Division)
VALUES
(1011, 'Keyur', 'Patel', 'techonthenet.com', 'Rajkot', 'II-BCX'),
(1022, 'Hardik', 'Shah', 'digminecraft.com', 'Ahmedabad', 'I-BCY'),
(1033, 'Kajal', 'Trivedi', 'bigactivities.com', 'Baroda', 'IV-DCX'),
(1044, 'Bhoomi', 'Gajera', 'checkyourmath.com', 'Ahmedabad', 'III-DCW'),
(1055, 'Harmit', 'Mitel', NULL, 'Rajkot', 'II-BCY'),
(1066, 'Ashok', 'Jani', NULL, 'Baroda', 'II-BCZ');

SELECT * FROM Students



--Part - A 

--1. Display the name of students whose first name starts with ‘k'.
    SELECT FIRSTNAME FROM Students
    WHERE FirstName LIKE 'K%';
--2. Display the name of students whose first name consists of five characters.
    SELECT FIRSTNAME FROM Students
    WHERE FirstName LIKE '_____';
--3. Retrieve the first name & last name of students whose city name ends with a & contains six characters. 
    SELECT FIRSTNAME,LASTNAME
    FROM Students
    WHERE CITY LIKE '%A' AND CITY LIKE '______';
--4. Display all the students whose last name ends with ‘tel’. 
    SELECT * FROM Students
    WHERE LASTNAME LIKE '%TEL';
--5. Display all the students whose first name starts with ‘ha’ & ends with ‘t’. 
    SELECT * FROM Students
    WHERE FirstName LIKE 'HA%T';
--6. Display all the students whose first name starts with ‘k’ and third character is ‘y’. 
    SELECT * FROM Students
    WHERE FirstName LIKE 'K_Y%';
--7. Display the name of students having no website and name consists of five characters. 
     SELECT * FROM Students
    WHERE WEBSITE=NULL AND FirstName LIKE '_____';
--8. Display all the students whose last name consists of ‘jer’. 
    SELECT * FROM Students
    WHERE LastName LIKE '%JER%';
--9. Display all the students whose city name starts with either ‘r’ or ‘b’. 
    SELECT * FROM Students
    WHERE CITY LIKE 'R%' OR CITY LIKE 'B%';
    --or--
    select * from Students
    where city like '[rb]%'
--10. Display all the students name having websites. 
    SELECT * FROM Students
    WHERE Website IS NOT NULL;


--Part - B 

--11. Display all the students whose name starts from alphabet A to H. 
    SELECT * FROM Students
    WHERE FirstName LIKE '[A-H]%';
--12. Display all the students whose name’s second character is vowel. 
    SELECT * FROM Students
    WHERE FirstName LIKE '[_AEIOU]%';
--13. Display student’s name whose city name consist of ‘rod’.
    SELECT * FROM Students
    WHERE City LIKE '%rod%';
--14. Retrieve the First & Last Name of students whose website name starts with ‘bi’. 
    SELECT FirstName,LastName FROM Students
    WHERE  WEBSITE LIKE 'BI%';
--15. Display student’s city whose last name consists of six characters. 
 SELECT City
FROM Students
WHERE LEN(LastName) = 6;


--Part - C 

--16. Display all the students whose city name consist of five characters & not start with ‘ba’. 
       SELECT *
FROM Students
WHERE LEN(CITY) = 6 AND CITY  NOT LIKE 'BA%';
--17. Show all the student’s whose division starts with ‘II’.
    SELECT *
FROM Students
WHERE Division LIKE 'II%';
--18. Find out student’s first name whose division contains ‘bc’ anywhere in division name. 
 SELECT FirstName
FROM Students
WHERE Division LIKE '%BC%';
--19. Show student id and city name in which division consist of six characters and having website name. 
    SELECT StuID , City
FROM Students
WHERE LEN(Division) = 6 AND Website IS NOT NULL;
--20. Display all the students whose name’s third character is consonant.

SELECT *
FROM Students
WHERE FirstName not LIKE '__[a,e,i,o,u]%';
    