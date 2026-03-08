                                        --LAB 6--
CREATE TABLE Customer (
    CID INT,
    CustomerName VARCHAR(100),
    ContactName VARCHAR(50),
    Address VARCHAR(100),
    City VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50)
);
DROP TABLE Customer
TRUNCATE TABLE Customer

INSERT INTO Customer (CID, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES
(1, 'Alfreds Futterkista', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitucion 2222', 'Mexico D.F.', '05021', 'Mexico'),
(3, 'Latonio Morenor Taqueria', 'Antonio Moreno', 'Mataderos 2312', 'Mexico D.F.', '05023', 'Mexico'),
(4, 'bround the Hors', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
(5, 'Brglunds snabbkop', 'Christina Berglund', 'Berguvsvagen 8', 'Lulea', 'S-958 22', 'Sweden');


SELECT * FROM Customer


--Part - A 
--1. Return all customers from a city that starts with 'L'. 
    SELECT * FROM CUSTOMER
    WHERE CITY LIKE 'L%'

--2. Return all customers from a city that contains the letter 'L'. 
    SELECT * FROM CUSTOMER
    WHERE CITY LIKE '%L%'

--3. Return all customers from a city that do not contains the letter 'L'.  
    SELECT * FROM CUSTOMER
    WHERE CITY NOT LIKE 'L%'
--4. Return all customers that name starts with 'La'.  
    SELECT * FROM Customer
    WHERE CustomerName LIKE 'La%'

--5. Return all customers that name does not starts with 'La'. 
     SELECT * FROM Customer
    WHERE CustomerName NOT LIKE 'La%'

--6. Return all customers that name starts with 'a' or starts with 'b'.  
     SELECT * FROM Customer
    WHERE CustomerName LIKE 'a%' OR CustomerName LIKE 'B%'

--7. Return all customers that name starts with 'a' or starts with 'c' or starts with ’t’. 
     SELECT * FROM Customer
    WHERE CustomerName  LIKE 'a%' OR CustomerName LIKE 'C%'OR CustomerName LIKE 'T%'

--8. Return all customers from a city that starts with ‘a’ to ‘d’. 
    SELECT * FROM Customer
    WHERE city LIKE 'a%' or city like 'd%'

--9. Return all customers that name ends with 'a'. 
    SELECT * FROM Customer
    WHERE CustomerName LIKE '%a' 

--10. Return all customers that name does not ends with 'a'.  
   SELECT * FROM Customer
   WHERE CustomerName NOT LIKE '%a' 

--Part - B 

--11. Return all customers that name starts with 'b' and ends with ’s’.  \
    SELECT * FROM Customer
   WHERE CustomerName  LIKE 'B%' AND CustomerName LIKE '%S';

--12. Return all customers that name contains 'or'.
    SELECT * FROM Customer
   WHERE CustomerName  LIKE '%OR%'

--13. Return all customers that name starts with ‘a’ and are at least 3 characters in length.  
    SELECT * FROM Customer
   WHERE CustomerName  LIKE 'A__%' 

--14. Return all customers that name has ‘r’ in the second position.   
    SELECT * FROM Customer
   WHERE CustomerName  LIKE '_R%'
 
--15. Return all customers from a city that starts with 'L' and contains ‘q’. 

   SELECT * FROM Customer
   WHERE CITY  LIKE 'L%' AND CITY LIKE '%Q%'


--Part - C 
--16. Return all customers that name starts vowels.  
   SELECT * FROM Customer
   WHERE CustomerName  LIKE '[AEIOU]%'

--17. Return all customers that name contains vowels. 
    SELECT * FROM Customer
   WHERE CustomerName  LIKE '%[AEIOU]%'

--18. Return all customers that name starts with vowels and are at least 3 characters in length.
    SELECT * FROM Customer
   WHERE CustomerName  LIKE '[AEIOU]__%'

--19. Return all customers that name has vowels in the second position. 
    SELECT * FROM Customer
   WHERE CustomerName  LIKE '_[AEIOU]%'

--20. Return all customers from a city that end with vowels. 
   SELECT * FROM Customer
   WHERE CITY  LIKE '%[AEIOU]'