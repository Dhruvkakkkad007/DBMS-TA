---LAB 10

---Implementation of Math Functions in SQL 


---Part – A 

--1. Display the result of 5 multiply by 30. 
SELECT 5*30 AS RESULT

--2. Find out the absolute value of -25, 25, -50 and 50.
SELECT ABS(-25) AS [ABS_-25] ,ABS(25) AS [ABS_25],
	   ABS(-50) AS [ABS_-50],ABS(50) AS [ABS_50]

--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
SELECT CEILING(25.2) AS [CEIL_25.2],
	   CEILING(25.7) AS [CEIL_25.7],
	   CEILING(-25.2) AS [CEIL_-25.2]

--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2. 
SELECT FLOOR(25.2) AS [FLOOR_25.2],
	   FLOOR(25.7) AS [FLOOR_25.7],
	   FLOOR(-25.2) AS [FLOOR_-25.2]

--5. Find out remainder of 5 divided 2 and 5 divided by 3. 
SELECT 5%2 AS RES_1,
	   5%3 AS RES_2

--Part – B 
--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power. 
SELECT POWER(3,2) AS POW_1,
	   POWER(4,3) AS POW_2

--7. Find out the square root of 25, 30 and 50. 
SELECT SQRT(25) AS [SQRT_25],
	   SQRT(30) AS [SQRT_30],
	   SQRT(50) AS [SQRT_50]

--8. Find out the square of 5, 15, and 25. 
SELECT SQUARE(5) AS [SQ_5],
	   SQUARE(15) AS [SQ_15],
	   SQUARE(25) AS [SQ_25]

--9. Find out the value of PI. 
SELECT PI() AS PI_VAL

--10. Find out round value of 157.732 for 2, 0 and -2 decimal points.
SELECT ROUND(157.732,2) AS R1,
	   ROUND(157.732,0) AS R2,
	   ROUND(157.732,-2) AS R3

--Part – C 
--11. Find out exponential value of 2 and 3.
SELECT EXP(2) AS EXP_2,
	   EXP(3) AS EXP_3

--12. Find out logarithm having base b having value 10 of 5 and 100. 
SELECT LOG10(5) AS LOG_5,

	   LOG10(100) AS LOG_100

	   select log(5)

--13. Find sine, cosine and tangent of 3.1415. 
SELECT SIN(3.1415) AS [SIN_3.1415],
	   COS(3.1415) AS [COS_3.1415],
	   TAN(3.1415) AS [TAN_3.1415]

--14. Find sign of -25, 0 and 25. 
SELECT SIGN(-25) AS S1,
	   SIGN(0) AS S2,
	   SIGN(25) AS S3

--15. Generate random number using function.(Range: 0.0 ≤ RAND() < 1.0) 

SELECT RAND() AS RANDOM_VALUE
