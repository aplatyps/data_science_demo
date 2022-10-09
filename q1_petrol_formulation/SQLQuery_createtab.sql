-- Create a new table called 'PetrolFormulation' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.PetrolFormulation', 'U') IS NOT NULL
 DROP TABLE dbo.PetrolFormulation;
GO

-- Create the table in the specified schema
CREATE TABLE dbo.PetrolFormulation
(
 a float, -- placeholder column
 b float, -- placeholder column
 c float, -- placeholder column
 d float, -- placeholder column
 e float, -- placeholder column
 f float, -- placeholder column
 g float, -- placeholder column
 h float, -- placeholder column
 i float, -- placeholder column
);
GO

-- truncate the table first
TRUNCATE TABLE dbo.PetrolFormulation;
GO
 
-- import the file
BULK INSERT dbo.PetrolFormulation
FROM '/var/opt/mssql/data/q1/ingredient.csv'
WITH
(
        DATAFILETYPE='char',
        FIRSTROW=2,
        FIELDQUOTE='"', 
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK 
)
GO