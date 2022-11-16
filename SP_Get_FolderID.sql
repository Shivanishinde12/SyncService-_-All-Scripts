USE [eBS4_INT_QA2]
GO
/****** Object:  StoredProcedure [sync].[Get_FolderId]    Script Date: 11/14/2022 10:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [sync].[Get_FolderId] (@FormID int)
as
begin
declare  @FormName varchar(100)

SET @FormName = (Select FormName From UI.FormDesign Where FormID = @FormID)

SELECT  FolderID from Fldr.Folder WHERE Name = @FormName

end