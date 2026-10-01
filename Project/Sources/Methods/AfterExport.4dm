//%attributes = {"invisible":true}

// ----------------------------------------------------
// Method: AfterExport
// Description
// Method executed after the export
// Open a dialog to choose if you want open the new document in Excel
// If you decline, the file will be showed in your explorer
// Parameters
// $areaName (Text) -> area name
// $filePath (Text) -> path uses to save the path
// $params (Object) -> parameters passed to the export command. 
// $status (Object) -> status object with the error message if necessary
// ----------------------------------------------------
#DECLARE($areaName : Text; $filePath : Text; $params : Object; $status : Object)

If ($status.success)
	CONFIRM:C162(Localized string("AfterExportOpenWithExcel"); Localized string("CommonYes"); Localized string("CommonNo"))
	If (OK=1)
		OPEN URL:C673($filePath; "excel")
	Else 
		SHOW ON DISK:C922($filePath)
	End if 
	
Else 
	ALERT:C41($status.errorMessage)
	
End if 