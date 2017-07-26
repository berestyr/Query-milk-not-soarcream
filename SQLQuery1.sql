SELECT 
	CustomerId, 
	Name 
FROM Table1 
WHERE CustomerId IN 
	( SELECT DISTINCT 
			CustomerId 
	FROM Table2 
	WHERE ProductName = 'milk' 
	AND CustomerId NOT IN
		( SELECT 
			CustomerId 
		FROM Table2 
		WHERE ProductName = 'soarcream' 
		AND PurchaiseDatetime >= DATEADD(MONTH, -1, GETDATE())
		)
	)