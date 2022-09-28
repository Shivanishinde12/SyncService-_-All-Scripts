CREATE TABLE [UI].[SyncServiceTable] (
	[FormDesignID] [int] NULL,
	[FormDesignVersionID] [int] NULL,
	[ExpressionRuleID] [int] NULL,
	[TenantID] [int] NULL,
	[QueueStatus] [int] NULL,
	[IsRequeued] [int] NULL,
	[DesignType] [varchar](250) NULL,
	[QueueID] [int]  NOT NULL
)

INSERT INTO UI.SyncServiceTable (FormDesignID,TenantID,QueueStatus,IsRequeued,DesignType,QueueID) values (4354,1,1,0,'Entire Design',1)

select * from UI.FormDesign where FormName = 'SSISDesignDemo1'
select * from UI.FormDesignVersion where FormDesignID = 4354
select * from UI.SyncServiceTable

CREATE TABLE [UI].[ClientInformation] (TenantId int ,ClientInfo VARCHAR(300))

