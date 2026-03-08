CREATE TABLE Student (
    Rno INT PRIMARY KEY,
    Name VARCHAR(50),
    Branch VARCHAR(10)
);



INSERT INTO Student (Rno, Name, Branch) VALUES
(101, 'Raju', 'CE'),
(102, 'Amit', 'CE'),
(103, 'Sanjay', 'ME'),
(104, 'Neha', 'EC'),
(105, 'Meera', 'EE'),
(106, 'Mahesh', 'ME');


CREATE TABLE Result (
    Rno INT,
    SPI DECIMAL(3,1),
    PRIMARY KEY (Rno)
);


INSERT INTO Result (Rno, SPI) VALUES
(101, 8.8),
(102, 9.2),
(103, 7.6),
(104, 8.2),
(105, 7.0),
(107, 8.9);


CREATE TABLE Employee (
    EmployeeNo VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(50),
    ManagerNo VARCHAR(5)
);



INSERT INTO Employee (EmployeeNo, Name, ManagerNo) VALUES
('E01', 'Tarun', NULL),
('E02', 'Rohan', 'E02'),
('E03', 'Priya', 'E01'),
('E04', 'Milan', 'E03'),
('E05', 'Jay', 'E01'),
('E06', 'Anjana', 'E04');

SELECT * FROM Student
SELECT * FROM Employee
SELECT * FROM Result


                                                                --Part – A--

--1. Combine information from student and result table using cross join or Cartesian product. 
       SELECT * FROM 
       Student CROSS JOIN Result
--2. Display Rno, Name, Branch and SPI of CE branch’s student only. 
    SELECT RNO,NAME,Branch FROM Student
    WHERE Branch = 'ce'
--3. Display Rno, Name, Branch and SPI of other than EC branch’s student only.
    SELECT s.RNO,s.NAME,s.BRANCH ,r.SPI 
    from Student s Join Result r
    on s.Rno = r.Rno
    where s.Branch != 'EC'
--4. Display average result of each branch. 
    SELECT s.branch, AVG(r.spi) as AVG
    from Student s join Result r
    on s.Rno = r.Rno
    group by s.Branch
--5. Display average result of each branch and sort them in ascending order by SPI.
    SELECT s.branch, AVG(r.spi) as AVG
    from Student s join Result r
    on s.Rno = r.Rno
    group by s.Branch
    Order by AVG(r.spi)

                                                                --Part – B-- 

--6. Display average result of CE and ME branch. 
    SELECT s.Branch,AVG(r.spi) as AVG
    from Student s join Result r
    on s.Rno = r.Rno
    WHERE s.Branch IN ('CE','ME')
    group by s.Branch
--7. Perform the left outer join on Student and Result tables. 
    select * from 
    Student left Outer join Result 
    on Student.Rno = Result.Rno
--8. Perform the right outer join on Student and Result tables. 
    select * from 
    Student right Outer join Result 
    on Student.Rno = Result.Rno
--9. Perform the full outer join on Student and Result tables.  
      select * from 
    Student full Outer join Result 
    on Student.Rno = Result.Rno
--10. Retrieve the names of employee along with their manager’s name from the Employee table. 
    SELECT e1.EmployeeNo, e1.Name AS EmployeeName, e2.Name AS ManagerName
    FROM Employee e1
    LEFT JOIN Employee e2
    ON e1.ManagerNo = e2.EmployeeNo;



                                                                --Part – C--
--11. Display maximum result of each branch. 
    SELECT s.branch,MAX(r.spi) as MAX_SPI
    from Student s Join Result r
    on s.Rno = r.Rno
    group by s.Branch
--12. Display minimum result of each branch. 
    SELECT s.branch,MIN(r.spi) as MIN_SPI
    from Student s Join Result r
    on s.Rno = r.Rno
    group by s.Branch
--13. Display name of student whose result is not generated. 
    select s.branch
    from Student s join Result r
    on s.Rno = r.Rno
    where r.spi IS NULL
--14. Display overall average result.
    select AVG(spi) as Overall_Average_SPI from Result
--15. Display Rno, Name, Branch and SPI of those students whose SPI greater than. 
    --select s.Rno,s.name,s.branch,r.spi
    --from Student s join Result r
    --on s.Rno = r.Rno
    --where spi

