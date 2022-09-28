select * from Ui.FormDesign where FormName = 'SSISDesignDemo4'
select * from UI.FormDesignVersion where FormDesignID = 4411
select * from UI.DocumentRule where FormDesignID = 4411
select * from UI.FormDesignMapping where TargetdesignId = 4411
select * from [UI].DocumentRuleEventMap where DocumentRuleID = 12367
in
(select DocumentRuleID from [UI].DocumentRule where FormDesignID = 4408)
select * from UI.FormDesignGroup where FormDesignGroupID = 647

