										--SUBQUERY--

--A subquery is simply a query nested inside another query

--Flow:Inner Query processes first to produce an Output, 
--which then serves as the Input for the Outer Query.

--A subquery is a query nested inside another query whose temporary output serves directly as the input
--for the outer query to produce your final result.


--Type A: Single Row Subquery (Scalar Subquery)

---A query that returns exactly zero or one row. It is also known as a scalar subquery

--Because it returns a single value,
--it is used with standard comparison operators like =, <, >, <=, >=.

CREATE TABLE Faculty (FID INT, FNAME VARCHAR(50), SAL INT);
INSERT INTO Faculty VALUES 
(11, 'PATEL', 10000), (12, 'PANDYA', 30000), (13, 'DOSHI', 15000), 
(14, 'MAKWANA', 18000), (15, 'MEHTA', 12000), (16, 'SHAH', 50000);

--EX:1 Display the name of the staff member who has the maximum salary.

--Step 1:  inner query -> returns one value (50000)

SELECT MAX(SAL) as max_salary FROM Faculty;

--Step:2 Full Nested Query

SELECT FNAME 
FROM Faculty 
WHERE SAL = (SELECT MAX(SAL) FROM Faculty);

--Type B: Multiple Row Subquery

--A query that returns one or more rows.

--Because it returns a list of values,
--you cannot use an = sign.
--Instead, you must use operators like IN, NOT IN, ANY, or ALL.

CREATE TABLE Student_1 (
RNO INT,
SNAME VARCHAR(50), 
CITY VARCHAR(50)
);

INSERT INTO Student_1(RNO,SNAME,CITY) VALUES 
(101, 'MITESH', 'RAJKOT'),
(102, 'KAUSHAL', 'RAJKOT'),
(103, 'ANKUR', 'RAJKOT'), 
(104, 'KISHAN', 'MORBI'), 
(105, 'MUKESH', 'JAMNAGAR');

CREATE TABLE Academic_1 (
	RNO INT,
	DID INT,
	SPI DECIMAL(3,1)
);


INSERT INTO Academic_1(RNO,DID,SPI) VALUES 
(101, 19, 6.8),
(102, 7, 7.2), 
(103, 6, 8.5), 
(104, 7, 6.1), 
(105, 9, 8.1);

--EX:2 Display the Roll no, Department id, and SPI of students who are from RAJKOT


--Step 1: Show the inner query fetching multiple Roll Numbers (101, 102, 103) for students from Rajkot. 
--Explain that this returns more than one record

SELECT RNO FROM Student_1 WHERE CITY='RAJKOT';--Output:Rollno:101,102,103
											--(one or More Records->Multiple Row Subquery)


--Step:2 Next We Will Compare Rno and Find Department id and SPI From Academic Table

SELECT RNO, DID, SPI 
FROM ACADEMIC_1 
WHERE RNO IN(
				SELECT RNO FROM Student_1 WHERE CITY='RAJKOT'
			);


--Type C: Correlated Subquery

--Also known as a synchronized query. 

--inner query executes more than one time.


CREATE TABLE EMP (
	EID INT,
	NAME VARCHAR(50)
);
INSERT INTO EMP VALUES
(1, 'Jay'), 
(2, 'Meet'),
(3, 'Minal'),
(4, 'Mira'), 
(5, 'Rahul');

CREATE TABLE DEPT (
	EID INT, 
	DEPT_ID VARCHAR(10), 
	DEPT_NAME VARCHAR(50)
);

INSERT INTO DEPT VALUES 
(1, 'D1', 'IT'),
(2, 'D2', 'HR'),
(3, 'D3', 'MARKETING');


--EX:3 Show how the query checks row-by-row to see if an employee exists in the department table

	SELECT * FROM EMP
	WHERE EXISTS (
					SELECT EID
					FROM DEPT
					WHERE EMP.EID = DEPT.EID
				);




