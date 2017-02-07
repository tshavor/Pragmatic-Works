1. USE AdventureWorks2016CTP3;
   GO

--here is a temp table create statement
CREATE TABLE #Names (BusinessEntityID INT, 
FirstName NVARCHAR(50),LastName NVARCHAR(50));

--now select from it, but there isn't any data yet
SELECT * FROM #Names;

--This is how to drop the table
DROP TABLE #Names;

2. USE AdventureWorks2016CTP3;
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
INSERT INTO #Names(BusinessEntityID, 
	FirstName, LastName)
VALUES (2,'John','Smith'),
		(3,'Mary','Smith'),
		(4,'Brian','Knight');

--Now view the data
SELECT * FROM #Names;

--Insert with a SELECT statement
INSERT INTO #Names(BusinessEntityID, 
	FirstName, LastName)
SELECT BusinessEntityID, FirstName, LastName
FROM Person.Person;

--Now view the data
SELECT * FROM #Names;

3. 