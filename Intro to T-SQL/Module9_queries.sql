MODULE 9: TABLE JOINS

1. SELECT *
	FROM Sales.Customer AS C
	INNER JOIN Sales.SalesOrderHeader AS SOH
	ON C.CustomerID = SOH.CustomerID ;
	--(basic join of 2 tables and using aliases on both tables to reduce typing the full path name)

2. SELECT C.CustomerID, C.AccountNumber, SOH.SalesOrderID, SOH.OrderDate
	FROM Sales.Customer AS C
	INNER JOIN Sales.SalesOrderHeader AS SOH  --inner Join is the default type of join; you could use "JOIN" instead
	ON C.CustomerID = SOH.CustomerID ;
	--(same query as above except selecting only 4 rows to display)

3. SELECT SOD.SalesOrderID, SOP. *
	FROM Sales.SalesOrderDetail AS SOD
	INNER JOIN Sales.SpecialOfferProduct AS SOP
	ON SOD.SpecialOfferID = SOP.SpecialOfferID
	AND SOD.ProductID = SOP.ProductID;
	--(not sure why I need to join on both SpecialOfferID and ProductID, but it decreases the volume by half.  Does 
		--this make it a 1:1 relationship?)

4. SELECT C.CustomerID, C.AccountNumber, SOH.SalesOrderID, SOH.OrderDate, P.Name AS ProductName, P.Color AS ProductColor, SOD.OrderQty
	FROM Sales.Customer AS C
	INNER JOIN Sales.SalesOrderHeader AS SOH
	ON C.CustomerID = SOH.CustomerID 
	INNER JOIN Sales.SalesOrderDetail as SOD
		ON SOH.SalesOrderID= SOD.SalesOrderID
			INNER JOIN Production.Product as P
				ON SOD.ProductID= P.ProductID;
				--(linking 4 tables together!)



