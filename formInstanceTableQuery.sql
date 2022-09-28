USE [eMS_INT_QA]
GO

/****** Object:  Table [Fldr].[FormInstanceDataMap]    Script Date: 8/26/2022 2:31:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Fldr].[FormInstanceDataMap](
	[FormInstanceDataMapID] [int] IDENTITY(1,1) NOT NULL,
	[FormInstanceID] [int] NOT NULL,
	[ObjectInstanceID] [int] NOT NULL,
	[FormData] [nvarchar](max) NULL,
	[CompressJsonData] [nvarchar](max) NULL,
 CONSTRAINT [PK_FormInstanceDataMap] PRIMARY KEY CLUSTERED 
(
	[FormInstanceDataMapID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [Fldr].[FormInstanceDataMap] SET (LOCK_ESCALATION = DISABLE)
GO

ALTER TABLE [Fldr].[FormInstanceDataMap]  WITH CHECK ADD  CONSTRAINT [FK_FormInstanceID_FormInstance_FormInstanceID] FOREIGN KEY([FormInstanceID])
REFERENCES [Fldr].[FormInstance] ([FormInstanceID])
GO

ALTER TABLE [Fldr].[FormInstanceDataMap] CHECK CONSTRAINT [FK_FormInstanceID_FormInstance_FormInstanceID]
GO


