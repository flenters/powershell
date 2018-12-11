#Set variables
$path = Test-Path "c:\temp"
$numberoffiles = (Get-ChildItem "C:\temp" | where {!$_.PsIsContainer} | Measure-Object).Count
$filestoarchive = Get-ChildItem "C:\temp" | where {!$_.PsIsContainer}
$date = Get-Date 
$date = $date.ToString("yyyy-MM-dd")
$newpath = Test-Path "c:\temp\$date"

#Check Path
if ($path -eq "true"){
    cd "c:\temp"
    }
    else
    {
    Write-Host "$path does not exist"
    exit 1
    }

    #Check for files and if archive has already been executed
        if ($numberoffiles -gt 1){
            Write-Host "There are $numberoffiles files to archive"
    
                if ($newpath -eq "true"){
                Write-Host "$date already exists archive will not continue"
                exit 1
                }
                else
                {
                    Write-Host "$date does not exist continuing with archive"
                    Write-Host "Creating new directory"
                    $newfolder = New-Item -ItemType directory -Path "c:\temp\$date" -Force
                    Write-Host "Copying files to archive"
                    foreach ($file in $filestoarchive) {
                    move-item $file $newfolder
                        if(!$?){
                            Add-Content -Path "c:\archive-log.txt" -Value "There has been an error"
                            }
                    }
                }
        }
else
    {
    Write-Host "There are no files to backup today" 
    }

#Logfile please note the location of the logfile below
Add-Content -Path "c:\archive-log.txt" -Value "--------------------------"
Add-Content -Path "c:\archive-log.txt" -Value "-- Todays is $date --"
Add-Content -Path "c:\archive-log.txt" -Value "--------------------------"
Add-Content -Path "c:\archive-log.txt" -Value "$numberoffiles Files moved to $newfolder"
Add-Content -Path "c:\archive-log.txt" -Value " "