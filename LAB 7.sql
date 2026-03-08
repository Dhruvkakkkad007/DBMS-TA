                                    --LAB 7--
CREATE TABLE Student (
    Enrollment_No VARCHAR(20),
    Name VARCHAR(25),
    CPI DECIMAL(5,2),
    Birthdate DATETIME
);


--Part - A 

--1. Add two more columns City VARCHAR (20) NULL and Backlog INT NOT NULL. 
    ALTER TABLE Student
    ADD CITY VARCHAR(20) NULL, 
    BACKLOG INT NOT NULL;
   
--2. Change the size of NAME column of student from VARCHAR (25) to VARCHAR (35). 
    ALTER TABLE STUDENT
    ALTER COLUMN NAME VARCHAR(35);

--3. Change the data type DECIMAL to INT in CPI Column. 
    ALTER TABLE STUDENT
    ALTER COLUMN CPI INT

--4. Rename Column Enrollment No to ENO. 
    SP_RENAME 'STUDENT.Enrollment_No' ,'ENO';

--5. Delete Column City from the STUDENT table. 
    ALTER TABLE STUDENT
    DROP COLUMN CITY; 

--6. Change name of table STUDENT to STUDENT_MASTER. 
    SP_RENAME 'STUDENT','STUDENT_MASTER';
    
--Part - B 

--7. Remove Column Backlog from the table. 
    ALTER TABLE STUDENT
    DROP COLUMN BACKLOG;
--8. Change Constraint of Name Column from NULL to NOT NULL. 
    
    
    
    
    ALTER TABLE STUDENT
    ALTER COLUMN NAME VARCHAR(35) NOT NULL;







--Part - C 

--9. Rename Column Birthdate to BDate.
    SP_RENAME 'BIRTHDATE','BDATE'

--10. Change the datatype of ENO Column from VARCHAR (20) to VARCHAR (12) 
    ALTER TABLE STUDENT
    ALTER COLUMN ENO VARCHAR(12);







   --- ALTER TABLE TABLE_NAME
   ---  ADD COLUMN_NAME DATA_TYPE

   --ALTER TABLE TABLE_NAME
   --ALTER COLUMN COLUMN_NAME NEW_DATA_TYPE

   --ALTER TABLE TABLE_NAME
   -- DROP COLUMN COLUMN_NAME 

   --SP_RENAME


 --a) Add a new column

--ALTER TABLE table_name
--ADD column_name datatype [constraints];

--b) Drop a column

--ALTER TABLE table_name
--DROP COLUMN column_name;

--c) Modify a column

--ALTER TABLE table_name
--ALTER COLUMN column_name new_datatype;

--D) RENAME
--EXEC sp_rename 'table_name.old_column_name', 'new_column_name';

--EXEC SP_RENAME 'OLD_TABLE_NAME','NEW_TABLE_NAME'