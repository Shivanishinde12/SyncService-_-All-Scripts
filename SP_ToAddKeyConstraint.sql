CREATE OR ALTER PROCEDURE SP_AddKeyConstraint
AS
BEGIN
--FormID = 4464
ALTER TABLE [UI].[DataSource] WITH NOCHECK ADD   CONSTRAINT [FK_DataSource_FormDesign]  FOREIGN KEY (FormDesignID) REFERENCES  UI.FormDesign(FormID)

--FormID = 2471
ALTER TABLE [ws].[ServiceDefinition] WITH NOCHECK ADD   CONSTRAINT  FK_UIElementID_ServiceDefinition_UIElement FOREIGN KEY (UIElementID) REFERENCES  UI.UIElement(UIElementID);



ALTER TABLE [ws].[ServiceDesignVersion]
WITH NOCHECK ADD   CONSTRAINT  FK_FormDesignVersionID_ServiceVersion_FormDesignVersion FOREIGN KEY (FormDesignVersionID) REFERENCES  UI.FormDesignVersion(FormDesignVersionID),
 CONSTRAINT FK_FormDesignID_ServiceVersion_FormDesign FOREIGN KEY (FormDesignID) REFERENCES UI.FormDesignVersion (FormDesignID);






--FormID = 2405



ALTER TABLE [UI].[TargetRepeaterKeyFilter] WITH NOCHECK ADD  CONSTRAINT FK_TargetRepeaterKeyFilter_PropertyRuleMap FOREIGN KEY (PropertyRuleMapID) REFERENCES  UI.PropertyRuleMap(PropertyRuleMapID),
 CONSTRAINT FK_TargetRepeaterKeyFilter_Rule FOREIGN KEY (RuleID) REFERENCES [UI].[Rule] (RuleID);



ALTER TABLE [Accn].[FormDesignAccountPropertyMap] WITH NOCHECK ADD  CONSTRAINT FK_FormDesignAccountPropertyMap_FormDesignVersion FOREIGN KEY (FormDesignVersionID) REFERENCES  UI.FormDesignVersion(FormDesignVersionID),
CONSTRAINT [FK_FormDesignAccountPropertyMap_FormDesign] FOREIGN KEY (FormDesignID) REFERENCES [UI].[FormDesignVersion] (FormDesignID),
CONSTRAINT [FK_FormDesignAccountPropertyMap_Tenant] FOREIGN KEY (TenantID) REFERENCES [UI].[FormDesign] (TenantID);



ALTER TABLE  UI.TargetRepeaterResultKeyFilter WITH NOCHECK ADD  CONSTRAINT [FK_TargetRepeaterResultKeyFilter_Rule] FOREIGN KEY (RuleID) REFERENCES  [UI].[Rule] (RuleID);

END