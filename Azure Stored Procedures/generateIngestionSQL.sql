CREATE PROCEDURE [config].[generateIngestionSQL]  
@dataSourceName varchar(100)

AS

DECLARE @lowWatermarkValue DATETIME2(0);
SET @lowWatermarkValue = (SELECT CAST('1900-01-01 00:00:00' as DATETIME2(0)));

SELECT 
tableId,
tableName,
dataSourceName,
watermarkFieldName,
watermarkPreviousValue,
CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(extractSQLFullScan, ' WHERE '), watermarkFieldName), ' > '), 'CAST(''', watermarkPreviousValue), ''' as DATETIME2(0))') as extractSQL,
CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(lkpWatermarkSQLFullScan, ' WHERE '), watermarkFieldName), ' > '), 'CAST(''', watermarkPreviousValue), ''' as DATETIME2(0))') as lkpWatermarkSQL
FROM
(
SELECT 
tbl.tableId,
tbl.tableName,
CONCAT(CONCAT(CONCAT(CONCAT(CONCAT('SELECT ', STRING_AGG(fld.fieldName, ',')), ' FROM '), tbl.schemaName), '.'), tbl.tableName) AS extractSQLFullScan,
CONCAT(CONCAT(CONCAT(CONCAT(CONCAT('SELECT CAST(COALESCE(MAX(', tbl.watermarkFieldName, '), CAST(''', COALESCE(MAX(hist.watermarkCurrentValue), @lowWatermarkValue)), ''' AS DATETIME2(0))) AS VARCHAR(50)) AS watermarkCurrentValue FROM '), tbl.schemaName), '.'), tbl.tableName) AS lkpWatermarkSQLFullScan,
tbl.watermarkFieldName,
tbl.dataSourceName,
CAST(COALESCE(MAX(hist.watermarkCurrentValue), @lowWatermarkValue) AS VARCHAR(50)) as watermarkPreviousValue
  
FROM config.sourceTableCatalog tbl
  
INNER JOIN config.sourceFieldCatalog fld 
ON tbl.tableId = fld.tableId

LEFT OUTER JOIN logging.latestSuccessfulPipelineRuns histLatest 
ON tbl.tableId = histLatest.tableId

LEFT OUTER JOIN logging.pipelineRunHistory hist 
ON hist.tableId = histLatest.tableId
AND hist.recordEndDatetime = histLatest.recordEndDatetime
  
WHERE tbl.ingestionActiveFlag = 'Y' 
AND tbl.activeRecordFl = 'Y' 
AND fld.ingestionActiveFlag = 'Y' 
AND fld.activeRecordFl = 'Y' 
AND tbl.dataSourceName = @dataSourceName
  
GROUP BY tbl.tableId, tbl.schemaName, tbl.tableName, tbl.dataSourceName, tbl.watermarkFieldName
) IngestionSQLGenerator
   
RETURN;
