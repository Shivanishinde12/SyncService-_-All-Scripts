USE [eBS4_INT_QA2]
GO
/****** Object:  StoredProcedure [sync].[SyncUpdateMDMTable]    Script Date: 11/15/2022 3:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sync].[SyncUpdateMDMTable] @FDID INT, @FDVID INT
AS
DECLARE @SID AS INT
Declare @JsonHash NVARCHAR(MAX)
set  @JsonHash = (select dbo.GZip(FormDesignVersionData) from ui.FormDesignVersion where FormDesignVersionID = @FDVID)
SET @SID = (SELECT schemaupdatetrackerid FROM mdm.SchemaUpdateTracker WHERE FormdesignID = @FDID and FormdesignVersionID = @FDVID)



IF(@SID is null)
BEGIN
    INSERT INTO mdm.SchemaUpdateTracker(FormDesignID,FormDesignVersionID,Status,OldJsonHash,CurrentJsonHash,AddedDate)
    VALUES(@FDID,@FDVID,1,'',@JsonHash,GETDATE())
END
ELSE
BEGIN
    DECLARE @TempCurrentJsonHash AS NVARCHAR(MAX)
    SET @TempCurrentJsonHash = (SELECT CurrentJsonHash FROM mdm.SchemaUpdateTracker WHERE FormdesignID = @FDID and FormdesignVersionID = @FDVID)
    UPDATE MDM.SchemaUpdateTracker
    SET Status = 3, OldJsonHash = @TempCurrentJsonHash, CurrentJsonHash = @JsonHash,UpdatedDate = GETDATE() WHERE FormdesignID = @FDID and FormdesignVersionID = @FDVID
END