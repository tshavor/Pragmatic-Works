MODULE #4:

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

7.	SELECT 10 % 2
	(use of Modulo gives remainder after division operation= 0)

8.	SELECT 5 % 2 AS Oddvalue
	(modulo is typically used in programming to determine if a value is ODD or EVEN)

9.	SELECT 5 % 2 AS OddValue
		, 30 % 10 AS EvenValue

10.	SELECT 10/3
	(SQL assumes all numbers are integers unless you specify otherwise.  Answer = 3)

11. SELECT 10.0/3
	(SQL converts numbers to decimals based on changing the 10 to 10.0.  Answer = 3.333)

//// FUNCTIONS ////

12. SELECT LEFT(FirstName, 1)
	FROM Person.Person;
	(takes first char on the LEFT side from "FirstName")

13. SELECT LEFT(FirstName, 1) AS FirstInitial
	, FirstName
	, LEFT(LastName, 1) AS LastInitial
	, LastName
	FROM Person.Person;
	(Displays 4 columns, with first and last initials followed by the full names)


14. SELECT FirstName
	, LEFT (FirstName, 3) AS LeftThree
	, LastName
	, RIGHT (LastName, 3) AS RightThree
	FROM Person.Person;
	(gives first 3 characters of FirstName, last 3 of LastName)

15. SELECT UPPER(FirstName) AS FirstName
	, LOWER(LastName) AS LastName
	FROM Person.Person;
	(Converts FirstName to upper case, Lastname to lower case)

16. SELECT REPLICATE ('A', 10) AS TenA;
	(gives you a column with 10 A's in it!)

17. SELECT LEN(FirstName) AS LengthofFirstName
	, FirstName
	FROM Person.Person;
	(gives length of FirstName)

18.  SELECT GETDATE() AS SystemDate
	, DATEPART(MONTH, GETDATE()) AS MonthOfYear
	, DATEPART(DAY, GETDATE()) AS DayOfMonth;;
	(gives system date and month of year based on current date)

19. SELECT GETDATE() AS SystemDate
	, MONTH(GETDATE()) AS MonthOfYear
	, DAY(GETDATE()) AS DayOfMonth;
	(shorter, more system efficent way of writing #18)

20. SELECT OrderDate
	FROM Sales.SalesOrderHeader
	ORDER BY OrderDate;

21. SELECT DATEADD(MONTH, 1, GETDATE()) AS NextMonth
		, GETDATE() AS Today;
	(gives 2 columns; today's date compared to 1 month in the future)

22. SELECT DATEDIFF(DAY, OrderDate, ShipDate) AS DaysToShip
	,OrderDate
	,ShipDate
	FROM Sales.SalesOrderHeader;
	(gives # of days between OrderDate and ShipDate)

23. SELECT DATEDIFF(MONTH, OrderDate, GETDATE()) AS MonthsFromOrder
	,OrderDate
	,GETDATE() AS TodaysDate
	FROM Sales.SalesOrderHeader;

24. SELECT CASE WHEN FirstName = 'Catherine' THEN 'Catherine'
	ELSE 'Not Katherine'
	END AS NotKatherine
	,FirstName 
	FROM Person.Person;
	(can have multiple WHEN statements, very powerful in NESTED statements!)

25. SELECT FirstName + CAST(BusinessEntityID AS nvarchar(10)) AS NameBusinessID
	FROM Person.Person;
	(the CAST function allows us to convert the BusinessEntityID as a STRING so that we can add these 2 columns together!)

26. SELECT OrderDate
	,CONVERT(VARCHAR, OrderDate, 112) AS FormattedDate1
	,CONVERT(VARCHAR, OrderDate, 102) AS FormattedDate2
	FROM Sales.SalesOrderHeader;
	(this allows us to convert the date to different formats; one without time, one with periods between the digits.  see MSDN article on codes)

27. SELECT OrderDate
	,FORMAT(OrderDate,'dd/MM/yyyy') AS FormattedDate
	,FORMAT(OrderDate,'MM/dd/yyyy') AS FormattedDate1
	FROM Sales.SalesOrderHeader;
	(various ways of formatting dates- month  is always CAPITALIZED)

28. SELECT FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName AS FullName
	,FirstName
	,MiddleName
	,LastName
	FROM Person.Person;
	(ISNULL function allows us to take missing, or null values and replace them with a character of our choosing- try this without ISNULL to see how this works!)

29. SELECT Size, Color, Style, Name
	FROM Production.Product;  //LOTS of nulls!

try this...

	SELECT Size, Color, Style, Name
	,COALESCE(Size, Color, Style, Name) AS FullNonNull
	FROM Production.Product;
	(now, the first non-null column is the one used in the final column)

30. SELECT TOP(10) *
	FROM Sales.SalesOrderHeader;

31. SELECT TOP(10) SalesOrderID, SubTotal
	FROM Sales.SalesOrderHeader
	ORDER by SubTotal DESC;
(note: default ordering method is Ascending, or ASC!)

32. SELECT TOP(10) PERCENT SalesOrderID, SubTotal
FROM Sales.SalesOrderHeader
ORDER by SubTotal DESC;
(gives top 10% of orders- not top 10)

33. SELECT DISTINCT Color
FROM Production.Product;
(gives us each possible value in a column only once!)