SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[sourceFieldCatalog](
	[tableId] [int] NOT NULL,
	[fieldId] [int] NOT NULL,
	[fieldName] [varchar](100) NOT NULL,
	[fieldType] [varchar](50) NOT NULL,
	[piiFlag] [varchar](1) NOT NULL,
	[sensitivity] [varchar](50) NULL,
	[classification] [varchar](100) NULL,
	[precision] [int] NOT NULL,
	[scale] [int] NULL,
	[nullableFlag] [varchar](1) NOT NULL,
	[ingestionActiveFlag] [varchar](1) NOT NULL,
	[recordStartDate] [datetime2](0) NOT NULL,
	[recordEndDate] [datetime2](0) NOT NULL,
	[activeRecordFl] [varchar](1) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [config].[sourceFieldCatalog] ADD  DEFAULT ('N') FOR [piiFlag]
GO
ALTER TABLE [config].[sourceFieldCatalog] ADD  DEFAULT ('Y') FOR [ingestionActiveFlag]
GO
ALTER TABLE [config].[sourceFieldCatalog] ADD  DEFAULT (sysdatetime()) FOR [recordStartDate]
GO
ALTER TABLE [config].[sourceFieldCatalog] ADD  DEFAULT (CONVERT([datetime2](0),'2999-12-31 23:59:59')) FOR [recordEndDate]
GO
ALTER TABLE [config].[sourceFieldCatalog] ADD  DEFAULT ('Y') FOR [activeRecordFl]
GO
