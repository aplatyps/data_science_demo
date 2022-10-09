
DECLARE @VAR_NAME table (TEMPCOL nvarchar(15), ARRAYINDEX int identity(1,1))
DECLARE @COL_NAME table (TEMPCOL nvarchar(15), ARRAYINDEX int identity(1,1))
DECLARE @UNIT table (TEMPCOL nvarchar(45), ARRAYINDEX int identity(1,1))
DECLARE @DESCRIPTION table (TEMPCOL nvarchar(100), ARRAYINDEX int identity(1,1))
DECLARE @FREQUENCY table (TEMPCOL nvarchar(10), ARRAYINDEX int identity(1,1))

INSERT INTO @VAR_NAME (TEMPCOL)  
   VALUES  
('SoilMoisture'), 
('Average Temp'), 
('Min Temp'), 
('Max Temp'),  
('Precipitation'), 
('Working days'), 
('HA Harvested'), 
('FFB Yield'),
('Date')

INSERT INTO @COL_NAME (TEMPCOL)  
   VALUES  
('Unit'), ('Description'), ('Frequency')

INSERT INTO @UNIT (TEMPCOL)  
   VALUES  
('Millimetres in top 0-1.6m soil'), 
('Celsius degree'), 
('Celsius degree'), 
('Celsius degree'), 
('Millimetres'), 
('Days'), 
('Hectare'), 
('Tonnes/Hectare'), 
('DD/MM/YYYY')

INSERT INTO @DESCRIPTION (TEMPCOL)  
   VALUES  
('How much water presents in top 0-1.6 meter soil per unit area'), 
('Average temperature throughout the specified duration'), 
('Minimum temperature throughout the specified duration'), 
('Maximum temperature throughout the specified duration'), 
('Accumulative precipitation in a month'), 
('Number of working days of harvesting'), 
('Hectare of land covered for harvest'), 
('Fresh Fruit Bunch Yield (Tonnes/Hectare)'), 
('Day Month Year of record')

INSERT INTO @FREQUENCY (TEMPCOL)  
   VALUES  
('Monthly'), ('Monthly'), ('Monthly'), ('Monthly'), ('Monthly'), ('Monthly'), ('Monthly'), ('Monthly'), ('Monthly')



DECLARE @INDEX_VAR int  
DECLARE @TOTALCOUNT_VAR int  
DECLARE @INDEX_COL int  
DECLARE @TOTALCOUNT_COL int  
DECLARE @TEMP nvarchar (15) 
DECLARE @TEMP1 nvarchar (100)
DECLARE @TEMP2 nvarchar (15)
DECLARE @TEMP_ table (TEMPCOL nvarchar(15), ARRAYINDEX int identity(1,1))

SET @INDEX_VAR = 0  
SELECT @TOTALCOUNT_VAR= COUNT(*) FROM @VAR_NAME


WHILE @INDEX_COL < @TOTALCOUNT_COL  
    BEGIN  
        SELECT @INDEX_COL = @INDEX_COL + 1 
        SELECT @TEMP = TEMPCOL from @COL_NAME where ARRAYINDEX = @INDEX_COL
    
    WHILE @INDEX_VAR < @TOTALCOUNT_VAR  
        BEGIN  
            SELECT @INDEX_VAR = @INDEX_VAR + 1
            INSERT INTO @TEMP_ (TEMPCOL) EXEC('SELECT * FROM ' + @TEMP)
            SELECT @TEMP1 = TEMPCOL from @TEMP_ where ARRAYINDEX = @INDEX_VAR
            SELECT @TEMP2 = TEMPCOL from @VAR_NAME where ARRAYINDEX = @INDEX_VAR

            EXEC 
            sys.sp_addextendedproperty  @name = @TEMP,
                                        @value = @TEMP1, 
                                        @level0type=N'SCHEMA', @level0name=N'dbo', 
                                        @level1type=N'TABLE', @level1name=N'PalmYield', 
                                        @level2type=N'COLUMN', @level2name=@TEMP2
        END
    END
    