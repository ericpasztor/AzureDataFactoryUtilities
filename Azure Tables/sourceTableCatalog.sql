SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[sourceTableCatalog](
	[tableId] [int] NOT NULL,
	[schemaName] [varchar](50) NOT NULL,
	[tableName] [varchar](100) NOT NULL,
	[watermarkFieldName] [varchar](100) NOT NULL,
	[dataSourceName] [varchar](100) NOT NULL,
	[ingestionActiveFlag] [varchar](1) NOT NULL,
	[recordStartDate] [datetime2](0) NOT NULL,
	[recordEndDate] [datetime2](0) NOT NULL,
	[activeRecordFl] [varchar](1) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [config].[sourceTableCatalog] ADD  DEFAULT ('Y') FOR [ingestionActiveFlag]
GO
ALTER TABLE [config].[sourceTableCatalog] ADD  DEFAULT (sysdatetime()) FOR [recordStartDate]
GO
ALTER TABLE [config].[sourceTableCatalog] ADD  DEFAULT (CONVERT([datetime2](0),'2999-12-31 23:59:59')) FOR [recordEndDate]
GO
ALTER TABLE [config].[sourceTableCatalog] ADD  DEFAULT ('Y') FOR [activeRecordFl]
GO
