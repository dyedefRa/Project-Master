SELECT [Id], [RoleId], [ControlFormTypeId]   
 FROM   [dbo].[ControlFormTypeRoles]   
 WHERE RoleId=32

 Select * from ControlFormType

 sp_helptext ControlFormStoreTypeDeleteByControlFormId

 Select * from ControlForm
 Select * from ControlFormActions
Select * from ControlFormCountry
Select * from ControlFormStoreType

Select s.StoreName,st.Name StoreTypeName,cf.Name ControlFormNAME from Store s INNER JOIN  StoreType st ON s.StoreType=st.Id
	INNER JOIN ControlFormStoreType cfst ON cfst.StoreTypeId=st.Id
	INNER JOIN ControlForm cf ON cf.Id=cfst.ControlFormId
Select * from ControlFormCategory

Select * from ControlFormStoreType cfst INNER JOIN ControlForm cf ON 
	cfst.ControlFormId=cf.Id INNER JOIN 
	StoreType s ON s.Id=cfst.StoreTypeId

	Select * from ControlFormStoreType

Select * from ControlFormControlFormType
Select * from ControlFormEvent
Select * from ControlFormTypeRoles cftr INNER JOIN Roles r ON cftr.RoleId=r.Id
	INNER JOIN ControlFormType cft ON cft.Id=cftr.ControlFormTypeId

Select * from ControlFromControlFromTypeGroup

Select * from ControlFormType
Select * from ControlFromTypeGroup

	