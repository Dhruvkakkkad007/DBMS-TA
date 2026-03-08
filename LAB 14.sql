---Create the following table and apply the specified Integrity Constraints. 

CREATE TABLE ProductInventory (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100) NOT NULL,
    CatalogNumber VARCHAR(20) UNIQUE,
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice >= 0.50 AND UnitPrice <= 5000.00),
    QuantityInStock INT NOT NULL CHECK (QuantityInStock >= 0),
    IsActive BIT NOT NULL DEFAULT 1
);

CREATE TABLE DepartmentData (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE EmployeeData (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL CHECK (Salary > 30000),
    DeptID INT FOREIGN KEY REFERENCES DepartmentData(DeptID)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY IDENTITY(1,1),
    MemberName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) UNIQUE,
    JoinDate DATETIME NOT NULL DEFAULT GETDATE(),
    City VARCHAR(50) NOT NULL DEFAULT 'Rajkot'
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(100,1),
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(50) NOT NULL,
    Category VARCHAR(30),
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    Stock INT NOT NULL CHECK (Stock >= 0)
);

CREATE TABLE Issue_Return (
    IssueID INT PRIMARY KEY IDENTITY(500,1),
    MemberID INT NOT NULL FOREIGN KEY REFERENCES Members(MemberID),
    BookID INT NOT NULL FOREIGN KEY REFERENCES Books(BookID),
    IssueDate DATE,
    ReturnDate DATE NOT NULL DEFAULT GETDATE()
);

-- Part A: ProductInventory

-- Valid Inserts
INSERT INTO ProductInventory (ProductName, CatalogNumber, UnitPrice, QuantityInStock, IsActive)
VALUES 
('Laptop', 'CAT001', 450.00, 10, 1),
('Mouse', 'CAT002', 5.00, 50, 1),
('Keyboard', 'CAT003', 7.50, 30, 1),
('Monitor', 'CAT004', 80.00, 15, 1),
('Printer', 'CAT005', 45.00, 5, 0);

-- Invalid Inserts 
-- UnitPrice < 0.50
-- INSERT INTO ProductInventory (ProductName, CatalogNumber, UnitPrice, QuantityInStock, IsActive)
-- VALUES ('Cheap Pen', 'CAT006', 0.25, 10, 1);

-- QuantityInStock < 0
-- INSERT INTO ProductInventory (ProductName, CatalogNumber, UnitPrice, QuantityInStock, IsActive)
-- VALUES ('Invalid Item', 'CAT007', 10.00, -5, 1);

-- Duplicate CatalogNumber
-- INSERT INTO ProductInventory (ProductName, CatalogNumber, UnitPrice, QuantityInStock, IsActive)
-- VALUES ('Duplicate Item', 'CAT001', 100.00, 10, 1);

-- Part B: DepartmentData

-- Valid Inserts
INSERT INTO DepartmentData (DeptID, DeptName)
VALUES 
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing');

-- Invalid Inserts
-- Duplicate DeptName
-- INSERT INTO DepartmentData (DeptID, DeptName) VALUES (5, 'IT');

-- DeptName NULL
-- INSERT INTO DepartmentData (DeptID, DeptName) VALUES (6, NULL);

-- Part B: EmployeeData

-- Valid Inserts
INSERT INTO EmployeeData (EmpID, EmpName, Salary, DeptID)
VALUES
(1, 'Kavya', 50000, 1),
(2, 'Darshan', 35000, 1),
(3, 'Anjali', 40000, 2),
(4, 'Rohit', 45000, 3),
(5, 'Nisha', 38000, 4);

-- Invalid Inserts
-- Salary < 30000
-- INSERT INTO EmployeeData (EmpID, EmpName, Salary, DeptID) VALUES (6, 'Test', 25000, 1);

-- DeptID not existing in DepartmentData
-- INSERT INTO EmployeeData (EmpID, EmpName, Salary, DeptID) VALUES (7, 'Test2', 40000, 10);

-- EmpName NULL
-- INSERT INTO EmployeeData (EmpID, EmpName, Salary, DeptID) VALUES (8, NULL, 40000, 1);

-- Part C: Members

-- Valid Inserts
INSERT INTO Members (MemberName, Email, Phone, City)
VALUES
('Kavya Vyas', 'kavya@example.com', '9876543210', 'Rajkot'),
('Darshan Patel', 'darshan@example.com', '9876543211', 'Rajkot'),
('Anjali Shah', 'anjali@example.com', '9876543212', 'Ahmedabad'),
('Rohit Mehta', 'rohit@example.com', '9876543213', 'Surat'),
('Nisha Desai', 'nisha@example.com', NULL, DEFAULT);

-- Invalid Inserts
-- Duplicate Email
-- INSERT INTO Members (MemberName, Email, Phone, City) VALUES ('Test', 'kavya@example.com', '9876543214', 'Rajkot');

-- Email NULL
-- INSERT INTO Members (MemberName, Email, Phone, City) VALUES ('Test', NULL, '9876543215', 'Rajkot');

-- Phone duplicate
-- INSERT INTO Members (MemberName, Email, Phone, City) VALUES ('Test2', 'test2@example.com', '9876543210', 'Rajkot');

-- Part C: Books

-- Valid Inserts
INSERT INTO Books (Title, Author, Category, Price, Stock)
VALUES
('Learn SQL', 'Kavya Vyas', 'Education', 450.00, 10),
('Mastering Python', 'Darshan Patel', 'Programming', 1200.00, 5),
('Data Structures', 'Anjali Shah', 'Education', 750.00, 15),
('Web Development', 'Rohit Mehta', 'Programming', 850.00, 8),
('Networking Basics', 'Nisha Desai', 'Technology', 500.00, 12);

-- Invalid Inserts
-- Price <= 0
-- INSERT INTO Books (Title, Author, Category, Price, Stock) VALUES ('Invalid Book', 'Author', 'Tech', 0, 10);

-- Stock < 0
-- INSERT INTO Books (Title, Author, Category, Price, Stock) VALUES ('Invalid Book', 'Author', 'Tech', 500, -5);

-- Part C: Issue_Return

-- Valid Inserts
INSERT INTO Issue_Return (MemberID, BookID, IssueDate, ReturnDate)
VALUES
(1, 101, '2025-12-01', DEFAULT),
(2, 102, '2025-12-02', DEFAULT),
(3, 103, '2025-12-03', DEFAULT),
(4, 104, '2025-12-04', DEFAULT),
(5, 105, '2025-12-05', DEFAULT);

-- Invalid Inserts
-- MemberID not existing
-- INSERT INTO Issue_Return (MemberID, BookID, IssueDate, ReturnDate) VALUES (10, 101, '2025-12-01', DEFAULT);

-- BookID not existing
-- INSERT INTO Issue_Return (MemberID, BookID, IssueDate, ReturnDate) VALUES (1, 200, '2025-12-01', DEFAULT);
