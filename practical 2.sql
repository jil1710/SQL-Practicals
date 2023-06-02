
-- CREATE DATABASE IF ALREADY CREATED IGNORE
IF NOT EXISTS (SELECT * FROM SYS.databases WHERE name = 'SQL_Practicals')
BEGIN
	CREATE DATABASE SQL_Practicals;
END
GO
---------------------------------------------------------------------------------------------------------

-- USE SQL_Practicals DATABASE
USE [SQL_Practicals]
GO
----------------------------------------------------------------------------------------------------------

-- CREATE TABLE Department 
IF NOT EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Department')
BEGIN
	CREATE TABLE Department 
	(
		DepartmentId INT PRIMARY KEY,
		DepartmentName VARCHAR(200) NOT NULL
	)
END
GO
----------------------------------------------------------------------------------------------------------

-- CREATE TABLE EMPLOYEE
IF NOT EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Employee')
BEGIN
	CREATE TABLE Employee 
	(
		EmployeeId INT PRIMARY KEY IDENTITY(1,1),
		EmployeeName VARCHAR(40) NOT NULL,
		DepartmentId INT NOT NULL,
		Experience DEC(4,2) NOT NULL,
		Salary MONEY NOT NULL,
		CONSTRAINT FK_DEPARTMENT_DepartmentId FOREIGN KEY (DepartmentId) REFERENCES Department(DepartmentId)
	)
END
GO
----------------------------------------------------------------------------------------------------------------

-- INSERT SOME RECORDS INTO DEPARTMENT TABLE
INSERT INTO Department VALUES(1, 'ASP.NET'),(2, 'Java'),(3,'PHP'),(4,'Android'),(5,'React');

-- INSERT SOME RECORDS INTO EMPLOYEE TABLE
INSERT INTO Employee VALUES ('Jay',1,8,50000),('Abhay',1,2,20000);
INSERT INTO Employee VALUES ('Jil',2,7,70000),('Bhavin',2,10,150000);
INSERT INTO Employee VALUES ('Denis',3,4,30000),('Devarsh',3,8,70000);
INSERT INTO Employee VALUES ('Ankit',4,2,40000),('Vipul',4,4,50000);

----------------------------------------------------------------------------------------------------------------

-- 1) Write a Query display empId,EmpName and DepartmentName.
SELECT E.EmployeeId,E.EmployeeName,D.DepartmentName FROM Employee E INNER JOIN Department D ON E.DepartmentId = D.DepartmentId;

-- 2) Write a Query to display department wise employee count.
SELECT D.DepartmentName,COUNT(E.EmployeeName) AS Employeecount FROM Employee E RIGHT JOIN Department D ON E.DepartmentId = D.DepartmentId GROUP BY D.DepartmentName;

-- 3) Write a Query to display department wise maximum salary.
SELECT D.DepartmentName,MAX(Salary) AS Maxsalary  FROM Employee E INNER JOIN Department D ON E.DepartmentId = D.DepartmentId GROUP BY D.DepartmentName;

-- 4) Write a Query to display employee name in the ascending order of department name.
SELECT D.DepartmentName,E.EmployeeName FROM Employee E INNER JOIN Department D ON E.DepartmentId = D.DepartmentId ORDER BY D.DepartmentName;

/* 5) Write a Query to display employeeName and grade where grade criteria is as below
		if employee has more than 10 years of experience then grade is expert
		if employee has experience between 7 to 10 years then its grade is advanced
		if employee has experience between 5 to 7 years then its grade is intermediate
		if employee has experience between 2 to 5 year then its grade is beginner
		and for the rest of case display grade as novice
*/

SELECT EmployeeName, 
	CASE 
	   WHEN Experience > 10 THEN 'Expert'
	   WHEN Experience BETWEEN 7 AND 10 THEN 'Advance'
	   WHEN Experience BETWEEN 5 AND 7 THEN 'Intermediate'
	   WHEN Experience BETWEEN 2 AND 5 THEN 'Beginner'
	   ELSE 'Novice'
	END AS Grade
	   FROM Employee;





