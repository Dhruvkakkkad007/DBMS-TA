---Implementation of SET Operators in SQL 

CREATE TABLE Computer (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Computer (RollNo, Name) VALUES
(101, 'Ajay'),
(109, 'Haresh'),
(115, 'Manish');

CREATE TABLE Electrical (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Electrical (RollNo, Name) VALUES
(105, 'Ajay'),
(107, 'Mahesh'),
(115, 'Manish');


--Part – A 
--1. Display the name of students who is either in Computer or in Electrical. 
SELECT Name FROM Computer
UNION
SELECT Name FROM Electrical;

--2. Display the name of students who is either in Computer or in Electrical including duplicate data. 
SELECT Name FROM Computer
UNION ALL
SELECT Name FROM Electrical;

--3. Display name of students who is in both Computer and Electrical. 
SELECT Name FROM Computer
INTERSECT
SELECT Name FROM Electrical;

--4. Display name of students who are in Computer but not in Electrical. 
SELECT Name FROM Computer
EXCEPT
SELECT Name FROM Electrical;

--5. Display name of students who are in Electrical but not in Computer. 
SELECT Name FROM Electrical
EXCEPT
SELECT Name FROM Computer;

--6. Display all the details of students who are either in Computer or in Electrical. 
SELECT * FROM Computer
UNION
SELECT * FROM Electrical;

--7. Display all the details of students who are in both Computer and Electrical.
SELECT * FROM Computer
INTERSECT
SELECT * FROM Electrical;


CREATE TABLE Employee_A (
    EmpID INT PRIMARY KEY,
    EName VARCHAR(50),
    Department VARCHAR(50)
);

INSERT INTO Employee_A (EmpID, EName, Department) VALUES
(101, 'Amar', 'Sales'),
(102, 'Boby', 'IT'),
(103, 'Charlie', 'HR'),
(104, 'Denish', 'Sales');

CREATE TABLE Employee_B (
    EmpID INT PRIMARY KEY,
    EName VARCHAR(50),	
    Department VARCHAR(50)
);

INSERT INTO Employee_B (EmpID, EName, Department) VALUES
(101, 'Amar', 'Sales'),
(103, 'Charlie', 'HR'),
(105, 'Isha', 'Finance'),
(106, 'Fatima', 'IT');

--Part – B 
--1. Find all unique employees present in either Employees_A OR Employees_B. 
SELECT EmpID, EName, Department FROM Employee_A
UNION
SELECT EmpID, EName, Department FROM Employee_B;

--2. Find ALL employees from both tables, including duplicates. 
SELECT EmpID, EName, Department FROM Employee_A
UNION ALL
SELECT EmpID, EName, Department FROM Employee_B;

--3. Find employees who are present in BOTH Employees_A AND Employees_B. 
SELECT EmpID, EName, Department FROM Employee_A
INTERSECT
SELECT EmpID, EName, Department FROM Employee_B;

--4. Find employees present in Employees_A BUT NOT in Employees_B. 
SELECT EmpID, EName, Department FROM Employee_A
EXCEPT
SELECT EmpID, EName, Department FROM Employee_B;

--5. Find employees present in Employees_B BUT NOT in Employees_A. 
SELECT EmpID, EName, Department FROM Employee_B
EXCEPT
SELECT EmpID, EName, Department FROM Employee_A;

--Part – C 
--6. Find unique employees belonging to the 'IT' department in either table. 
SELECT EmpID, EName, Department FROM Employee_A WHERE Department='IT'
UNION
SELECT EmpID, EName, Department FROM Employee_B WHERE Department='IT';

--7. Find employees who are in 'Sales' AND appear in both tables. 
SELECT EmpID, EName, Department FROM Employee_A WHERE Department='Sales'
INTERSECT
SELECT EmpID, EName, Department FROM Employee_B WHERE Department='Sales';

--8. List all names from both tables, retaining all duplicates. 
SELECT EName FROM Employee_A
UNION ALL
SELECT EName FROM Employee_B;

--9. Find employees in A with EmployeeID > 102, who are NOT in B. 
SELECT EmpID, EName, Department FROM Employee_A
WHERE EmpID > 102
EXCEPT
SELECT EmpID, EName, Department FROM Employee_B;
