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

LIKE AND WILDCARDS:

5. 