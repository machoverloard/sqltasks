CREATE DATABASE Sample1;
ALTER DATABASE Sample1 MODIFY NAME = Gymdb;

USE [Gymdb]
GO

CREATE TABLE employee
	(
	ID INT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	DOB DATE,
    Description VARCHAR(255),
    Role VARCHAR(15),
    Salary DECIMAL(10,2),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Experience INT
	); 

	ALTER TABLE employee ADD about varchar(50);

	ALTER TABLE employee DROP COLUMN about; 

	ALTER TABLE employee ALTER COLUMN Description INT;
	
	ALTER TABLE employee DROP COLUMN Description; 

	DROP TABLE employee; 

	CREATE TABLE employee
	(
	ID INT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	DOB DATE,
    Gender INT,
    Role VARCHAR(15),
    Salary DECIMAL(10,2),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Experience INT
	); 

	INSERT INTO employee(ID,FirstName,LastName,DOB,Gender,Role,Salary,Phone,Email,Experience)
						VALUES(1,'Paul','G','1998-1-20',1,'Trainer',20000,'9898767654','paul123@gmail.com',3); 

	INSERT INTO employee VALUES(2,'Sam','K','1998-8-2',1,'Coach',18000,'9898745678','sam23@gmail.com',4); 

	INSERT INTO employee VALUES(3,'Anjaly','S','2000-9-28',2,'Yoga',25000,'6298745678','anjaly@gmail.com',2), 
							   (4,'Shibu','D','1999-1-1',1,'Trainer',18000,'988885678','shibu3@gmail.com',1),
							   (5,'Sidh','N','1998-12-31',1,'Karate',30000,'6578945678','sboss369@gmail.com',6);

	SELECT * FROM employee; 

	UPDATE employee SET FirstName='Shine',
						LastName='A',
						DOB='2000-1-1',
						Gender=3,
						Role='Assistant',
						Salary=17000,
						Phone='6789098761',
						Email='shining@gmail.com',
						Experience =1
					WHERE ID=4; 

	SELECT * FROM employee; 
	
	UPDATE employee SET Phone='9988776655' WHERE ID=2; 

	SELECT FirstName FROM employee; 
	SELECT FirstName,LastName,Phone FROM employee; 
	SELECT FirstName,LastName,Salary FROM employee; 

	SELECT FirstName,DOB FROM employee;

	SELECT ID,FirstName,LastName,Experience FROM employee WHERE Salary > 20000; 

	DELETE FROM employee where ID=5;

	SELECT * FROM employee; 

	SELECT FirstName,Salary FROM employee ORDER BY Salary DESC ;

	SELECT MAX(Salary) FROM employee; 

	SELECT * FROM employee WHERE Salary = (SELECT MAX(Salary) FROM Employee); 

	SELECT FirstName,Salary FROM employee ORDER BY Salary DESC; 

	SELECT FirstName,Salary FROM employee WHERE Salary > 15000 AND Experience > 2; 

	SELECT FirstName,Salary FROM employee WHERE Salary > 15000 OR Experience > 2; 

	SELECT * FROM employee;

	CREATE TABLE gender
	(
	ID INT NOT NULL PRIMARY KEY,
    Gender VARCHAR(10) NOT NULL
	);
	

	INSERT INTO gender values(1,'Male'),
							(2,'Female'),
							(3,'Other');
	
	SELECT * FROM gender;

	INSERT INTO employee VALUES(5,'Athi','T','2000-9-2',2,'Yoga',25000,'6266665678','atlt@gmail.com',2), 
							   (6,'Denny','B','1996-8-1',1,'Trainer',18000,'955585678','shu3@gmail.com',5),
							   (7,'Febin','S','1994-7-2',1,'Coach',18000,'9890000678','sam993@gmail.com',8),
							   (8,'Solo','G','1998-5-20',3,'Trainer',20000,'9811117654','aul123@gmail.com',3), 
							   (9,'Sidhiq','N','1998-12-31',1,'Karate',30000,'6578333378','soss36@gmail.com',2);

	UPDATE employee SET Salary=23500 WHERE ID=1; 
	UPDATE employee SET Salary=27000 WHERE ID=2;
	UPDATE employee SET Salary=45000 WHERE ID=7; 
	UPDATE employee SET Salary=33000 WHERE ID=6; 
	UPDATE employee SET Salary=24000 WHERE ID=3; 
	 
	 --Foreign Key

	ALTER TABLE employee ADD CONSTRAINT employee_Gender_FK
	FOREIGN KEY (Gender) REFERENCES gender(ID);

	Select ID, FirstName from employee where Role = 'Trainer';*/

	--task

	SELECT DISTINCT Salary AS SecondHighestSalary FROM employee WHERE Salary = (SELECT MAX(Salary)FROM Employee WHERE Salary < (SELECT MAX(Salary) FROM Employee));

	SELECT Role, COUNT(*) AS NumberOfEmployees FROM employee GROUP BY Role;

	SELECT Role, COUNT(*) FROM employee GROUP BY Role;

	--task

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(25),
    Email VARCHAR(50),
    Country VARCHAR(25));

INSERT INTO Customers (CustomerID, CustomerName, Email, Country)
VALUES
    (1, 'John', 'john1@gmail.com', 'USA'),
    (2, 'Anna', 'anna@gmail.com', 'UK'),
    (3, 'Mike', 'mikey@gmail.com', 'Canada');

INSERT INTO Customers (CustomerID, CustomerName, Email, Country)
VALUES
    (4, 'Fred', 'red1@gmail.com', 'USA'),
    (5, 'Brock', 'rock@gmail.com', 'UK'),
    (6, 'Helen', 'elen@gmail.com', 'Canada');


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2));

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (101, 1, '2023-01-15', 100.00),
    (102, 2, '2023-02-20', 150.50),
    (103, 1, '2023-03-25', 75.25),
    (104, 3, '2023-04-10', 200.75);

	INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (105, 4, '2023-01-17', 100.00),
    (106, 5, '2023-03-20', 150.50),
    (107, 6, '2023-04-25', 75.25),
    (108, 2, '2023-05-10', 200.75);

	SELECT * FROM Customers;
	SELECT * FROM Orders;

	SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

	SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

	SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate FROM Orders RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

	SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate FROM Customers FULL JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

	SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate FROM Customers JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

	SELECT Customers.CustomerID, Customers.CustomerName, Customers.Email, Orders.OrderID, Orders.OrderDate FROM Customers JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

	--customers from same country
	SELECT C1.CustomerName AS Customer1, C2.CustomerName AS Customer2 FROM Customers C1 JOIN Customers C2 
										ON C1.Country = C2.Country AND C1.CustomerID < C2.CustomerID;

	SELECT
    C1.CustomerName AS Customer1,
    C1.Country AS Country,
    C2.CustomerName AS Customer2,
    C2.Country AS Country
	FROM Customers C1 JOIN Customers C2 ON C1.Country = C2.Country AND C1.CustomerID < C2.CustomerID;


	
	CREATE PROCEDURE SelectAllCustomers AS SELECT * FROM Customers GO;

	EXEC SelectAllCustomers;


	
