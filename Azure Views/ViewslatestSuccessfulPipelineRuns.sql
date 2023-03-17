SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [logging].[latestSuccessfulPipelineRuns]

AS

select 
tableId,
max(recordEndDatetime) as recordEndDatetime

from logging.pipelineRunHistory 

where pipelineRunStatus = 'Succeeded'
group by tableId;

GO
