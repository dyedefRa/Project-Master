
DECLARE @EventId int 
--http://newcust.local/report/storescoredetail/?eventId=f215d387-79cc-46e8-8930-daafd723c108
--sp_helptext sb_EventReportDetailByEventId
Select 
e.EventId,
s.StoreCode,
s.StoreName,
s.StoreType 'StoreTypeId',
(Select st.Name from StoreType st Where st.Id=s.StoreType ) 'StoreTypeName',
e.StoreComment 'StoreComment',
e.StoreDirectorComment 'StoreAdviceComment',
cft.Id 'AuditTypeId',
cft.Name 'AuditTypeName',
e.Date 'EventDate',
(Select u.FirstName+' '+u.LastName from Users u Where u.Id=r.RegionDirectorId) 'RegionManager',
(Select u.FirstName+' '+u.LastName from Users u Where u.Id=s.DirectorId ) 'StoreManager',
(Select u.FirstName+' '+u.LastName from Users u Where Id=(Select TOP 1 ea.UserId from EventAuditor ea WHERE ea.EventId=e.Id)) 'Auditor',
 Cast(ROUND(ecp.Point, 2)as nvarchar(10)) as 'AuditPoint',    
aus.Code 'AuditScoreCode',
aus.ColorCode 'ScoreColorCode',
 oldEvent.AuditScoreCode 'ExternalLetterCode',  
 oldEvent.Point 'ExternalScore' 
from Event e INNER JOIN Store s ON e.StoreId=s.Id
	INNER JOIN ControlFormType cft ON cft.Id=e.StoreControlType
	INNER JOIN Region r ON r.Id=s.RegionId
	INNER JOIN EventCalculatePoint ecp ON ecp.EventId=e.Id
	LEFT JOIN AuditScore aus ON aus.Id=ecp.AuditScoreId
	OUTER APPLY ( Select top 1 * from vwEventPointWithStore oldEventPoint
	Where oldEventPoint.EventId<>e.Id AND
	oldEventPoint.EventDate<=e.Time AND
	oldEventPoint.StoreId=s.Id AND
	oldEventPoint.StoreControlType=e.StoreControlType 
	ORDER BY oldEventPoint.EventDate desc
) AS oldEvent
WHERE e.Id=@EventId


	--------------- OUTER APPLY  => iki tablodan birtanesinde kesisen degerlerden ilkini vs almak için kullanýlýr
--sp_helptext vwEventPointWithStore 
--Select * from vwEventPointWithStore --> EN SON KÝ EVENTIN PUAN VE HAFINI ALMAK ICIN 



