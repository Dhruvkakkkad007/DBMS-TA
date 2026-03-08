----LAB-17

---Practice the basic SQL commands, various built-in functions (Math, String, Date), Aggregate functions and 
---Group by Having clause.

--1. Display all the employees whose name starts with “m” and 4th character is “h”. 
SELECT *
FROM Employees
WHERE EName LIKE 'M__H%'

--2. Find the value of 3 raised to 5. Label the column as output.
SELECT POWER(3,5) AS OUTPUT

--3. Write a query to subtract 20 days from the current date. 
SELECT DATEADD(DAY,-20,GETDATE()) AS OUTPUT_DATE

--4. Write a query to display name of employees whose name starts with “j” and contains “n” in their 
--name. 
SELECT EName
FROM Employees
WHERE EName LIKE 'J%N%';

--5. Display 2nd to 9th character of the given string “SQL Programming”. 
SELECT SUBSTRING('SQL Programming',2,9) AS OUTPUT_STRING

--6. Display name of the employees whose city name ends with “ney” &contains six characters.
SELECT ENAME
FROM Employees
WHERE CITY LIKE '___NEY'

--7. Write a query to convert value 15 to string. 
SELECT CAST(15 AS varchar(5)) AS CASTED_NUMBER

--8. Add department column with varchar(20) to Employees table.
ALTER TABLE EMPLOYEES
ADD DEPARTMENT VARCHAR(20)

--9. Set the value of department to Marketing who belongs to London city. 
UPDATE EMPLOYEES
SET Department = 'Marketing'
WHERE City = 'London';

SELECT * FROM Employees

--10. Display all the employees whose name ends with either “n” or “y”. 
SELECT *
FROM Employees
WHERE EName LIKE '%[NY]'

--11. Find smallest integer value that is greater than or equal to 63.1, 63.8 and -63.2. 
SELECT CEILING(63.1) AS [CEIL_63.1],
	   CEILING(63.8) AS [CEIL_63.8],
	   CEILING(-63.2) AS [CEIL_-63.2]

--12. Display all employees whose joining date is not available. 
SELECT *
FROM Employees
WHERE JoiningDate IS NULL

--13. Display name of the employees in capital letters and city in small letters.
SELECT UPPER(ENAME) AS EMP_NAME,
	   LOWER(CITY) AS CITY_NAME
FROM Employees

--14. Change the data type of Ename from varchar(30) to char(30). 
ALTER TABLE EMPLOYEES
ALTER COLUMN ENAME CHAR(30)

--15. Display city wise maximum salary. 
SELECT CITY,MAX(SALARY) AS MAX_SALARY
FROM Employees
GROUP BY CITY

--16. Produce output like <Ename> works at <city> and earns <salary>. 
SELECT 
    LTRIM(RTRIM(ENAME)) + ' works at ' +
    LTRIM(RTRIM(CITY)) + 
    ' and earns ' + CAST(SALARY AS VARCHAR(15)) AS RESULT
FROM Employees;

--17. Find total number of employees whose salary is more than 5000. 
SELECT COUNT(EID) AS TOTAL_EMPLOYEES
FROM Employees
WHERE Salary>5000

--18. Write a query to display first 4 & last 3 characters of all the employees. 
SELECT LEFT(ENAME,4) AS FIRST_4,
	   RIGHT(ENAME,3) AS LAST_3
FROM Employees

--19. List the city having total salaries more than 15000 and employees joined after 1st January, 2014. 
SELECT City
FROM Employees
WHERE JoiningDate > '2014-01-01'
GROUP BY City
HAVING SUM(Salary) > 15000;

--20. Write a query to replace “u” with “oo” in Ename. 
SELECT REPLACE(ENAME,'U','oo') AS REPLACED_TEXT
FROM Employees

--21. Display city with average salaries and total number of employees belongs to each city.
SELECT CITY,AVG(SALARY) AS AVG_SALARY,COUNT(EID) AS TOTAL_EMPLOYEES
FROM Employees
GROUP BY CITY

--22. Display total salaries paid to female employees. 
SELECT SUM(Salary) AS TOTAL_SALARY
FROM Employees
WHERE Gender = 'FEMALE'

--23. Display name of the employees and their experience in years. 
SELECT ENAME,DATEDIFF(YEAR,JoiningDate,GETDATE()) AS EXPERIENCE
FROM EMPLOYEES

--24. Remove column department from employees table. 
ALTER TABLE EMPLOYEES
DROP COLUMN DEPARTMENT

--25. Update the value of city from sydney to null. 
UPDATE EMPLOYEES
SET CITY = NULL
WHERE CITY = 'SYDNEY'

--26. Retrieve all the Employee’s Name, Salary & Joining date. 
SELECT ENAME,SALARY,JOININGDATE
FROM Employees

--27. Find out combine length of Ename & Gender.
SELECT LEN(ENAME+GENDER) AS STR_LENGTH
FROM Employees

--28. Find the difference between highest & lowest salary. 
SELECT MAX(SALARY)-MIN(SALARY)  AS RESULT
FROM Employees

--29. Rename a column from Ename to FirstName. 
SP_RENAME 'EMPLOYEES.Ename','FirstName'

--30. Rename a table from Employees to EmpMaster. 
SP_RENAME 'Employees', 'EmpMaster'

