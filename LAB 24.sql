CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE Emp_Detail (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    DeptID INT,
    Salary DECIMAL(10,2),
    HireDate DATE,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Departments (DeptID, DeptName, Location) VALUES
(10, 'HR', 'Surat'),
(20, 'Sales', 'Rajkot'),
(30, 'IT', 'Baroda'),
(40, 'Finance', 'Surat'),
(50, 'Operations', 'Ahmedabad');

INSERT INTO Emp_Detail (EmpID, Name, DeptID, Salary, HireDate) VALUES
(101, 'Ali', 10, 60000.00, '2022-01-15'),
(102, 'Boby', 20, 75000.00, '2021-05-20'),
(103, 'Charu', 10, 62000.00, '2023-03-10'),
(104, 'Danish', 30, 90000.00, '2020-11-01'),
(105, 'Emran', 20, 78000.00, '2022-08-25'),
(106, 'Faizal', 30, 92000.00, '2021-07-01'),
(107, 'Gita', 40, 85000.00, '2023-11-12'),
(108, 'Hena', 50, 55000.00, '2024-02-01'),
(109, 'Isha', 20, 75000.00, '2021-05-20'),
(110, 'Jay', 50, 58000.00, '2024-05-01');


                                                    --Part – A--

--1. List all employees who earn a salary greater than the average salary of all employees. 
    select * from
    Emp_Detail where Salary > 
                        (
                            select AVG(Salary) from Emp_Detail 
                        )
--2. Find the names of employees who work in the 'Surat' location.
    Select name from
    Emp_Detail where DeptID in 
                            (
                                Select DeptID from  Departments
                                where Location = 'Surat'
                            )
--3. List all employees who do not work in the 'Rajkot' and 'Ahmedabad' location. 
    Select name from
    Emp_Detail where DeptID IN 
                            (
                                  Select DeptID from Departments
                                  where Location <> 'Rajkot' and Location <> 'Ahmedabad'
                             )

                                        --Part – B--
--4. List the names of departments that have more than two employees. 
    Select DeptName from Departments
    where DeptID IN 
                   (
                        Select DeptID from Emp_Detail
                        group by DeptID
                        having Count(*)>2
                   )      
--5. List all employees who earn the same salary as Boby. 
    Select name from 
    Emp_Detail where Salary IN (
                                Select Salary from Emp_Detail
                                where name='Boby'
                                )
--6. List employees hired after the employee named 'Ali'.

    Select name from
    Emp_Detail where HireDate > 
                           (
                                Select HireDate from Emp_Detail
                                where name ='ALI'
                            )

                                    --Part – C-- 

--7. List employees whose salary is either the highest or the lowest within the 'HR' department. 
    Select name from
    Emp_Detail where DeptID IN 
                              (
                                Select DeptID from Departments
                                where DeptName = 'HR' 
                               ) 
                                        AND Salary IN( 
                                                          Select MIN(Salary) as MIN
                                                          from Emp_Detail
                                                           where DeptID = (
                                                                                Select DeptID from Departments
                                                                                 where DeptName='HR'
                                                                           )
                                                       )

                                                --OR--
Select name from 
Emp_Detail where DeptID IN 
                        (
                            Select DeptID from Departments
                            where DeptName = 'HR'
                        ) AND Salary IN (
                                            Select MAX(Salary) from Emp_Detail
                                            where DeptID IN (
                                                                Select DeptID from Departments
                                                                where DeptName = 'HR'
                                                            )
                                                        )

                                                   
--8. List employees who work in a 'Surat' location AND have a salary less than the average salary of all 
--employees. 
    Select name from 
    Emp_Detail where DeptID IN
                            (
                                Select DeptID from Departments
                                where Location = 'Surat'
                             ) AND Salary IN(
                                            Select Salary from Emp_Detail
                                            where Salary < (
                                                        Select AVG(Salary) from Emp_Detail
                                                        where DeptID IN (
                                                                        Select DeptID from Departments
                                                                        where Location = 'Surat'
                                                    )
                                                  )
                                                )
--9. List the name and salary of all employees who earn more than the minimum salary paid in the 'IT' 
--department.

    Select name, Salary from 
    Emp_Detail where Salary > (
                                Select MIN(Salary) from Emp_Detail
                                where DeptID IN (
                                                    Select DeptID from Departments
                                                    where DeptName = 'IT'
                                                  )
                               )
