1. --CREATE tables

USE AdventureWorks2016CTP3;
   GO

--here is a temp table create statement
CREATE TABLE #Names (BusinessEntityID INT, 
FirstName NVARCHAR(50),LastName NVARCHAR(50));

--now select from it, but there isn't any data yet
SELECT * FROM #Names;

--This is how to drop the table
DROP TABLE #Names;

2. --INSERT

USE AdventureWorks2016CTP3;
GO

--Create a table to work with
CREATE TABLE #Names (BusinessEntityID INT, 
FirstName NVARCHAR(50),LastName NVARCHAR(50));

--Insert one row
INSERT INTO #Names(BusinessEntityID, 
	FirstName, LastName)
VALUES (1,'John','Smith');

--Now view the data
SELECT * FROM #Names;

--You can also enter multiple rows at once
INSERT INTO #Names(BusinessEntityID, FirstName, LastName)
--Here, we are hard coding the values for the created variables.  2=BusinessEntityId, "John"= FirstName, "Smith"= LastName
VALUES (2,'John','Smith'),
		(3,'Mary','Smith'),
		(4,'Brian','Knight');

--Now view the data
SELECT * FROM #Names;

--Insert with a SELECT statement
INSERT INTO #Names(BusinessEntityID, FirstName, LastName)
SELECT BusinessEntityID, FirstName, LastName
FROM Person.Person;

--Now view the data
SELECT * FROM #Names;

3. --SELECT INTO

USE AdventureWorks2016CTP3;
GO

--SELECT INTO creates and populates the
--table in one step

SELECT BusinessEntityID, FirstName, LastName
INTO #SNames
FROM Person.Person;

--Now view the data
SELECT * FROM #SNames;

--You can also create the table and then populate it
--this is more efficient when importing a large table
SELECT BusinessEntityID, FirstName, LastName
INTO #ENames
FROM Person.Person 
WHERE 1 = 2;

SELECT * FROM #ENames;

INSERT INTO #ENames(BusinessEntityID, FirstName, LastName)
SELECT BusinessEntityID, FirstName, LastName 
FROM Person.Person;

SELECT * FROM #ENames;

4. --UPDATE

USE AdventureWorks2016CTP3;
GO

--create a table to work with
SELECT BusinessEntityID, FirstName, LastName, 0 as Total
INTO #Names
FROM Person.Person;


--Update names
UPDATE #Names 
SET LastName = 'SMITH', FirstName = 'ABC'
WHERE LastName = 'Smith';

SELECT * 
FROM #Names
WHERE LastName = 'Smith';


--Only update the rows that join to Customer
UPDATE N
SET LastName = 'ABC'
FROM #Names AS N 
INNER JOIN Sales.Customer C 
ON N.BusinessEntityID = C.PersonID;

SELECT * 
FROM #Names;

--You cannot update with an aggregate!
UPDATE N
SET Total = SUM(TotalDue) 
FROM #Names AS N 
INNER JOIN Sales.Customer AS C ON N.BusinessEntityID = C.PersonID
INNER JOIN Sales.SalesOrderHeader AS SOH ON SOH.CustomerID = C.CustomerID;


--Must use a workaround!
--calculate aggregate in a CTE
;WITH totals AS(
	SELECT SUM(TotalDue) Total, CustomerID 
	FROM Sales.SalesOrderHeader
	GROUP BY CustomerID)
UPDATE N 
SET Total = totals.Total 
FROM #Names AS N 
JOIN Sales.Customer AS C ON N.BusinessEntityID = C.PersonID
JOIN totals ON C.CustomerID = totals.CustomerID;

5. --DELETE

USE AdventureWorks2016CTP3;
GO

--create a table 
SELECT BusinessEntityID, FirstName, LastName
INTO #Names
FROM Person.Person;

SELECT * FROM #Names;

--Delete all the data
DELETE #Names;

SELECT * FROM #Names;

DROP TABLE #Names 

--create a table 
SELECT BusinessEntityID, FirstName, LastName
INTO #Names
FROM Person.Person;

--Only delete the rows that join to Customer
DELETE N
FROM #Names AS N 
INNER JOIN Sales.Customer C 
ON N.BusinessEntityID = C.PersonID;

SELECT * FROM #Names;
