/*
Name:
    Sync.UpdateOrInsertDocRule 

Purpose:
    To check DocumentRuleID is available in table to decide insert or update Document Rule Table  

Assumption:
    
  History:
    Created on  20/08/2022 by Shivani Shinde 
    Modified on ---------
*/

CREATE OR ALTER  PROCEDURE Sync.UpdateOrInsertDocRule 
AS
DECLARE @formDID int
SET @formDID = (SELECT tdr.FormDesignID FROM Temp.DocRule tdr join ui.DocumentRule udr ON tdr.FormDesignID=udr.FormDesignID)
IF(@formDID is null)
BEGIN
	SET @formDID = 0
END
SELECT @formDID as formDID
PRINT @FDVID

/*
Name:
    Sync.UpdateOrInsertDocRule 

Purpose:
    To check FormDesignVersionID is available in table to decide insert or update FormDesign Version Table  

Assumption:
 

   History:
    Created on  21/08/2022 by Shivani Shinde 
    Modified on ---------
*/

CREATE OR ALTER  PROCEDURE Sync.UpdateOrInsertFormDesgVr 
AS
DECLARE @formDVID int
SET @formDVID = (SELECT tfdv.[FDVID] FROM Temp.FLDRVR tfdv join ui.FormDesignVersion ufdv ON tfdv.[FDVID]=ufdv.FormDesignVersionID)
IF(@formDVID is null)
BEGIN
	SET @formDVID = 0
END
SELECT @formDVID AS [FDVID]



select * from Temp.FLDRVR where FDVID=4256

select IIF(tfd.FDVID is null,0,1) from Temp.FLDRVR tfd join ui.FormDesignVersion ufd on tfd.FDVID=ufd.FormDesignVersionID



select * from ui.FormDesignVersion ufd join Temp.FLDRVR tfd on ufd.FormDesignID=tfd.FID and ufd.FormDesignVersionID=tfd.FDVID

select * from ui.FormDesignVersion where FormDesignVersionID = 4256

delete from ui.FormDesignVersion where FormDesignVersionID = 4256
select * from fldr.forminstance where FormDesignVersionID = 4256
delete from fldr.forminstance where FormDesignVersionID = 4256
select * from fldr.FormInstanceDataMap where FormInstanceID = 2512582
delete from fldr.FormInstanceDataMap where FormInstanceID = 2512582


select * from Temp.FLDRVR

select FormDesignID,TenantID,VersionNumber,EffectiveDate,FormDesignVersionData,StatusID,AddedBy,AddedDate,UpdatedBy,
UpdatedDate,Comments,FormDesignTypeID,LastUpdatedDate,RuleExecutionTreeJSON,RuleEventMapJSON,PBPViewImpacts,MigrationID
,IsMigrated,IsMigrationOverriden,MigrationDate,SimplifyDesignVersionTypeID,ConfigRuleTreeJSON
from UI.FormDesignVersion

IF Exists(select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'FLDRVR' and TABLE_SCHEMA = 'Temp')
Drop table Temp.FLDRVR
CREATE TABLE Temp.FLDRVR(
	[FDVID] [int] NULL,
	[FID] [int] NULL,
	[TID] [int] NULL,
	[VNumber] [nvarchar](15) NULL,
	[EffDate] [datetime] NULL,
	[FDVData] [nvarchar](max) NULL,
	[SID] [int] NOT NULL,
	[AddBy] [nvarchar](20) NOT NULL,
	[AddDate] [datetime] NOT NULL,
	[UpdBy] [nvarchar](20) NULL,
	[UpDate] [datetime] NULL,
	[Comts] [varchar](500) NULL,
	[FDTypeID] [int] NULL,
	[LastUpdDate] [datetime] NULL,
	[RETJSON] [varchar](max) NULL,
	[REMJSON] [varchar](max) NULL,
	[PBPVImpacts] [nvarchar](max) NULL,
	[MigrID] [int] NULL,
	[IsMgrtd] [int] NULL,
	[IsMigrnOverriden] [int] NULL,
	[MigrDate] [datetime] NULL,
	[SimplTypeID] [int] NULL,
	[CfgRuleTreeJSON] [nvarchar](max) NULL)



select * from UI.FormDesigntype
