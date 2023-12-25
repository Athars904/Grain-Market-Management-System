Create database grainmarket

-- Create the 'Department' table
CREATE TABLE Department (
  DepartmentID INT PRIMARY KEY,
  DepartmentName VARCHAR(50) NOT NULL
);
CREATE TABLE Supplier (
  SupplierID INT PRIMARY KEY,
  SupplierName VARCHAR(50) NOT NULL
);
-- Create the 'City' table
CREATE TABLE City (
  CityID INT PRIMARY KEY,
  CityName VARCHAR(50) NOT NULL
);

-- Create the 'Product' table
CREATE TABLE Product (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50) NOT NULL,
  AvailableQuantity INT NOT NULL,
  PricePerUnit DECIMAL(10,2) NOT NULL,
  SupplierID INT,
  FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

-- Create the 'Investor' table
CREATE TABLE Investor (
  InvestorID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  ContactInformation VARCHAR(255) NOT NULL,
  InvestmentAmount DECIMAL(10,2) NOT NULL,
  CityID INT,
  FOREIGN KEY (CityID) REFERENCES City(CityID)
);

-- Create the 'Transaction' table
CREATE TABLE Transactions (
  TransactionID INT PRIMARY KEY,
  ProductID INT NOT NULL,
  InvestorID INT NOT NULL,
  QuantitySold INT NOT NULL,
  SaleAmount DECIMAL(10,2) NOT NULL,
  Date DATE NOT NULL,
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
  FOREIGN KEY (InvestorID) REFERENCES Investor(InvestorID)
);

-- Create the 'Expenses' table
CREATE TABLE Expenses (
  ExpenseID INT PRIMARY KEY,
  Description VARCHAR(255) NOT NULL,
  Amount DECIMAL(10,2) NOT NULL,
  Date DATE NOT NULL
);

-- Create the 'Employee' table
CREATE TABLE Employee (
  EmployeeID INT PRIMARY KEY,
  EmployeeName VARCHAR(50) NOT NULL,
  Role VARCHAR(50) NOT NULL,
  ContactInformation VARCHAR(255) NOT NULL,
  Salary DECIMAL(10,2) NOT NULL,
  DepartmentID INT,
  Username VARCHAR(50) NOT NULL,
  Password VARCHAR(255) NOT NULL, -- Hash passwords in a real-world scenario
  FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Create the 'ProfitSharing' table
CREATE TABLE ProfitSharing (
  TransactionID INT PRIMARY KEY,
  InvestorID INT NOT NULL,
  ProfitAmount DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID),
  FOREIGN KEY (InvestorID) REFERENCES Investor(InvestorID)
);

-- Insert data into the 'Supplier' table
INSERT INTO Supplier (SupplierID, SupplierName)
VALUES
(1, 'Zain'),
(2, 'Talha');

-- Insert data into the 'Product' table
INSERT INTO Product (ProductID, ProductName, AvailableQuantity, PricePerUnit, SupplierID)
VALUES
(1, 'Wheat', 100, 10, 1),
(2, 'Corn', 50, 5, 2),
(3, 'Soybeans', 200, 12, 1);

-- Insert data into the 'City' table
INSERT INTO City (CityID, CityName)
VALUES
(1, 'City1'),
(2, 'City2');

-- Insert data into the 'Department' table
INSERT INTO Department (DepartmentID, DepartmentName)
VALUES
(1, 'Sales'),
(2, 'Finance');

-- Insert data into the 'Employee' table
INSERT INTO Employee (EmployeeID, EmployeeName, Role, ContactInformation, Salary, DepartmentID, Username, Password)
VALUES
(1, 'John Doe', 'Manager', '123-456-7890', 50000.00, 1, 'john_doe', 'password123'),
(2, 'Jane Smith', 'Accountant', '987-654-3210', 45000.00, 2, 'jane_smith', 'securepass');

select * from Employee;
select * from Transactions;
select * from City;
select * from Department;
select * from Supplier;
