--LAB 11

--Implementation of String Functions in SQL 

--Part – A 

--1. Find the length of following. (I) NULL    (II) ‘   hello     ’   (III)  Blank
SELECT LEN(NULL) AS [LEN_1],
	   LEN('   hello     ') AS [LEN_2],
	   LEN('') AS [LEN_3]

--2. Display your name in lower & upper case. 
SELECT UPPER('Kavya') AS UPPERCASE,
	   LOWER('KAVYA') AS LOWERCASE

--3. Display first three characters of your name. 
SELECT LEFT('Kavya',3) AS FIRST_3

--4. Display 3rd to 10th character of your name.
SELECT SUBSTRING('Kavya',3,10) AS [SUBSTRING_NAME]

--5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE. 
SELECT REPLACE('abc123efg','123','XYZ') AS REPLACED_TXT_1,
	   REPLACE('abcabcabc','c','5') AS REPLACED_TXT_2

--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9. 
SELECT ASCII('a') as ASCII_a,
	   ASCII('A') as ASCII_A,
	   ASCII('z') as ASCII_z,
	   ASCII('Z') as ASCII_Z,
	   ASCII('0')as ASCII_0,  --IF WE WRITE ASCII(0) IT WILL IMPLICITLY CONVERTS IT TO CHAR
	   ASCII('9') as ASCII_9

--7. Write a query to display character based on number 97, 65,122,90,48,57. 
SELECT CHAR(97) AS CHAR_97,
	   CHAR(65) AS CHAR_65,
	   CHAR(122) AS CHAR_122,
	   CHAR(90) AS CHAR_90,
	   CHAR(48) AS CHAR_48,
	   CHAR(57) AS CHAR_57

--Part – B 
--8. Write a query to remove spaces from left of a given string ‘ hello world  ‘. 
SELECT LTRIM(' hello world  ') AS TRIM_LEFT

--9. Write a query to remove spaces from right of a given string ‘ hello world  ‘.
SELECT RTRIM(' hello world  ') AS TRIM_RIGHT

--10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’. 
SELECT LEFT('SQL Server',4) AS FIRST_4,
	   RIGHT('SQL Server',5) AS LAST_5

--11. Write a query to convert a string ‘1234.56’ to number (Use CAST()). 
SELECT CAST('1234.56' AS DECIMAL(10,2)) AS RESULT;
--SELECT CAST('1234.56' AS FLOAT) AS RESULT;

--12. Write a query to convert a float 10.58 to integer (UseCONVERT()). 
SELECT CONVERT(INT, 10.58) AS RESULT;

--13. Put 10 space before your name using function.
SELECT SPACE(10)+ 'Kavya' AS Spaced_name

--14. Combine two strings (Your name & Surname) using + sign as well as CONCAT (). 
SELECT 'Kavya '+'Vyas' AS Concatenated_String

SELECT CONCAT('Kavya ','Vyas') AS Concatenated_String

--Part – C 
--15. Find reverse of “Darshan”. 
SELECT REVERSE('Darshan') AS Reversed_string 

--16. Repeat your name 3 times.
SELECT REPLICATE('Kavya',3) AS Replicated_string 

--17. Write a query to display first 3 & Last 3 characters of ‘your name’. 
SELECT LEFT('Kavya',3) AS FIRST_3,
	   RIGHT('Kavya',3) AS LAST_3




--18. From Data, returns the first non-null value in a list. (Use COALESCE()) 
SELECT COALESCE(NULL,'Manav',NULL, 'Hello', 'World') AS RESULT;

--19. Tests whether the expression is numeric. (Use ISNUMERIC()) 
SELECT ISNUMERIC('19.57') AS RESULT --STRING IS CONVERTED TO NUMBER
SELECT ISNUMERIC('KAVYA') AS RESULT
   
--20. Search for "t" in string "Customer", and return its position. (Use CHARINDEX()) 
SELECT CHARINDEX('T','CUSTOMER',1) AS CHARINDEX_CUSTOMER