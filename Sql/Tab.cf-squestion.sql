Select
	cf.Name 'ControlFormName' ,
	cftype.Name 'ControlFormType',
	e.EventId 'EventId',
	cft.Title 'CFTitle',
	mcft.Point 'TitlePoint',
    cfc.CategoryName 'CatName',
    mcfc.Point 'CategoryPoint',
    sq.QuestionName 'QuestName',
    mcfq.Point 'Quespoint',
    so.OptionChoiceName 'Choice'
FROM ControlForm cf
	INNER JOIN ControlFormControlFormType cfcft ON cf.Id=cfcft.ControlFormId
	INNER JOIN ControlFormType cftype ON cftype.Id=cfcft.ControlFormTypeId
	INNER JOIN Event e ON e.StoreControlType=cftype.Id
	INNER JOIN MatchControlFormTitle mcft ON cf.Id=mcft.ControlFormId
	INNER JOIN ControlFormTitle cft ON cft.Id=mcft.TitleId 
	INNER JOIN MatchControlFormCategory mcfc ON mcft.Id=mcfc.MatchTitleId
	INNER JOIN ControlFormCategory cfc ON cfc.Id=mcfc.ControlFormCategoryId
	INNER JOIN MatchControlFormQuestion mcfq ON mcfq.MatchCategoryId=mcfc.Id
	INNER JOIN SurveyQuestion sq ON sq.Id=mcfq.QuestionId
	INNER JOIN SurveyAnswer sa ON sa.QuestionId=sq.Id
	INNER JOIN SurveyOption so ON so.Id=sa.OptionId
	 WHERE cft.Id=1144 


