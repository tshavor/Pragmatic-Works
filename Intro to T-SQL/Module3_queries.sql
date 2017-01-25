MODULE #3:

1.	SELECT * FROM Person.Person;
	--(Pulls all columns from 20,000 database!)

2.	 SELECT LastName, FirstName FROM Person.Person;
	--(Pulls just the LastName and FirstName columns)


3.	SELECT TOP (10) LastName, FirstName
 	FROM Person.Person; //(Person schema, Person table)//
	--(Selects 10 rows from query (in any order))

4.	SELECT TOP (10) LastName AS Last, FirstName First
 	FROM Person.Person;
	--(renames LastName to "Last" and FirstName to "First".  (The keyword "AS" is optional!))

5.	SELECT TOP (10) LastName AS Last, FirstName First
 	FROM Person.Person;
	ORDER BY FirstName, LastName;
	--(orders first name and last name)
