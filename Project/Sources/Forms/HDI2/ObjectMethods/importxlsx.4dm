C_TEXT:C284($d)

// select an excel document
$d:=Select document:C905(Form:C1466.fileFolder; ".xlsx"; "Select Excel file"; Use sheet window:K24:11)

If (Bool:C1537(OK))
	// Excel file folder memorization to open the saving selector in this folder
	Form:C1466.fileFolder:=Path to object:C1547(document).parentFolder
	
	// import of an excel file in a 4D View Pro area
	VP IMPORT DOCUMENT("ViewProArea"; document)
End if 