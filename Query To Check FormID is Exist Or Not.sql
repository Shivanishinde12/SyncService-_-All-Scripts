USE [eBS4_INT_QA2]
GO
/****** Object:  StoredProcedure [dbo].[SP_IsExistFormID]    Script Date: 9/19/2022 5:16:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER   PROCEDURE [dbo].[SPIsExistFormID] (@FID int)
AS
BEGIN
DECLARE @flag int
IF exists (SELECT FormID FROM UI.FormDesign WHERE FormID=@FID)
BEGIN
	SET @flag = 1
END
ELSE
BEGIN
	SET @flag = 0
END

SELECT @flag

END