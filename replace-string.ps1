#Set the path to the XML file
$path = "somexmlfile"
#the word you before the string you would like to replace
$word = "string"
#read the xml file 
$text = Get-Content $path
#the string you would like to replace
$newstring = "newstring" 
$text -replace ("(?<=$word)" +'(.*?)(?=")'), $newstring | Set-Content $path
