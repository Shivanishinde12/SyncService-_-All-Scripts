CREATE PROCEDURE Delete_FormInstance @FormName VARCHAR(100) 
--- Delete data from all related tables of given ForminstanceID
AS 
BEGIN
DECLARE @ForminstanceIDList TABLE (ForminstanceID Int)

INSERT INTO @ForminstanceIDList (ForminstanceID) 
SELECT fi.forminstanceid
FROM fldr.folder f
Inner join fldr.FolderVersion fv ON f.folderid=fv.folderid
inner join fldr.forminstance fi ON fv.folderversionid=fi.folderversionid
Inner join ui.formdesign fd ON fd.formid=fi.formdesignid
WHERE fd.DisplayText in(
@FormName
)
IF exists ( SELECT 1 FROM @ForminstanceIDList )

BEGIN TRY

	BEGIN TRANSACTION

			--- delete Data from fldr.FormInstanceActivityLog
			 
				DELETE		a
				FROM		fldr.FormInstanceActivityLog a 
				WHERE		a.FormInstanceID	in (SELECT FormInstanceID FROM @ForminstanceIDList	)

			---delete Data  from Fldr.FormInstanceDataMap

				DELETE 		FROM		Fldr.FormInstanceDataMap 
				WHERE		FormInstanceID	 in (SELECT FormInstanceID FROM @ForminstanceIDList	)

			---delete Data from [Accn].[AccountProductMap]

				DELETE FROM [Accn].[AccountProductMap] 
				WHERE		ForminstanceID		 in (SELECT ForminstanceID FROM @ForminstanceIDList	)


		  

			---delete Data from  fldr.Journal

				DELETE FROM	 fldr.Journal 
				WHERE		 ForminstanceID	in (SELECT ForminstanceID FROM @ForminstanceIDList	)   

			---delete Data from [Fldr].[FormInstanceViewImpactLog]

				DELETE FROM [Fldr].[FormInstanceViewImpactLog] 
				WHERE		ForminstanceID		in (SELECT ForminstanceID FROM @ForminstanceIDList	) 
																		
			---delete Data from [Fldr].[FormInstance]

				DELETE FROM [Fldr].[FormInstance] 
				WHERE		ForminstanceID		in (SELECT ForminstanceID FROM @ForminstanceIDList	) 
				  
	

	COMMIT TRANSACTION

END TRY

BEGIN CATCH
		
			IF @@ERROR > 0  
				BEGIN
					-- added to check if any delete satatement gets error out then rollback all transaction
					 ROLLBACK TRANSACTION;
				END

				
				SELECT  ERROR_NUMBER() AS ErrorNumber  
					   ,ERROR_SEVERITY() AS ErrorSeverity  
					   ,ERROR_LINE() AS ErrorLine  
					   ,ERROR_MESSAGE() AS ErrorMessage;  
		
END CATCH
END 