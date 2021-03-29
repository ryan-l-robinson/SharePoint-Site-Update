# SharePoint Site Script and Design Update
This PowerShell script demonstrates some simple handling of updating SharePoint site scripts and site designs. With this script, it is much easier to simply update the site script file, then run the PowerShell script again.

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

## Next Update
My goal for the next update is to add some further demonstrations of more complicated scenarios like if you have a site design that incorporates multiple scripts, e.g.:
ProjectType1 uses scripts Project + script Project1;
ProjectType2 uses scripts Project + script Project2