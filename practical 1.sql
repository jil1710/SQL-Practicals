-- CREATE DATABASE IF ALREADY CREATED IGNORE
IF NOT EXISTS (SELECT * FROM SYS.databases WHERE name = 'SQL_Practicals')
BEGIN
	CREATE DATABASE SQL_Practicals;
END

GO
-- USE SQL_Practicals DATABASE
USE [SQL_Practicals]

GO
-- CREATE TABLE PRODUCT
IF NOT EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'product')
BEGIN
	CREATE TABLE product
	(
		ProductID INT IDENTITY(1,1) PRIMARY KEY,
		ProductName VARCHAR(500) CHECK(LEN(ProductName) <=500 ) NOT NULL,
		Category VARCHAR(50) NOT NULL,
		Price INT CHECK(Price !< 0) NOT NULL
	)
END
GO
-- ADD NEW COLUMN TO EXISTING TABLE PRODUCT
ALTER TABLE product ADD Description VARCHAR(MAX) NOT NULL
GO
INSERT INTO product VALUES('IPhone','Electronic', 150000, 'IPhone 14 Pro Max');
INSERT INTO product VALUES('HP','Electronic', 75000, 'Pavilion Series');
INSERT INTO product VALUES('Canon','Electronic', 400000, 'Canon R');
INSERT INTO product VALUES('Injection','Health', 200, 'Injection');
INSERT INTO product VALUES('FaceWash','Health', 100, 'Garniaman');
INSERT INTO product VALUES('Glucose Powder','Health', 150, 'Tang,Lemon');
INSERT INTO product VALUES('Football','Sport', 1000, 'Nike Football');
INSERT INTO product VALUES('Chess','Sport', 800, 'Chess Game');
INSERT INTO product VALUES('Cricket Kit','Sport', 18000, 'SG Cricket Kit');

-- NEGATIVE PRICE NOT ALLOWED
INSERT INTO product VALUES('Calvin','Electronic', -30000, 'Fridge');

-- 1) Display All Products.
SELECT * FROM product;

-- 2) Write a Query to List all the products belonging to health category.
SELECT * FROM product WHERE Category = 'Health';

-- 3) Write a Query to get total price of all products.
SELECT SUM(Price) AS TotalPrice FROM product;

-- 4) Write a query to display product in descending order of price.
SELECT * FROM product ORDER BY Price DESC;

-- 5) Write a Query to display category wise product count having price greater than 10000.
SELECT Category,COUNT(ProductName) AS Productcount FROM product WHERE Price > 10000 GROUP BY Category;


