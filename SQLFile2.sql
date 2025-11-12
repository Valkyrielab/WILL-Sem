CREATE TABLE CompanyName(
	CompanyNameID int PRIMARY KEY,
	CompanyName VARCHAR (50),
	CreatedBy VARCHAR(100),
    createdDate DATETIME DEFAULT GETDATE(),
    lastUpdatedBy VARCHAR(100),
    lastUpdatedDate DATETIME
	);

CREATE TABLE ContractType (
	ContractTypeID INT PRIMARY KEY,
	CompanyNameID INT, 
	ContractType VARCHAR,
	CreatedBy VARCHAR(100),
    createdDate DATETIME DEFAULT GETDATE(),
    lastUpdatedBy VARCHAR(100),
    lastUpdatedDate DATETIME
	FOREIGN KEY (CompanyNameID) REFERENCES CompanyName(CompanyNameID)
	);

CREATE TABLE EmploymentContract(
	EmploymentContractID INT PRIMARY KEY(1,1),
	ContractCreateDate DATETIME NOT NULL,
	CompanyNameID INT,
	CompanyName VARCHAR,
	ContractTypeID INT,
	ContractType VARCHAR,
	Surname VARCHAR,
	Firstname VARCHAR,
	IdentificationType  varchar,
	identitynumber int,
	PassportNumber int,
	IDValue int,
	JobTitle Varchar,
	Department varchar,
	Branch VARCHAR(100),
    Remuneration DECIMAL(18,2),
    ContractStartDate DATE,
    ContractEndDate DATE,
    ContractStatus VARCHAR(50),
    ProjectDetail VARCHAR(MAX),
    CreatedBy VARCHAR(100),
    createdDate DATETIME DEFAULT GETDATE(),
    lastUpdatedBy VARCHAR(100),
    lastUpdatedDate DATETIME,
	FOREIGN KEY (CompanyNameID) REFERENCES CompanyName(CompanyNameID),
	FOREIGN KEY (ContractTypeID) REFERENCES ContractType(ContractTypeID)
);

CREATE TABLE ApprovedContracts(
	fileID int primary key identity (1,1),
	EmploymentContractID INT NOT NULL,
    FileName VARCHAR(255) NOT NULL,
    createdBy VARCHAR(100),
    createdDate DATETIME DEFAULT GETDATE(),
    lastUpdatedBy VARCHAR(100),
    lastUpdatedDate DATETIME,
    FOREIGN KEY (EmploymentContractID) REFERENCES EmploymentContract(EmploymentContractID)
);

CREATE TABLE WarningTypes (
	WarningTypeID int primary key identity (1,1),
	WarningType VARCHAR (100)
);

CREATE TABLE CoCoffences(
	CoCID int primary key identity (1,1),
	CoCoffence VARCHAR (300),
	CreatedBy VARCHAR(100),
    createdDate DATETIME DEFAULT GETDATE(),
    lastUpdatedBy VARCHAR(100),
    lastUpdatedDate DATETIME,
);

CREATE TABLE SignedWarnings(
	fileID int primary key identity (1,1),
	WarningID int,
	FileName VARCHAR(255) NOT NULL,
	CreatedBy VARCHAR(100),
    createdDate DATETIME DEFAULT GETDATE(),
    lastUpdatedBy VARCHAR(100),
    lastUpdatedDate DATETIME,
);


CREATE TABLE EmploymentConfirmationLetter (
    EmploymentConfirmationLetterID INT PRIMARY KEY IDENTITY(1,1),
    PersonnelNumber VARCHAR(50) NOT NULL,
    Name VARCHAR(100),
    Surname VARCHAR(100),
    IDType VARCHAR(50),
    IDValue VARCHAR(50),
    CompanyCode VARCHAR(50),
    CompanyName VARCHAR(255),
    JobTitle VARCHAR(100),
    Department VARCHAR(100),
    EmploymentStartDate DATE,
	EmploymentEndDate DATE,
    createdBy VARCHAR(100),
    createdDate DATETIME DEFAULT GETDATE(),
    lastUpdatedBy VARCHAR(100),
    lastUpdatedDate DATETIME
);

CREATE TABLE MaternityAgreement (
    MaternityAgreementID INT PRIMARY KEY IDENTITY(1,1),
    confirmationLetterID INT NOT NULL,
    PersonnelNumber VARCHAR(50) NOT NULL,
    Name VARCHAR(100),
    Surname VARCHAR(100),
    IDType VARCHAR(50),
    IDValue VARCHAR(50),
    CompanyCode VARCHAR(50),
    CompanyName VARCHAR(255),
    JobTitle VARCHAR(100),
    Department VARCHAR(100),
    MaternityStartDate DATE,
    MaternityEndDate DATE,
    Percentage DECIMAL(5,2),
    dirName VARCHAR(255),
    createdBy VARCHAR(100),
    createdDate DATETIME DEFAULT GETDATE(),
    lastUpdatedBy VARCHAR(100),
    lastUpdatedDate DATETIME,
    FOREIGN KEY (confirmationLetterID) REFERENCES EmploymentConfirmationLetter(EmploymentConfirmationLetterID)
);


CREATE TABLE DisciplinaryStatus (
    DisciplinaryStatusID INT PRIMARY KEY IDENTITY(1,1),
    RowID INT NOT NULL,
    personnelNumber VARCHAR(50) NOT NULL,
    NotesAddress VARCHAR(255),
    DisciplinaryStatus VARCHAR(100),
    createdBy VARCHAR(100),
    createdDate DATETIME DEFAULT GETDATE(),
    lastUpdatedBy VARCHAR(100),
    lastUpdatedDate DATETIME,
    FOREIGN KEY (RowID) REFERENCES EmploymentContract(EmploymentContractID)
);

INSERT INTO EmploymentContract (EmploymentContractID, ContractCreateDate, CompanyNameID,CompanyName,
    ContractTypeID, ContractType,  Surname, Firstname, IdentificationType,identitynumber, PassportNumber, IDValue, JobTitle, 
    Department, Branch, Remuneration, ContractStartDate, ContractEndDate, ContractStatus, ProjectDetail, CreatedBy,  createdDate, lastUpdatedBy, 
    lastUpdatedDate)
VALUES
    (1, '2025-11-12', 101, 'TechCorp', 1, 'Permanent', 'Smith', 'John', 'ID', '8001015009087', NULL, 'ID', 'Software Engineer', 'IT', 'Head Office', 75000, '2025-12-01', '2028-12-01', 'Active', 'Project Alpha', 'Admin', '2025-11-12', 'Admin', '2025-11-12'),
    (2, '2025-11-12', 102, 'BizSolutions', 2, 'Contract', 'Doe', 'Jane', 'Passport', NULL, 'P1234567', 'Passport', 'Business Analyst', 'Consulting', 'Branch A', 65000, '2025-12-15', '2026-12-15', 'Active', 'Project Beta', 'Admin', '2025-11-12', 'Admin', '2025-11-12'),
    (3, '2025-11-12', 103, 'HealthPlus', 1, 'Permanent', 'Brown', 'Michael', 'ID', '7902026009088', NULL, 'ID', 'HR Manager', 'HR', 'Branch B', 55000, '2026-01-01', '2029-01-01', 'Active', 'HR System Upgrade', 'Admin', '2025-11-12', 'Admin', '2025-11-12'),
    (4, '2025-11-12', 104, 'EduWorld', 3, 'Internship', 'Taylor', 'Emily', 'ID', '9903037009089', NULL, 'ID', 'Intern', 'Education', 'Branch C', 15000, '2025-12-01', '2026-06-01', 'Active', 'Training Program', 'Admin', '2025-11-12', 'Admin', '2025-11-12'),
    (5, '2025-11-12', 105, 'FinServe', 2, 'Contract', 'Wilson', 'Robert', 'Passport', NULL, 'P7654321', 'Passport', 'Financial Advisor', 'Finance', 'Head Office', 85000, '2025-12-10', '2027-12-10', 'Active', 'Project Gamma', 'Admin', '2025-11-12', 'Admin', '2025-11-12');


