---LAB 19

----Implementation of Select * Into command in SQL 

CREATE TABLE Cricket (
    Name VARCHAR(50),
    City VARCHAR(50),
    Age INT
);

INSERT INTO Cricket (Name, City, Age) VALUES
('Sachin Tendulkar', 'Mumbai', 30),
('Rahul Dravid', 'Bombay', 35),
('M. S. Dhoni', 'Jharkhand', 31),
('Suresh Raina', 'Gujarat', 30);

--Part – A 

--1. Create table World cup from cricket with all the columns.  
SELECT * 
INTO WORLDCUP
FROM Cricket

SELECT * FROM WORLDCUP

--2. Create table T20 from cricket with first two columns with no data. 
SELECT NAME, CITY
INTO T20
FROM Cricket
WHERE 1=2;	

--3. Create table IPL From Cricket with No Data. 
SELECT *
INTO IPL
FROM Cricket
WHERE 1=2

--4. Insert the Data into IPL from Cricket Whose Second Character Should Be ‘A’ And String Should Have 
--At least 7 Characters in Cricket Name Field. 
INSERT INTO IPL
SELECT *
FROM Cricket
WHERE NAME LIKE '_A_____%'

SELECT * FROM IPL

--5. Delete All the Rows From IPL. 
DELETE FROM IPL

--6. Delete the Detail of Cricketer Whose City is Jharkhand. 
DELETE FROM Cricket
WHERE CITY = 'Jharkhand'

--7. Rename the Table IPL to IPL2018. 
SP_RENAME 'IPL', 'IPL2018'

--8. Destroy table T20 with All the Data. 
DROP TABLE T20;

CREATE TABLE SALESRECORDS  (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    ProductName VARCHAR(50),
    Qty INT,
    SaleDate DATE,
    Region VARCHAR(50)
);

INSERT INTO SALESRECORDS (OrderID, ProductID, ProductName, Qty, SaleDate, Region) VALUES
(1, 10, 'Laptop', 25, '2025-10-01', 'North'),
(2, 20, 'Monitor', 60, '2025-10-05', 'South'),
(3, 30, 'Keyboard', 150, '2025-10-10', 'East'),
(4, 10, 'Laptop', 10, '2025-10-15', 'West'),
(5, 40, 'Mouse', 45, '2025-10-20', 'North'),
(6, 50, 'Webcam', 55, '2025-10-25', 'South'),
(7, 60, 'Speaker', 20, '2025-10-30', 'East'),
(8, 20, 'Monitor', 70, '2025-11-01', 'West');

--Part – B 

--1. Create a full backup of the SalesRecords table and name it SalesRecords_Backup_Full as a new table. 
SELECT *
INTO SalesRecords_Backup_Full
FROM SALESRECORDS

--2. Create a table SalesInfo from the SalesRecords table with only the OrderID, ProductName, and Quantity 
--columns. 
SELECT OrderID,ProductName,Qty
INTO SalesInfo
FROM SALESRECORDS

--3. Create a new empty table with the same schema as SalesRecords and name it SalesRecords_Empty. 
SELECT *
INTO SalesRecords_Empty
FROM SalesRecords
WHERE 'A'='B'

--Part – C 

--4. Create a table Sales_North_West from the SalesRecords table containing only the sales records for the 
--North and West regions. 
SELECT *
INTO Sales_North_West
FROM SalesRecords
WHERE Region = 'North' OR Region = 'West'

SELECT * FROM Sales_North_West

--5. Create a table Product_Summary from the SalesRecords table that summarizes the total quantity sold 
--for each product. 
SELECT ProductID, ProductName, SUM(Qty) AS Total_Qty
INTO Product_Summary
FROM SalesRecords
GROUP BY ProductID, ProductName;
select * from Product_Summary
--6. Create an archive table for all sales made before Oct 15, 2025. 
SELECT *
INTO Sales_Archive
FROM SalesRecords
WHERE SaleDate < '2025-10-15';
