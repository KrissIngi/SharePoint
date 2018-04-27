#This script can be used to get and then delete the ScriptLinks in a SharePoint Site Collection
#Just run the script from Command Promt or PowerShell
$credentials = Get-credential

$username = $credentials.UserName
$securePassword = $credentials.Password
 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

$url = Read-Host -Prompt ("Enter the Url of the site")
 
# connect/authenticate to SharePoint Online and get ClientContext object 
$clientContext = New-Object Microsoft.SharePoint.Client.ClientContext($url) 
$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $securePassword) 
$clientContext.Credentials = $credentials 
 
if (!$clientContext.ServerObjectIsNull.Value) 
{ 
    Write-Host "Connected to SharePoint Online site: '$Url'" -ForegroundColor Green 
} 

$site = $clientContext.Site
$sca = $site.UserCustomActions

$clientContext.Load($sca)

$clientContext.ExecuteQuery() 

Write-Host($sca | Format-List -Property Id, Name, Scope, Location, Sequence, ScriptSrc | Out-String)

$idToDelete = Read-Host -Prompt ("Enter the ID of the scriptlink to be deleted")

Foreach ($scriptLink in $sca)
{   
    if($scriptLink.Id -eq $idToDelete){
        $confirm = Read-Host -Prompt ("Are you sure you want to delete " + $scriptLink.Id + " (y/n)")

        if($confirm -eq "y"){
            Write-Host("Deleting " + $scriptLink.Id)
            $scriptLink.DeleteObject()
            $clientContext.ExecuteQuery() 
        }
    }
}


