

Select * from Event

Select * from Notification

Select * from EventAuditor

Select * from Event Where Id='B300BC81-4EB5-4AE5-8D72-A14B5720C83C'

Select * from ControlFormEvent Where EventId='05321D18-8811-49ED-8B1F-173AC782BD14'

Select * from EmailLog Where  EventId='B300BC81-4EB5-4AE5-8D72-A14B5720C83C'

Select * from ControlFormEvent Where EventId='BC6B3117-B640-45C1-9CB0-37FCF81606C2'

Select * from Notification



--/////////////////
Select * from ControlForm --71

Select * from ControlFormStoreType Where ControlFormId=71

Select cft.Name from ControlFormControlFormType cfcf INNER JOIN ControlFormType cft ON cfcf.ControlFormTypeId=cft.Id
	INNER JOIN ControlForm cf ON cf.Id=cfcf.ControlFormId WHERE cf.Id=71

Select * from StoreType


--Denetim sihirbazý

Select * from ControlFormTitle  -- "Baþlýk1"  11

Select * from MatchControlFormTitle WHERE ControlFormId=71 -- 79    |71,11|


Select * from ControlFormCategory -- Baþlýktan sonra kategori seçimi  -- "Kategori 1"  52  seçtik


Select * from MatchControlFormCategory Where MatchTitleId=79    --218    |cfcategoryId=52,matchtitle=79|


Select * from SurveyQuestion  --Categoriden sonra soru seçimi     575,576 seçtim

Select * from MatchControlFormQuestion  WHERE MatchCategoryId=218   --218,575   218,576


sp_helptext DeleteControlFormMatchTreeByControlFormId


CREATE PROC [dbo].[DeleteControlFormMatchTreeByControlFormId]   
    @controlFormId int  
AS   
 SET NOCOUNT ON   
 SET XACT_ABORT ON    
   
 BEGIN TRAN  
   
 DELETE mq  
 FROM MatchControlFormQuestion mq  
 join MatchControlFormCategory mc on mc.Id = mq.MatchCategoryId  
 join MatchControlFormTitle mt on mt.Id = mc.MatchTitleId  
 WHERE  [ControlFormId] = @controlFormId  
  
 DELETE mc  
 FROM MatchControlFormCategory mc  
 join MatchControlFormTitle mt on mt.Id = mc.MatchTitleId  
 WHERE  [ControlFormId] = @controlFormId  
  
 DELETE  
 FROM   [dbo].[MatchControlFormTitle]  
 WHERE  [ControlFormId] = @controlFormId  
  
 COMMIT  
   

