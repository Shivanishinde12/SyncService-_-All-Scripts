USE [eBS4_INT_QA2]
GO
/****** Object:  StoredProcedure [sync].[UpdateOrInsertDocRule]    Script Date: 8/25/2022 12:03:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [sync].[UpdateOrInsertDocRuleTable] @DRID int
AS
DECLARE @DID int
SET @DID = (SELECT tdr.DocumentRuleID FROM Temp.DocRule tdr join ui.DocumentRule udr ON udr.DocumentRuleID = @DRID)
IF(@DID is null)
BEGIN
	SET @DID = 0
END
SELECT @DID AS DocRuleID


CREATE OR ALTER PROCEDURE [sync].[ExistDocRuleEventMapIdDesgVer] @FDID int , @FDVID int
AS
IF exists(SELECT * FROM Ui.DocumentRuleEventMap WHERE DocumentRuleId in (SELECT DocumentRuleID FROM UI.DocumentRule WHERE FormDesignID = @FDID and FormDesignVersionID = @FDVID))
BEGIN 
 DELETE FROM Ui.DocumentRuleEventMap WHERE DocumentRuleId in (SELECT DocumentRuleID FROM UI.DocumentRule WHERE FormDesignID = @FDID and FormDesignVersionID = @FDVID)
END

CREATE PROCEDURE [sync].[ExistFormDesignVersionId] @FDID int , @FDVID int
AS
IF exists(SELECT * FROM Ui.FormDesignVersion WHERE FormDesignID = @FDID and FormDesignVersionID = @FDVID)
BEGIN 
 DELETE FROM Ui.FormDesignVersion WHERE FormDesignID = @FDID and FormDesignVersionID = @FDVID
END

CREATE PROCEDURE [sync].[ExistDoctRuleIdDesgVersion] @FDID int , @FDVID int
AS
IF exists(SELECT * FROM Ui.DocumentRule WHERE FormDesignID = @FDID and FormDesignVersionID = @FDVID)
BEGIN 
 DELETE FROM Ui.DocumentRule WHERE FormDesignID = @FDID and FormDesignVersionID = @FDVID
END

CREATE OR ALTER PROCEDURE [sync].[ExistDoctRuleIdExpRule] @DRID int ,@FDID int
AS
IF exists(SELECT * FROM Ui.DocumentRule WHERE DocumentRuleID = @DRID and FormDesignID  = @FDID)
BEGIN 
 DELETE FROM Ui.DocumentRule WHERE DocumentRuleID = @DRID and FormDesignID  = @FDID
END

CREATE PROCEDURE [sync].[ExistDocRuleEventMapIdExpRule] @DRID int 
AS
IF exists(SELECT * FROM Ui.DocumentRuleEventMap WHERE DocumentRuleId = @DRID )
BEGIN 
 DELETE FROM UI.DocumentRuleEventMap  WHERE   DocumentRuleId = @DRID
END

select * from UI.DocumentRule where FormDesignID = 4408