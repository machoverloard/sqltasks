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


