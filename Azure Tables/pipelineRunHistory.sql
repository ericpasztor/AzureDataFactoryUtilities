SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [logging].[pipelineRunHistory](
	[tableId] [int] NOT NULL,
	[tableName] [varchar](100) NOT NULL,
	[watermarkPreviousValue] [datetime2](0) NOT NULL,
	[watermarkCurrentValue] [datetime2](0) NOT NULL,
	[pipelineName] [varchar](100) NOT NULL,
	[recordStartDatetime] [datetime2](0) NOT NULL,
	[recordEndDatetime] [datetime2](0) NULL,
	[pipelineRunStatus] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [logging].[pipelineRunHistory] ADD  DEFAULT (sysdatetime()) FOR [recordStartDatetime]
GO
