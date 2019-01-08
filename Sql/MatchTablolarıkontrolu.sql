Select * from Operation o 
Select * from BrandDirectorRelation
Select * from EventAuditor
Select r.RegionCode+'/' +r.RegionName from Region r INNER join Operation o ON r.OperationId=o.Id INNER JOIN Brand b ON o.BrandId=b.Id
Select * from Region
Select * from Operation

Select * from USers

Select * from EventProcess
Select * from ControlFormType

Select  cfc.CategoryName,            
  sq.QuestionName,            
  sq.QuestionCode,            
  mcfq.QuestionId 
   from MatchControlFormTitle mcf INNER JOIN ControlFormTitle cft ON mcf.TitleId=cft.Id 
	INNER JOIN ControlForm cf ON cf.Id=mcf.ControlFormId
	INNER JOIN MatchControlFormCategory mcfc ON mcf.ControlFormId=cf.Id
	INNER JOIN ControlFormCategory cfc ON cfc.Id=mcfc.ControlFormCategoryId
	INNER JOIN MatchControlFormQuestion mcfq ON mcfq.MatchCategoryId=mcfc.Id
	INNER JOIN SurveyQuestion sq ON mcfq.QuestionId=sq.Id
WHERE cf.MerchantId=1 AND cft.MerchantId=1
Group by             
  --title.Title,            
  cfc.CategoryName,            
  sq.QuestionName,            
  sq.QuestionCode,            
  mcfq.QuestionId 

sp_helptext EventGetListByStateId



Select * from MatchControlFormCategory
Select * from ControlFormCategory
Select * from MatchControlFormQuestion
Select * from ControlForm
Select * from EventStates
Select * from Region


          
CREATE PROCEDURE [dbo].[EventGetListByStateId] --4,2          
@merchantId INT ,          
@stateId INT          
AS          
BEGIN          
INSERT INTO EventProcess (EventId,InsertedAt,StateStep)          
SELECT           
    Event.Id AS 'EventId',          
    getdate(),          
    1          
 FROM  dbo.Event (NOLOCK)   
 INNER JOIN dbo.Store (NOLOCK)          
     ON Event.StoreId = Store.Id          
     INNER JOIN dbo.ControlFormType (NOLOCK)          
     ON Event.StoreControlType = dbo.ControlFormtype.Id          
 WHERE Event.MerchantId = @merchantId AND EventStatusId != 2 AND  Event.EventStateId = @stateId AND IsComplete = 1 AND Event.Id NOT IN (SELECT EventId FROM EventProcess (NOLOCK))           
          
   SELECT           
     Event.Id AS 'EventId',          
     EventProcess.StateStep AS 'EventStateStep',          
     Region.RegionName AS 'RegionName',          
     Store.StoreName AS 'StoreName',          
     Store.Id AS 'StoreId',          
     Store.StoreCode AS 'StoreCode',          
     Event.Checkout AS 'CheckOutDate',          
     Store.DirectorId AS 'StoreDirectorId',          
     Region.RegionDirectorId AS 'RegionDirectorId',          
     ControlFormType.Name 'ControlFormTypeName',          
     ControlFormType.Id 'ControlFormTypeId'          
   FROM      
   dbo.Event (NOLOCK)     
   INNER JOIN dbo.SurveyAnswer on dbo.Event.Id=dbo.SurveyAnswer.EventId    
   INNER JOIN dbo.Store (NOLOCK) ON Event.StoreId = Store.Id          
      INNER JOIN dbo.ControlFormType (NOLOCK) ON Event.StoreControlType = dbo.ControlFormtype.Id          
      INNER JOIN EventProcess (NOLOCK) ON EventProcess.EventId = Event.Id          
      INNER JOIN Region (NOLOCK)  ON Store.RegionId = Region.Id          
  WHERE     
  Event.MerchantId = @merchantId     
  AND  Event.EventStateId = @stateId     
  AND IsComplete = 1      
  AND EventStatusId != 2          
  AND Event.Id IN(SELECT Event.Id FROM Event (NOLOCK) LEFT JOIN SurveyAnswer (NOLOCK) ON Event.Id=SurveyAnswer.EventId WHERE SurveyAnswer.EventId IS NOT NULL)--SurveyAnswer tablosu boþ olan eventlarý almamasý için konuldu.          
  AND dbo.SurveyAnswer.IsActionActive=1          
  GROUP BY  
  Event.Id,          
     EventProcess.StateStep ,          
     Region.RegionName,          
     Store.StoreName ,          
     Store.Id ,          
     Store.StoreCode,          
     Event.Checkout ,          
     Store.DirectorId ,          
     Region.RegionDirectorId ,          
     ControlFormType.Name ,          
     ControlFormType.Id          
END 