 ---Implementation of Aggregate Functions in SQL (Part – 1)

CREATE TABLE Student_Marks (
    SID INT,
    SName VARCHAR(25),
    Marks INT
);

INSERT INTO Student_Marks (SID, SName, Marks) VALUES
(1, 'John', 90),
(2, 'Martin', 90),
(3, 'Carol', 80),
(4, 'Jack', 99),
(5, 'Rose', 88),
(6, 'Mary', 90);

--Part – A 

--1. Find the total number of students. 
SELECT COUNT(SID) AS TOTAL_STUDENTS
FROM Student_Marks

--2. Find the total marks scored by all students.
SELECT SUM(Marks) AS TOTAL_MARKS
FROM Student_Marks

--3. Find the average marks of all students. 
SELECT AVG(Marks) AS AVERAGE_MARKS
FROM Student_Marks

--4. Find the minimum marks scored by any student.
SELECT MIN(Marks) AS MIN_MARKS
FROM Student_Marks

--5. Find the maximum marks scored by any student.
SELECT MAX(Marks) AS MAX_MARKS
FROM Student_Marks

--Part – B 

CREATE TABLE Employee (
    EID INT PRIMARY KEY,
    EName VARCHAR(50),
    Department VARCHAR(20),
    Salary INT,
    JoiningDate DATE,
    City VARCHAR(50)
);

INSERT INTO Employee (EID, EName, Department, Salary, JoiningDate, City) VALUES
(101, 'Rahul', 'Admin', 56000, '1990-01-01', 'Rajkot'),
(102, 'Hardik', 'IT', 18000, '1990-09-25', 'Ahmedabad'),
(103, 'Bhavin', 'HR', 25000, '1991-05-14', 'Baroda'),
(104, 'Bhoomi', 'Admin', 39000, '1991-02-08', 'Rajkot'),
(105, 'Rohit', 'IT', 17000, '1990-07-23', 'Jamnagar'),
(106, 'Priya', 'IT', 9000, '1990-10-18', 'Ahmedabad'),
(107, 'Neha', 'HR', 34000, '1991-12-25', 'Rajkot');

--1. Display the Highest, Lowest, Total, and Average salary of all employees & label the columns Maximum, 
--Minimum, Total_Sal and Average_Sal, respectively. 
SELECT MAX(SALARY) AS Maximum,
	   MIN(SALARY) AS Minimum,
	   SUM(SALARY) AS Total_Sal,
	   AVG(SALARY) AS Average_Sal
FROM Employee

--2. Find total number of employees of EMPLOYEE table. 
SELECT COUNT(EID) AS TOTAL_EMPLOYEES
FROM Employee

--3. Retrieve maximum salary from IT department. 
SELECT MAX(SALARY) AS MAX_SALARY
FROM Employee
WHERE Department = 'IT'

--4. Count total number of cities of employee without duplication. 
SELECT COUNT(DISTINCT CITY) AS CITY_COUNT
FROM Employee

--5. Display city with the total number of employees belonging to each city.
SELECT CITY, COUNT(EID) AS TOTAL_EMPLOYEE
FROM Employee
GROUP BY CITY

--6. Display city having more than one employee.
SELECT CITY,COUNT(EID) AS EMPLOYEE_COUNT
FROM Employee
GROUP BY CITY
HAVING COUNT(EID)>1

--7. Give total salary of each department of EMPLOYEE table. 
SELECT DEPARTMENT,SUM(SALARY) AS TOTAL_SALARY
FROM Employee
GROUP BY Department

--8. Give average salary of each department of EMPLOYEE table without displaying the respective 
--department name. 
SELECT  AVG(SALARY) AS AVG_SALARY
FROM Employee
GROUP BY Department

--9. Give minimum salary of employee who belongs to Ahmedabad. 
SELECT MIN(SALARY) AS MIN_SALARY
FROM Employee
WHERE CITY = 'AHMEDABAD'

--10.  List the departments having total salaries more than 50000 and located in city Rajkot. 
SELECT DEPARTMENT,SUM(SALARY) AS TOTAL_SALARIES
FROM Employee
WHERE CITY = 'RAJKOT'
GROUP BY DEPARTMENT
HAVING SUM(SALARY)> 50000
