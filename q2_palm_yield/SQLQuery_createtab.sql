-- Create a new table called 'PetrolFormulation' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.PalmYield', 'U') IS NOT NULL
 DROP TABLE dbo.PalmYield;
GO

-- Set date format
SET DATEFORMAT dmy;  
GO 

-- Create the table in the specified schema
CREATE TABLE dbo.PalmYield
(
 "Date" Date, -- placeholder column
 SoilMoisture float, -- placeholder column
 Average_Temp float, -- placeholder column
 Min_Temp float, -- placeholder column
 Max_Temp float, -- placeholder column
 Precipitation float, -- placeholder column
 Working_days int, -- placeholder column
 HA_Harvested float, -- placeholder column
 FFB_Yield float, -- placeholder column
);
GO

-- truncate the table first
TRUNCATE TABLE dbo.PalmYield;
GO
 
-- import the file
BULK INSERT dbo.PalmYield
FROM '/var/opt/mssql/data/q2/palm_ffb.csv'
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