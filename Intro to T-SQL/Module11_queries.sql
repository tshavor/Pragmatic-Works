MODULE 11

1.  SELECT E.BusinessEntityID, P.FirstName + ' ' + P.LastName AS Name, 'Employee' AS SOURCE
	FROM HumanResources.Employee AS E
	JOIN Person.Person AS P
		ON E.BusinessEntityID = P.BusinessEntityID;
--( gives us 3 columns, linked by BusinessEntityID)

2. SELECT E.BusinessEntityID, P.FirstName + ' ' + P.LastName AS Name, 'Employee' AS SOURCE
	FROM HumanResources.Employee AS E
	JOIN Person.Person AS P
		ON E.BusinessEntityID = P.BusinessEntityID
		
		UNION ALL

	SELECT V.BusinessEntityID, Name, 'Vendor' AS Source
	FROM Purchasing.Vendor AS V
--(this query joins 3 tables, and appends the vendor information to the bottom of the Source column )

3. 