--LAB 12

--Implementation of DATE Functions in SQL 

--Part – A 

--1. Write a query to display the current date & time. Label the column Today_Date.
SELECT GETDATE() AS Today_Date

--2. Write a query to find new date after 365 day with reference to today. 
SELECT DATEADD(day,365,GETDATE()) AS NEW_DATE_365

--3. Display the current date in a format that appears as may 5 1994 12:00AM. 
select  FORMAT(GETDATE(),'MMM d yyyy hh:mmtt')

--4. Display the current date in a format that appears as 03 Jan 1995.
SELECT FORMAT(GETDATE(), 'dd MMM yyyy') AS FormattedDate;

--5. Display the current date in a format that appears as Jan 04, 96. 
SELECT FORMAT(GETDATE(), 'MMM dd, yy') AS FormattedDate;

--Part – B 
--6. Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09. 
SELECT DATEDIFF(MONTH, '2008-12-31', '2009-03-31') AS TOTAL_MONTHS;

--7. Write a query to find out total number of years between 25-Jan-12 and 14-Sep-10.
SELECT DATEDIFF(YEAR, '2010-09-14', '2012-01-25') AS TOTAL_YEARS;

--8. Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30. 
SELECT DATEDIFF(HOUR, '2012-01-25 07:30', '2012-01-26 11:30') AS TOTAL_HOURS;

--9. Write a query to extract Day, Month, Year from given date 12-May-16. 
SELECT DAY('12-May-16') AS [DAY],
	   MONTH('12-May-16') AS [MONTH],
	   YEAR('12-May-16') AS [YEAR]

--10. Write a query that adds 5 years to current date.
SELECT DATEADD(YEAR,5,GETDATE()) AS [5_YEARS_LATER]

--Part – C 
--11. Write a query to subtract 2 months from current date. 
SELECT DATEADD(MONTH, -2, GETDATE()) AS RESULT;

--12. Extract month from current date using datename () and datepart () function. 
SELECT DATENAME(MONTH,GETDATE()) AS DATENAME_CURRENTDATE,
	   DATEPART(MONTH,GETDATE()) AS DATEPART_CURRENTDATE

--13. Write a query to find out last date of current month. 
SELECT EOMONTH(GETDATE()) AS LAST_DATE

--14. Write a query to display date & time after 30 days from today. 
SELECT DATEADD(DAY,30,GETDATE()) AS [30_DAYS_LATER]

--15. Calculate your age in years and months. 
SELECT DATEDIFF(YEAR,'2006-11-08',GETDATE()) AS AGE_YEARS
SELECT DATEDIFF(MONTH,'2006-11-08',GETDATE()) AS AGE_MONTHS