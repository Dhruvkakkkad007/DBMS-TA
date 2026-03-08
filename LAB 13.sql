--LAB 13

---Implementation of Integrity Constraints in SQL 

--Part – A 
CREATE TABLE Student_Info (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    Enrollment_No VARCHAR(20) UNIQUE NOT NULL,
    Name VARCHAR(25) NOT NULL,
    CPI DECIMAL(5,2) CHECK (CPI <= 10),
    JoiningDate DATETIME NOT NULL DEFAULT GETDATE(),
    Bklog INT NOT NULL CHECK (Bklog >= 0),
    StateName VARCHAR(50) DEFAULT 'Gujarat'
);


CREATE TABLE State (
    StateID INT IDENTITY(1,1) PRIMARY KEY,
    StateName VARCHAR(20) UNIQUE NOT NULL
);


CREATE TABLE City (
    CityID INT IDENTITY(1,1) PRIMARY KEY,
    CityName VARCHAR(20) UNIQUE NOT NULL,
    PinCode VARCHAR(10),
    StateID INT FOREIGN KEY REFERENCES State(StateID)
);

SELECT * FROM Student_Info

--STUDENT_INFO TABLE

-- Valid Inserts
INSERT INTO Student_Info (StudentID, Enrollment_No, Name, CPI, JoiningDate, Bklog, StateName)
VALUES (1, 'ENR001', 'Kavya', 9.5, GETDATE(), 0, 'Gujarat');

INSERT INTO Student_Info (StudentID, Enrollment_No, Name, CPI, JoiningDate, Bklog, StateName)
VALUES (2, 'ENR002', 'Darshan', 10, GETDATE(), 1, 'Maharashtra');

-- Test PRIMARY KEY constraint
-- This will fail because StudentID 1 already exists
-- INSERT INTO Student_Info (StudentID, Enrollment_No, Name, CPI, JoiningDate, Bklog, StateName)
-- VALUES (1, 'ENR003', 'Ankit', 8.5, GETDATE(), 0, 'Gujarat');

-- Test UNIQUE constraint
-- This will fail because Enrollment_No 'ENR001' already exists
-- INSERT INTO Student_Info (StudentID, Enrollment_No, Name, CPI, JoiningDate, Bklog, StateName)
-- VALUES (3, 'ENR001', 'Ankit', 8.5, GETDATE(), 0, 'Gujarat');

-- Test NOT NULL constraint
-- This will fail because Name is NOT NULL
-- INSERT INTO Student_Info (StudentID, Enrollment_No, CPI, JoiningDate, Bklog, StateName)
-- VALUES (3, 'ENR003', NULL, GETDATE(), 0, 'Gujarat');

-- Test CHECK constraint (CPI <= 10)
-- This will fail
-- INSERT INTO Student_Info (StudentID, Enrollment_No, Name, CPI, JoiningDate, Bklog, StateName)
-- VALUES (4, 'ENR004', 'Nisha', 10.5, GETDATE(), 0, 'Gujarat');

-- Test CHECK constraint (Bklog >= 0)
-- This will fail
-- INSERT INTO Student_Info (StudentID, Enrollment_No, Name, CPI, JoiningDate, Bklog, StateName)
-- VALUES (5, 'ENR005', 'Rohit', 9.0, GETDATE(), -1, 'Gujarat');


--STATE TABLE
-- Valid Inserts
INSERT INTO State (StateID, StateName) VALUES (1, 'Gujarat');
INSERT INTO State (StateID, StateName) VALUES (2, 'Maharashtra');

-- Test UNIQUE constraint
-- This will fail because 'Gujarat' already exists
-- INSERT INTO State (StateID, StateName) VALUES (3, 'Gujarat');

-- Test NOT NULL constraint
-- This will fail because StateName is NOT NULL
-- INSERT INTO State (StateID) VALUES (4);

--CITY TABLE
-- Valid Inserts
INSERT INTO City (CityID, CityName, PinCode, StateID) 
VALUES (1, 'Ahmedabad', '380001', 1);

INSERT INTO City (CityID, CityName, PinCode, StateID) 
VALUES (2, 'Surat', '395001', 1);

INSERT INTO City (CityID, CityName, PinCode, StateID) 
VALUES (3, 'Mumbai', '400001', 2);

-- Test UNIQUE constraint
-- This will fail because CityName must be unique
-- INSERT INTO City (CityID, CityName, PinCode, StateID) VALUES (4, 'Ahmedabad', '380002', 1);

-- Test FOREIGN KEY constraint
-- This will fail because StateID 5 does not exist
-- INSERT INTO City (CityID, CityName, PinCode, StateID) VALUES (5, 'Pune', '411001', 5);




