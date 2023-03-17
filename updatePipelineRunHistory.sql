CREATE PROCEDURE [logging].[updatePipelineRunHistory]
@tableId int,
@pipelineRunStatus varchar(50)

AS 
BEGIN

UPDATE logging.pipelineRunHistory 
SET 
recordEndDatetime = sysdatetime() at time zone 'UTC' at time zone 'Eastern Standard Time',
pipelineRunStatus = @pipelineRunStatus
WHERE
tableId = @tableId and 
pipelineRunStatus = 'Running';

END;
