USE [Gymdb]
GO

CREATE TABLE Employees
	(
	EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Department NVARCHAR(50) NOT NULL
	); 

	CREATE PROCEDURE InsertEmployee	@FirstName NVARCHAR(50),@LastName NVARCHAR(50),@Department NVARCHAR(50) AS BEGIN
			INSERT INTO Employees (FirstName, LastName, Department)
				 VALUES (@FirstName, @LastName, @Department);
		END	

	CREATE PROCEDURE GetEmployee @EmployeeID INT AS	BEGIN 
		SELECT * FROM Employees WHERE EmployeeID = @EmployeeID;
		END	

		CREATE PROCEDURE UpdateEmployee @EmployeeID INT,@FirstName NVARCHAR(50),@LastName NVARCHAR(50),@Department NVARCHAR(50) AS BEGIN
			UPDATE Employees SET FirstName = @FirstName,
								LastName = @LastName,
								Department = @Department
							WHERE EmployeeID = @EmployeeID;
				END 

	CREATE PROCEDURE DeleteEmployee @EmployeeID INT AS BEGIN
			DELETE FROM Employees WHERE EmployeeID = @EmployeeID;
		END	*/


		

		EXEC InsertEmployee @FirstName = 'John', @LastName = 'Doe', @Department = 'Sales';

		EXEC GetEmployee @EmployeeID = 1;

		EXEC UpdateEmployee @EmployeeID = 1, @FirstName = 'Jane', @LastName = 'Smith', @Department = 'Marketing';


		EXEC DeleteEmployee @EmployeeID = 1;
