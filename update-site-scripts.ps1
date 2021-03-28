#TODO: replace the domain variable with your own domain
$domain = 'your tenant here'

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
if (($script_test = Get-SPOSiteScript | Where-Object 'Title' -eq 'Project').count -gt 0) {
    #If a script already exists with that title, update it, including an incremented version number
    $script_id = $script_test.Id
    Set-SPOSiteScript -Identity $script_id -Version (($script_test.Version)++) -Content $script -Description $description
}
else {
    #If it doesn't already exist, create a new one
    $new_script = Add-SPOSiteScript -Title 'Project' -Content $script -Description $description
    $script_id = $new_script.Id
}

#Site design: Project
$description = 'Site design for base project template'
if (($design_test = Get-SPOSiteDesign | Where-Object 'Title' -eq 'Project').count -gt 0) {
    #If a design already exists with that title, update it, including an incremented version number
    Set-SPOSiteDesign -Identity $design_test.Id -Version (($design_test.Version)++) -SiteScripts $script_id -Description $description -WebTemplate 64
    #Web-Template 64 is for a team site template. Use 68 instead if for communication sites.
}
else {
    Add-SPOSiteDesign -Title 'Project' -SiteScripts $script_id -Description $description
}