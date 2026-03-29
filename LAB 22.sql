CREATE TABLE City (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(50) UNIQUE,
    Pincode INT,
    Remarks VARCHAR(50)
);

INSERT INTO City (CityID, CityName, Pincode, Remarks) VALUES
(1, 'Rajkot', 360005, 'Good'),
(2, 'Surat', 335009, 'Good'),
(3, 'Baroda', 390001, 'Awesome'),
(4, 'Jamnagar', 361003, 'Smart'),
(5, 'Junagadh', 362229, 'Historic'),
(6, 'Morvi', 363641, 'Ceramic');


CREATE TABLE Village (
    VillageID INT PRIMARY KEY,
    VillageName VARCHAR(50),
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);


INSERT INTO Village (VillageID, VillageName, CityID) VALUES
(101, 'Raiya', 1),
(102, 'Madhapar', 1),
(103, 'Dodka', 3),
(104, 'Falla', 4),
(105, 'Bhesan', 5),
(106, 'Dhoraji', 5);


                                                 --Part – A--
--1. Display all the villages of Rajkot city.  
    Select v.VillageName from Village v Join City c
    on v.CityID = c.CityID
    where c.CityName = 'Rajkot'
--2. Display city along with their villages & pin code. 
    Select c.CityName,v.VillageName,c.Pincode from Village v  Join City c
    on v.CityID = c.CityID
--3. Display the city having more than one village. 
     Select c.CityName,count(c.CityID) as COUNT 
     from Village v  Join City c
    on v.CityID = c.CityID
    group by c.CityName
    having count(c.CityID) > 1
--4. Display the city having no village. 
     Select c.CityName  
     from Village v  Join City c
    on v.CityID = c.CityID
    where v.VillageID is null

--5. Count the total number of villages in each city. 
   Select c.CityName,count(v.VillageID) as COUNT 
     from Village v  Join City c
    on v.CityID = c.CityID
    group by c.CityName
  
--Part – B 
--6. Display number of villages of Rajkot city.  

    Select c.CityName,count(v.VillageID) as COUNT 
    from Village v  Join City c
    on v.CityID = c.CityID
    where c.CityName='Rajkot'
    group by c.CityName

--7. Display Rajkot city along with their villages & pin code.

   Select c.CityName,v.VillageName,c.Pincode 
     from Village v  Join City c
    on v.CityID = c.CityID
    where c.CityName='Rajkot'
    
--8. Display villages of Rajkot & Junagadh city.  

SELECT v.VillageName, c.CityName
FROM Village v
JOIN City c ON v.CityID = c.CityID
WHERE c.CityName IN ('Rajkot', 'Junagadh');


                                                                --Part – C 
--9. Display number of villages of Surat city. 
    Select count(v.VillageID)  from
    Village v Join City c
    on v.CityID = c.CityID
    where c.CityName = 'Surat'
--10. Display city along with their villages & pin code whose Remarks is Good. 
    Select c.CityName,v.VillageName,c.Pincode from
    City c Join Village v
    on c.CityID = v.CityID
    where c.Remarks = 'GOOD'

--11. Display the city name of Falla village. 
     Select c.CityName from
    City c Join Village v
    on c.CityID = v.CityID
    where v.VillageName = 'Falla'