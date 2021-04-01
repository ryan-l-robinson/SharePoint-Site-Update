# SharePoint Site Script and Design Update
This PowerShell script demonstrates some simple handling of updating SharePoint site scripts and site designs. With this script (adapted to your needs), it is much easier to simply update the site script file(s), then run the PowerShell script again. 

## Demo Structure
The desired structure for this demonstration is to get to two site designs, one for project type 1 and one for project type 2. They share some characteristics, captured in one site script. They differ on other characteristics. In other words, Project Type 1 is the Project (general) script plus the Project 1 script, while Project Type 2 is the Project (general) script plus the Project 2 script. The purpose of including this structure is to demonstrate how you can efficiently stack shared scripts across designs as well as the syntax for having multiple scripts in one design.

## Customizing
You should review the whole code and understand what it is doing, but here are some hints of what you would need to change to prepare it for your own scenario:
1. Update the tenant domain
2. Update the title, description, and path to JSON files of the site script and design
3. If this design is for communication sites instead of team sites, change the WebTemplate option on the site design to 68 instead of 64

## Use
This script was designed for a site design workflow scenario like this:
1. Have this script and all the JSON site scripts in the same folder structure
2. Open the site scripts in your text editor, make edits as needed, and save
3. Run the PowerShell script to update everything to your SharePoint
4. Test applying the design to a site in SharePoint if needed.
5. Repeat for next site script change if needed.
