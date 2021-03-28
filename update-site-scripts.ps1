#TODO: replace the domain variable with your own domain
$domain = 'yourtenanthere'

#Test if already connected by trying to get the admin site
Try { get-sposite https://$domain-admin.sharepoint.com }
Catch [System.InvalidOperationException]
{
    #If not already connected, notify and prompt
    Write-Host -foreground Yellow "Follow the prompts to login to your SharePoint tenant."
    Connect-SPOService -Url "https://$domain-admin.sharepoint.com"
}

#Site script: Project
$script = Get-Content './project-script.json' -Raw
$description = 'Site script for base project template'
If (($script_test = Get-SPOSiteScript | Where-Object 'Title' -eq 'Project').count -gt 0) {
    #If a script already exists with that title, update it, including an incremented version number
    Set-SPOSiteScript -Identity $script_test.Id -Version (($script_test.Version)++) -Content $script -Description $description
}
else {
    #If it doesn't already exist, create a new one
    Add-SPOSiteScript -Title 'Project' -Content $script -Description $description
}

#Site design: Project
