Select ROW_NUMBER() OVER(order by TitleOfCOurtesy) indexer, EmployeeID from Employees

Select e.EmployeeID,e.FirstName + e.LastName 'Ad-Soyad',ROW_NUMBER() OVER(ORDER BY e.TitleOfCourtesy desc) from Employees e
Select * from Employees



Select O.ShipCountry 'Ulke',e.Title 'Ünvan',SUM(od.UnitPrice) 'TOTAL' from [Order Details] od 
	INNER JOIN Orders O On O.OrderID=od.OrderID 
	INNER JOIN Employees e ON e.EmployeeID=O.EmployeeID
	GROUP BY O.ShipCountry,e.Title ORDER BY O.ShipCountry 

	--ORDER BY O.ShipCountry 

Select O.ShipCountry 'Ulke',e.Title 'Ünvan',SUM(od.UnitPrice) 'TOTAL' from [Order Details] od 
	INNER JOIN Orders O On O.OrderID=od.OrderID 
	INNER JOIN Employees e ON e.EmployeeID=O.EmployeeID
	GROUP BY O.ShipCountry,e.Title with ROLLUP 

Select O.ShipCountry 'Ulke',e.Title 'Ünvan',SUM(od.UnitPrice) 'TOTAL' from [Order Details] od 
	INNER JOIN Orders O On O.OrderID=od.OrderID 
	INNER JOIN Employees e ON e.EmployeeID=O.EmployeeID
	GROUP BY O.ShipCountry,e.Title with CUBE 


	
WITH Yenii as(

Select O.ShipCountry 'Ulke',e.Title 'Unvan',SUM(od.UnitPrice) 'TOTAL' from [Order Details] od 
	INNER JOIN Orders O On O.OrderID=od.OrderID 
	INNER JOIN Employees e ON e.EmployeeID=O.EmployeeID
	GROUP BY O.ShipCountry,e.Title with ROLLUP 
	)
Select * from Yenii y WHERE y.Unvan is NULL


---- STUFF FOR XML KULLANIMI --   => STUFF('mhaba',)
Select STUFF((Select (', ' + O.CustomerID) AS [data()]  from Orders O 
	INNER JOIN Employees e ON e.EmployeeID=O.EmployeeID WHERE e.EmployeeID=1
	FOR XML PATH('')),1,1,'')
	
SELECT STUFF('mxxxhaba',2,3,'er') --2.indexten baþla 'h' 3 tane sil ve oraya 'er' koy  => 


(Select DISTINCT(','+TitleOfCourtesy) as 'sfsf' from Employees FOR XML PATH(''))

Select FirstName as 'fff' from Employees FOR XML PATH('')