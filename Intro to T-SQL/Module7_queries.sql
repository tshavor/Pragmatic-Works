MODULE #7: Muliple Predicates

1. SELECT BusinessEntityID, FirstName, LastName
	FROM Person.Person
	WHERE FirstName = 'Hailey' AND LastName = 'Barnes';
	--(returns persons where both first and second predicates are true-only 1 person)

2. SELECT BusinessEntityID, FirstName, LastName
	FROM Person.Person
	WHERE FirstName = 'Hailey' OR LastName = 'Barnes';
	--(returns persons where both first OR second predicates are true- 140 people)

3. SELECT SalesOrderID, CustomerID, OrderDate
	FROM Sales.SalesOrderHeader
	WHERE CustomerID BETWEEN 11000 AND 12000
	AND OrderDate >= '2010-01-01' AND OrderDate < '2012-01-01';
	--(multiple predicates at work here...)

4. SELECT BusinessEntityID, FirstName, LastName
	FROM Person.Person
	WHERE (FirstName = 'Hailey' OR FirstName = 'Haley')
	AND LastName = 'Barnes';
	--(use () when using both WHERE & OR to avoid confusion in reading code)

5. SELECT BusinessEntityID, FirstName, LastName
	FROM Person.Person
	WHERE NOT (LastName = 'Barnes');
	--(gives everyone who does not have the LastName of Barnes)

6. SELECT BusinessEntityID, FirstName, LastName
	FROM Person.Person
	WHERE NOT ( FirstName = 'Hailey' AND LastName = 'Barnes');
	--(gives you everyone except Hailey Barnes)

7. SELECT BusinessEntityID, FirstName, LastName
	FROM Person.Person
	WHERE LastName LIKE 'S%';
	--(gives all people with LastName starting with 'S' )

8. SELECT BusinessEntityID, FirstName, LastName
	FROM Person.Person
	WHERE LastName NOT LIKE 'S%';
	--(gives all people with LastName does NOT start with 'S' )

9. SELECT FirstName, MiddleName, LastName
FROM Person.Person
WHERE MiddleName <> 'B';

--19,972 all records
--291 records with middleName of B
--11,182 records not B
--LOTS OF NULL VALUES in MiddleName!
--to account for the NULL values, try this...

SELECT FirstName, MiddleName, LastName
FROM Person.Person
WHERE MiddleName <> 'B' OR MiddleName IS NULL;