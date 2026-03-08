										--LAB-2--

										--PART-A--

-- 1. Retrieve all data from table DEPOSIT.


SELECT *FROM DEPOSIT


 -- 2.  Retrieve all data from table BORROW.

 SELECT *FROM BORROW

 -- 3.  Display Account No, Customer Name & Amount from DEPOSIT.

 SELECT ACTNO,CNAME,AMOUNT 
 FROM DEPOSIT

 -- 4. Display Loan No, Amount from BORROW.

 SELECT LOANNO,AMOUNT 
 FROM BORROW

 --5.  Display loan details of all customers who belongs to ‘ANDHERI’ branch from borrow table

 SELECT LOANNO
 FROM BORROW
 WHERE BNAME='ANDHERI';

 --6.  Give account no and amount of depositor, whose account no is equals to 106 from deposit table.

 SELECT ACTNO,AMOUNT
 FROM DEPOSIT
 WHERE ACTNO=106;

 --7.  Give name of borrowers having amount greater than 5000 from borrow table.

 SELECT CNAME 
 FROM BORROW
 WHERE AMOUNT>5000;

 --8. Give name of customers who opened account after date '1-12-1995' from deposit table


 SELECT CNAME
 FROM DEPOSIT
 WHERE ADATE > '1995-12-1';

 --9. Display name of customers whose account no is less than 105 from deposit table.

 SELECT CNAME 
 FROM DEPOSIT
 WHERE ACTNO<105;

 --10. Display name of customer who belongs to either ‘NAGPUR’ or ‘DELHI’ from customer table. (USE OR & IN)

 SELECT CNAME 
 FROM CUSTOMERS
 WHERE CITY IN('NAGPUR','DELHI');


 --11. Display name of customers with branch whose amount is greater than 4000 and account no is less than 105 from deposit table.

 SELECT CNAME
 FROM DEPOSIT
 WHERE AMOUNT>4000 AND ACTNO<105;

 --12.Find all borrowers whose amount is greater than equals to 3000 & less than equals to 8000 from borrow table. (USE AND & BETWEEN)
 
 --USE OF AND

 SELECT BNAME 
 FROM BORROW
 WHERE AMOUNT>=3000 AND AMOUNT<=8000;

 --USE OF BETWEEN

 SELECT BNAME 
 FROM BORROW
 WHERE AMOUNT BETWEEN 3000 AND 8000;


--13. Find all depositors who do not belongs to ‘ANDHERI’ branch from deposit table.

SELECT CNAME 
FROM DEPOSIT 
WHERE BNAME!='ANDHERI';

--14. Display Account No, Customer Name & Amount of such customers who belongs to ‘AJNI’, ‘KAROLBAGH’ Or ‘M.G. ROAD’ and Account No is less than 104 from deposit table.

SELECT ACTNO,CNAME,AMOUNT 
FROM DEPOSIT
WHERE BNAME IN('AJNI','KAROLBAGH','M.G.ROAD') AND ACTNO<104;


--15.Display the name of borrowers whose amount is NULL.

SELECT CNAME
FROM BORROW
WHERE AMOUNT=NULL;


									--PART B--



--16. Display Account No, Customer Name & Amount of such customers who belongs to ‘AJNI’, ‘KAROLBAGH’ 
--Or ‘M.G. ROAD’ and Account No is less than 104. 
	
SELECT ACTNO,CNAME,AMOUNT
FROM DEPOSIT
WHERE BNAME IN ('AJNI', 'KAROLBAGH', 'M.G. ROAD')
AND ACTNO < 104;

--17. Display all the details of first five customers.
	SELECT TOP 5 *
	FROM CUSTOMERS

--18. Display all the details of first three depositors whose amount is greater than 1000. 
	SELECT TOP 3 CNAME
	FROM DEPOSIT
	WHERE AMOUNT > 1000;

--19. Display Loan No, Customer Name of first five borrowers whose branch name does not belongs to 
--‘ANDHERI’. 
	SELECT TOP 5 LOANNO,CNAME
	FROM BORROW
	WHERE BNAME != 'ANDHERI';

--20. Retrieve all unique cities using DISTINCT. (Use Customers Table)

	SELECT DISTINCT CITY
	FROM CUSTOMERS;


									--Part - C 


--21. Retrieve all unique branches using DISTINCT. (Use Branch Table) 
	SELECT DISTINCT BNAME 
	FROM BRANCH;
--22. Retrieve all the records of customer table as per their city name in ascending order.
	SELECT * 
	FROM CUSTOMERS
	ORDER BY CITY ASC;
--23. Retrieve all the records of deposit table as per their amount column in descending order. 
	SELECT *
	FROM DEPOSIT
	ORDER BY AMOUNT DESC;
--24. Retrieve all the details of customers in descending order of their city name. 
	SELECT * 
	FROM CUSTOMERS
	ORDER BY CITY DESC;
--25. Show all unique borrowers& label the column Unique_Borrowers. (Display only Names) 
	SELECT DISTINCT CNAME AS Unique_Borrowers
	FROM BORROW
