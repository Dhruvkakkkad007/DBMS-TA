                                   --LAB 8--

                                  --PART A--

CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Enrollment_No VARCHAR(20) UNIQUE NOT NULL,
    Name VARCHAR(25) NOT NULL,
    CPI DECIMAL(5,2) NULL CHECK (CPI <= 10),
    JoiningDate DATETIME NOT NULL DEFAULT(GETDATE()),
    Bklodge INT NOT NULL CHECK (Bklodge >= 0),
    StateName VARCHAR(50) NULL DEFAULT 'Gujarat'
);

                                --PART B--
CREATE TABLE State (
    StateID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    StateName VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE City
(
    CITYID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    CITYNAME VARCHAR(20) UNIQUE  NOT NULL,
    PINCODE VARCHAR(20) NULL,
    STATEID INT FOREIGN KEY REFERENCES  STATE(STATEID)
);


                                --PART C--

--WITH DESIGN MODE
