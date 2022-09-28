  

CREATE or ALTER PROCEDURE [dbo].[DynamicExeSyncService]
	(@QueueId int ,
	@FormDesignId int , 
	@FormDesignVersionId int , 
	@ExpressionRule int , 
	@TID int , 
	@QueueStatus int , 
	@IsRequeued int , 
	@Type nvarchar(200),
	@TenantId int , 
	@ClientInformation nvarchar(200),
	@EXECUTION_ID BIGINT OUTPUT)
	AS
	BEGIN
	-- 1. declare variables
	DECLARE 
	@FOLDER_NAME     NVARCHAR(128) = 'SSISProject',  
	@PROJECT_NAME    NVARCHAR(128) = 'Main_Sync_Service_Project',  
	@PACKAGE_NAME    NVARCHAR(128) = 'SyncService.dtsx'; 
	--@REFERENCE_ID    BIGINT;
		
   -- 4. check if 1 row was returned
   IF @@ROWCOUNT <> 1
	  BEGIN
   -- throw error
		RETURN;
	  END
   -- 5. create the package execution
   EXEC [SSISDB].[catalog].[create_execution]
       @folder_name = @FOLDER_NAME
   ,   @project_name = @PROJECT_NAME
   ,   @package_name = @PACKAGE_NAME
  -- ,   @reference_id = @REFERENCE_ID
   ,   @execution_id = @EXECUTION_ID OUTPUT;

   -- 6. set value for Customer_Flat_File_Name package parameter
   EXEC [SSISDB].[catalog].[set_execution_parameter_value]
        @execution_id = @EXECUTION_ID  
    ,   @object_type = 20 -- package parameter 
	,   @parameter_name = N'QueueId', 
		@parameter_value = @QueueId;

	EXEC [SSISDB].[catalog].[set_execution_parameter_value]
		@execution_id = @EXECUTION_ID  
    ,   @object_type = 20 -- package parameter 
	  , @parameter_name = N'FormDesignId', 
		@parameter_value = @FormDesignId;

	EXEC [SSISDB].[catalog].[set_execution_parameter_value]
		@execution_id = @EXECUTION_ID  
    ,   @object_type = 20 -- package parameter 
	,   @parameter_name = N'FormDesignversionId', 
		@parameter_value = @FormDesignVersionId;

	EXEC [SSISDB].[catalog].[set_execution_parameter_value]
		@execution_id = @EXECUTION_ID  
    ,   @object_type = 20 -- package parameter 
	,   @parameter_name = N'ExpressionRule', 
		@parameter_value = @ExpressionRule;

	EXEC [SSISDB].[catalog].[set_execution_parameter_value]
		@execution_id = @EXECUTION_ID  
    ,   @object_type = 20 -- package parameter 
	,   @parameter_name = N'TID', 
		@parameter_value = @TID;

	EXEC [SSISDB].[catalog].[set_execution_parameter_value]
		@execution_id = @EXECUTION_ID  
    ,   @object_type = 20 -- package parameter 
	,   @parameter_name = N'QueueStatus', 
		@parameter_value = @QueueStatus;

	EXEC [SSISDB].[catalog].[set_execution_parameter_value]
		@execution_id = @EXECUTION_ID  
    ,   @object_type = 20 -- package parameter 
	,   @parameter_name = N'IsRequeued', 
		@parameter_value = @IsRequeued;

	EXEC [SSISDB].[catalog].[set_execution_parameter_value]
		@execution_id = @EXECUTION_ID  
    ,   @object_type = 20 -- package parameter 
	,   @parameter_name = N'Type', 
		@parameter_value = @Type;

	EXEC [SSISDB].[catalog].[set_execution_parameter_value]
		@execution_id = @EXECUTION_ID  
    ,   @object_type = 20 -- package parameter 
	,   @parameter_name = N'TenantId', 
		@parameter_value = @TenantId;

	EXEC [SSISDB].[catalog].[set_execution_parameter_value]
		@execution_id = @EXECUTION_ID  
    ,   @object_type = 20 -- package parameter 
	,   @parameter_name = N'ConnectionString', 
		@parameter_value = @ClientInformation;

	-- 7. start the execution
	EXEC [SSISDB].[catalog].[start_execution]
     @execution_id = @EXECUTION_ID;
END 


