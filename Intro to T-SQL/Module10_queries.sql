MODULE 10: OUTER JOINS

--we want a list of products, whether or not they have been sold
1.  SELECT P.ProductID, P.Name AS ProductName, SOD.OrderQty
	FROM Production.Product AS P
		LEFT OUTER JOIN Sales.SalesOrderDetail AS SOD
		ON P.ProductID = SOD.ProductID;

--now we want products order with >5 units
2. SELECT P.ProductID, P.Name AS ProductName, SOD.OrderQty
	FROM Production.Product AS P
		LEFT OUTER JOIN Sales.SalesOrderDetail AS SOD
		ON P.ProductID = SOD.ProductID
		WHERE SOD.OrderQty > 5  --WHERE clauses are evaluated by program BEFORE the join STATEMENT! This will remove null orders from the results...
		Order BY SOD.OrderQty;

--a better way to write this is...

SELECT P.ProductID, P.Name AS ProductName, SOD.OrderQty
FROM Production.Product AS P
	LEFT OUTER JOIN Sales.SalesOrderDetail AS SOD
	ON P.ProductID = SOD.ProductID
	AND SOD.OrderQty > 5
	Order BY SOD.OrderQty;

3. --This query is just like the LEFT order JOIN
--The positions are swapped
SELECT C.CustomerID, SOH.SalesOrderID, SOH.OrderDate 
FROM Sales.SalesOrderHeader AS SOH
RIGHT OUTER JOIN Sales.Customer AS C 
	ON C.CustomerID = SOH.CustomerID;

SELECT P.ProductID, P.Name, SOD.OrderQty
FROM  Sales.SalesOrderDetail AS SOD
RIGHT OUTER JOIN  Production.Product AS P
	ON P.ProductID = SOD.ProductID;