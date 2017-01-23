MODULE #6

1. SELECT CustomerID, SalesOrderID, OrderDate
	FROM Sales.SalesOrderHeader
	WHERE CustomerID = 29825;

2. SELECT CustomerID, SalesOrderID, OrderDate
	FROM Sales.SalesOrderHeader
	WHERE 1=2;
	(since 1 will never equal 2, this query returns only the column headings)

3. SELECT LastName, FirstName
	FROM Person.Person
	WHERE LEFT(LastName, 1) = 'S';

OPERATORS:

= (EQUAL TO)
<>  OR != (NOT EQUAL TO)
< (LESS THAN)
> (GREATER THAN)
<= (LESS THAN OR EQUAL TO)
>= (GREATER THAN OR EQUAL TO)
BETWEEN	

4. SELECT LastName, FirstName
	FROM Person.Person
	WHERE LastName BETWEEN 'A' AND 'C';
	(BETWEEN works on numbers as well as string expressions!)

LIKE AND WILDCARDS (%, _):

5. SELECT LastName, FirstName
	FROM Person.Person
	WHERE LastName LIKE 'S%';
	(gives every person beginning with the last name of "S")

6. SELECT LastName, FirstName
	FROM Person.Person
	WHERE LastName LIKE '%S';
	(gives every person ending with the last name of "S")

7. SELECT LastName, FirstName
	FROM Person.Person
	WHERE LastName LIKE '%S%';
	(returns a LastName containing an "s" anywhere in the string)

8. SELECT LastName, FirstName
	FROM Person.Person
	WHERE LastName LIKE 'Anders[eo]n';
	(variations of the letters within the array brackets [] are searched for in conjunction with the name)

IN Statement (similar to [])

9. SELECT LastName, FirstName
	FROM Person.Person
	WHERE LastName IN ('Smith', 'Anderson');
	(gives all people with the last name of Smith or Anderson)

10. SELECT OrderDate, SalesOrderID
	FROM Sales.SalesOrderHeader
	WHERE OrderDate IN ('2011-05-31');
	(date string is implicity created by SQL Server and searched)

11. SELECT CustomerID, OrderDate, SalesOrderID
	FROM Sales.SalesOrderHeader
	WHERE CustomerID IN (11000, 11001);
	(returns only customerIDs in parentheses)

