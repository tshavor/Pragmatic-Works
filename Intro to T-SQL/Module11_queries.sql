MODULE 11

1.  SELECT E.BusinessEntityID, P.FirstName + ' ' + P.LastName AS Name, 'Employee' AS SOURCE
	FROM HumanResources.Employee AS E
	JOIN Person.Person AS P
		ON E.BusinessEntityID = P.BusinessEntityID;
--( gives us 3 columns, linked by BusinessEntityID)

2. SELECT E.BusinessEntityID, P.FirstName + ' ' +  P.LastName AS Name, 'Employee' AS Source
	FROM HumanResources.Employee E 
	JOIN Person.Person P ON e.BusinessEntityID = P.BusinessEntityID
	UNION ALL 
	SELECT V.BusinessEntityID, Name, 'Vendor' AS Source
	FROM Purchasing.Vendor V 
	UNION ALL 
	SELECT P.BusinessEntityID, P.FirstName + ' ' + P.LastName, 'Customer' 
	FROM Sales.Customer C 
--(this query joins 3 tables, and appends the vendor information to the bottom of the Source column )

3. SELECT Name
	FROM Production.Product 
	UNION
	SELECT FirstName
	FROM Person.Person
	ORDER BY Name;  
--This query removes all duplicates
--ORDER BY statement mut be LAST line when using UNION

4. SELECT Name
	FROM Production.Product 
	UNION ALL
	SELECT FirstName
	FROM Person.Person
	ORDER BY Name;
--This query keeps all duplicates
--ORDER BY statement mut be LAST line when using UNION

5. 

--this query from Module 10 can be rewritten as a CTE
	SELECT P.ProductID, P.Name, SOD.OrderQty
	FROM Production.Product AS P 
	LEFT OUTER JOIN Sales.SalesOrderDetail AS SOD 
		ON P.ProductID = SOD.ProductID
		AND SOD.OrderQty > 5;

--Always start the CTE query with ;
--Any code before must end with ; but that is not guaranteed
	USE AdventureWorks2016CTP3;
    GO

   ;WITH Orders AS (
		SELECT SalesOrderID, ProductID, OrderQty 
		FROM Sales.SalesOrderDetail
		WHERE OrderQty > 5)
	SELECT P.ProductID, Name, Color, OrderQty, SalesOrderID 
	FROM Production.Product AS P 
	LEFT JOIN Orders ON P.ProductID = Orders.ProductID;