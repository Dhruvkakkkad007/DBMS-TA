--1.Primary Key Constraint

-- I want to make StudentID as  the Primary Key Constraints

--age => not null

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT NOT NULL
);
select * from Student

--insert records
DROP TABLE Student
insert into Student values(1,'Rahul',18) 

insert into Student values(1,'Raj',19)
--
insert into Student values(NULL,'XYZ',20)




SELECT * FROM Student



--2.Check Constraints

CREATE TABLE Student_1(
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT CHECK (AGE>18)
);

DROP TABLE Student_1
--CHECK (Age >= 18)
INSERT INTO Student_1 VALUES (1, 'Rahul', 16);


INSERT INTO Student_1 VALUES (2, 'RR', 20);
INSERT INTO Student_1 VALUES (3, 'RR', 21);

SELECT * FROM Student_1

--3.Default Constraints

CREATE TABLE Employee(
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50) DEFAULT 'RAJKOT'
);

drop table Employee


INSERT INTO Employee (EmpID, Name,CITY)
VALUES (2, 'Amit','JUNAGADH');

SELECT * FROM Employee


--4.Unique Key Constraints  ACCEPTS NULL ONLY ONE TIME

CREATE TABLE Student_2 (
    RollNo INT PRIMARY KEY,
    Email VARCHAR(50) UNIQUE,
    Phone VARCHAR(15)
);

INSERT INTO Student_2 VALUES (101, 'dhruv@gmail.com', '9876543210');
INSERT INTO Student_2 VALUES (102, 'rahul@gmail.com', '9876543211');
SELECT * FROM Student_2


INSERT INTO Student_2 VALUES (103, 'dhruv@gmail.com', '987654312');
INSERT INTO Student_2 VALUES (103,NULL, '987654312');
INSERT INTO Student_2 VALUES (103,NULL, '987654312');

---5.FOREIGN KEY CONSTRAINTS

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

INSERT INTO Department VALUES(101,'IT')

INSERT INTO Department VALUES(102,'CSE')

SELECT * FROM Department

CREATE TABLE Employee_1 (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT,   --FIRST MAKE COLUMN THEN APPLY FORIEGN KEY
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);
INSERT INTO Employee_1 VALUES(1,'DHRUV',101)

INSERT INTO Employee_1 VALUES(2,'MANAV',105)

DROP TABLE Employee_1
SELECT * FROM Employee_1


--6.AUTO INCREMENT DEMO--

--SYNTAX 

--COLUMN_NAME DATA_TYPE IDENTITY(1,1) 

CREATE TABLE Student_4 (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);

SELECT * FROM Student_4

INSERT INTO Student_4 (Name, Age) VALUES ('Dhruv',20);
INSERT INTO Student_4 (Name, Age) VALUES ('Rahul',21);
INSERT INTO Student_4 (Name, Age) VALUES ('Amit',22);




--ALL CONSTRAINTS TOGETHER--

CREATE TABLE EmployeeRecords (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(15) UNIQUE,
    Salary DECIMAL(10,2) NOT NULL CHECK (Salary >= 10000 AND Salary <= 1000000),
    Age INT NOT NULL CHECK (Age >= 18 AND Age <= 60),
    Department VARCHAR(50) NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1
);

--Valid Insert--

INSERT INTO EmployeeRecords (Email, PhoneNumber, Salary, Age, Department)
VALUES ('dhruv@gmail.com','9876543210',50000,22,'IT');


--Check Constraint Error--
INSERT INTO EmployeeRecords (Email, PhoneNumber, Salary, Age, Department)
VALUES ('rahul@gmail.com','9876543211',5000,20,'HR');

---Unique Constraint Error--
INSERT INTO EmployeeRecords (Email, PhoneNumber, Salary, Age, Department)
VALUES ('dhruv@gmail.com','9999999999',60000,25,'Sales');

--Email must be unique




--EX1--
CREATE TABLE Student_Info (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    Enrollment_No VARCHAR(20) NOT NULL UNIQUE,
    Name VARCHAR(25) NOT NULL,
    CPI DECIMAL(5,2) CHECK (CPI <= 10),
    JoiningDate DATETIME NOT NULL DEFAULT GETDATE(),
    Bklog INT NOT NULL CHECK (Bklog >= 0),
    StateName VARCHAR(50) DEFAULT 'Gujarat'
    --DEPTID INT,
    --FOREIGN KEY (DeptID) REFERENCES Department(DeptID) 
);