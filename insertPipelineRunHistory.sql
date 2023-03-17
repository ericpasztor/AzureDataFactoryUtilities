CREATE PROCEDURE [logging].[insertPipelineRunHistory]
@tableId int,
@tableName varchar(100),
@watermarkPreviousValue varchar(100),
@watermarkCurrentValue varchar(100),
@pipelineName varchar(100)

AS 
BEGIN

INSERT INTO logging.pipelineRunHistory 
(tableId, 
tableName, 
watermarkPreviousValue, 
watermarkCurrentValue, 
pipelineName, 
recordStartDatetime,
recordEndDatetime,
pipelineRunStatus) 
(
SELECT
@tableId,
@tableName,
cast(@watermarkPreviousValue as datetime2(0)),
cast(@watermarkCurrentValue as datetime2(0)),
@pipelineName,
sysdatetime() at time zone 'UTC' at time zone 'Eastern Standard Time',
null,
'Running'
);

END;
