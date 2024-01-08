-- Create Database
CREATE DATABASE DBMS_FullExample;
USE DBMS_FullExample;
-- Create Table
CREATE TABLE Employees (
    EmployeeID int,
    FirstName varchar(255),
    LastName varchar(255),
    Department varchar(255),
    Salary decimal(10, 2),
    BirthDate date,
    PRIMARY KEY (EmployeeID)
);
-- Insert More Data
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, BirthDate)
VALUES (1, 'John', 'Doe', 'HR', 50000.00, '1980-01-01'),
       (2, 'Jane', 'Smith', 'IT', 60000.00, '1985-05-15'),
       (3, 'Jim', 'Beam', 'Finance', 55000.00, '1979-11-23'),
       (4, 'Lisa', 'Green', 'IT', 62000.00, '1988-03-22'),
       (5, 'Mark', 'Taylor', 'HR', 53000.00, '1992-07-11'),
       (6, 'Emily', 'Johnson', 'Marketing', 48000.00, '1990-12-01'),
       (7, 'David', 'Lee', 'Finance', 58000.00, '1983-08-15'),
       (8, 'Angela', 'Martinez', 'IT', 62500.00, '1986-01-30'),
       (9, 'Robert', 'Hernandez', 'HR', 52000.00, '1991-04-09'),
       (10, 'Alice', 'Williams', 'Marketing', 58000.00, '1990-07-30'),
       (11, 'Michael', 'Brown', 'Finance', 57000.00, '1975-09-15'),
       (12, 'Sarah', 'Davis', 'IT', 61000.00, '1989-06-04'),
       (13, 'Daniel', 'Miller', 'Marketing', 50000.00, '1993-03-28'),
       (14, 'Laura', 'Wilson', 'HR', 54000.00, '1982-11-23'),
       (15, 'Peter', 'Moore', 'Finance', 59500.00, '1978-05-19');
-- Select all records from Employees
SELECT * FROM Employees;

-- Select distinct departments from Employees
SELECT DISTINCT Department FROM Employees;

-- Select employees from a specific department using WHERE
SELECT * FROM Employees WHERE Department = 'IT';

-- Select employees using AND & OR
SELECT * FROM Employees WHERE Department = 'HR' AND Salary > 50000;
SELECT * FROM Employees WHERE Department = 'Finance' OR Department = 'IT';

-- Order employees by salary
SELECT * FROM Employees ORDER BY Salary DESC;

-- Insert a new employee
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary)
VALUES (16, 'Rebecca', 'Black', 'Marketing', 45000.00);

-- Update information of an employee
UPDATE Employees SET Salary = 55000.00 WHERE EmployeeID = 16;

-- Delete an employee record
DELETE FROM Employees WHERE EmployeeID = 16;

-- Select top 3 highest paid employees
SELECT * FROM Employees ORDER BY Salary DESC LIMIT 3;


-- Select employees with names that start with 'J' using LIKE
SELECT * FROM Employees WHERE FirstName LIKE 'J%';

-- Select employees within a specific salary range using BETWEEN
SELECT * FROM Employees WHERE Salary BETWEEN 45000.00 AND 60000.00;

-- Select employees from specific departments using IN
SELECT * FROM Employees WHERE Department IN ('HR', 'IT');

-- Using aliases for column names
SELECT EmployeeID AS ID, FirstName AS Name FROM Employees;

-- Now for demonstrating join operations
-- We create a new Projects table
CREATE TABLE Projects (
    ProjectID int,
    ProjectName varchar(255),
    Department varchar(255),
    StartDate date,
    EndDate date,
    PRIMARY KEY (ProjectID)
);

-- Insert Data into the Projects Table
INSERT INTO Projects (ProjectID, ProjectName, Department, StartDate, EndDate)
VALUES (101, 'Project Mercury', 'IT', '2023-01-01', '2023-12-31'),
       (102, 'Project Venus', 'Finance', '2023-03-15', '2023-11-20'),
       (103, 'Project Earth', 'HR', '2023-05-22', '2024-01-15'),
       (104, 'Project Mars', 'Marketing', '2023-07-01', '2023-10-30');

-- Join Operations
-- Inner Join
SELECT Employees.FirstName, Employees.LastName, Employees.Department, Projects.ProjectName
FROM Employees
INNER JOIN Projects ON Employees.Department = Projects.Department;

-- Left Join
SELECT Employees.FirstName, Employees.LastName, Employees.Department, Projects.ProjectName
FROM Employees
LEFT JOIN Projects ON Employees.Department = Projects.Department;

-- Right Join
SELECT Employees.FirstName, Employees.LastName, Employees.Department, Projects.ProjectName
FROM Employees
RIGHT JOIN Projects ON Employees.Department = Projects.Department;

-- UNION: Combine the results of two SELECT statements
SELECT FirstName FROM Employees
UNION
SELECT LastName FROM Employees;

-- Create a new table (backup) similar to Employees
CREATE TABLE EmployeesBackup LIKE Employees;

-- Insert data into the new table using SELECT
INSERT INTO EmployeesBackup 
SELECT * FROM Employees;

-- INSERT INTO SELECT: Insert data into a table using the result of a SELECT query
INSERT INTO EmployeesBackup (EmployeeID, FirstName, LastName, Department, Salary)
SELECT EmployeeID, FirstName, LastName, Department, Salary FROM Employees WHERE Department = 'IT';

-- Create a new table with various constraints
CREATE TABLE Departments (
    DepartmentID int NOT NULL,
    DepartmentName varchar(255),
    PRIMARY KEY (DepartmentID),
    UNIQUE KEY (DepartmentName)
);

-- Add NOT NULL and UNIQUE constraints to an existing table
ALTER TABLE Employees ADD COLUMN Email varchar(255) UNIQUE;
ALTER TABLE Employees MODIFY LastName varchar(255) NOT NULL;

-- CHECK: Add a CHECK constraint to limit salary values
ALTER TABLE Employees
ADD CONSTRAINT CHK_Salary CHECK (Salary >= 30000.00);

-- DEFAULT: Set a default value for the 'PhoneNumber' column
ALTER TABLE Employees
ALTER COLUMN PhoneNumber SET DEFAULT 'N/A';

-- CREATE INDEX: Create an index on the 'Department' column for faster queries
CREATE INDEX idx_Department ON Employees (Department);

-- DROP: Drop the 'EmployeesBackup' table
DROP TABLE IF EXISTS EmployeesBackup;

-- ALTER: Modify the data type of the 'Salary' column
ALTER TABLE Employees
MODIFY COLUMN Salary decimal(10, 2);

-- AUTO_INCREMENT: Set auto-increment for 'EmployeeID'
ALTER TABLE Employees
MODIFY COLUMN EmployeeID INT AUTO_INCREMENT PRIMARY KEY;

-- VIEW: Create a view to display employees in the IT department
CREATE VIEW IT_Employees AS
SELECT * FROM Employees WHERE Department = 'IT';

-- Handling NULL Values
-- Find employees with NULL phone numbers
SELECT * FROM Employees WHERE PhoneNumber IS NULL;

-- GROUP BY: Group employees by department and calculate the average salary
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;

-- HAVING: Filter departments with an average salary above 55000
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 55000;

-- Functions related to NULL Values
-- Find employees with NULL email or phone numbers
SELECT * FROM Employees WHERE Email IS NULL OR PhoneNumber IS NULL;

-- Use IFNULL function to handle NULL values
SELECT IFNULL(Email, 'No Email') AS Email, IFNULL(PhoneNumber, 'No Phone') AS PhoneNumber
FROM Employees;

-- Sample Stored Procedure
DELIMITER //
CREATE PROCEDURE GetEmployeeCount (OUT totalEmployees INT)
BEGIN
    SELECT COUNT(*) INTO totalEmployees FROM Employees;
END //
DELIMITER ;

-- We can Re-Make the tables using concept of normalization
-- Example- First Normal Form
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(15)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255)
);
-- Second Normal Form
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(15)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255)
);
-- Third Normal Form
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DepartmentID INT,
    Email VARCHAR(255),
    PhoneNumber VARCHAR(15)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255)
);

CREATE TABLE Salaries (
    EmployeeID INT PRIMARY KEY,
    Salary DECIMAL(10, 2)
);



