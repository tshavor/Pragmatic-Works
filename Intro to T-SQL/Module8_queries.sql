MODULE #8: Sub-Query Filtering

1. USE AdventureWorks2016CTP3;
   GO

	SELECT CustomerID, AccountNumber
	FROM Sales.Customer
	WHERE CustomerID IN (SELECT CustomerID FROM Sales.SalesOrderHeader);
	
	--(Find all the customers who have placed an order by comparing the CustomerID within the Sales.Customer table to the CustomerID values
	--returned from the Sales.SalesOrderHeader table)

2. USE AdventureWorks2016CTP3;
   	   GO
	
		SELECT ProductID, Color, Name
		FROM Production.Product 
		WHERE ProductID IN (SELECT ProductID FROM Sales.SalesOrderDetail)
			AND Color = 'Blue';
			(Find the Products that have been ordered that are Blue; Can combine with other predicates)

3. 	SELECT ProductID, Color, Name
   	FROM Production.Product 
	WHERE ProductID IN (SELECT ProductID FROM Sales.SalesOrderDetail 
					WHERE SalesOrderID IN (Select SalesOrderID 
											FROM Sales.SalesOrderHeader 
											WHERE YEAR(OrderDate) = 2006))

--(Could have multiple levels of nesting; Find the products that have been ordered in 2006)