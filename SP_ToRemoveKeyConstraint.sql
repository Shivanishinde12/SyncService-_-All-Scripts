CREATE OR ALTER PROCEDURE SP_ToRemoveKeyConstraint
AS
BEGIN
-- FormID =4464

ALTER TABLE [UI].[DataSource]
DROP CONSTRAINT FK_DataSource_FormDesign

--FormID = 2471
ALTER TABLE [ws].[ServiceDefinition]
DROP CONSTRAINT FK_UIElementID_ServiceDefinition_UIElement

ALTER TABLE [ws].[ServiceDesignVersion]
DROP CONSTRAINT FK_FormDesignVersionID_ServiceVersion_FormDesignVersion

ALTER TABLE [ws].[ServiceDesignVersion]
DROP CONSTRAINT FK_FormDesignID_ServiceVersion_FormDesign


--FormID = 2405
ALTER TABLE [UI].[TargetRepeaterKeyFilter]
DROP CONSTRAINT FK_TargetRepeaterKeyFilter_PropertyRuleMap

ALTER TABLE [Accn].[FormDesignAccountPropertyMap]
DROP CONSTRAINT [FK_FormDesignAccountPropertyMap_FormDesignVersion]


ALTER TABLE UI.TargetRepeaterResultKeyFilter
DROP CONSTRAINT [FK_TargetRepeaterResultKeyFilter_Rule]


ALTER TABLE Accn.FormDesignAccountPropertyMap
DROP CONSTRAINT [FK_FormDesignAccountPropertyMap_FormDesign],[FK_FormDesignAccountPropertyMap_Tenant]

ALTER TABLE [UI].[TargetRepeaterKeyFilter]
DROP CONSTRAINT FK_TargetRepeaterKeyFilter_Rule

END 



