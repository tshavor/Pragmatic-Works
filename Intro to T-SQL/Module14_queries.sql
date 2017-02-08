1. VARIBLES

USE AdventureWorks2016CTP3; 
GO

DECLARE @var1 INT = 1;
PRINT @var1;

SET @var1 = 5; 
PRINT @var1;

--Query example
DECLARE @CustID INT = 11000;
SELECT * 
FROM Sales.Customer
WHERE CustomerID = @CustID;

--table variable example
DECLARE @test TABLE(Col1 INT, Col2 VARCHAR(10));

INSERT INTO @test(Col1, Col2) VALUES(1,'a');

SELECT * FROM @test;

2. CONDITIONAL LOGIC

USE AdventureWorks2016CTP3; 
GO

DECLARE @var1 INT = 1; 
DECLARE @var2 INT = 2;

IF @var1 = @var2 BEGIN 
	print 'they are the same!'
END
ELSE BEGIN
	print 'they are different!'
END;

--example with query
IF EXISTS(SELECT * FROM Sales.Customer 
			WHERE CustomerID = 1) BEGIN
	SELECT * FROM Sales.Customer 
	WHERE CustomerID = 1
END
ELSE BEGIN 
	PRINT 'there is no customer -1';
END;
	
GO
--nesting example (FIZZ BUZZ EXAMPLE FOR INTERVIEWS)
DECLARE @Var1 INT = 9
IF @Var1 % 5 = 0 BEGIN
	IF @Var1 % 3 = 0 BEGIN 
		print 'the number is divisible by 3 and 5'
	END
	ELSE BEGIN 
		print 'the number is divisible by 5'
	END
END
ELSE BEGIN 
	IF @Var1 % 3 = 0 BEGIN 
		print 'the number is divisible by 3'
	END
	ELSE BEGIN 
		print 'the number is not divisible by 3 or 5'
	END
END


3. LOOPS

USE AdventureWorks2016CTP3; 
GO

--Use WHILE for loops
DECLARE @Count int = 0;

WHILE @Count < 10 BEGIN 
	PRINT @Count;
	SET @Count = @Count + 1;
END;


--create a table 
SELECT BusinessEntityID, FirstName, LastName
INTO #Names
FROM Person.Person;

--loop runs until table is empty
WHILE EXISTS(SELECT * FROM #Names) BEGIN
	DELETE TOP(1) FROM #Names;
END

SELECT * FROM #Names;


4. STORED PROCEDURES

USE AdventureWorks2016CTP3;
GO

CREATE PROC usp_GetCustomer @CustomerID INT AS 
	SELECT * FROM Sales.Customer
	WHERE CustomerID = @CustomerID;
GO

exec usp_GetCustomer 11000;

GO

CREATE PROC usp_TEST AS 
	SELECT BusinessEntityID, FirstName, LastName
	INTO #Names
	FROM Person.Person;

	WHILE EXISTS(SELECT * FROM #Names) BEGIN
		DELETE TOP(1) FROM #Names;
	END

GO

exec usp_TEST;



