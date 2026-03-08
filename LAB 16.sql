----Implementation of Aggregate Functions in SQL (Part – 2) 

---PART-A

--1. Display the Highest, Lowest SPI of all students & label the columns Maximum, Minimum respectively. 
SELECT MAX(SPI) AS Maximum,
	   MIN(SPI) AS Minimum
FROM STUDENT_DATA

--2. Find total number of students of student table. 
SELECT COUNT(SID) AS TOTAL_STUDENTS
FROM Student_Data

--3. Retrieve maximum SPI from BCA department. 
SELECT MAX(SPI) AS MAX_SPI
FROM Student_Data
WHERE Department = 'BCA'

--4. Count total number of cities of students without duplication. 
SELECT COUNT(DISTINCT CITY) AS TOTAL_CITIES
FROM Student_Data

--5. Display city with the total number of students belonging to each city.
SELECT CITY,COUNT(SID) AS TOTAL_STUDENTS
FROM Student_Data
GROUP BY CITY

--Part – B 
--6. Display city having more than one student. 
SELECT CITY,COUNT(SID) AS STUDENT_COUNT
FROM Student_Data
GROUP BY CITY
HAVING COUNT(SID)>1

--7. Give total SPI of each department of student table.
SELECT DEPARTMENT,SUM(SPI) AS TOTAL_SPI
FROM Student_Data
GROUP BY Department

--8. Give average SPI of each department of student table without displaying the respective department 
--name. 
SELECT AVG(SPI) AS AVERAGE_SPI
FROM Student_Data
GROUP BY Department

--9. Give minimum SPI of student who belongs to Ahmedabad. 
SELECT MIN(SPI) AS MIN_SPI
FROM Student_Data
WHERE CITY = 'AHMEDABAD'

--10. List the departments having total SPI more than 15. 
SELECT DEPARTMENT,SUM(SPI) AS TOTAL_SPI
FROM Student_Data
GROUP BY Department
HAVING SUM(SPI)>15

--Part – C 
--11. Display department having more than one student. 
SELECT DEPARTMENT,COUNT(SID) AS STUDENT_COUNT
FROM Student_Data
GROUP BY Department
HAVING COUNT(SID)>1

--12. Find total number of students from MCA department.
SELECT COUNT(SID) AS STUDENT_COUNT
FROM Student_Data
WHERE Department = 'MCA'

--13. Retrieve maximum SPI from BBA department. 
SELECT MAX(SPI) AS MAX_SPI
FROM Student_Data
WHERE Department = 'BBA'

--14. Count total number of department of students table without duplication. 
SELECT COUNT(DISTINCT DEPARTMENT) AS DEPT_COUNT
FROM Student_Data

--15. List the departments having total number of students more than one. 
SELECT DEPARTMENT,COUNT(SID) AS STUDENT_COUNT
FROM Student_Data
GROUP BY Department
HAVING COUNT(SID)>1