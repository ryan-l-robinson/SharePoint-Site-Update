#TODO: replace the domain variable with your own domain
$domain = 'your tenant here'

#Test if already connected by trying to get the admin. If error is returned, prompt to connect.
Try { get-sposite https://$domain-admin.sharepoint.com }
Catch [System.InvalidOperationException]
{
    Write-Host -foreground Yellow "Follow the prompts to login to your SharePoint tenant."
    Connect-SPOService -Url "https://$domain-admin.sharepoint.com"
}

#Site script: Project (general)
#If the script already exists, update it, including incremented version number
#If the script doesn't already exist, create a new one
$script = Get-Content './project-script.json' -Raw
$description = 'Site script for base project template'
if (($script_test = Get-SPOSiteScript | Where-Object 'Title' -eq 'Project').count -gt 0) {
    $general_script_id = $script_test.Id
    Set-SPOSiteScript -Identity $general_script_id -Version (($script_test.Version)++) -Content $script -Description $description
}
else {
    $new_script = Add-SPOSiteScript -Title 'Project' -Content $script -Description $description
    $general_script_id = $new_script.Id
}

#Site script: Project Type 1
#If the script already exists, update it, including incremented version number
#If the script doesn't already exist, create a new one
$script = Get-Content './project-1-script.json' -Raw
$description = 'Site script for elements unique to project type 1'
if (($script_test = Get-SPOSiteScript | Where-Object 'Title' -eq 'Project Type 1').count -gt 0) {
    $project_1_id = $script_test.Id
    Set-SPOSiteScript -Identity $project_1_id -Version (($script_test.Version)++) -Content $script -Description $description
}
else {
    $new_script = Add-SPOSiteScript -Title 'Project Type 1' -Content $script -Description $description
    $project_1_id = $new_script.Id
}

#Site script: Project Type 2
#If the script already exists, update it, including incremented version number
#If the script doesn't already exist, create a new one
$script = Get-Content './project-1-script.json' -Raw
$description = 'Site script for elements unique to project type 2'
if (($script_test = Get-SPOSiteScript | Where-Object 'Title' -eq 'Project Type 2').count -gt 0) {
    $project_2_id = $script_test.Id
    Set-SPOSiteScript -Identity $project_2_id -Version (($script_test.Version)++) -Content $script -Description $description
}
else {
    $new_script = Add-SPOSiteScript -Title 'Project Type 2' -Content $script -Description $description
    $project_2_id = $new_script.Id
}

#Site design: Project Type 1, which combines the general script and the type 1 script
#If the design already exists, update it, including an incremented version number
#If the design doesn't already exist, create a new one
$description = 'Site design for base project template'
if (($design_test = Get-SPOSiteDesign | Where-Object 'Title' -eq 'Project').count -gt 0) {
    #Web-Template 64 is for a team site template. Use 68 instead if for communication sites.
    Set-SPOSiteDesign -Identity $design_test.Id -Version (($design_test.Version)++) -SiteScripts $general_script_id,$project_1_id -Description $description -WebTemplate 64
}
else {
    Add-SPOSiteDesign -Title 'Project' -SiteScripts $script_id -Description $description
}

#Next addition: demo of combining the same script into multiple designs, e.g. projects1, projects2