
CREATE OR ALTER PROCEDURE SP_IsExistFormID (@FID int)
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