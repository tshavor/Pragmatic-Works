# Pragmatic-Works
Collection of Microsoft Training classes sponsored by Pragmatic data, Inc.

MODULE #3:

1.	SELECT * FROM Person.Person;
	(Pulls all columns from 20,000 database!)

2.	 SELECT LastName, FirstName FROM Person.Person;
	(Pulls just the LastName and FirstName columns)


3.	SELECT TOP (10) LastName, FirstName
 	FROM Person.Person; //(Person schema, Person table)//
	(Selects 10 rows from query (in any order))

4.	SELECT TOP (10) LastName AS Last, FirstName First
 	FROM Person.Person;
	(renames LastName to "Last" and FirstName to "First".  (The keyword "AS" is optional!))

5.	SELECT TOP (10) LastName AS Last, FirstName First
 	FROM Person.Person;
	ORDER BY FirstName, LastName;
	(orders first name and last name)

Module #4:

1.	USE AdventureWorks2016CTP3
	GO

	SELECT FirstName, LastName, FirstName + ' ' + LastName AS FullName
	FROM Person.Person;
	(concatenates FirstName and  LastName into a new column aliased as “FullName”)

2.	USE AdventureWorks2016CTP3
	GO

	SELECT FirstName, LastName, FirstName + ' ' + LastName 
	FROM Person.Person;
	(without aliasing, you get a "no column header" on your new column- VERY BAD PRACTICE, so always alias your column names!)

3. 	SELECT UnitPrice,
	UnitPrice + 10 AS TenDollarsAdded
	FROM Sales.SalesOrderDetail
	(selects UnitPrice column, then adds 10 to it, & creates an aliased column called "TenDollarsAdded"; only works because both column are numeric!)

4. 	SELECT UnitPrice,
	UnitPrice + 10 AS TenDollarsAdded,  
	UnitPrice/2 AS HalfOff
	FROM Sales.SalesOrderDetail

5. 	SELECT UnitPrice,
	UnitPrice + 10 AS TenDollarsAdded,
	UnitPrice/2 AS HalfOff,
	UnitPrice + UnitPrice AS DoubleMarkup
	FROM Sales.SalesOrderDetail

6. 	SELECT UnitPrice,
	(UnitPrice - 10) /2 *7 AS ComplexExpression
		
	FROM Sales.SalesOrderDetail
	(allows for complex orders of operations, as long as columns are numeric)

7.	