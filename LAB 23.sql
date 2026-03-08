CREATE TABLE Stu (
    Rno INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT,
    FOREIGN KEY (DID) REFERENCES Department(DID)
);

CREATE TABLE Academic (
    Rno INT PRIMARY KEY,
    SPI DECIMAL(3,1),
    Bklog INT,
    FOREIGN KEY (Rno) REFERENCES Student(Rno)
);

CREATE TABLE Department (
    DID INT PRIMARY KEY,
    DName VARCHAR(50)
);

INSERT INTO Department (DID, DName) VALUES
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical'),
(40, 'Civil');

INSERT INTO Stu (Rno, Name, City, DID) VALUES
(101, 'Raju', 'Rajkot', 10),
(102, 'Amit', 'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda', 40),
(104, 'Neha', 'Rajkot', 20),
(105, 'Meera', 'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda', 10);

INSERT INTO Academic (Rno, SPI, Bklog) VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);


                                                      --Part – A-- 
--1. Display details of students who are from computer department.
    Select * from
    Stu where DID In (
                            Select DID from Department
                            where DName = 'Computer'
                         )
--2. Display name of students whose SPI is more than 8. 
    Select name from
    Stu where Rno IN
                    (
                        Select Rno from Academic
                        where SPI>8
                    )

--3. Display details of students of computer department who belongs to Rajkot city. 
    Select * from 
    Stu where DID IN (
                            Select DID from Department
                            where DName = 'Computer'
                            ) AND City IN (
                                            Select City From Stu
                                            where City = 'Rajkot'
                                            )


                                         --OR--

    SELECT *
    FROM Stu
    WHERE City = 'Rajkot'
    AND DID = (
        SELECT DID FROM Department WHERE DName = 'Computer'
    );

                                     


--4. Find total number of students of electrical department. 
    Select Count(*) As Total_student
    from Stu where DID IN (
                                Select DID from Department
                                where DName = 'Electrical'
                              )
--5. Display name of student who is having maximum SPI.

    Select name from
    Stu where Rno IN (
                            Select Rno from  Academic
                            where SPI = (
                                            Select MAX(SPI) from Academic
                                        )
                         )

                                                    --Part – B--

--6. Display details of students having more than 1 backlog. 
    Select * from
    Stu where Rno IN (
                            Select Rno from Academic
                            where Bklog > 1
                          )
--7. Display name of student who is having second highest SPI. 
    Select name from
    Stu where Rno IN (
                            Select Rno from Academic
                            where SPI = (
                                            select MAX(SPI) from Academic
                                            where SPI < (
                                                            Select MAX(SPI) from Academic
                                                            )
                                             )
                                     )
--8. Display name of students who are either from computer department or from mechanical department. 
       Select name from
       Stu where DID IN 
                            (
                                Select DID from Department
                                where DName IN ('Computer','Mechanical')
                              )
                                                        --Part – C--
                                                        

--9. Display name of students who are in same department as 102 studying in. 
      Select name from
      Stu where DID IN 
                        (
                            Select DID from Stu
                            where Rno = 102
                         )
--10. Display name of students whose SPI is more than 9 and who is from electrical department. 

    Select name 
    from Stu
    where Rno IN (
                    Select Rno from Academic
                    where Spi > 9 
                 ) AND DID IN (
                                Select DID from Department
                                where DName = 'electrical'
                                )
                                