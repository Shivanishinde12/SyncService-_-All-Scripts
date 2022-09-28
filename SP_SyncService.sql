CREATE OR ALTER PROCEDURE [dbo].[sp_SyncService] 
AS
BEGIN
DECLARE 
@QID int , @FormId int , @FormDesignVersionId int ,@ExpRule int ,@TenantId int , @QueueStatus int ,@IsRequeued int ,
@Type NVARCHAR(max) , @TID int , @ClientInfo NVARCHAR(max)

SELECT TOP 1 @QID = QueueId,
@FormId = FormDesignId, @FormDesignVersionId = FormDesignVersionId , @ExpRule = ExpressionRule,@TID = TID,
@QueueStatus = QueueStatus,@IsRequeued = IsRequeued ,@Type = DesignType , @TenantId = TenantId , @ClientInfo = ClientInfo
FROM [eBS4_INT_QA2].[UI].SyncServiceTable DQ  inner join [eBS4_INT_QA2].[UI].[ClientInformation] CI
ON DQ.TID = CI.TenantId
WHERE QueueStatus = 1 OR (QueueStatus = 4 AND IsRequeued = 1)
AND Not exists (SELECT 1 FROM [eBS4_INT_QA2].[UI].SyncServiceTable DS WHERE DQ.TID = DS.TID and DS.QueueStatus = 2)
ORDER BY QueueId


DECLARE @P_EXECUTION_ID BIGINT;

EXEC [SSISDB].[dbo].[DynamicExeSyncService] @QueueId = @QID , @FormDesignId = @FormId ,@FormDesignVersionId = @FormDesignVersionId ,
@ExpressionRule = @ExpRule ,@TID = @TID , @QueueStatus = @QueueStatus ,@IsRequeued = @IsRequeued ,
@Type = @Type , @TenantId = @TenantId , @ClientInformation = @ClientInfo,
@EXECUTION_ID= @P_EXECUTION_ID OUTPUT;

SELECT @P_EXECUTION_ID ;

SELECT[start_time],   
[end_time],  
[status]
FROM [SSISDB].[catalog].[executions]
WHERE [execution_id]= @P_EXECUTION_ID;
END

EXEC  [dbo].[sp_SyncService] 




