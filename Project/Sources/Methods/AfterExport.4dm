//%attributes = {}

// ----------------------------------------------------
// Method: AfterExport
// Description
// Method executed after the export
// Open a dialog to choose if you want open the new document in Excel
// If you decline, the file will be showed in your explorer
// Parameters
// $1 -> C_TEXT -> area name
// $2 -> C_TEXT -> path uses to save the path
// $3 -> C_OBJECT -> parameters passed to the export command. 
// $4 -> C_OBJECT -> status object with the error message if necessary
// ----------------------------------------------------

C_TEXT:C284($1; $areaName; $2; $filePath)
C_OBJECT:C1216($3; $params; $4; $status)

$areaName:=$1
$filePath:=$2
$params:=$3
$status:=$4

If ($status.success)
	CONFIRM:C162("Open with Excel?"; "Yes"; "No")
	If (OK=1)
		OPEN URL:C673($filePath; "excel")
	Else 
		SHOW ON DISK:C922($filePath)
	End if 
	
Else 
	ALERT:C41($status.errorMessage)
	
End if 