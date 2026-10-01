Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		ARRAY TEXT:C222(_TabTitles; 0)
		// Init the labels
		Infos:=ds:C1482.INFO.all().orderBy("PageNumber").toCollection()
		COLLECTION TO ARRAY:C1562(Infos.query("PageNumber<3"); _TabTitles; "TabTitle")
		
		// Init the path of the 4D View Pro documents
		Form:C1466.fileFolder:=Get 4D folder:C485(Current resources folder:K5:16)
		
		OBJECT SET ENABLED:C1123(*; "importxlsx"; False:C215)
		OBJECT SET ENABLED:C1123(*; "exportxlsx"; False:C215)
		
End case 

